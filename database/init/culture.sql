/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 260700
 Source Host           : localhost:3306
 Source Schema         : culture

 Target Server Type    : MySQL
 Target Server Version : 260700
 File Encoding         : 65001

 Date: 11/10/2026 12:33:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `BookingID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EventID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NULL DEFAULT NULL,
  `ExpiredAt` datetime NULL DEFAULT NULL,
  `Status` int NULL DEFAULT 1 COMMENT '1pending, 2confirmed, 3cancelled',
  `BookingCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`BookingID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES ('0b82344e-3e2b-45e4-9d8b-508c9af3012a', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', '79adfffb-d4a7-453f-8434-6f94163ec121', '2026-10-10 22:50:19', '2026-10-10 22:50:55', '2026-10-10 23:05:19', 2, 'BK-ZB3ZUZ', 0);
INSERT INTO `bookings` VALUES ('336d5360-1693-4445-96ac-bab6abcc8f84', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', '79adfffb-d4a7-453f-8434-6f94163ec121', '2026-10-10 22:10:11', NULL, '2026-10-10 22:25:11', 1, 'BK-UQPFQA', 0);
INSERT INTO `bookings` VALUES ('44c3442b-4794-4a8a-9e4d-15ced1a909cf', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', '79adfffb-d4a7-453f-8434-6f94163ec121', '2026-10-09 22:41:33', NULL, '2026-10-09 22:56:33', 1, 'BK-Y86SOT', 0);
INSERT INTO `bookings` VALUES ('8b425609-9e1f-4f24-93b3-8f8de5f0c073', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', '79adfffb-d4a7-453f-8434-6f94163ec121', '2026-10-09 23:02:20', NULL, '2026-10-09 23:17:20', 1, 'BK-7LQWJA', 0);
INSERT INTO `bookings` VALUES ('a3bc261e-8685-4702-ae73-e67ee6a170d7', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', '79adfffb-d4a7-453f-8434-6f94163ec121', '2026-10-09 22:26:41', NULL, '2026-10-09 22:41:41', 1, 'BK-QYWRTW', 0);
INSERT INTO `bookings` VALUES ('ec2114ec-4283-443d-b260-fe87a24c4042', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', '79adfffb-d4a7-453f-8434-6f94163ec121', '2026-10-09 22:27:38', '2026-10-10 22:05:25', '2026-10-09 22:42:38', 3, 'BK-UMEXES', 0);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `CategoryID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsActive` tinyint NULL DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CategoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('59987706-b4cb-4b69-8609-f83d8316217c', 'Music Concert', 1, 'Live music shows and concerts', '2026-10-09 18:37:29', NULL);
INSERT INTO `categories` VALUES ('9b89b5af-b889-4b1c-88d0-314d2202232f', 'Music', 1, 'Music', '2026-10-09 18:26:16', NULL);
INSERT INTO `categories` VALUES ('d80d8f72-f123-4c34-a5f8-dc8de15fee85', 'Classical Concert', 0, 'Symphony and orchestra', '2026-10-09 18:23:30', '2026-10-10 22:05:22');
INSERT INTO `categories` VALUES ('ee8609ab-e161-4cf9-b963-fffbd23536df', 'Music Concert1', 1, 'Live music shows and concerts', '2026-10-09 20:25:33', NULL);

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `EventID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EventName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CategoryID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `VenueID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventDate` datetime NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NULL DEFAULT NULL,
  `Status` tinyint NULL DEFAULT NULL COMMENT '1. Opening 2.End 3.Cancel',
  PRIMARY KEY (`EventID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'Rock Symphony 2026', 'An incredible rock music event', '9b89b5af-b889-4b1c-88d0-314d2202232f', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', '2026-11-20 20:00:00', '2026-10-09 23:02:20', NULL, 1);
INSERT INTO `events` VALUES ('0c358246-77d3-48c2-8005-2aa5c6632a7b', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 20:05:43', NULL, 1);
INSERT INTO `events` VALUES ('0f15b58b-0dd2-4dd7-bb6e-a00c3df02bf6', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 18:37:30', NULL, 1);
INSERT INTO `events` VALUES ('2244eb18-464e-44a6-817d-7830ebc0d5a9', 'Rock Symphony 2026 Extended', 'Updated description', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 18:02:45', '2026-10-09 22:09:07', 1);
INSERT INTO `events` VALUES ('2d885b02-bec9-4a41-9a37-8188407b5b73', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 22:00:36', NULL, 1);
INSERT INTO `events` VALUES ('474a8260-c982-4cd8-8527-b87c7aabd24d', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 17:59:18', NULL, 1);
INSERT INTO `events` VALUES ('8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'Rock Symphony 2026', 'An incredible rock music event', '9b89b5af-b889-4b1c-88d0-314d2202232f', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', '2026-11-20 20:00:00', '2026-10-09 22:04:12', NULL, 1);
INSERT INTO `events` VALUES ('a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'Rock Symphony 2026', 'An incredible rock music event', '9b89b5af-b889-4b1c-88d0-314d2202232f', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', '2026-11-20 20:00:00', '2026-10-09 22:41:32', NULL, 1);
INSERT INTO `events` VALUES ('c1abe01c-d935-41b2-b152-5be4dca0ccae', 'Rock Symphony 2026', 'An incredible rock music event', '9b89b5af-b889-4b1c-88d0-314d2202232f', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', '2026-11-20 20:00:00', '2026-10-09 22:27:37', NULL, 1);
INSERT INTO `events` VALUES ('d8f6527b-9f53-4954-a341-c7db80a54353', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 18:00:27', NULL, 1);
INSERT INTO `events` VALUES ('e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'Rock Symphony 2026', 'An incredible rock music event', '9b89b5af-b889-4b1c-88d0-314d2202232f', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', '2026-11-20 20:00:00', '2026-10-09 22:09:07', NULL, 1);
INSERT INTO `events` VALUES ('e3bc73ab-31f6-4b2a-8bb1-f29ad0aaaba3', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 21:41:02', NULL, 1);
INSERT INTO `events` VALUES ('e41efb21-c007-4af1-aa32-81ac8e614249', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 21:14:41', NULL, 1);
INSERT INTO `events` VALUES ('e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'Rock Symphony 2026', 'An incredible rock music event', '9b89b5af-b889-4b1c-88d0-314d2202232f', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', '2026-11-20 20:00:00', '2026-10-10 22:05:23', NULL, 1);
INSERT INTO `events` VALUES ('e633fbf3-5e32-4142-8b12-88ac3be66237', 'Rock Symphony 2026', 'An incredible rock music event', 'CATEGORY_ID_HERE', 'VENUE_ID_HERE', '2026-11-20 20:00:00', '2026-10-09 18:14:42', NULL, 1);

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `PaymentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BookingID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PaymentMethod` int NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL COMMENT '1pending, 2success, 3failed, 4refunded',
  `TransactionID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PaidAt` datetime NULL DEFAULT NULL COMMENT 'Payment time !=null when status =success',
  `CreatedTime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateTime` datetime NULL DEFAULT NULL,
  `Amount` decimal(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('c3a2be76-cc56-4159-b8dd-4e0a6ebe9d42', 'ec2114ec-4283-443d-b260-fe87a24c4042', 1, 3, 'TRANS_998877', '2026-10-09 18:00:00', NULL, '2026-10-10 22:05:25', 500000.00);
INSERT INTO `payments` VALUES ('eadd529f-0972-4c42-b5bb-4c53f81ec4c0', '0b82344e-3e2b-45e4-9d8b-508c9af3012a', 1, 2, '708d4e12-e83b-45d8-a0f3-0d18de92ca87', '2026-10-10 22:50:55', '2026-10-10 22:50:55', NULL, 500000.00);

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `TicketID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EventID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SeatRow` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SeatNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Price` decimal(12, 2) NULL DEFAULT NULL,
  `Status` int UNSIGNED NULL DEFAULT 1 COMMENT '1: Available, 2: Locked , 3: Sold',
  `BookingID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SeatType` tinyint NULL DEFAULT NULL COMMENT '1. Normal 2. VIP 3. VVIP',
  `SeatID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TicketID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES ('04c3fd0c-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '1', 700000.00, 1, NULL, NULL, '9fe7a715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c40e13-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '2', 700000.00, 1, NULL, NULL, '9fe7abf3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c475ca-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '3', 700000.00, 1, NULL, NULL, '9fe7f347-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47745-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '4', 700000.00, 1, NULL, NULL, '9fe7f50b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c477f7-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '5', 700000.00, 1, NULL, NULL, '9fe7f715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47894-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '6', 700000.00, 1, NULL, NULL, '9fe7f864-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47932-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '7', 700000.00, 1, NULL, NULL, '9fe7f9af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c479cc-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '8', 700000.00, 1, NULL, NULL, '9fe7fafa-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47a61-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '9', 700000.00, 1, NULL, NULL, '9fe7fc33-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47b12-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'A', '10', 700000.00, 1, NULL, NULL, '9fe7fd74-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47bb0-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '1', 700000.00, 1, NULL, NULL, '9fe7ff3d-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47c4f-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '2', 700000.00, 1, NULL, NULL, '9fe80080-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47ce7-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '3', 700000.00, 1, NULL, NULL, '9fe801b5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47d81-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '4', 700000.00, 1, NULL, NULL, '9fe802f4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47e16-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '5', 700000.00, 1, NULL, NULL, '9fe80434-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47ea8-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '6', 700000.00, 1, NULL, NULL, '9fe80568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c47f3a-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '7', 700000.00, 1, NULL, NULL, '9fe8069c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4800b-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '8', 700000.00, 1, NULL, NULL, '9fe807e5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c480a7-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '9', 700000.00, 1, NULL, NULL, '9fe8091a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4813a-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'B', '10', 700000.00, 1, NULL, NULL, '9fe80a4f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c481d0-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '1', 400000.00, 1, NULL, NULL, '9fe80bcb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48262-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '2', 400000.00, 1, NULL, NULL, '9fe80d37-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c482f7-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '3', 400000.00, 1, NULL, NULL, '9fe80e6e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48389-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '4', 400000.00, 1, NULL, NULL, '9fe80fa9-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4841d-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '5', 400000.00, 1, NULL, NULL, '9fe810df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c484e5-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '6', 400000.00, 1, NULL, NULL, '9fe81210-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4858a-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '7', 400000.00, 1, NULL, NULL, '9fe81371-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48628-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '8', 400000.00, 1, NULL, NULL, '9fe814ac-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c486c3-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '9', 400000.00, 1, NULL, NULL, '9fe815df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48758-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'C', '10', 400000.00, 1, NULL, NULL, '9fe81715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c487ee-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '1', 400000.00, 1, NULL, NULL, '9fe818a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4888a-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '2', 400000.00, 1, NULL, NULL, '9fe819df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4891e-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '3', 400000.00, 1, NULL, NULL, '9fe81b13-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48b4d-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '4', 400000.00, 1, NULL, NULL, '9fe81c55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48c55-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '5', 400000.00, 1, NULL, NULL, '9fe81d8b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48cf6-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '6', 400000.00, 1, NULL, NULL, '9fe81f32-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48d8d-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '7', 400000.00, 1, NULL, NULL, '9fe82075-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48e1f-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '8', 400000.00, 1, NULL, NULL, '9fe821af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48eb0-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '9', 400000.00, 1, NULL, NULL, '9fe822eb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48f57-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'D', '10', 400000.00, 1, NULL, NULL, '9fe82421-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c48ff5-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '1', 400000.00, 1, NULL, NULL, '9fe82599-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4908a-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '2', 400000.00, 1, NULL, NULL, '9fe826d2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c49119-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '3', 400000.00, 1, NULL, NULL, '9fe82809-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c491ab-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '4', 400000.00, 1, NULL, NULL, '9fe82964-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4923d-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '5', 400000.00, 1, NULL, NULL, '9fe82a98-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c492d3-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '6', 400000.00, 1, NULL, NULL, '9fe82bdd-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c49366-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '7', 400000.00, 1, NULL, NULL, '9fe82d21-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c493fb-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '8', 400000.00, 1, NULL, NULL, '9fe82e57-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4948c-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '9', 400000.00, 1, NULL, NULL, '9fe82f88-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c49538-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'E', '10', 400000.00, 1, NULL, NULL, '9fe830bc-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4962f-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '1', 200000.00, 1, NULL, NULL, '9fe83237-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c496cf-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '2', 200000.00, 1, NULL, NULL, '9fe83374-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4975f-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '3', 200000.00, 1, NULL, NULL, '9fe834af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c497f0-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '4', 200000.00, 1, NULL, NULL, '9fe835e7-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c49884-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '5', 200000.00, 1, NULL, NULL, '9fe8371f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c49915-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '6', 200000.00, 1, NULL, NULL, '9fe8387c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4a033-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '7', 200000.00, 1, NULL, NULL, '9fe839be-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4a352-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '8', 200000.00, 1, NULL, NULL, '9fe83af4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4a482-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '9', 200000.00, 1, NULL, NULL, '9fe83c25-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4a568-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'F', '10', 200000.00, 1, NULL, NULL, '9fe83d59-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4a65b-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '1', 200000.00, 1, NULL, NULL, '9fe83ed4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4b35d-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '2', 200000.00, 1, NULL, NULL, '9fe84011-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4b4f5-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '3', 200000.00, 1, NULL, NULL, '9fe8414f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4b60c-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '4', 200000.00, 1, NULL, NULL, '9fe84285-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4b705-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '5', 200000.00, 1, NULL, NULL, '9fe8440c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4b949-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '6', 200000.00, 1, NULL, NULL, '9fe845ae-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4ba66-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '7', 200000.00, 1, NULL, NULL, '9fe84712-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4bb7d-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '8', 200000.00, 1, NULL, NULL, '9fe8484c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4bc85-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '9', 200000.00, 1, NULL, NULL, '9fe84993-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4bd82-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'G', '10', 200000.00, 1, NULL, NULL, '9fe84aca-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4be71-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '1', 200000.00, 1, NULL, NULL, '9fe84c45-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4bf65-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '2', 200000.00, 1, NULL, NULL, '9fe84d82-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4c05a-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '3', 200000.00, 1, NULL, NULL, '9fe84eb8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4c370-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '4', 200000.00, 1, NULL, NULL, '9fe84fe8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4c7af-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '5', 200000.00, 1, NULL, NULL, '9fe8511e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4c925-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '6', 200000.00, 1, NULL, NULL, '9fe85252-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4ca4f-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '7', 200000.00, 1, NULL, NULL, '9fe85381-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4cb54-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '8', 200000.00, 1, NULL, NULL, '9fe854b2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4cc48-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '9', 200000.00, 1, NULL, NULL, '9fe855e8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4cd3e-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'H', '10', 200000.00, 1, NULL, NULL, '9fe85720-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4ce38-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '1', 200000.00, 1, NULL, NULL, '9fe85897-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4cf66-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '2', 200000.00, 1, NULL, NULL, '9fe859d3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d085-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '3', 200000.00, 1, NULL, NULL, '9fe85b0a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d19f-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '4', 200000.00, 1, NULL, NULL, '9fe85c3f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d315-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '5', 200000.00, 1, NULL, NULL, '9fe85d9e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d42e-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '6', 200000.00, 1, NULL, NULL, '9fe85ed5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d53c-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '7', 200000.00, 1, NULL, NULL, '9fe8600b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d638-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '8', 200000.00, 1, NULL, NULL, '9fe8615f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d73b-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '9', 200000.00, 1, NULL, NULL, '9fe86295-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d880-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'I', '10', 200000.00, 1, NULL, NULL, '9fe863c8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4d99e-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '1', 200000.00, 1, NULL, NULL, '9fe86568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4daa4-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '2', 200000.00, 1, NULL, NULL, '9fe866a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c4dda0-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '3', 200000.00, 1, NULL, NULL, '9fe867e1-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c524da-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '4', 200000.00, 1, NULL, NULL, '9fe86918-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c526dd-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '5', 200000.00, 1, NULL, NULL, '9fe86a55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c5281c-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '6', 200000.00, 1, NULL, NULL, '9fe86b8a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c528d4-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '7', 200000.00, 1, NULL, NULL, '9fe86cc2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c529ae-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '8', 200000.00, 1, NULL, NULL, '9fe86df3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c52a50-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '9', 200000.00, 1, NULL, NULL, '9fe86f24-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('04c52b29-c4bc-11f1-8896-002b67aa92f3', 'e4cdd767-c69a-4fcb-9414-ba0c97665f62', 'J', '10', 200000.00, 1, NULL, NULL, '9fe87056-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1087-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '1', 700000.00, 1, NULL, NULL, '9fe7a715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1310-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '2', 700000.00, 1, NULL, NULL, '9fe7abf3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc13a2-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '3', 700000.00, 1, NULL, NULL, '9fe7f347-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1406-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '4', 700000.00, 1, NULL, NULL, '9fe7f50b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1472-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '5', 700000.00, 1, NULL, NULL, '9fe7f715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc14d0-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '6', 700000.00, 2, '8b425609-9e1f-4f24-93b3-8f8de5f0c073', NULL, '9fe7f864-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc152a-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '7', 700000.00, 2, '8b425609-9e1f-4f24-93b3-8f8de5f0c073', NULL, '9fe7f9af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1582-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '8', 700000.00, 1, NULL, NULL, '9fe7fafa-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc15de-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '9', 700000.00, 1, NULL, NULL, '9fe7fc33-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc16e3-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'A', '10', 700000.00, 1, NULL, NULL, '9fe7fd74-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc173b-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '1', 700000.00, 1, NULL, NULL, '9fe7ff3d-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1790-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '2', 700000.00, 1, NULL, NULL, '9fe80080-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc17e3-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '3', 700000.00, 1, NULL, NULL, '9fe801b5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc18a5-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '4', 700000.00, 1, NULL, NULL, '9fe802f4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1904-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '5', 700000.00, 1, NULL, NULL, '9fe80434-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc19cc-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '6', 700000.00, 1, NULL, NULL, '9fe80568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1a27-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '7', 700000.00, 1, NULL, NULL, '9fe8069c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1aaf-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '8', 700000.00, 1, NULL, NULL, '9fe807e5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1b09-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '9', 700000.00, 1, NULL, NULL, '9fe8091a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1b60-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'B', '10', 700000.00, 1, NULL, NULL, '9fe80a4f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1bb4-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '1', 400000.00, 1, NULL, NULL, '9fe80bcb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1c0d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '2', 400000.00, 1, NULL, NULL, '9fe80d37-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1c62-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '3', 400000.00, 1, NULL, NULL, '9fe80e6e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1cb8-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '4', 400000.00, 1, NULL, NULL, '9fe80fa9-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1d0d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '5', 400000.00, 1, NULL, NULL, '9fe810df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1d77-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '6', 400000.00, 1, NULL, NULL, '9fe81210-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1dcc-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '7', 400000.00, 1, NULL, NULL, '9fe81371-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1e21-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '8', 400000.00, 1, NULL, NULL, '9fe814ac-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1e74-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '9', 400000.00, 1, NULL, NULL, '9fe815df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1ec8-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'C', '10', 400000.00, 1, NULL, NULL, '9fe81715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1f1b-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '1', 400000.00, 1, NULL, NULL, '9fe818a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1f6d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '2', 400000.00, 1, NULL, NULL, '9fe819df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc1fbf-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '3', 400000.00, 1, NULL, NULL, '9fe81b13-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc202a-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '4', 400000.00, 1, NULL, NULL, '9fe81c55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc207e-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '5', 400000.00, 1, NULL, NULL, '9fe81d8b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc20d7-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '6', 400000.00, 1, NULL, NULL, '9fe81f32-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc212d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '7', 400000.00, 1, NULL, NULL, '9fe82075-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc2181-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '8', 400000.00, 1, NULL, NULL, '9fe821af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc21d7-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '9', 400000.00, 1, NULL, NULL, '9fe822eb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc222b-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'D', '10', 400000.00, 1, NULL, NULL, '9fe82421-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc2280-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '1', 400000.00, 1, NULL, NULL, '9fe82599-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc22d5-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '2', 400000.00, 1, NULL, NULL, '9fe826d2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc2327-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '3', 400000.00, 1, NULL, NULL, '9fe82809-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc237a-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '4', 400000.00, 1, NULL, NULL, '9fe82964-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc23cc-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '5', 400000.00, 1, NULL, NULL, '9fe82a98-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc241d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '6', 400000.00, 1, NULL, NULL, '9fe82bdd-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc246e-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '7', 400000.00, 1, NULL, NULL, '9fe82d21-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc24be-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '8', 400000.00, 1, NULL, NULL, '9fe82e57-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6220-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '9', 400000.00, 1, NULL, NULL, '9fe82f88-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6378-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'E', '10', 400000.00, 1, NULL, NULL, '9fe830bc-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc63ee-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '1', 200000.00, 1, NULL, NULL, '9fe83237-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6452-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '2', 200000.00, 1, NULL, NULL, '9fe83374-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc64ac-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '3', 200000.00, 1, NULL, NULL, '9fe834af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6501-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '4', 200000.00, 1, NULL, NULL, '9fe835e7-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc65f5-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '5', 200000.00, 1, NULL, NULL, '9fe8371f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6648-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '6', 200000.00, 1, NULL, NULL, '9fe8387c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc669d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '7', 200000.00, 1, NULL, NULL, '9fe839be-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc66f0-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '8', 200000.00, 1, NULL, NULL, '9fe83af4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6742-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '9', 200000.00, 1, NULL, NULL, '9fe83c25-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6796-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'F', '10', 200000.00, 1, NULL, NULL, '9fe83d59-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc67ef-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '1', 200000.00, 1, NULL, NULL, '9fe83ed4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6847-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '2', 200000.00, 1, NULL, NULL, '9fe84011-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6899-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '3', 200000.00, 1, NULL, NULL, '9fe8414f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc68ee-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '4', 200000.00, 1, NULL, NULL, '9fe84285-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc693e-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '5', 200000.00, 1, NULL, NULL, '9fe8440c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc69f3-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '6', 200000.00, 1, NULL, NULL, '9fe845ae-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6a4f-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '7', 200000.00, 1, NULL, NULL, '9fe84712-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6aa3-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '8', 200000.00, 1, NULL, NULL, '9fe8484c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6af7-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '9', 200000.00, 1, NULL, NULL, '9fe84993-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6b46-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'G', '10', 200000.00, 1, NULL, NULL, '9fe84aca-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6caf-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '1', 200000.00, 1, NULL, NULL, '9fe84c45-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6d13-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '2', 200000.00, 1, NULL, NULL, '9fe84d82-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6d6c-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '3', 200000.00, 1, NULL, NULL, '9fe84eb8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6dd9-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '4', 200000.00, 1, NULL, NULL, '9fe84fe8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6e38-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '5', 200000.00, 1, NULL, NULL, '9fe8511e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6e8c-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '6', 200000.00, 1, NULL, NULL, '9fe85252-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6edc-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '7', 200000.00, 1, NULL, NULL, '9fe85381-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6f30-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '8', 200000.00, 1, NULL, NULL, '9fe854b2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6f80-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '9', 200000.00, 1, NULL, NULL, '9fe855e8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc6fd0-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'H', '10', 200000.00, 1, NULL, NULL, '9fe85720-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7021-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '1', 200000.00, 1, NULL, NULL, '9fe85897-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc707d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '2', 200000.00, 1, NULL, NULL, '9fe859d3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc70cf-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '3', 200000.00, 1, NULL, NULL, '9fe85b0a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7120-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '4', 200000.00, 1, NULL, NULL, '9fe85c3f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7190-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '5', 200000.00, 1, NULL, NULL, '9fe85d9e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc71e2-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '6', 200000.00, 1, NULL, NULL, '9fe85ed5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7232-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '7', 200000.00, 1, NULL, NULL, '9fe8600b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7282-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '8', 200000.00, 1, NULL, NULL, '9fe8615f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc72d2-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '9', 200000.00, 1, NULL, NULL, '9fe86295-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc732d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'I', '10', 200000.00, 1, NULL, NULL, '9fe863c8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7381-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '1', 200000.00, 1, NULL, NULL, '9fe86568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc73d1-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '2', 200000.00, 1, NULL, NULL, '9fe866a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcc7423-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '3', 200000.00, 1, NULL, NULL, '9fe867e1-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca06d-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '4', 200000.00, 1, NULL, NULL, '9fe86918-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca114-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '5', 200000.00, 1, NULL, NULL, '9fe86a55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca176-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '6', 200000.00, 1, NULL, NULL, '9fe86b8a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca1ce-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '7', 200000.00, 1, NULL, NULL, '9fe86cc2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca23b-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '8', 200000.00, 1, NULL, NULL, '9fe86df3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca295-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '9', 200000.00, 1, NULL, NULL, '9fe86f24-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('5fcca2eb-c3f3-11f1-8896-002b67aa92f3', 'e2e75ce7-3cf2-4245-a6a3-8e09185b34ac', 'J', '10', 200000.00, 1, NULL, NULL, '9fe87056-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afce3589-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '1', 700000.00, 3, '0b82344e-3e2b-45e4-9d8b-508c9af3012a', NULL, '9fe7a715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc50a-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '2', 700000.00, 1, NULL, NULL, '9fe7abf3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc6e7-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '3', 700000.00, 1, NULL, NULL, '9fe7f347-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc768-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '4', 700000.00, 1, NULL, NULL, '9fe7f50b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc7dd-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '5', 700000.00, 1, NULL, NULL, '9fe7f715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc841-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '6', 700000.00, 1, NULL, NULL, '9fe7f864-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc90d-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '7', 700000.00, 1, NULL, NULL, '9fe7f9af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc96d-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '8', 700000.00, 1, NULL, NULL, '9fe7fafa-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfc9f3-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '9', 700000.00, 1, NULL, NULL, '9fe7fc33-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfca6c-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'A', '10', 700000.00, 1, NULL, NULL, '9fe7fd74-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcad6-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '1', 700000.00, 1, NULL, NULL, '9fe7ff3d-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcb38-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '2', 700000.00, 1, NULL, NULL, '9fe80080-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcb9c-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '3', 700000.00, 1, NULL, NULL, '9fe801b5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcbfb-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '4', 700000.00, 1, NULL, NULL, '9fe802f4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcc5a-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '5', 700000.00, 1, NULL, NULL, '9fe80434-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcd59-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '6', 700000.00, 1, NULL, NULL, '9fe80568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcdb6-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '7', 700000.00, 1, NULL, NULL, '9fe8069c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfce5a-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '8', 700000.00, 1, NULL, NULL, '9fe807e5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcebb-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '9', 700000.00, 1, NULL, NULL, '9fe8091a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcf17-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'B', '10', 700000.00, 1, NULL, NULL, '9fe80a4f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcf74-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '1', 400000.00, 1, NULL, NULL, '9fe80bcb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfcfd8-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '2', 400000.00, 1, NULL, NULL, '9fe80d37-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd035-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '3', 400000.00, 1, NULL, NULL, '9fe80e6e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd091-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '4', 400000.00, 1, NULL, NULL, '9fe80fa9-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd0ed-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '5', 400000.00, 1, NULL, NULL, '9fe810df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd196-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '6', 400000.00, 1, NULL, NULL, '9fe81210-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd1f6-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '7', 400000.00, 1, NULL, NULL, '9fe81371-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd252-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '8', 400000.00, 1, NULL, NULL, '9fe814ac-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd2ac-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '9', 400000.00, 1, NULL, NULL, '9fe815df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd307-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'C', '10', 400000.00, 1, NULL, NULL, '9fe81715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd364-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '1', 400000.00, 1, NULL, NULL, '9fe818a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd3c3-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '2', 400000.00, 1, NULL, NULL, '9fe819df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd547-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '3', 400000.00, 1, NULL, NULL, '9fe81b13-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd5c2-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '4', 400000.00, 1, NULL, NULL, '9fe81c55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd621-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '5', 400000.00, 1, NULL, NULL, '9fe81d8b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd67b-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '6', 400000.00, 1, NULL, NULL, '9fe81f32-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd6d6-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '7', 400000.00, 1, NULL, NULL, '9fe82075-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd732-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '8', 400000.00, 1, NULL, NULL, '9fe821af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd790-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '9', 400000.00, 1, NULL, NULL, '9fe822eb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd7ec-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'D', '10', 400000.00, 1, NULL, NULL, '9fe82421-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd84c-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '1', 400000.00, 1, NULL, NULL, '9fe82599-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd8a7-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '2', 400000.00, 1, NULL, NULL, '9fe826d2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd900-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '3', 400000.00, 1, NULL, NULL, '9fe82809-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd95a-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '4', 400000.00, 1, NULL, NULL, '9fe82964-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfd9b3-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '5', 400000.00, 1, NULL, NULL, '9fe82a98-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfda0c-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '6', 400000.00, 1, NULL, NULL, '9fe82bdd-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfda65-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '7', 400000.00, 1, NULL, NULL, '9fe82d21-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdabd-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '8', 400000.00, 1, NULL, NULL, '9fe82e57-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdb16-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '9', 400000.00, 1, NULL, NULL, '9fe82f88-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdb87-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'E', '10', 400000.00, 1, NULL, NULL, '9fe830bc-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdc01-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '1', 200000.00, 1, NULL, NULL, '9fe83237-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdc5f-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '2', 200000.00, 1, NULL, NULL, '9fe83374-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdcb8-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '3', 200000.00, 1, NULL, NULL, '9fe834af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdd11-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '4', 200000.00, 1, NULL, NULL, '9fe835e7-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdd69-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '5', 200000.00, 1, NULL, NULL, '9fe8371f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfddc5-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '6', 200000.00, 1, NULL, NULL, '9fe8387c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfde1f-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '7', 200000.00, 1, NULL, NULL, '9fe839be-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfde78-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '8', 200000.00, 1, NULL, NULL, '9fe83af4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfded2-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '9', 200000.00, 1, NULL, NULL, '9fe83c25-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdf2a-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'F', '10', 200000.00, 1, NULL, NULL, '9fe83d59-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdf84-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '1', 200000.00, 1, NULL, NULL, '9fe83ed4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfdfdd-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '2', 200000.00, 1, NULL, NULL, '9fe84011-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe035-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '3', 200000.00, 1, NULL, NULL, '9fe8414f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe08e-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '4', 200000.00, 1, NULL, NULL, '9fe84285-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe102-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '5', 200000.00, 1, NULL, NULL, '9fe8440c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe1b5-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '6', 200000.00, 1, NULL, NULL, '9fe845ae-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe21d-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '7', 200000.00, 1, NULL, NULL, '9fe84712-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe27b-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '8', 200000.00, 1, NULL, NULL, '9fe8484c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe2d6-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '9', 200000.00, 1, NULL, NULL, '9fe84993-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe32e-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'G', '10', 200000.00, 1, NULL, NULL, '9fe84aca-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe389-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '1', 200000.00, 1, NULL, NULL, '9fe84c45-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe437-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '2', 200000.00, 1, NULL, NULL, '9fe84d82-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe49d-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '3', 200000.00, 1, NULL, NULL, '9fe84eb8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe518-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '4', 200000.00, 1, NULL, NULL, '9fe84fe8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe575-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '5', 200000.00, 1, NULL, NULL, '9fe8511e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe5ce-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '6', 200000.00, 1, NULL, NULL, '9fe85252-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe62d-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '7', 200000.00, 1, NULL, NULL, '9fe85381-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe688-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '8', 200000.00, 1, NULL, NULL, '9fe854b2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe6e2-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '9', 200000.00, 1, NULL, NULL, '9fe855e8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe73c-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'H', '10', 200000.00, 1, NULL, NULL, '9fe85720-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe796-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '1', 200000.00, 1, NULL, NULL, '9fe85897-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe7fb-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '2', 200000.00, 1, NULL, NULL, '9fe859d3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe856-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '3', 200000.00, 1, NULL, NULL, '9fe85b0a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe8b1-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '4', 200000.00, 1, NULL, NULL, '9fe85c3f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe928-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '5', 200000.00, 1, NULL, NULL, '9fe85d9e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe989-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '6', 200000.00, 1, NULL, NULL, '9fe85ed5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfe9e4-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '7', 200000.00, 1, NULL, NULL, '9fe8600b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfea3e-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '8', 200000.00, 1, NULL, NULL, '9fe8615f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfea99-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '9', 200000.00, 1, NULL, NULL, '9fe86295-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfeb1f-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'I', '10', 200000.00, 1, NULL, NULL, '9fe863c8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfeb7e-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '1', 200000.00, 1, NULL, NULL, '9fe86568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfebda-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '2', 200000.00, 1, NULL, NULL, '9fe866a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfec34-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '3', 200000.00, 1, NULL, NULL, '9fe867e1-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afcfec8c-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '4', 200000.00, 1, NULL, NULL, '9fe86918-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afd04cba-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '5', 200000.00, 1, NULL, NULL, '9fe86a55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afd04d97-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '6', 200000.00, 1, NULL, NULL, '9fe86b8a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afd04e0e-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '7', 200000.00, 1, NULL, NULL, '9fe86cc2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afd04e91-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '8', 200000.00, 1, NULL, NULL, '9fe86df3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afd04efe-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '9', 200000.00, 1, NULL, NULL, '9fe86f24-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('afd04f5a-c3f2-11f1-8896-002b67aa92f3', '8e7d4da2-9a60-4c9c-9eaf-04f7900f49bb', 'J', '10', 200000.00, 1, NULL, NULL, '9fe87056-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec8bfee-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '1', 700000.00, 1, NULL, NULL, '9fe7a715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec8c1df-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '2', 700000.00, 1, NULL, NULL, '9fe7abf3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec8fdfa-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '3', 700000.00, 1, NULL, NULL, '9fe7f347-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec8fef5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '4', 700000.00, 1, NULL, NULL, '9fe7f50b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec8ff58-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '5', 700000.00, 1, NULL, NULL, '9fe7f715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec8ffb4-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '6', 700000.00, 1, NULL, NULL, '9fe7f864-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9000a-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '7', 700000.00, 1, NULL, NULL, '9fe7f9af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9005c-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '8', 700000.00, 1, NULL, NULL, '9fe7fafa-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec900ad-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '9', 700000.00, 1, NULL, NULL, '9fe7fc33-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90113-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'A', '10', 700000.00, 1, NULL, NULL, '9fe7fd74-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9016c-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '1', 700000.00, 1, NULL, NULL, '9fe7ff3d-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec901bf-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '2', 700000.00, 1, NULL, NULL, '9fe80080-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90217-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '3', 700000.00, 1, NULL, NULL, '9fe801b5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90265-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '4', 700000.00, 1, NULL, NULL, '9fe802f4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec902b6-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '5', 700000.00, 1, NULL, NULL, '9fe80434-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90304-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '6', 700000.00, 1, NULL, NULL, '9fe80568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90356-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '7', 700000.00, 1, NULL, NULL, '9fe8069c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec903d2-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '8', 700000.00, 1, NULL, NULL, '9fe807e5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9042c-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '9', 700000.00, 1, NULL, NULL, '9fe8091a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90480-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'B', '10', 700000.00, 1, NULL, NULL, '9fe80a4f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec904d0-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '1', 400000.00, 1, NULL, NULL, '9fe80bcb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90523-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '2', 400000.00, 1, NULL, NULL, '9fe80d37-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90571-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '3', 400000.00, 1, NULL, NULL, '9fe80e6e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec905bf-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '4', 400000.00, 1, NULL, NULL, '9fe80fa9-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9060d-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '5', 400000.00, 1, NULL, NULL, '9fe810df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9066b-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '6', 400000.00, 1, NULL, NULL, '9fe81210-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec906bd-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '7', 400000.00, 1, NULL, NULL, '9fe81371-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9070c-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '8', 400000.00, 1, NULL, NULL, '9fe814ac-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9075a-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '9', 400000.00, 1, NULL, NULL, '9fe815df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec907a8-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'C', '10', 400000.00, 1, NULL, NULL, '9fe81715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec907f5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '1', 400000.00, 1, NULL, NULL, '9fe818a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90844-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '2', 400000.00, 1, NULL, NULL, '9fe819df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90891-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '3', 400000.00, 1, NULL, NULL, '9fe81b13-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec908eb-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '4', 400000.00, 1, NULL, NULL, '9fe81c55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9093b-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '5', 400000.00, 1, NULL, NULL, '9fe81d8b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90988-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '6', 400000.00, 1, NULL, NULL, '9fe81f32-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec909d5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '7', 400000.00, 1, NULL, NULL, '9fe82075-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90a27-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '8', 400000.00, 1, NULL, NULL, '9fe821af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec90a72-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '9', 400000.00, 1, NULL, NULL, '9fe822eb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec938db-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'D', '10', 400000.00, 1, NULL, NULL, '9fe82421-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec939a2-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '1', 400000.00, 1, NULL, NULL, '9fe82599-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93a57-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '2', 400000.00, 1, NULL, NULL, '9fe826d2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93ab6-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '3', 400000.00, 1, NULL, NULL, '9fe82809-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93b0a-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '4', 400000.00, 1, NULL, NULL, '9fe82964-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93ba5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '5', 400000.00, 1, NULL, NULL, '9fe82a98-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93bfc-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '6', 400000.00, 1, NULL, NULL, '9fe82bdd-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93c4d-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '7', 400000.00, 1, NULL, NULL, '9fe82d21-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93c9f-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '8', 400000.00, 1, NULL, NULL, '9fe82e57-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93cfa-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '9', 400000.00, 1, NULL, NULL, '9fe82f88-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93d6b-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'E', '10', 400000.00, 1, NULL, NULL, '9fe830bc-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93dc3-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '1', 200000.00, 1, NULL, NULL, '9fe83237-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93e13-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '2', 200000.00, 1, NULL, NULL, '9fe83374-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93e64-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '3', 200000.00, 1, NULL, NULL, '9fe834af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93eb6-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '4', 200000.00, 1, NULL, NULL, '9fe835e7-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93f0c-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '5', 200000.00, 1, NULL, NULL, '9fe8371f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93f5a-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '6', 200000.00, 1, NULL, NULL, '9fe8387c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93fa7-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '7', 200000.00, 1, NULL, NULL, '9fe839be-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec93ff7-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '8', 200000.00, 1, NULL, NULL, '9fe83af4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94048-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '9', 200000.00, 1, NULL, NULL, '9fe83c25-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94095-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'F', '10', 200000.00, 1, NULL, NULL, '9fe83d59-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec940e1-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '1', 200000.00, 1, NULL, NULL, '9fe83ed4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9412e-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '2', 200000.00, 1, NULL, NULL, '9fe84011-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9417a-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '3', 200000.00, 1, NULL, NULL, '9fe8414f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec941c9-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '4', 200000.00, 1, NULL, NULL, '9fe84285-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94217-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '5', 200000.00, 1, NULL, NULL, '9fe8440c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec942da-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '6', 200000.00, 1, NULL, NULL, '9fe845ae-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94334-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '7', 200000.00, 1, NULL, NULL, '9fe84712-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94381-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '8', 200000.00, 1, NULL, NULL, '9fe8484c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec943cd-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '9', 200000.00, 1, NULL, NULL, '9fe84993-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94419-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'G', '10', 200000.00, 1, NULL, NULL, '9fe84aca-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94469-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '1', 200000.00, 1, NULL, NULL, '9fe84c45-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec944b5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '2', 200000.00, 1, NULL, NULL, '9fe84d82-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94501-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '3', 200000.00, 1, NULL, NULL, '9fe84eb8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94562-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '4', 200000.00, 1, NULL, NULL, '9fe84fe8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec945b4-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '5', 200000.00, 1, NULL, NULL, '9fe8511e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94601-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '6', 200000.00, 1, NULL, NULL, '9fe85252-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9464d-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '7', 200000.00, 1, NULL, NULL, '9fe85381-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94699-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '8', 200000.00, 1, NULL, NULL, '9fe854b2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec946e5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '9', 200000.00, 1, NULL, NULL, '9fe855e8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94731-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'H', '10', 200000.00, 1, NULL, NULL, '9fe85720-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9477f-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '1', 200000.00, 1, NULL, NULL, '9fe85897-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec947d4-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '2', 200000.00, 1, NULL, NULL, '9fe859d3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94823-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '3', 200000.00, 1, NULL, NULL, '9fe85b0a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9486f-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '4', 200000.00, 1, NULL, NULL, '9fe85c3f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec948dc-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '5', 200000.00, 1, NULL, NULL, '9fe85d9e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec9492d-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '6', 200000.00, 1, NULL, NULL, '9fe85ed5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94979-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '7', 200000.00, 1, NULL, NULL, '9fe8600b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec949c8-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '8', 200000.00, 1, NULL, NULL, '9fe8615f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94a15-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '9', 200000.00, 1, NULL, NULL, '9fe86295-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94a75-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'I', '10', 200000.00, 1, NULL, NULL, '9fe863c8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94ac5-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '1', 200000.00, 1, NULL, NULL, '9fe86568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94b13-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '2', 200000.00, 1, NULL, NULL, '9fe866a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94b5f-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '3', 200000.00, 1, NULL, NULL, '9fe867e1-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94bab-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '4', 200000.00, 1, NULL, NULL, '9fe86918-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94bf6-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '5', 200000.00, 1, NULL, NULL, '9fe86a55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94c46-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '6', 200000.00, 1, NULL, NULL, '9fe86b8a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94c93-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '7', 200000.00, 1, NULL, NULL, '9fe86cc2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94cea-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '8', 200000.00, 1, NULL, NULL, '9fe86df3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94d3a-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '9', 200000.00, 1, NULL, NULL, '9fe86f24-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('cec94d87-c3fa-11f1-8896-002b67aa92f3', '06b8d274-4b5b-42c8-995b-81aa9ba670f1', 'J', '10', 200000.00, 1, NULL, NULL, '9fe87056-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fbc8ba-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '1', 700000.00, 1, NULL, NULL, '9fe7a715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fbcace-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '2', 700000.00, 1, NULL, NULL, '9fe7abf3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc03fb-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '3', 700000.00, 1, NULL, NULL, '9fe7f347-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc04cb-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '4', 700000.00, 1, NULL, NULL, '9fe7f50b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc053b-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '5', 700000.00, 1, NULL, NULL, '9fe7f715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc059f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '6', 700000.00, 1, NULL, NULL, '9fe7f864-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc05fe-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '7', 700000.00, 1, NULL, NULL, '9fe7f9af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc065a-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '8', 700000.00, 1, NULL, NULL, '9fe7fafa-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc06b1-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '9', 700000.00, 1, NULL, NULL, '9fe7fc33-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0719-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'A', '10', 700000.00, 1, NULL, NULL, '9fe7fd74-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0776-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '1', 700000.00, 1, NULL, NULL, '9fe7ff3d-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc07d0-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '2', 700000.00, 1, NULL, NULL, '9fe80080-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0829-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '3', 700000.00, 1, NULL, NULL, '9fe801b5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0880-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '4', 700000.00, 1, NULL, NULL, '9fe802f4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc08d8-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '5', 700000.00, 1, NULL, NULL, '9fe80434-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0933-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '6', 700000.00, 1, NULL, NULL, '9fe80568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc098a-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '7', 700000.00, 1, NULL, NULL, '9fe8069c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0a0c-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '8', 700000.00, 1, NULL, NULL, '9fe807e5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0a67-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '9', 700000.00, 1, NULL, NULL, '9fe8091a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0ac0-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'B', '10', 700000.00, 1, NULL, NULL, '9fe80a4f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0b19-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '1', 400000.00, 1, NULL, NULL, '9fe80bcb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0b75-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '2', 400000.00, 1, NULL, NULL, '9fe80d37-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0bcf-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '3', 400000.00, 1, NULL, NULL, '9fe80e6e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0c65-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '4', 400000.00, 1, NULL, NULL, '9fe80fa9-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0cdf-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '5', 400000.00, 1, NULL, NULL, '9fe810df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0d4f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '6', 400000.00, 1, NULL, NULL, '9fe81210-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0da8-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '7', 400000.00, 1, NULL, NULL, '9fe81371-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0e01-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '8', 400000.00, 1, NULL, NULL, '9fe814ac-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0e58-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '9', 400000.00, 1, NULL, NULL, '9fe815df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0eae-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'C', '10', 400000.00, 1, NULL, NULL, '9fe81715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0f04-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '1', 400000.00, 1, NULL, NULL, '9fe818a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc0fae-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '2', 400000.00, 1, NULL, NULL, '9fe819df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc1010-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '3', 400000.00, 1, NULL, NULL, '9fe81b13-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc1079-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '4', 400000.00, 1, NULL, NULL, '9fe81c55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc10d1-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '5', 400000.00, 1, NULL, NULL, '9fe81d8b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc1127-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '6', 400000.00, 1, NULL, NULL, '9fe81f32-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc117d-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '7', 400000.00, 1, NULL, NULL, '9fe82075-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc11d4-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '8', 400000.00, 1, NULL, NULL, '9fe821af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc122f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '9', 400000.00, 1, NULL, NULL, '9fe822eb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc40b4-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'D', '10', 400000.00, 1, NULL, NULL, '9fe82421-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4174-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '1', 400000.00, 1, NULL, NULL, '9fe82599-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc41de-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '2', 400000.00, 1, NULL, NULL, '9fe826d2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc423f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '3', 400000.00, 1, NULL, NULL, '9fe82809-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc429d-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '4', 400000.00, 1, NULL, NULL, '9fe82964-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc42fe-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '5', 400000.00, 1, NULL, NULL, '9fe82a98-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4359-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '6', 400000.00, 1, NULL, NULL, '9fe82bdd-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc43b3-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '7', 400000.00, 1, NULL, NULL, '9fe82d21-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4426-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '8', 400000.00, 1, NULL, NULL, '9fe82e57-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4482-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '9', 400000.00, 1, NULL, NULL, '9fe82f88-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc44f7-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'E', '10', 400000.00, 1, NULL, NULL, '9fe830bc-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4556-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '1', 200000.00, 1, NULL, NULL, '9fe83237-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc45b1-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '2', 200000.00, 1, NULL, NULL, '9fe83374-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc460a-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '3', 200000.00, 1, NULL, NULL, '9fe834af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4667-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '4', 200000.00, 1, NULL, NULL, '9fe835e7-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4763-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '5', 200000.00, 1, NULL, NULL, '9fe8371f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc47b8-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '6', 200000.00, 1, NULL, NULL, '9fe8387c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4810-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '7', 200000.00, 1, NULL, NULL, '9fe839be-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4869-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '8', 200000.00, 1, NULL, NULL, '9fe83af4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc48c1-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '9', 200000.00, 1, NULL, NULL, '9fe83c25-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc491d-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'F', '10', 200000.00, 1, NULL, NULL, '9fe83d59-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4974-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '1', 200000.00, 1, NULL, NULL, '9fe83ed4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc49ca-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '2', 200000.00, 1, NULL, NULL, '9fe84011-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4a1f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '3', 200000.00, 1, NULL, NULL, '9fe8414f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4a76-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '4', 200000.00, 1, NULL, NULL, '9fe84285-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4ad1-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '5', 200000.00, 1, NULL, NULL, '9fe8440c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4b93-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '6', 200000.00, 1, NULL, NULL, '9fe845ae-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4bfb-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '7', 200000.00, 1, NULL, NULL, '9fe84712-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4c58-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '8', 200000.00, 1, NULL, NULL, '9fe8484c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4cad-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '9', 200000.00, 1, NULL, NULL, '9fe84993-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4d08-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'G', '10', 200000.00, 1, NULL, NULL, '9fe84aca-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4d60-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '1', 200000.00, 1, NULL, NULL, '9fe84c45-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4db5-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '2', 200000.00, 1, NULL, NULL, '9fe84d82-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4e0b-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '3', 200000.00, 1, NULL, NULL, '9fe84eb8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4e71-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '4', 200000.00, 1, NULL, NULL, '9fe84fe8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4ec9-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '5', 200000.00, 1, NULL, NULL, '9fe8511e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4f1f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '6', 200000.00, 1, NULL, NULL, '9fe85252-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4f74-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '7', 200000.00, 1, NULL, NULL, '9fe85381-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc4fc9-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '8', 200000.00, 1, NULL, NULL, '9fe854b2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc501f-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '9', 200000.00, 1, NULL, NULL, '9fe855e8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5074-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'H', '10', 200000.00, 1, NULL, NULL, '9fe85720-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc50c9-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '1', 200000.00, 1, NULL, NULL, '9fe85897-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc512d-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '2', 200000.00, 1, NULL, NULL, '9fe859d3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5182-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '3', 200000.00, 1, NULL, NULL, '9fe85b0a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc51d8-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '4', 200000.00, 1, NULL, NULL, '9fe85c3f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5264-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '5', 200000.00, 1, NULL, NULL, '9fe85d9e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc52be-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '6', 200000.00, 1, NULL, NULL, '9fe85ed5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5313-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '7', 200000.00, 1, NULL, NULL, '9fe8600b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5369-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '8', 200000.00, 1, NULL, NULL, '9fe8615f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc53c0-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '9', 200000.00, 1, NULL, NULL, '9fe86295-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5424-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'I', '10', 200000.00, 1, NULL, NULL, '9fe863c8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc547e-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '1', 200000.00, 1, NULL, NULL, '9fe86568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc54d5-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '2', 200000.00, 1, NULL, NULL, '9fe866a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5529-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '3', 200000.00, 1, NULL, NULL, '9fe867e1-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc557e-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '4', 200000.00, 1, NULL, NULL, '9fe86918-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc55d4-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '5', 200000.00, 1, NULL, NULL, '9fe86a55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5629-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '6', 200000.00, 1, NULL, NULL, '9fe86b8a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc567e-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '7', 200000.00, 1, NULL, NULL, '9fe86cc2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc56dd-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '8', 200000.00, 1, NULL, NULL, '9fe86df3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc5738-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '9', 200000.00, 1, NULL, NULL, '9fe86f24-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('e6fc578e-c3f7-11f1-8896-002b67aa92f3', 'a34694be-53d9-4ee5-a7dd-a15d5d23eaa0', 'J', '10', 200000.00, 1, NULL, NULL, '9fe87056-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55ddee5-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '1', 700000.00, 1, NULL, NULL, '9fe7a715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55de58a-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '2', 700000.00, 1, NULL, NULL, '9fe7abf3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55de726-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '3', 700000.00, 1, NULL, NULL, '9fe7f347-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55de816-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '4', 700000.00, 1, NULL, NULL, '9fe7f50b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55de8df-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '5', 700000.00, 1, NULL, NULL, '9fe7f715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55de991-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '6', 700000.00, 1, NULL, NULL, '9fe7f864-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dea4d-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '7', 700000.00, 1, NULL, NULL, '9fe7f9af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55deb0f-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '8', 700000.00, 1, NULL, NULL, '9fe7fafa-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55debd7-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '9', 700000.00, 1, NULL, NULL, '9fe7fc33-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55decb5-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'A', '10', 700000.00, 1, NULL, NULL, '9fe7fd74-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55ded6e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '1', 700000.00, 1, NULL, NULL, '9fe7ff3d-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dee22-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '2', 700000.00, 1, NULL, NULL, '9fe80080-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55deeda-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '3', 700000.00, 1, NULL, NULL, '9fe801b5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55defa4-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '4', 700000.00, 1, NULL, NULL, '9fe802f4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df063-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '5', 700000.00, 1, NULL, NULL, '9fe80434-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df13a-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '6', 700000.00, 1, NULL, NULL, '9fe80568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df206-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '7', 700000.00, 1, NULL, NULL, '9fe8069c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df31a-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '8', 700000.00, 1, NULL, NULL, '9fe807e5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df3eb-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '9', 700000.00, 1, NULL, NULL, '9fe8091a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df4b3-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'B', '10', 700000.00, 1, NULL, NULL, '9fe80a4f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df57e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '1', 400000.00, 1, NULL, NULL, '9fe80bcb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df643-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '2', 400000.00, 1, NULL, NULL, '9fe80d37-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df7c0-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '3', 400000.00, 1, NULL, NULL, '9fe80e6e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df894-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '4', 400000.00, 1, NULL, NULL, '9fe80fa9-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55df961-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '5', 400000.00, 1, NULL, NULL, '9fe810df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dfa4d-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '6', 400000.00, 1, NULL, NULL, '9fe81210-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dfb20-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '7', 400000.00, 1, NULL, NULL, '9fe81371-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dfbe7-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '8', 400000.00, 1, NULL, NULL, '9fe814ac-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dfcaf-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '9', 400000.00, 1, NULL, NULL, '9fe815df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dfd79-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'C', '10', 400000.00, 1, NULL, NULL, '9fe81715-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dfe4e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '1', 400000.00, 1, NULL, NULL, '9fe818a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dff1d-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '2', 400000.00, 1, NULL, NULL, '9fe819df-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55dffe5-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '3', 400000.00, 1, NULL, NULL, '9fe81b13-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e021f-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '4', 400000.00, 1, NULL, NULL, '9fe81c55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e033b-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '5', 400000.00, 1, NULL, NULL, '9fe81d8b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e040a-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '6', 400000.00, 1, NULL, NULL, '9fe81f32-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e04de-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '7', 400000.00, 1, NULL, NULL, '9fe82075-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e05ac-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '8', 400000.00, 1, NULL, NULL, '9fe821af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e067f-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '9', 400000.00, 1, NULL, NULL, '9fe822eb-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e074c-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'D', '10', 400000.00, 1, NULL, NULL, '9fe82421-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e5b89-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '1', 400000.00, 1, NULL, NULL, '9fe82599-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e5d4b-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '2', 400000.00, 1, NULL, NULL, '9fe826d2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e5e33-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '3', 400000.00, 1, NULL, NULL, '9fe82809-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e5f0c-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '4', 400000.00, 1, NULL, NULL, '9fe82964-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e5fd0-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '5', 400000.00, 1, NULL, NULL, '9fe82a98-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e60a5-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '6', 400000.00, 1, NULL, NULL, '9fe82bdd-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6172-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '7', 400000.00, 1, NULL, NULL, '9fe82d21-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e623b-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '8', 400000.00, 1, NULL, NULL, '9fe82e57-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e631b-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '9', 400000.00, 1, NULL, NULL, '9fe82f88-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6429-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'E', '10', 400000.00, 1, NULL, NULL, '9fe830bc-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6503-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '1', 200000.00, 1, NULL, NULL, '9fe83237-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e65d6-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '2', 200000.00, 1, NULL, NULL, '9fe83374-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e669a-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '3', 200000.00, 1, NULL, NULL, '9fe834af-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6765-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '4', 200000.00, 1, NULL, NULL, '9fe835e7-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6825-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '5', 200000.00, 1, NULL, NULL, '9fe8371f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e68f6-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '6', 200000.00, 1, NULL, NULL, '9fe8387c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e69bf-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '7', 200000.00, 1, NULL, NULL, '9fe839be-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6a88-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '8', 200000.00, 1, NULL, NULL, '9fe83af4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6b5d-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '9', 200000.00, 1, NULL, NULL, '9fe83c25-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6c24-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'F', '10', 200000.00, 1, NULL, NULL, '9fe83d59-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6cef-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '1', 200000.00, 1, NULL, NULL, '9fe83ed4-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6dbe-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '2', 200000.00, 1, NULL, NULL, '9fe84011-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6e88-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '3', 200000.00, 1, NULL, NULL, '9fe8414f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e6f55-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '4', 200000.00, 1, NULL, NULL, '9fe84285-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7022-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '5', 200000.00, 1, NULL, NULL, '9fe8440c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e719c-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '6', 200000.00, 1, NULL, NULL, '9fe845ae-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e726e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '7', 200000.00, 1, NULL, NULL, '9fe84712-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e732a-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '8', 200000.00, 1, NULL, NULL, '9fe8484c-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e73e7-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '9', 200000.00, 1, NULL, NULL, '9fe84993-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e74aa-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'G', '10', 200000.00, 1, NULL, NULL, '9fe84aca-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7576-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '1', 200000.00, 1, NULL, NULL, '9fe84c45-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7641-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '2', 200000.00, 1, NULL, NULL, '9fe84d82-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7705-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '3', 200000.00, 1, NULL, NULL, '9fe84eb8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e77f3-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '4', 200000.00, 1, NULL, NULL, '9fe84fe8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e78c2-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '5', 200000.00, 1, NULL, NULL, '9fe8511e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7995-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '6', 200000.00, 1, NULL, NULL, '9fe85252-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7a63-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '7', 200000.00, 1, NULL, NULL, '9fe85381-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7b34-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '8', 200000.00, 1, NULL, NULL, '9fe854b2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7bf4-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '9', 200000.00, 1, NULL, NULL, '9fe855e8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7cb9-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'H', '10', 200000.00, 1, NULL, NULL, '9fe85720-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7d86-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '1', 200000.00, 1, NULL, NULL, '9fe85897-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e7f2e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '2', 200000.00, 1, NULL, NULL, '9fe859d3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8001-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '3', 200000.00, 1, NULL, NULL, '9fe85b0a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e80c4-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '4', 200000.00, 1, NULL, NULL, '9fe85c3f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e81d7-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '5', 200000.00, 1, NULL, NULL, '9fe85d9e-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e82a4-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '6', 200000.00, 1, NULL, NULL, '9fe85ed5-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e836d-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '7', 200000.00, 1, NULL, NULL, '9fe8600b-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8437-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '8', 200000.00, 1, NULL, NULL, '9fe8615f-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8503-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '9', 200000.00, 1, NULL, NULL, '9fe86295-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e85ea-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'I', '10', 200000.00, 1, NULL, NULL, '9fe863c8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e86b9-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '1', 200000.00, 1, NULL, NULL, '9fe86568-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e877e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '2', 200000.00, 1, NULL, NULL, '9fe866a8-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8847-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '3', 200000.00, 1, NULL, NULL, '9fe867e1-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e890f-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '4', 200000.00, 1, NULL, NULL, '9fe86918-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e89d8-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '5', 200000.00, 1, NULL, NULL, '9fe86a55-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8a98-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '6', 200000.00, 1, NULL, NULL, '9fe86b8a-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8b5e-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '7', 200000.00, 1, NULL, NULL, '9fe86cc2-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8c34-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '8', 200000.00, 1, NULL, NULL, '9fe86df3-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8cfb-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '9', 200000.00, 1, NULL, NULL, '9fe86f24-c3d2-11f1-8896-002b67aa92f3');
INSERT INTO `tickets` VALUES ('f55e8dd0-c3f5-11f1-8896-002b67aa92f3', 'c1abe01c-d935-41b2-b152-5be4dca0ccae', 'J', '10', 200000.00, 1, NULL, NULL, '9fe87056-c3d2-11f1-8896-002b67aa92f3');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FullName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Sex` bit(1) NULL DEFAULT NULL COMMENT '0. Woman 1.Man',
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Birthday` datetime NULL DEFAULT NULL,
  `PhoneNumber` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NULL DEFAULT NULL,
  `Role` int NULL DEFAULT 1 COMMENT '1customer\', 2\'organizer\', 3\'admin\'',
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('507953f8-2bb7-4e9a-bc22-546f248a3e7a', 'nguyenvanb', '$2b$10$X3ipVU81i3KYaL4.W9.yfeN.77R3FmcIV1alkdiXM7JVuk8uIsw3S', 'Nguyễn Văn A', b'1', 'b.nguyen@gmail.com', NULL, '0987654321', NULL, NULL, 1);
INSERT INTO `users` VALUES ('5c6de659-39fa-4b52-85ff-467fb4bd0f85', 'nguyenvana', '$2b$10$TJ1hG4E.yWJDyf3HPrIrqee9E7FsZ7digHoZbwKDdWYEkVmdWja56', 'Nguyễn Văn A', b'1', 'a.nguyen@gmail.com', NULL, '0987654321', NULL, NULL, 1);
INSERT INTO `users` VALUES ('79adfffb-d4a7-453f-8434-6f94163ec121', 'admin', '$2b$10$P6NBTz/YEy4U07P.U./pIe7vKs.RmHEJ1t6mq0iZExARNfPGfc8Le', 'Admin Updated', b'1', 'admin@example.com', '1995-05-15 08:00:00', '912345678', NULL, '2026-10-10 22:05:21', 3);
INSERT INTO `users` VALUES ('a8d708ba-d558-47ba-a2ef-2ca78b35c7b8', 'lammm', '$2b$10$UyyLRoK.uT0lI6s2xjEaE.mUcMaiq1q7YN1eq45HZKm3N0Fe5jnwa', NULL, b'1', 'lammm@gmail.com', NULL, '0987654321', NULL, NULL, 2);
INSERT INTO `users` VALUES ('de4d1ef0-e762-4e74-a777-7c5a2849c81a', 'john_doe', '$2b$10$v1mLPXTWdUcMcHJmx5KO0Og6EW.5q5XvF19SXtjRrQ8vAZlKDAllm', 'John Doe', b'1', 'john@example.com', '1995-05-15 00:00:00', '0987654321', NULL, NULL, 1);

-- ----------------------------
-- Table structure for venue_seats
-- ----------------------------
DROP TABLE IF EXISTS `venue_seats`;
CREATE TABLE `venue_seats`  (
  `SeatID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `VenueID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SeatRow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SeatNumber` int NULL DEFAULT NULL,
  `SeatType` tinyint NULL DEFAULT NULL COMMENT '1. Basic 2. Vip 3 VVIP',
  PRIMARY KEY (`SeatID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venue_seats
-- ----------------------------
INSERT INTO `venue_seats` VALUES ('04604098-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('04604d01-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('0460d217-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('0460d4ab-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('0460d641-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('0460d7b5-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('0460d94c-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('0460dafd-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('0460dc6e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('0460de84-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('0460ee65-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('0460f0d8-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('0460f2b1-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('0460f424-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('0460f5bf-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('0460f75a-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('0460f973-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('0460fb4b-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('0460fe27-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('0460ffcc-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('046101c7-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('04610338-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('0461049e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('0461070e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('046108f5-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('04610aa8-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('04610c1b-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('04610d82-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('04610ee3-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('04611050-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('04611355-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('04611518-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('04611689-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('046117ea-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('04611946-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('04611ac0-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('04611c27-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('04611dbd-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('04611f22-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('04612d9f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('046130fe-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('046132a9-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('0461341f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('0461358d-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('046136f2-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('046149ad-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('04614cb1-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('04614fd3-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('04615201-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('04615379-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('04615575-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('046157d0-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('04615a37-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('04615bbf-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('04615dca-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('046160c5-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('046166b1-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('046169fc-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('04616c6b-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('04616e98-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('046171bc-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('046173dd-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('0461776f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('04617b6a-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('04617e6e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('04618084-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('04618289-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('0461848f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('046186e6-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('0461898b-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('04618cc1-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('046190d0-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('046193da-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('04619653-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('046198d1-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('04619b2b-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('04619d7c-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('04619fdf-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('0461a22f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('0461a6fd-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('0461ab1f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('0461b0c3-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('0461b3ae-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('0461b660-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('0461b94d-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('0461bb8d-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('0461be14-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('0461c232-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('0461c50e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('0461c72e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('0461ca27-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('0461ccf8-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('0461cf1e-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('0461d19b-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('0461d3d2-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('0461d98f-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('0461dd00-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('0461df80-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('0461e1d7-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('0461e419-c4bc-11f1-8896-002b67aa92f3', 'fc76a67d-9437-438d-bc58-15ebfe3720e6', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('047302be-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('047309c7-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('04730c9c-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('04730f79-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('0473125d-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('047314c9-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('0473186c-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('04731b5e-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('04731dfc-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('04732043-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('047322a8-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 11, 3);
INSERT INTO `venue_seats` VALUES ('04732529-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'A', 12, 3);
INSERT INTO `venue_seats` VALUES ('04732848-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('04732a8b-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('04732e3a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('0473313d-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('04733380-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('0473378a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('04733a12-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('04733d59-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('04733fc5-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('0473420f-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('04734626-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 11, 3);
INSERT INTO `venue_seats` VALUES ('047350d6-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'B', 12, 3);
INSERT INTO `venue_seats` VALUES ('047354d4-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('0473575d-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('04735b1a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('04735f57-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('047361dd-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('04736430-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('04736667-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('047368a9-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('04736af2-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('047373a3-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('047382ea-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 11, 2);
INSERT INTO `venue_seats` VALUES ('047387be-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'C', 12, 2);
INSERT INTO `venue_seats` VALUES ('04738bb5-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('04738eae-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('0473912f-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('047393f4-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('0473968f-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('04739ac2-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('04739f2e-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('0473a1d4-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('0473a42b-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('0473ad70-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('0473b24a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 11, 2);
INSERT INTO `venue_seats` VALUES ('0473b56d-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'D', 12, 2);
INSERT INTO `venue_seats` VALUES ('0473ba83-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('0473bf16-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('0473c1f4-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('0473f386-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('0473f86a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('0473fbc1-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('0474024c-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('047405e7-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('04740803-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('04740a80-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('04740c4b-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 11, 2);
INSERT INTO `venue_seats` VALUES ('04740ddf-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'E', 12, 2);
INSERT INTO `venue_seats` VALUES ('047410a5-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 1, 2);
INSERT INTO `venue_seats` VALUES ('0474125c-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 2, 2);
INSERT INTO `venue_seats` VALUES ('04741542-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 3, 2);
INSERT INTO `venue_seats` VALUES ('04741775-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 4, 2);
INSERT INTO `venue_seats` VALUES ('04741911-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 5, 2);
INSERT INTO `venue_seats` VALUES ('04741aad-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 6, 2);
INSERT INTO `venue_seats` VALUES ('04741c4d-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 7, 2);
INSERT INTO `venue_seats` VALUES ('04741ddc-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 8, 2);
INSERT INTO `venue_seats` VALUES ('04741f69-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 9, 2);
INSERT INTO `venue_seats` VALUES ('047420f9-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 10, 2);
INSERT INTO `venue_seats` VALUES ('04742434-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 11, 2);
INSERT INTO `venue_seats` VALUES ('047426c1-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'F', 12, 2);
INSERT INTO `venue_seats` VALUES ('04742975-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('04742b33-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('04742cc1-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('04742e64-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('04742ff3-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('04743d62-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('04743fd8-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('04744175-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('04744324-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('04744576-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('04744801-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 11, 1);
INSERT INTO `venue_seats` VALUES ('047449be-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'G', 12, 1);
INSERT INTO `venue_seats` VALUES ('04744c5f-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('04744f24-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('04745144-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('047452d8-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('04745463-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('047456e6-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('04745973-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('04745b7c-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('04745d14-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('04746050-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('04746281-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 11, 1);
INSERT INTO `venue_seats` VALUES ('0474642a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'H', 12, 1);
INSERT INTO `venue_seats` VALUES ('04746642-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('047467d8-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('04746961-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('04746ae1-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('04746c61-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('04746ee2-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('04747149-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('047472e2-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('0474746a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('04747622-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('047477af-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 11, 1);
INSERT INTO `venue_seats` VALUES ('04747aa1-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'I', 12, 1);
INSERT INTO `venue_seats` VALUES ('04747cc9-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('04747fa7-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('047481c8-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('04748359-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('04751979-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('04751d53-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('04751f79-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('04752133-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('047522d7-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('0475289c-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('04752af7-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 11, 1);
INSERT INTO `venue_seats` VALUES ('04752c8f-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'J', 12, 1);
INSERT INTO `venue_seats` VALUES ('047530b4-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 1, 1);
INSERT INTO `venue_seats` VALUES ('0475328f-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 2, 1);
INSERT INTO `venue_seats` VALUES ('04753420-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 3, 1);
INSERT INTO `venue_seats` VALUES ('047535b6-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 4, 1);
INSERT INTO `venue_seats` VALUES ('047537ef-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 5, 1);
INSERT INTO `venue_seats` VALUES ('04753be5-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 6, 1);
INSERT INTO `venue_seats` VALUES ('04753e70-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 7, 1);
INSERT INTO `venue_seats` VALUES ('04754015-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 8, 1);
INSERT INTO `venue_seats` VALUES ('04754259-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 9, 1);
INSERT INTO `venue_seats` VALUES ('04754a14-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 10, 1);
INSERT INTO `venue_seats` VALUES ('04754c1b-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 11, 1);
INSERT INTO `venue_seats` VALUES ('04754dad-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'K', 12, 1);
INSERT INTO `venue_seats` VALUES ('04754fcd-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 1, 1);
INSERT INTO `venue_seats` VALUES ('04755267-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 2, 1);
INSERT INTO `venue_seats` VALUES ('04755483-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 3, 1);
INSERT INTO `venue_seats` VALUES ('04755610-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 4, 1);
INSERT INTO `venue_seats` VALUES ('04755799-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 5, 1);
INSERT INTO `venue_seats` VALUES ('04755922-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 6, 1);
INSERT INTO `venue_seats` VALUES ('04755aab-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 7, 1);
INSERT INTO `venue_seats` VALUES ('04755c31-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 8, 1);
INSERT INTO `venue_seats` VALUES ('04755db1-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 9, 1);
INSERT INTO `venue_seats` VALUES ('0475602a-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 10, 1);
INSERT INTO `venue_seats` VALUES ('04756339-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 11, 1);
INSERT INTO `venue_seats` VALUES ('04756549-c4bc-11f1-8896-002b67aa92f3', 'cb8433c3-9776-4443-adca-d8ba37189d4c', 'L', 12, 1);
INSERT INTO `venue_seats` VALUES ('21fd9f80-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('21fdb3b5-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('21fdb71c-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('21fdb9ef-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('21fdbc9f-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('21fdc01b-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('21fdc26d-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('21fdc40f-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('21fdc5e1-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('21fdc773-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('21fdc9a7-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('21fdcb6d-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('21fdccfc-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('21fdcf67-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('21fdd1f5-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('21fdd483-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('21fdd6d7-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('21fdd923-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('21fddb70-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('21fddfbb-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('21fde390-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('21fde609-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('21fde868-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('21fdeac4-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('21fdf176-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('21fdf5f5-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('21fdfc6b-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('21fdffbf-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('21fe028a-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('21fe050a-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('21fe0847-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('21fe0a4a-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('21fe0c3d-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('21fe0e6b-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('21fe110c-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('21fe13bb-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('21fe1671-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('21fe1919-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('21fe1bac-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('21fe1eb9-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('21fe2298-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('21fe254b-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('21fe27e4-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('21fe2a79-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('21fe2d28-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('21fe308e-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('21fe333b-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('21fe3808-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('21fe3b6a-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('21fe3ddb-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('21fe406a-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('21fe4219-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('21fe43ba-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('21fe4556-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('21fe46e5-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('21fe48be-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('21fe4a60-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('21fe4bf4-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('21fe4dc9-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('21fe4f86-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('21fe51c1-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('21fe535d-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('21fe54e8-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('21fe57b4-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('21fe59d8-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('21fe5b72-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('21fe5d02-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('21fe5e93-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('21fe602a-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('21fe61bb-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('21fe63b3-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('21fe6680-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('21fe69b3-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('21fe6b98-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('21fe6d33-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('21fe6ec6-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('21fe7057-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('21febb68-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('21febf24-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('21fec45d-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('21fec8f5-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('21fecc13-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('21fecea1-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('21fed166-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('21fed485-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('21fed6ed-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('21fed8a0-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('21fedbaf-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('21fedde4-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('21fedf80-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('21fee1ec-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('21fee38f-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('21fee545-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('21fee6e0-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('21fee872-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('21feeb58-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('21feed70-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('21feef05-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('21fef091-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('21fef21f-c3e2-11f1-8896-002b67aa92f3', 'b217d824-2ac9-41fc-b672-2c57a686289b', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('2e957dac-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('2e95805f-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('2e9581b9-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('2e9582e2-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('2e958405-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('2e958523-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('2e95863e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('2e95874e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('2e95885e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('2e958971-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('2e958ad0-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('2e958bec-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('2e958cfc-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('2e958e09-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('2e958f23-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('2e959033-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('2e95913e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('2e9592f4-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('2e959406-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('2e95951e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('2e95978d-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('2e9598d8-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('2e9599f0-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('2e959b04-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('2e959c20-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('2e959d35-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('2e959e45-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('2e959f55-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('2e95a06a-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('2e95a179-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('2e95a2e5-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('2e95a3fe-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('2e95a510-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('2e95a628-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('2e95a73e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('2e95a850-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('2e95a960-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('2e95aa73-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('2e95ab88-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('2e95ac9b-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('2e95ae9e-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('2e95afc7-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('2e95b10d-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('2e95b22d-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('2e95b345-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('2e95b469-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('2e95b57c-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('2e95b690-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('2e95b84f-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('2e95b971-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('2e95baf3-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('2e95bc18-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('2e95be5c-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('2e95bf92-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('2e95c0b5-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('2e95c1db-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('2e95c2fd-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('2e95c41f-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('2e95c540-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('2e95c666-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('2e95c7c7-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('2e95c8fe-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('2e95ca27-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('2e95cb41-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('2e95cd26-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('2e95ce79-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('2e95cfa1-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('2e95d0bf-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('2e95d1ee-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('2e95d319-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('2e95d480-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('2e95d5a8-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('2e95d6cb-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('2e95d7e9-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('2e95d90c-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('2e95da28-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('2e95db45-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('2e95dc6a-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('2e95dd8d-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('2e95e1ae-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('2e95e346-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('2e95e47a-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('2e95e5a1-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('2e95e6c6-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('2e95e815-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('2e95e939-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('2e95eb2a-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('2e95ec78-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('2e95eda5-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('2e95eecf-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('2e95f041-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('2e95f187-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('2e95f2ae-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('2e95f406-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('2e95f585-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('2e95f70f-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('2e95f843-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('2e95f967-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('2e95fb0a-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('2e95fca6-c3f2-11f1-8896-002b67aa92f3', 'cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('5f6b6855-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('5f6b6a55-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('5f6b6b71-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('5f6b6d74-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('5f6b6ee4-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('5f6b708a-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7176-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7263-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('5f6b734d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7505-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('5f6b763f-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('5f6b773c-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('5f6b78c9-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('5f6b79b0-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7a9d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7b87-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7c71-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7d58-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7e41-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('5f6b7fcc-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('5f6b80f5-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('5f6b81e8-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('5f6b82d7-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('5f6b83c2-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('5f6b84be-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('5f6b85b5-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('5f6b86a3-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('5f6b878f-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('5f6b889d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('5f6b898d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('5f6b8ab3-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('5f6b8ba7-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('5f6b8c95-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('5f6b8d84-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('5f6b8e71-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('5f6b8f5e-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('5f6b904a-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('5f6b913d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('5f6b9228-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('5f6b9312-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('5f6b944b-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('5f6b953d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('5f6b962c-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('5f6b971e-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('5f6b980c-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('5f6b98f9-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('5f6b99e6-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('5f6b9ad1-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('5f6b9bbe-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('5f6b9cac-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('5f6b9dd7-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('5f6b9ec9-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('5f6b9fd1-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba0f0-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba1e2-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba2d4-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba3c4-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba554-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba646-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba737-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba865-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('5f6ba95b-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('5f6baa52-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('5f6bab46-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('5f6bac3c-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('5f6bad31-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('5f6bae21-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('5f6baf10-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb004-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb0f6-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb221-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb318-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb411-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb502-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb5f3-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb6e4-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb7d6-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb8e8-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('5f6bb9dc-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('5f6bbada-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('5f6bbc07-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('5f6bbd56-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('5f6bbe5b-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('5f6bbf52-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc06c-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc162-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc257-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc349-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc43e-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc53d-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc669-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc764-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc858-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('5f6bc94a-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('5f6bca3b-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('5f6bcb2f-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('5f6bcc25-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('5f6bcdbb-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('5f6bcebc-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('5f6bcfb8-c3f3-11f1-8896-002b67aa92f3', '3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('72f3f3d7-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('72f3f67e-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('72f3f7b5-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('72f3f8b8-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('72f3f9ae-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('72f3faa7-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('72f3fba5-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('72f3fc99-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('72f3fd8f-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('72f3fe8e-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('72f3ffce-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('72f400d0-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('72f401c3-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('72f402ba-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('72f403e2-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('72f404d9-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('72f405ca-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('72f406e5-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('72f40803-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('72f408f9-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('72f40a45-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('72f40b46-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('72f40c3c-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('72f40d2f-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('72f40e1d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('72f40f0f-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('72f41005-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('72f410fc-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('72f411ec-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('72f412e5-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('72f41439-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('72f41534-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('72f41624-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('72f41712-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('72f41801-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('72f418ef-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('72f419dc-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('72f41aca-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('72f41bbc-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('72f41caf-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('72f41dfa-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('72f41ef6-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('72f4200b-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('72f420fe-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('72f421ee-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('72f4242e-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('72f42549-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('72f4263d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('72f4272b-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('72f4282b-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('72f4295d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('72f42a53-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('72f42b43-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('72f42c30-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('72f42d1f-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('72f42e0e-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('72f42efd-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('72f43350-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('72f434d3-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('72f435e1-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('72f43717-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('72f43812-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('72f43988-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('72f43a8e-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('72f43ba7-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('72f43c9d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('72f43d8d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('72f43e80-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('72f43fa0-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('72f4409c-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('72f441ce-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('72f442c5-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('72f443b4-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('72f444a4-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('72f44594-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('72f44684-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('72f44775-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('72f4488d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('72f44997-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('72f44a89-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('72f44bd0-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('72f44cc7-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('72f44dbb-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('72f44ead-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('72f44fd9-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('72f450cb-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('72f451bb-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('72f452ae-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('72f453a5-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('72f45498-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('72f45626-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('72f45739-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('72f4582d-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('72f4591c-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('72f45a0c-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('72f45b23-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('72f45c7b-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('72f45df0-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('72f45f27-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('72f46022-c3ef-11f1-8896-002b67aa92f3', '4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('79590a72-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('795912d9-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('79591670-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('795919ce-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('79591bf2-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('79591ddb-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('79592044-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('79592250-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('79592440-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('79592814-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('79592ae7-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('79592cc9-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('79592ebc-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('7959311e-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('795932e8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('795934b4-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('79593678-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('795938d6-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('79593adf-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('79593c9a-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('79593fd3-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('795941ca-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('79594385-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('79594532-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('79594826-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('79594ad7-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('79594ce8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('79594eb0-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('7959505e-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('79595239-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('795954b4-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('7959571d-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('79595906-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('79595ba9-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('79596851-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('79596aa1-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('79596c66-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('79596d8e-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('79596f2a-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('7959707c-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('7959720c-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('79597389-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('795975cb-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('795976f9-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('79597801-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('7959799f-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('79597bf8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('79597de7-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('79598023-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('79598191-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('79598310-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('795984b7-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('795985fe-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('795987f5-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('795989db-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('79598bc0-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('79598d4b-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('79598e64-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('79598f6b-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('7959906a-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('795991c1-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('79599360-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('795994a8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('795995df-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('795996dc-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('79599807-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('79599901-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('795999f8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('79599b04-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('79599c80-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('79599dfd-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('79599ef9-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('79599ff4-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('7959a0ed-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('7959a1e4-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('7959a2dc-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('7959a3d6-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('7959a5e8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('7959a7f6-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('7959a9a3-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('7959aadf-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('7959abfc-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('7959acf8-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('7959adec-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('7959aefd-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('7959baf2-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('7959c126-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('7959c3a2-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('7959c581-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('7959c756-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('7959c975-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('7959cb17-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('7959ccab-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('7959cf27-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('7959d0b6-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('7959d241-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('7959d3bf-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('7959d544-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('7959d6cc-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('7959d84e-c3d0-11f1-8896-002b67aa92f3', '6856c4e1-de9b-4bb8-8f65-e018ea003369', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('9fe7a715-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('9fe7abf3-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('9fe7f347-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('9fe7f50b-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('9fe7f715-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('9fe7f864-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('9fe7f9af-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('9fe7fafa-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('9fe7fc33-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('9fe7fd74-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('9fe7ff3d-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('9fe80080-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('9fe801b5-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('9fe802f4-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('9fe80434-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('9fe80568-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('9fe8069c-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('9fe807e5-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('9fe8091a-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('9fe80a4f-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('9fe80bcb-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('9fe80d37-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('9fe80e6e-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('9fe80fa9-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('9fe810df-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('9fe81210-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('9fe81371-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('9fe814ac-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('9fe815df-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('9fe81715-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('9fe818a8-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('9fe819df-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('9fe81b13-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('9fe81c55-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('9fe81d8b-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('9fe81f32-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('9fe82075-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('9fe821af-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('9fe822eb-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('9fe82421-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('9fe82599-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('9fe826d2-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('9fe82809-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('9fe82964-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('9fe82a98-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('9fe82bdd-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('9fe82d21-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('9fe82e57-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('9fe82f88-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('9fe830bc-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('9fe83237-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('9fe83374-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('9fe834af-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('9fe835e7-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('9fe8371f-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('9fe8387c-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('9fe839be-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('9fe83af4-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('9fe83c25-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('9fe83d59-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('9fe83ed4-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('9fe84011-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('9fe8414f-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('9fe84285-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('9fe8440c-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('9fe845ae-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('9fe84712-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('9fe8484c-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('9fe84993-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('9fe84aca-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('9fe84c45-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('9fe84d82-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('9fe84eb8-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('9fe84fe8-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('9fe8511e-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('9fe85252-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('9fe85381-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('9fe854b2-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('9fe855e8-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('9fe85720-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('9fe85897-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('9fe859d3-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('9fe85b0a-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('9fe85c3f-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('9fe85d9e-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('9fe85ed5-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('9fe8600b-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('9fe8615f-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('9fe86295-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('9fe863c8-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('9fe86568-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('9fe866a8-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('9fe867e1-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('9fe86918-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('9fe86a55-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('9fe86b8a-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('9fe86cc2-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('9fe86df3-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('9fe86f24-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('9fe87056-c3d2-11f1-8896-002b67aa92f3', '37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('a20f02ea-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('a20f06fe-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('a20f0915-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('a20f0ad8-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('a20f0ceb-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('a20f0eb3-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('a20f105f-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('a20f120b-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('a20f13fc-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('a20f15ac-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('a20f17e5-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('a20f1991-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('a20f1c4c-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('a20f1e80-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('a20f2102-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('a20f22b5-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('a20f2461-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('a20f2602-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('a20f27a4-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('a20f293e-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('a20f2cd6-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('a20f2f0d-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('a20f30bf-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('a20f3271-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('a20f3420-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('a20f35d6-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('a20f37c4-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('a20f397d-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('a20f3b64-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('a20f3d6c-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('a20f5475-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('a20f576c-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('a20f5936-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('a20f5af5-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('a20f5c9d-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('a20f5e46-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('a20f6084-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('a20f62be-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('a20f6476-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('a20f663a-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('a20f686e-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('a20f6a1d-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('a20f6bc0-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('a20f6d70-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('a20f70dc-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('a20f7346-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('a20f7500-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('a20f7705-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('a20f7916-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('a20f7b2e-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('a20f7eb6-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('a20f80f0-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('a20fd99e-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('a20fdc2d-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('a20fde5c-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('a20fe0f8-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('a20fe3cc-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('a20fe6f2-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('a20fe9de-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('a20fece8-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('a20ff502-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('a20ff943-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('a20ffed2-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('a21002b1-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('a210058b-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('a2100917-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('a2100c11-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('a2100f32-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('a21011fa-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('a2101744-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('a21022d6-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('a21026d3-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('a21029d1-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('a2102cb0-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('a2102f53-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('a21032d9-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('a2103586-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('a2103877-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('a2103d01-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('a2104035-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('a21043dc-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('a21046b2-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('a210496f-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('a21051f7-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('a210559c-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('a2105cd1-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('a2106385-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('a2106839-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('a2106ba0-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('a2106e9b-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('a2107487-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('a2107772-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('a21079d4-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('a2107cbe-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('a2107fc5-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('a210842b-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('a2108752-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('a2108a7f-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('a2108f15-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('a2109291-c3d0-11f1-8896-002b67aa92f3', '90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('c4a1ed60-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('c4a1f16a-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('c4a1f691-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('c4a1f83f-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('c4a1f9bc-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('c4a1fb35-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('c4a1fcb4-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('c4a1fe1a-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('c4a1ff82-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('c4a201ef-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('c4a203ec-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('c4a20560-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('c4a206d1-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('c4a20834-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('c4a2099d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('c4a20b2d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('c4a20c94-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('c4a20df5-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('c4a20f57-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('c4a210c1-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('c4a21295-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('c4a21405-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('c4a21569-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('c4a2170f-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('c4a2193e-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('c4a21beb-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('c4a21d93-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('c4a21ef9-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('c4a2205d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('c4a221c9-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('c4a223bf-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('c4a2252e-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('c4a2268f-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('c4a227fe-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('c4a2295b-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('c4a22ab8-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('c4a22c15-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('c4a22d77-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('c4a22ed3-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('c4a23036-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('c4a2323d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('c4a233ac-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('c4a2350d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('c4a2366e-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('c4a237cc-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('c4a2397d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('c4a23adb-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('c4a23c39-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('c4a23d9b-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('c4a23f01-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('c4a240b9-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('c4a2421e-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('c4a24594-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('c4a24708-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('c4a24865-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('c4a249c5-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('c4a24b23-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('c4a24c8c-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('c4a24dec-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('c4a24fef-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('c4a251b4-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('c4a25318-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('c4a25475-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('c4a25611-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('c4a25774-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('c4a258df-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('c4a25a43-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('c4a25bdb-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('c4a25d67-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('c4a25eca-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('c4a26089-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('c4a261ee-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('c4a2634b-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('c4a2652b-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('c4a26691-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('c4a267f2-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('c4a26956-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('c4a26ab8-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('c4a26c18-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('c4a26d7b-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('c4a26f36-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('c4a2709b-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('c4a271fc-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('c4a2738c-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('c4a2751e-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('c4a2767d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('c4a277e6-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('c4a27980-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('c4a27ae9-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('c4a27c7d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('c4a27e38-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('c4a27f99-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('c4a280fc-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('c4a2825c-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('c4a283bf-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('c4a2851a-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('c4a2867d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('c4a287df-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('c4a2893d-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('c4a28aa2-c3eb-11f1-8896-002b67aa92f3', '87f49215-5409-4b4a-b333-190ca155d960', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('ce81939a-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('ce8195e2-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('ce8197ea-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('ce8198f9-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('ce819a20-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('ce819b22-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('ce819c24-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('ce819d1e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('ce819e13-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('ce819f3e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('ce81a089-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('ce81a18d-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('ce81a28e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('ce81a389-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('ce81a48f-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('ce81a587-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('ce81a67e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('ce81a77a-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('ce81a878-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('ce81a96e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('ce81aaad-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('ce81abac-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('ce81aca8-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('ce81ad9e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('ce81ae9c-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('ce81af92-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('ce81b089-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('ce81b1a0-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('ce81b29d-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('ce81b391-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('ce81b4dc-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('ce81b601-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('ce81b6f9-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('ce81b812-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('ce81b90d-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('ce81ba01-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('ce81baf6-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('ce81bbed-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('ce81bce2-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('ce81be79-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('ce81bfae-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('ce81c0b4-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('ce81c1b2-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('ce81c2cd-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('ce81c3d0-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('ce81c621-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('ce81c743-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('ce81c846-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('ce81c940-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('ce81ca66-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('ce81cbb0-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('ce81ccb4-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('ce81cdb9-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('ce81ceb8-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('ce81cfb5-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('ce81d0b6-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('ce81d1af-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('ce81d2ad-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('ce81d443-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('ce81d552-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('ce81d6a1-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('ce81d7a7-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('ce81d8af-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('ce81d9ae-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('ce81daaa-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('ce81dba6-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('ce81dca1-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('ce81dd9d-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('ce81deb3-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('ce81dfb0-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('ce81e0e9-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('ce81e207-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('ce81e308-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('ce81e405-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('ce81e4ff-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('ce81e5fa-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('ce81e6f9-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('ce81e7f7-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('ce81e8f1-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('ce81e9ee-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('ce81eb32-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('ce81ec39-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('ce81ed3a-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('ce81ee51-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('ce81ef71-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('ce81f06e-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('ce81f16b-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('ce81f267-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('ce81f360-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('ce81f462-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('ce81f59a-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('ce81f69c-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('ce81f79c-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('ce81f8b6-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('ce81f9b6-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('ce81fab3-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('ce81fbae-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('ce81fcaa-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('ce81fda8-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('ce81fea8-c3fa-11f1-8896-002b67aa92f3', '7cab62e9-c978-4640-8229-7c60209e06ba', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('cf84d659-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('cf84e31e-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('cf84e514-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('cf84e652-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('cf84e786-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('cf84e8a5-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('cf84e9c4-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('cf84eb1a-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('cf84ec2e-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('cf84ed49-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('cf84eed2-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('cf84f002-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('cf84f11b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('cf84f22d-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('cf84f349-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('cf84f45b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('cf84f56c-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('cf84f67a-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('cf84f829-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('cf84f937-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('cf84fa97-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('cf84fbb6-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('cf84fd04-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('cf84fe15-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('cf84ff23-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('cf85002f-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('cf850137-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('cf853cce-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('cf853e4d-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('cf853f7d-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('cf854112-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('cf854222-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('cf854325-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('cf8544c3-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('cf8545bf-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('cf8546b8-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('cf8547b2-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('cf8548ab-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('cf8549a8-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('cf854aa1-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('cf854bd8-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('cf854cf0-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('cf854de8-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('cf854edd-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('cf854ffb-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('cf855141-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('cf8552a5-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('cf8553a5-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('cf8554a7-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('cf8555a0-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('cf8556d4-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('cf85582d-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('cf858a6e-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('cf858c05-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('cf858d29-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('cf858e69-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('cf858f74-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('cf85907f-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('cf859185-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('cf85932b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('cf85948f-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('cf859597-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('cf859695-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('cf859796-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('cf859894-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('cf85998c-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('cf859aa9-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('cf859baa-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('cf859cf7-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('cf859df2-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('cf859f33-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('cf85a034-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('cf85a12b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('cf85a226-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('cf85a322-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('cf85a41e-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('cf85a513-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('cf85a60c-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('cf85a702-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('cf85a7fb-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('cf85a951-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('cf85aa52-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('cf85ab50-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('cf85ac4b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('cf85ad65-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('cf85ae5f-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('cf85af5b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('cf85b055-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('cf85b16e-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('cf85b26e-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('cf85b3a9-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('cf85b4a5-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('cf85b5a7-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('cf85b69f-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('cf85b7af-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('cf85b8ca-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('cf85b9d0-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('cf85bb6b-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('cf85bc63-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('cf85bd57-c3d5-11f1-8896-002b67aa92f3', 'c8529c59-d6b0-46c8-a158-fd64a1df5091', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('e69b1c10-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('e69b1f82-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('e69b272d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('e69b2880-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('e69b29c4-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('e69b2adf-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('e69b2c0f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('e69b2d2b-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('e69b2e42-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('e69b3018-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('e69b31a5-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('e69b32ba-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('e69b33c7-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('e69b34d8-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('e69b35ef-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('e69b36fb-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('e69b380e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('e69b3925-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('e69b3a3e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('e69b3b4f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('e69b3c9a-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('e69b3e49-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('e69b3f4e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('e69b4053-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('e69b4156-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('e69b425f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('e69b4366-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('e69b446c-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('e69b4570-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('e69b46a1-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('e69b4945-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('e69b4b4d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('e69b4c7e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('e69b4d86-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('e69b4e8f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('e69b4f99-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('e69b509f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('e69b51a7-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('e69b52ae-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('e69b53b2-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('e69b54f5-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('e69b5602-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('e69b5705-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('e69b5808-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('e69b590d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('e69b5a2a-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('e69b5b38-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('e69b5c41-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('e69b5d4a-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('e69b5e4e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('e69b5f8e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('e69b6096-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('e69b6240-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('e69b6412-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('e69b654d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('e69b665d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('e69b6771-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('e69b687f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('e69b6989-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('e69b6a95-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('e69b6be0-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('e69b6cf0-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('e69b6dfe-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('e69b6f0d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('e69b701e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('e69b7130-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('e69b7242-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('e69b734e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('e69b746e-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('e69b757c-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('e69b76c7-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('e69b77d7-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('e69b78e3-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('e69b79f5-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('e69b7aff-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('e69b7cbf-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('e69b7df1-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('e69b7f04-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('e69b803b-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('e69b814b-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('e69b8297-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('e69b83a7-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('e69b84b5-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('e69b85c4-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('e69b86f5-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('e69b8807-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('e69b8914-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('e69b8a22-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('e69b8bce-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('e69b8cd3-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('e69b8e13-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('e69b8f1c-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('e69b9023-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('e69b9132-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('e69b923f-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('e69b9349-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('e69b944d-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('e69b960a-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('e69b9796-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('e69b98ae-c3f7-11f1-8896-002b67aa92f3', '15a42854-e71a-425d-8d12-0a9b264ae25f', 'J', 10, 1);
INSERT INTO `venue_seats` VALUES ('f4f967a5-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 1, 3);
INSERT INTO `venue_seats` VALUES ('f4f96b08-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 2, 3);
INSERT INTO `venue_seats` VALUES ('f4f96d1b-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 3, 3);
INSERT INTO `venue_seats` VALUES ('f4f96f1d-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 4, 3);
INSERT INTO `venue_seats` VALUES ('f4f97102-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 5, 3);
INSERT INTO `venue_seats` VALUES ('f4f972c2-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 6, 3);
INSERT INTO `venue_seats` VALUES ('f4f97483-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 7, 3);
INSERT INTO `venue_seats` VALUES ('f4f97637-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 8, 3);
INSERT INTO `venue_seats` VALUES ('f4f977e8-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 9, 3);
INSERT INTO `venue_seats` VALUES ('f4f9799c-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'A', 10, 3);
INSERT INTO `venue_seats` VALUES ('f4f97c26-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 1, 3);
INSERT INTO `venue_seats` VALUES ('f4f97de1-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 2, 3);
INSERT INTO `venue_seats` VALUES ('f4f97f85-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 3, 3);
INSERT INTO `venue_seats` VALUES ('f4f98119-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 4, 3);
INSERT INTO `venue_seats` VALUES ('f4f98377-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 5, 3);
INSERT INTO `venue_seats` VALUES ('f4f98521-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 6, 3);
INSERT INTO `venue_seats` VALUES ('f4f986c0-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 7, 3);
INSERT INTO `venue_seats` VALUES ('f4f988fe-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 8, 3);
INSERT INTO `venue_seats` VALUES ('f4f98b81-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 9, 3);
INSERT INTO `venue_seats` VALUES ('f4f98d39-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'B', 10, 3);
INSERT INTO `venue_seats` VALUES ('f4f98f05-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 1, 2);
INSERT INTO `venue_seats` VALUES ('f4f99026-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 2, 2);
INSERT INTO `venue_seats` VALUES ('f4f99132-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 3, 2);
INSERT INTO `venue_seats` VALUES ('f4f9923d-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 4, 2);
INSERT INTO `venue_seats` VALUES ('f4f9934a-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 5, 2);
INSERT INTO `venue_seats` VALUES ('f4f9944d-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 6, 2);
INSERT INTO `venue_seats` VALUES ('f4f99551-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 7, 2);
INSERT INTO `venue_seats` VALUES ('f4f99659-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 8, 2);
INSERT INTO `venue_seats` VALUES ('f4f9975a-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 9, 2);
INSERT INTO `venue_seats` VALUES ('f4f99864-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'C', 10, 2);
INSERT INTO `venue_seats` VALUES ('f4f999c4-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 1, 2);
INSERT INTO `venue_seats` VALUES ('f4f99ace-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 2, 2);
INSERT INTO `venue_seats` VALUES ('f4f99bd0-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 3, 2);
INSERT INTO `venue_seats` VALUES ('f4f99cdb-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 4, 2);
INSERT INTO `venue_seats` VALUES ('f4f99ddd-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 5, 2);
INSERT INTO `venue_seats` VALUES ('f4f99f11-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 6, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a014-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 7, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a118-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 8, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a21a-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 9, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a31b-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'D', 10, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a47d-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 1, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a585-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 2, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a684-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 3, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a788-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 4, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a888-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 5, 2);
INSERT INTO `venue_seats` VALUES ('f4f9a99f-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 6, 2);
INSERT INTO `venue_seats` VALUES ('f4f9aaa0-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 7, 2);
INSERT INTO `venue_seats` VALUES ('f4f9aba6-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 8, 2);
INSERT INTO `venue_seats` VALUES ('f4f9aca6-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 9, 2);
INSERT INTO `venue_seats` VALUES ('f4f9adaa-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'E', 10, 2);
INSERT INTO `venue_seats` VALUES ('f4f9af99-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 1, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b0aa-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 2, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b1b7-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 3, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b2c2-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 4, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b3c9-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 5, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b4d4-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 6, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b5dc-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 7, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b6e6-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 8, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b7f0-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 9, 1);
INSERT INTO `venue_seats` VALUES ('f4f9b8fa-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'F', 10, 1);
INSERT INTO `venue_seats` VALUES ('f4f9ba6f-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 1, 1);
INSERT INTO `venue_seats` VALUES ('f4f9bb85-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 2, 1);
INSERT INTO `venue_seats` VALUES ('f4f9bcb5-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 3, 1);
INSERT INTO `venue_seats` VALUES ('f4f9bdc7-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 4, 1);
INSERT INTO `venue_seats` VALUES ('f4f9bed0-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 5, 1);
INSERT INTO `venue_seats` VALUES ('f4f9bfdb-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 6, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c0e8-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 7, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c1f3-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 8, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c311-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 9, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c423-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'G', 10, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c578-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 1, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c689-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 2, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c79f-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 3, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c8ac-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 4, 1);
INSERT INTO `venue_seats` VALUES ('f4f9c9b5-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 5, 1);
INSERT INTO `venue_seats` VALUES ('f4f9cac8-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 6, 1);
INSERT INTO `venue_seats` VALUES ('f4f9cbd2-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 7, 1);
INSERT INTO `venue_seats` VALUES ('f4f9cce1-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 8, 1);
INSERT INTO `venue_seats` VALUES ('f4f9cdee-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 9, 1);
INSERT INTO `venue_seats` VALUES ('f4f9cefe-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'H', 10, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d04a-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 1, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d1f1-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 2, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d311-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 3, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d421-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 4, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d627-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 5, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d73b-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 6, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d844-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 7, 1);
INSERT INTO `venue_seats` VALUES ('f4f9d954-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 8, 1);
INSERT INTO `venue_seats` VALUES ('f4f9da5a-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 9, 1);
INSERT INTO `venue_seats` VALUES ('f4f9dbb0-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'I', 10, 1);
INSERT INTO `venue_seats` VALUES ('f4f9dd38-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 1, 1);
INSERT INTO `venue_seats` VALUES ('f4f9de56-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 2, 1);
INSERT INTO `venue_seats` VALUES ('f4f9df60-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 3, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e06a-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 4, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e172-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 5, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e27e-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 6, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e382-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 7, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e488-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 8, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e5a1-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 9, 1);
INSERT INTO `venue_seats` VALUES ('f4f9e6a8-c3f5-11f1-8896-002b67aa92f3', '2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'J', 10, 1);

-- ----------------------------
-- Table structure for venues
-- ----------------------------
DROP TABLE IF EXISTS `venues`;
CREATE TABLE `venues`  (
  `VenueID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `VenueName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `VenueAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Capacity` int NULL DEFAULT NULL,
  `SeatingRow` int NULL DEFAULT NULL,
  `SeatingCol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`VenueID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venues
-- ----------------------------
INSERT INTO `venues` VALUES ('15a42854-e71a-425d-8d12-0a9b264ae25f', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('2cb2a6b4-d799-48d8-84e9-5839fde6f093', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('37473cd0-7174-4b4a-be0b-1f495d5bcb80', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', 600, 10, '10');
INSERT INTO `venues` VALUES ('3d34689a-4a99-4bea-8399-43aabf8c4e1c', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('4f8337b5-c8b4-44a4-9bda-1f8bc8e7f9a7', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('6856c4e1-de9b-4bb8-8f65-e018ea003369', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', 600, 10, '10');
INSERT INTO `venues` VALUES ('7cab62e9-c978-4640-8229-7c60209e06ba', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('87f49215-5409-4b4a-b333-190ca155d960', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('90fd3e8a-8875-4194-b8da-2b0af6d14d90', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', 600, 10, '10');
INSERT INTO `venues` VALUES ('b217d824-2ac9-41fc-b672-2c57a686289b', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', 600, 10, '10');
INSERT INTO `venues` VALUES ('c8529c59-d6b0-46c8-a158-fd64a1df5091', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', 600, 10, '10');
INSERT INTO `venues` VALUES ('cb8433c3-9776-4443-adca-d8ba37189d4c', 'Hanoi Opera House Grand', '1 Trang Tien, Hanoi', 800, 12, '12');
INSERT INTO `venues` VALUES ('cfe09a32-a45b-4ddd-9c4d-db647e8b5a45', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');
INSERT INTO `venues` VALUES ('fc76a67d-9437-438d-bc58-15ebfe3720e6', 'Hanoi Opera House', '1 Trang Tien, Hoan Kiem, Hanoi', NULL, 10, '10');

-- ----------------------------
-- Procedure structure for usp_Booking_Delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Booking_Delete`;
delimiter ;;
CREATE PROCEDURE `usp_Booking_Delete`(pBookingID VARCHAR(36))
BEGIN
    UPDATE bookings
    SET IsDeleted = 1
    WHERE BookingID = pBookingID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Booking_GetByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Booking_GetByID`;
delimiter ;;
CREATE PROCEDURE `usp_Booking_GetByID`(pBookingID VARCHAR(36))
BEGIN
    SELECT 
        b.BookingID, b.BookingCode, b.Status, b.ExpiredAt, b.CreateDate,
        e.EventName, e.EventDate,
        v.VenueName, v.VenueAddress,
        t.TicketID, t.SeatRow, t.SeatNumber, t.Price
    FROM bookings b
    LEFT JOIN events e ON e.EventID = b.EventID
    LEFT JOIN venues v ON v.VenueID = e.VenueID
    LEFT JOIN tickets t ON t.BookingID = b.BookingID
    WHERE b.BookingID = pBookingID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Booking_GetByUserID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Booking_GetByUserID`;
delimiter ;;
CREATE PROCEDURE `usp_Booking_GetByUserID`(pUserID varchar(36))
BEGIN
	SELECT b.BookingID,
  b.Status,
  b.ExpiredAt,
  b.CreateDate,
  e.EventName,
  v.VenueName,
  v.VenueAddress,
  t.TicketID,
  t.SeatRow,
  t.SeatNumber,
  t.Price
  FROM bookings b
  left join `events` e on e.EventID = b.EventID
  left join venues v on v.VenueID = e.VenueID
  left join tickets t on t.BookingID = b.BookingID
  WHERE b.UserID = pUserID and b.IsDeleted = 0
  ORDER BY b.CreateDate DESC, t.SeatRow, t.SeatNumber;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Booking_GetExpired
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Booking_GetExpired`;
delimiter ;;
CREATE PROCEDURE `usp_Booking_GetExpired`()
BEGIN
    SELECT BookingID
    FROM bookings b
    WHERE Status = 1 AND ExpiredAt < NOW() and b.IsDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Booking_Insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Booking_Insert`;
delimiter ;;
CREATE PROCEDURE `usp_Booking_Insert`(pBookingID   VARCHAR(36),
    pUserID      VARCHAR(36),
    pEventID     VARCHAR(36),
    pBookingCode VARCHAR(30),
    pExpiresAt   DATETIME)
BEGIN
    INSERT INTO bookings (
        BookingID, 
        UserID, 
        EventID, 
        BookingCode,
        Status, 
        ExpiredAt
    ) VALUES (
        pBookingID, 
        pUserID, 
        pEventID, 
        pBookingCode,
        1, 
        pExpiresAt
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Booking_UpdateStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Booking_UpdateStatus`;
delimiter ;;
CREATE PROCEDURE `usp_Booking_UpdateStatus`(pBookingID VARCHAR(36),
    pStatus    VARCHAR(20))
BEGIN
    UPDATE bookings b
    SET Status    = pStatus,
        UpdateDate = NOW()
    WHERE BookingID = pBookingID and b.IsDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Category_CheckExistName
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Category_CheckExistName`;
delimiter ;;
CREATE PROCEDURE `usp_Category_CheckExistName`(pName VARCHAR(100))
BEGIN
    SELECT count(*) as Total
    FROM categories WHERE pName = Name;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Category_Delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Category_Delete`;
delimiter ;;
CREATE PROCEDURE `usp_Category_Delete`(pCategoryID      VARCHAR(36))
BEGIN
    UPDATE categories
    SET IsActive        = 0
    WHERE CategoryID = pCategoryID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Category_GetAll
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Category_GetAll`;
delimiter ;;
CREATE PROCEDURE `usp_Category_GetAll`(pPageIndex INT,
    pPageSize  INT)
BEGIN
    DECLARE vOffset INT;
    SET vOffset = (pPageIndex - 1) * pPageSize;
 
    SELECT CategoryID, Name, IsActive, Description
    FROM categories
    WHERE IsActive = 1
    ORDER BY Name
    LIMIT pPageSize OFFSET vOffset;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Category_GetByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Category_GetByID`;
delimiter ;;
CREATE PROCEDURE `usp_Category_GetByID`(pCategoryID VARCHAR(36))
BEGIN
    SELECT CategoryID, Name, IsActive, Description
    FROM categories
    WHERE CategoryID = pCategoryID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Category_Insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Category_Insert`;
delimiter ;;
CREATE PROCEDURE `usp_Category_Insert`(pCategoryID      VARCHAR(36),
    pName            VARCHAR(255),
    pDescription     VARCHAR(255))
BEGIN
    INSERT INTO categories (
        CategoryID, Name, IsActive, Description
    ) VALUES (
        pCategoryID, pName, 1, pDescription
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Category_Update
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Category_Update`;
delimiter ;;
CREATE PROCEDURE `usp_Category_Update`(pCategoryID      VARCHAR(36),
    pName            VARCHAR(255),
    pDescription     VARCHAR(255),
    pIsActive        TINYINT,
    pUpdateDate datetime)
BEGIN
    UPDATE categories
    SET Name            = pName,
        Description     = pDescription,
        IsActive        = pIsActive,
        UpdateDate = pUpdateDate
    WHERE CategoryID = pCategoryID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_Delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_Delete`;
delimiter ;;
CREATE PROCEDURE `usp_Event_Delete`(pEventID VARCHAR(36))
BEGIN
    DELETE FROM events WHERE EventID = pEventID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_GetAll
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_GetAll`;
delimiter ;;
CREATE PROCEDURE `usp_Event_GetAll`(pPageIndex INT,
    pPageSize  INT)
BEGIN
    DECLARE vOffset INT;
    SET vOffset = (pPageIndex - 1) * pPageSize;

    SELECT e.*, v.VenueName, c.Name
    FROM events e
    LEFT JOIN venues v ON v.VenueID = e.VenueID
    LEFT JOIN categories c ON c.CategoryID = e.CategoryID
    ORDER BY e.EventDate DESC
    LIMIT pPageSize OFFSET vOffset;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_GetByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_GetByID`;
delimiter ;;
CREATE PROCEDURE `usp_Event_GetByID`(pEventID VARCHAR(36))
BEGIN
    SELECT e.*, v.VenueName, v.VenueAddress, c.Name
    FROM events e
    LEFT JOIN venues v ON v.VenueID = e.VenueID
    LEFT JOIN categories c ON c.CategoryID = e.CategoryID
    WHERE e.EventID = pEventID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_Insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_Insert`;
delimiter ;;
CREATE PROCEDURE `usp_Event_Insert`(pEventID     VARCHAR(36),
    pEventName   VARCHAR(255),
    pDescription TEXT,
    pCategoryID  VARCHAR(36),
    pVenueID     VARCHAR(36),
    
    pEventDate   DATETIME,
    pStatus      VARCHAR(20))
BEGIN
    INSERT INTO events (
        EventID, EventName, Description, CategoryID, VenueID,
         EventDate,  Status
    ) VALUES (
        pEventID, pEventName, pDescription, pCategoryID, pVenueID,
         pEventDate, pStatus
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_Search
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_Search`;
delimiter ;;
CREATE PROCEDURE `usp_Event_Search`(IN pDate        DATE,
    IN pCategoryID  VARCHAR(36),
    IN pVenueID     VARCHAR(36),
    IN pMinPrice    DECIMAL(12,2),
    IN pMaxPrice    DECIMAL(12,2),
    IN pSortBy      VARCHAR(20),
    IN pPageIndex   INT,
    IN pPageSize    INT)
BEGIN
    DECLARE vOffset INT;

    -- Xử lý phân trang mặc định
    IF pPageIndex IS NULL OR pPageIndex < 1 THEN
        SET pPageIndex = 1;
    END IF;

    IF pPageSize IS NULL OR pPageSize < 1 THEN
        SET pPageSize = 10;
    END IF;

    SET vOffset = (pPageIndex - 1) * pPageSize;

    SELECT 
        e.EventID, 
        e.EventName, 
        e.Description,
        e.EventDate, 
        e.Status,
        e.CategoryID,
        e.VenueID,
        COALESCE(v.VenueName, '') AS VenueName, 
        COALESCE(c.Name, '') AS CategoryName,
        COALESCE(MIN(t.Price), 0) AS MinPrice, 
        COALESCE(MAX(t.Price), 0) AS MaxPrice,
        COUNT(CASE WHEN t.Status = 3 THEN 1 END) AS TicketsSold
    FROM events e
    LEFT JOIN venues v ON v.VenueID = e.VenueID
    LEFT JOIN categories c ON c.CategoryID = e.CategoryID
    LEFT JOIN tickets t ON t.EventID = e.EventID
    WHERE 
        (pDate IS NULL OR DATE(e.EventDate) = pDate)
        AND (pCategoryID IS NULL OR pCategoryID = '' OR e.CategoryID = pCategoryID)
        AND (pVenueID IS NULL OR pVenueID = '' OR e.VenueID = pVenueID)
    GROUP BY 
        e.EventID, 
        e.EventName, 
        e.Description,
        e.EventDate, 
        e.Status, 
        e.CategoryID,
        e.VenueID,
        v.VenueName, 
        c.Name
    HAVING 
        (pMinPrice IS NULL OR COALESCE(MIN(t.Price), 0) >= pMinPrice)
        AND (pMaxPrice IS NULL OR COALESCE(MAX(t.Price), 0) <= pMaxPrice)
    ORDER BY
        CASE WHEN pSortBy = 'popularity' THEN COUNT(CASE WHEN t.Status = 3 THEN 1 END) END DESC,
        CASE WHEN pSortBy = 'date_desc' THEN e.EventDate END DESC,
        CASE WHEN pSortBy = 'date' OR pSortBy IS NULL OR pSortBy = '' THEN e.EventDate END ASC
    LIMIT pPageSize OFFSET vOffset;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_Update
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_Update`;
delimiter ;;
CREATE PROCEDURE `usp_Event_Update`(pEventID     VARCHAR(36),
    pEventName   VARCHAR(255),
    pDescription TEXT,
    pCategoryID  VARCHAR(36),
    pVenueID     VARCHAR(36),
    pEventDate   DATETIME,
    pStatus      TINYINT(20))
BEGIN
    UPDATE events
    SET EventName   = pEventName,
        Description = pDescription,
        CategoryID  = pCategoryID,
        VenueID     = pVenueID,
        EventDate   = pEventDate,
        Status      = pStatus,
        UpdateDate  = NOW()
    WHERE EventID = pEventID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Event_UpdateStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Event_UpdateStatus`;
delimiter ;;
CREATE PROCEDURE `usp_Event_UpdateStatus`(pEventID VARCHAR(36), pStatus TINYINT)
BEGIN
    UPDATE events
    SET Status = pStatus, UpdateDate = NOW()
    WHERE EventID = pEventID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_GetStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_GetStatistics`;
delimiter ;;
CREATE PROCEDURE `usp_GetStatistics`(IN pStartDate DATETIME,
    IN pEndDate DATETIME,
    IN pVenueID VARCHAR(36))
BEGIN
    SET pStartDate = IFNULL(pStartDate, DATE_FORMAT(NOW(), '%Y-%m-01 00:00:00'));
    SET pEndDate = IFNULL(pEndDate, DATE_FORMAT(LAST_DAY(NOW()), '%Y-%m-%d 23:59:59'));

    SELECT 
        (
            SELECT COUNT(DISTINCT e.EventID) 
            FROM Events e 
            WHERE (pVenueID IS NULL OR pVenueID = '' OR e.VenueID = pVenueID) 
              AND e.EventDate BETWEEN pStartDate AND pEndDate
        ) AS TotalEvents,
        (
            SELECT COUNT(t.TicketID) 
            FROM Tickets t 
            JOIN Bookings b ON t.BookingID = b.BookingID 
            JOIN Events e ON b.EventID = e.EventID 
            WHERE b.Status = 2 
              AND (pVenueID IS NULL OR pVenueID = '' OR e.VenueID = pVenueID) 
              AND e.EventDate BETWEEN pStartDate AND pEndDate
        ) AS TotalSoldTickets,
        (
            SELECT IFNULL(SUM(t.Price), 0) 
            FROM Tickets t 
            JOIN Bookings b ON t.BookingID = b.BookingID 
            JOIN Events e ON b.EventID = e.EventID 
            WHERE b.Status = 2 
              AND (pVenueID IS NULL OR pVenueID = '' OR e.VenueID = pVenueID) 
              AND e.EventDate BETWEEN pStartDate AND pEndDate
        ) AS TotalRevenue;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Payment_Create
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Payment_Create`;
delimiter ;;
CREATE PROCEDURE `usp_Payment_Create`(IN pPaymentID      VARCHAR(36),
    IN pBookingID      VARCHAR(36),
    IN pPaymentMethod  INT,
    IN pTransactionID  VARCHAR(36),
    IN pAmount         DECIMAL(12,2),
    IN pStatus         TINYINT,        -- 2: Thành công (Success), 3: Thất bại (Failed)
    IN pPaidAt         DATETIME)
BEGIN
    INSERT INTO payments (
        PaymentID, 
        BookingID, 
        PaymentMethod, 
        TransactionID, 
        Amount, 
        Status, 
        PaidAt
    )
    VALUES (
        pPaymentID, 
        pBookingID, 
        pPaymentMethod, 
        pTransactionID, 
        pAmount, 
        pStatus, 
        pPaidAt
    );

    SELECT PaymentID, BookingID, Status, Amount, PaidAt
    FROM payments
    WHERE PaymentID = pPaymentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Payment_GetBookingIDByPaymentID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Payment_GetBookingIDByPaymentID`;
delimiter ;;
CREATE PROCEDURE `usp_Payment_GetBookingIDByPaymentID`(IN pPaymentID VARCHAR(36))
BEGIN
    SELECT 
        PaymentID,
        BookingID,
        PaymentMethod,
        TransactionID,
        Amount,
        Status,
        PaidAt
    FROM payments
    WHERE PaymentID = pPaymentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Payment_GetByBookingID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Payment_GetByBookingID`;
delimiter ;;
CREATE PROCEDURE `usp_Payment_GetByBookingID`(pBookingID VARCHAR(36))
BEGIN
    SELECT PaymentID, BookingID, PaymentMethod, Status, TransactionID,
           PaidAt, CreatedTime, Amount
    FROM payments
    WHERE BookingID = pBookingID
    ORDER BY CreatedTime DESC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Payment_Update
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Payment_Update`;
delimiter ;;
CREATE PROCEDURE `usp_Payment_Update`(IN pPaymentID      VARCHAR(36),
    IN pTransactionID  VARCHAR(36),
    IN pStatus         TINYINT,        -- 2: Thành công (Success), 3: Thất bại (Failed), ...
    IN pPaidAt         DATETIME)
BEGIN
    UPDATE payments
    SET 
        TransactionID = IFNULL(pTransactionID, TransactionID),
        Status        = IFNULL(pStatus, Status),
        PaidAt        = pPaidAt,
        UpdateTime    = NOW()
    WHERE PaymentID = pPaymentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_Delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_Delete`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_Delete`(pTicketID VARCHAR(36))
BEGIN
    DELETE FROM tickets WHERE TicketID = pTicketID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_GenerateByEvent
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_GenerateByEvent`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_GenerateByEvent`(pEventID    VARCHAR(36),
    pPriceBasic DECIMAL (12,2),
    pPriceVIP DECIMAL (12,2),
    pPriceVVIP DECIMAL (12,2))
BEGIN
  DECLARE vVenueID VARCHAR(36);
  SELECT VenueID into vVenueID FROM `events` e WHERE pEventID= EventID;
  if vVenueID is not null then
    INSERT INTO tickets (
    TicketID,
    EventID,
    SeatRow,
    SeatNumber,
    Status,
    SeatID, 
    Price
    )
    SELECT 
    UUID(),
    pEventID,
    vs.SeatRow,
    vs.SeatNumber,
    1, -- Status =1 : free
    vs.SeatID,
    Case 
      when vs.SeatType = 1 then pPriceBasic
      when vs.SeatType = 2 then  pPriceVIP
      else pPriceVVIP
    end
    FROM venue_seats vs
    WHERE vVenueID = vs.VenueID;
    END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_GetAvailableByEvent
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_GetAvailableByEvent`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_GetAvailableByEvent`(pEventID VARCHAR(36))
BEGIN
    SELECT TicketID, SeatRow, SeatNumber, SeatType, Price
    FROM tickets
    WHERE EventID = pEventID AND Status = 1
    ORDER BY SeatRow, SeatNumber;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_GetByBookingID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_GetByBookingID`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_GetByBookingID`(pBookingID VARCHAR(36))
BEGIN
    SELECT TicketID, EventID, SeatRow, SeatNumber, SeatType, Price, Status
    FROM tickets
    WHERE BookingID = pBookingID
    ORDER BY SeatRow, SeatNumber;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_GetByEventID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_GetByEventID`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_GetByEventID`(pEventID VARCHAR(36))
BEGIN
    SELECT TicketID, SeatRow, SeatNumber, Price, Status, BookingID
    FROM tickets
    WHERE EventID = pEventID
    ORDER BY SeatRow, SeatNumber;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_GetByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_GetByID`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_GetByID`(pTicketID VARCHAR(36))
BEGIN
    SELECT * FROM tickets WHERE TicketID = pTicketID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_UpdateStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_UpdateStatus`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_UpdateStatus`(pTicketID VARCHAR(36),
    pStatus    VARCHAR(20),
    pBookingID VARCHAR(36))
BEGIN
    UPDATE tickets
    SET Status    = pStatus,
     BookingID = pBookingID
		 WHERE TicketID =pTicketID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Ticket_UpdateStatusByBookingID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ticket_UpdateStatusByBookingID`;
delimiter ;;
CREATE PROCEDURE `usp_Ticket_UpdateStatusByBookingID`(pStatus    VARCHAR(20),
    pBookingID VARCHAR(36))
BEGIN
    UPDATE tickets
    SET Status    = pStatus
     WHERE BookingID = pBookingID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_ChangePassword
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_ChangePassword`;
delimiter ;;
CREATE PROCEDURE `usp_User_ChangePassword`(pUserID VARCHAR(36),
pPassword varchar(255))
BEGIN
	UPDATE users SET Password=pPassword WHERE pUserID = users.UserID; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_CheckEmail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_CheckEmail`;
delimiter ;;
CREATE PROCEDURE `usp_User_CheckEmail`(pEmail VARCHAR(50))
BEGIN
	SELECT COUNT(*) as Total
	FROM users
	WHERE Email = pEmail;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_CheckExistUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_CheckExistUser`;
delimiter ;;
CREATE PROCEDURE `usp_User_CheckExistUser`(pUserName varchar(30))
BEGIN
	select count(*) as Total
    from users where UserName = pUserName; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_DeleteAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_DeleteAccount`;
delimiter ;;
CREATE PROCEDURE `usp_User_DeleteAccount`(pUserID varchar(36))
BEGIN
	DELETE FROM users WHERE  UserID = pUserID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_GetAll
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_GetAll`;
delimiter ;;
CREATE PROCEDURE `usp_User_GetAll`(pPageIndex INT, pPageSize INT)
BEGIN
    DECLARE vOffset INT;
    SET vOffset = (IFNULL(pPageIndex, 1) - 1) * IFNULL(pPageSize, 10);

    SELECT UserID, UserName, FullName, Email, PhoneNumber, CreateDate, Role
    FROM users
    ORDER BY CreateDate DESC
    LIMIT pPageSize OFFSET vOffset;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_GetByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_GetByID`;
delimiter ;;
CREATE PROCEDURE `usp_User_GetByID`(pUserID VARCHAR(36))
BEGIN
    SELECT *
    FROM users
    WHERE UserID = pUserID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_GetByUserName
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_GetByUserName`;
delimiter ;;
CREATE PROCEDURE `usp_User_GetByUserName`(pUserName varchar(36))
BEGIN
	SELECT u.*
  FROM users u
  WHERE u.UserName = pUserName;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_Insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_Insert`;
delimiter ;;
CREATE PROCEDURE `usp_User_Insert`(pUserID varchar(36) ,
pUserName VARCHAR(25),
pPassword varchar(255),
pFullName VARCHAR(255),
pEmail varchar(50),
pPhoneNumber varchar(20),
pRole int,
pBirthday DATETIME,
pSex bit)
BEGIN
	INSERT  INTO users
					( UserID,
						UserName,
						Password ,
            FullName,
						Email ,
            Role,
            PhoneNumber,
            Birthday,
            Sex
					)
	VALUES  ( pUserID,
						pUserName,
						pPassword ,
            pFullName,
						pEmail ,
            pRole,
            pPhoneNumber,
            pBirthday,
            pSex
					);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_Update
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_Update`;
delimiter ;;
CREATE PROCEDURE `usp_User_Update`(pUserID varchar(36) ,
pUserName VARCHAR(25),
pFullName VARCHAR(255),
pPhoneNumber int,
pBirthday DATETIME,
pSex bit)
BEGIN
	UPDATE users
	set	UserName = pUserName,
  FullName = pFullName,
  PhoneNumber = pPhoneNumber,
  Birthday = pBirthday,
  Sex = pSex,
  UpdateDate = CURRENT_TIMESTAMP()
  WHERE pUserID = UserID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_User_UpdateRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_User_UpdateRole`;
delimiter ;;
CREATE PROCEDURE `usp_User_UpdateRole`(pUserID VARCHAR(36), pRole INT)
BEGIN
    UPDATE users SET Role = pRole, UpdateDate = NOW() WHERE UserID = pUserID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_VenueSeat_DeleteByVenueID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_VenueSeat_DeleteByVenueID`;
delimiter ;;
CREATE PROCEDURE `usp_VenueSeat_DeleteByVenueID`(pVenueID VARCHAR(36))
BEGIN
    DELETE FROM venue_seats WHERE VenueID = pVenueID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_VenueSeat_GenerateVenueMap
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_VenueSeat_GenerateVenueMap`;
delimiter ;;
CREATE PROCEDURE `usp_VenueSeat_GenerateVenueMap`(pVenueID     VARCHAR(36),
    pRows        INT,
    pSeatsPerRow INT,
    pVVIPRows    INT,
    pVIPRows     INT)
BEGIN
    DECLARE r INT DEFAULT 1;
    DECLARE s INT;
    DECLARE vType TINYINT;
    WHILE r <= pRows DO
        SET vType = CASE
                        WHEN r <= IFNULL(pVVIPRows, 0) THEN 3
                        WHEN r <= IFNULL(pVVIPRows, 0) + IFNULL(pVIPRows, 0) THEN 2
                        ELSE 1
                    END;
        SET s = 1;
        WHILE s <= pSeatsPerRow DO
            INSERT INTO venue_seats (SeatID, VenueID, SeatRow, SeatNumber, SeatType)
            VALUES (UUID(), pVenueID, CHAR(64 + r), s, vType);
            SET s = s + 1;
        END WHILE;
        SET r = r + 1;
    END WHILE;
    SELECT COUNT(*) AS TotalSeats FROM venue_seats WHERE VenueID = pVenueID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_VenueSeat_GetByVenueID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_VenueSeat_GetByVenueID`;
delimiter ;;
CREATE PROCEDURE `usp_VenueSeat_GetByVenueID`(pVenueID VARCHAR(36))
BEGIN
    SELECT SeatID, VenueID, SeatRow, SeatNumber, SeatType
    FROM venue_seats
    WHERE VenueID = pVenueID
    ORDER BY SeatRow, SeatNumber;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_VenueSeat_UpdateType
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_VenueSeat_UpdateType`;
delimiter ;;
CREATE PROCEDURE `usp_VenueSeat_UpdateType`(pSeatID VARCHAR(36), pSeatType TINYINT)
BEGIN
    UPDATE venue_seats SET SeatType = pSeatType WHERE SeatID = pSeatID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Venue_Delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Venue_Delete`;
delimiter ;;
CREATE PROCEDURE `usp_Venue_Delete`(pVenueID VARCHAR(36))
BEGIN
    DELETE FROM venues WHERE VenueID = pVenueID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Venue_GetAll
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Venue_GetAll`;
delimiter ;;
CREATE PROCEDURE `usp_Venue_GetAll`(pPageIndex INT,
    pPageSize  INT)
BEGIN
    DECLARE vOffset INT;
    SET vOffset = (pPageIndex - 1) * pPageSize;

    SELECT * FROM venues
    ORDER BY VenueName ASC
    LIMIT pPageSize OFFSET vOffset;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Venue_GetByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Venue_GetByID`;
delimiter ;;
CREATE PROCEDURE `usp_Venue_GetByID`(pVenueID VARCHAR(36))
BEGIN
    SELECT * FROM venues WHERE VenueID = pVenueID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Venue_GetStats
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Venue_GetStats`;
delimiter ;;
CREATE PROCEDURE `usp_Venue_GetStats`(pVenueID   VARCHAR(36),
    pStartDate DATETIME,
    pEndDate   DATETIME)
BEGIN
    SELECT
        v.VenueID,
        v.VenueName,
        (SELECT COUNT(*)
           FROM events e
          WHERE e.VenueID = v.VenueID
            AND e.EventDate BETWEEN pStartDate AND pEndDate) AS TotalEvents,
        (SELECT COUNT(*)
           FROM payments p
           JOIN bookings b ON b.BookingID = p.BookingID
           JOIN events   e ON e.EventID   = b.EventID
           JOIN tickets  t ON t.BookingID = b.BookingID AND t.Status = 3
          WHERE e.VenueID = v.VenueID
            AND p.Status = 2
            AND p.PaidAt BETWEEN pStartDate AND pEndDate)    AS TicketsSold,
        (SELECT COALESCE(SUM(p.Amount), 0)
           FROM payments p
           JOIN bookings b ON b.BookingID = p.BookingID
           JOIN events   e ON e.EventID   = b.EventID
          WHERE e.VenueID = v.VenueID
            AND p.Status = 2
            AND p.PaidAt BETWEEN pStartDate AND pEndDate)    AS Revenue
    FROM venues v
    WHERE v.VenueID = pVenueID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Venue_Insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Venue_Insert`;
delimiter ;;
CREATE PROCEDURE `usp_Venue_Insert`(pVenueID     VARCHAR(36),
    pVenueName   VARCHAR(255),
    pVenueAddress VARCHAR(500),
    pSeatingRow int,
    pSeatingCol int)
BEGIN
    INSERT INTO venues (
        VenueID, VenueName, VenueAddress, SeatingRow, SeatingCol
    ) VALUES (
        pVenueID, pVenueName, pVenueAddress, pSeatingRow,pSeatingCol
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for usp_Venue_Update
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Venue_Update`;
delimiter ;;
CREATE PROCEDURE `usp_Venue_Update`(pVenueID      VARCHAR(36),
    pVenueName    VARCHAR(255),
    pVenueAddress VARCHAR(500),
    pSeatingRow int,
    pSeatingCol VARCHAR(20))
BEGIN
    UPDATE venues
    SET VenueName    = pVenueName,
        VenueAddress = pVenueAddress,
        SeatingRow = pSeatingRow,
        SeatingCol = pSeatingCol
    WHERE VenueID = pVenueID;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
