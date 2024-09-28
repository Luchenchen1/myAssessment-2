SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Education');
INSERT INTO `category` VALUES (2, 'Health');
INSERT INTO `category` VALUES (3, 'Environment');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `FUNDRAISER_ID` int NOT NULL AUTO_INCREMENT,
  `ORGANIZER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CAPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TARGET_FUNDING` decimal(10, 2) NULL DEFAULT NULL,
  `CURRENT_FUNDING` decimal(10, 2) NULL DEFAULT NULL,
  `CITY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ACTIVE` tinyint(1) NULL DEFAULT 1,
  `CATEGORY_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`FUNDRAISER_ID`) USING BTREE,
  INDEX `CATEGORY_ID`(`CATEGORY_ID` ASC) USING BTREE,
  CONSTRAINT `fundraiser_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES (1, 'Alice Johnson', 'Help Build a School', 5000.00, 2500.00, 'New York', 1, 1);
INSERT INTO `fundraiser` VALUES (2, 'Bob Smith', 'Cancer Research Fund', 10000.00, 7000.00, 'Los Angeles', 1, 2);
INSERT INTO `fundraiser` VALUES (3, 'Charlie Brown', 'Planting Trees', 3000.00, 1500.00, 'Chicago', 1, 3);
INSERT INTO `fundraiser` VALUES (4, 'Diana Prince', 'Support Local Hospitals', 15000.00, 12000.00, 'Houston', 1, 2);
INSERT INTO `fundraiser` VALUES (5, 'Ethan Hunt', 'Scholarship Program', 8000.00, 2000.00, 'Miami', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
