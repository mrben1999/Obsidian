/*
Navicat Premium Dump SQL

Source Server         : 16.QMS
Source Server Type    : MySQL
Source Server Version : 100623 (10.6.23-MariaDB)
Source Schema         : qve

Target Server Type    : MySQL
Target Server Version : 100623 (10.6.23-MariaDB)
File Encoding         : 65001

Date: 19/06/2026 14:57:03

SET NAMES utf8mb4;
## SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accbal
-- ----------------------------
DROP TABLE IF EXISTS `accbal`;
CREATE TABLE `accbal`  (
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Month` char(10) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DbtAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`CrdAmt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`Account`, `Dept`, `Month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accbat00
-- ----------------------------
DROP TABLE IF EXISTS `accbat00`;
CREATE TABLE `accbat00`  (
`BatchTrxNo` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VchNo` int NULL DEFAULT 0,
`Account` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxFormat` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Date` date NULL DEFAULT NULL,
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Particular` varchar(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`JobNumber` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Trader` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DueDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AdjAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`AmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`ErrCode` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`BatchTrxNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3238 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AliasCode` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AliasName` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Type` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxFormat` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtrlID` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AccessLevel` int NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BaseCur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Account`) USING BTREE,
INDEX `ACCOUNT_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accrec
-- ----------------------------
DROP TABLE IF EXISTS `accrec`;
CREATE TABLE `accrec`  (
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`RecDate` date NULL DEFAULT NULL,
PRIMARY KEY (`Account`, `Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accstmnt
-- ----------------------------
DROP TABLE IF EXISTS `accstmnt`;
CREATE TABLE `accstmnt`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Title` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentStmnt` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StmntBody` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for acctrx
-- ----------------------------
DROP TABLE IF EXISTS `acctrx`;
CREATE TABLE `acctrx`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VoucherNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Trxno` int NOT NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`AmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`Particular` char(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`JobNumber` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxFormat` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RecDate` date NULL DEFAULT NULL,
PRIMARY KEY (`Journal`, `VoucherNo`, `Trxno`) USING BTREE,
INDEX `ACCTRX_LedgerKey`(`Account` ASC, `Dept` ASC, `TrxDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accvch
-- ----------------------------
DROP TABLE IF EXISTS `accvch`;
CREATE TABLE `accvch`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VoucherNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VchDate` date NULL DEFAULT NULL,
`Particular` char(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DbtAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`CrdAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`InputSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ErrCode` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`Journal`, `VoucherNo`) USING BTREE,
INDEX `ACCVCH_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accxgen
-- ----------------------------
DROP TABLE IF EXISTS `accxgen`;
CREATE TABLE `accxgen`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VoucherNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxNo` int NOT NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`AmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`Particular` char(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`JobNumber` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Journal`, `VoucherNo`, `TrxNo`) USING BTREE,
INDEX `ACCXGEN_LedgerKey`(`Account` ASC, `Dept` ASC, `TrxDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accxref
-- ----------------------------
DROP TABLE IF EXISTS `accxref`;
CREATE TABLE `accxref`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VoucherNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxNo` int NOT NULL DEFAULT 0,
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrgJournal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrgVoucher` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrgTrxNo` int NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`StlInBase` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`Journal`, `VoucherNo`, `TrxNo`) USING BTREE,
INDEX `ACCXREF_TraceKey`(`TrgJournal` ASC, `TrgVoucher` ASC, `TrgTrxNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accxsng
-- ----------------------------
DROP TABLE IF EXISTS `accxsng`;
CREATE TABLE `accxsng`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VoucherNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxNo` int NOT NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`AmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`CtrlAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`CtrlFx` decimal(12, 6) NULL DEFAULT 0.000000,
`CtrlAmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`Particular` char(80) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Journal`, `VoucherNo`, `TrxNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accxsub
-- ----------------------------
DROP TABLE IF EXISTS `accxsub`;
CREATE TABLE `accxsub`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VoucherNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxNo` int NOT NULL DEFAULT 0,
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dept` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`InvoiceNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`Particular` char(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DueDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AmtInBase` decimal(19, 4) NULL DEFAULT 0.0000,
`PayAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`PayInBase` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`Journal`, `VoucherNo`, `TrxNo`) USING BTREE,
INDEX `ACCXSUB_ByTrader`(`Trader` ASC, `InvoiceNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for acjdstr
-- ----------------------------
DROP TABLE IF EXISTS `acjdstr`;
CREATE TABLE `acjdstr`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SysID` int NOT NULL DEFAULT 0,
`DstrAct` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DstrPrc` double NULL DEFAULT 0,
PRIMARY KEY (`Journal`, `SysID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for acjurnal
-- ----------------------------
DROP TABLE IF EXISTS `acjurnal`;
CREATE TABLE `acjurnal`  (
`Journal` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AccessLevel` int NULL DEFAULT 0,
`LockFlag` tinyint(1) NULL DEFAULT 0,
`BaseAccount` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Journal`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for acmdept
-- ----------------------------
DROP TABLE IF EXISTS `acmdept`;
CREATE TABLE `acmdept`  (
`Code` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpbk
-- ----------------------------
DROP TABLE IF EXISTS `cpbk`;
CREATE TABLE `cpbk`  (
`BkGroupSysId` int NOT NULL DEFAULT 0,
`BkSysId` int NOT NULL DEFAULT 0,
`Customer` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Division` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`SAM` double NULL DEFAULT 0,
PRIMARY KEY (`BkGroupSysId`, `BkSysId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpbkforecast
-- ----------------------------
DROP TABLE IF EXISTS `cpbkforecast`;
CREATE TABLE `cpbkforecast`  (
`BkGroupSysId` int NOT NULL DEFAULT 0,
`BkSysId` int NOT NULL DEFAULT 0,
`Month` char(6) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`ManHours` double NULL DEFAULT 0,
PRIMARY KEY (`BkGroupSysId`, `BkSysId`, `Month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpbkgrant
-- ----------------------------
DROP TABLE IF EXISTS `cpbkgrant`;
CREATE TABLE `cpbkgrant`  (
`BkGroupSysId` int NOT NULL DEFAULT 0,
`UserCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ModifyRight` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`BkGroupSysId`, `UserCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpbkgroup
-- ----------------------------
DROP TABLE IF EXISTS `cpbkgroup`;
CREATE TABLE `cpbkgroup`  (
`BkGroupSysId` int UNSIGNED NOT NULL AUTO_INCREMENT,
`GroupField` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GroupFieldValue` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`BkGroupSysId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 902 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpbkprealc
-- ----------------------------
DROP TABLE IF EXISTS `cpbkprealc`;
CREATE TABLE `cpbkprealc`  (
`BkGroupSysId` int NOT NULL DEFAULT 0,
`Month` char(6) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ManHours` double NULL DEFAULT 0,
PRIMARY KEY (`BkGroupSysId`, `Month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpcldrtmp
-- ----------------------------
DROP TABLE IF EXISTS `cpcldrtmp`;
CREATE TABLE `cpcldrtmp`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`CldrName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StartDate` date NOT NULL DEFAULT '0000-00-00',
`StopDate` date NOT NULL DEFAULT '0000-00-00',
`HoursOfWeek` char(28) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpcldrtmpdtl
-- ----------------------------
DROP TABLE IF EXISTS `cpcldrtmpdtl`;
CREATE TABLE `cpcldrtmpdtl`  (
`SysID` int NOT NULL DEFAULT 0,
`Month` int NOT NULL DEFAULT 0,
`WorkDays` char(124) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`SysID`, `Month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpfactoryeq
-- ----------------------------
DROP TABLE IF EXISTS `cpfactoryeq`;
CREATE TABLE `cpfactoryeq`  (
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`EQ` int NULL DEFAULT 0,
PRIMARY KEY (`Factory`, `GmtType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpfactorygrant
-- ----------------------------
DROP TABLE IF EXISTS `cpfactorygrant`;
CREATE TABLE `cpfactorygrant`  (
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UserCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ModifyRight` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`Factory`, `UserCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpinstruction
-- ----------------------------
DROP TABLE IF EXISTS `cpinstruction`;
CREATE TABLE `cpinstruction`  (
`InstructionSysId` int NOT NULL DEFAULT 0,
`Factory` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ResourceId` int NULL DEFAULT 0,
`ResourceId2` int NULL DEFAULT 0,
`InstructionClass` int NULL DEFAULT 0,
`Memo` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Enabled` tinyint(1) NULL DEFAULT 0,
`StartDate` datetime NULL DEFAULT NULL,
`EndDate` datetime NULL DEFAULT NULL,
`Value` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`Factory`, `InstructionSysId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpjobprogress
-- ----------------------------
DROP TABLE IF EXISTS `cpjobprogress`;
CREATE TABLE `cpjobprogress`  (
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PrdDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
`RequestSysId` int NOT NULL DEFAULT 0,
`JobSysId` int NOT NULL DEFAULT 0,
`LaunchDate` datetime NULL DEFAULT NULL,
`FinishDate` datetime NULL DEFAULT NULL,
`P100` int NULL DEFAULT 0,
`P90` int NULL DEFAULT 0,
`P80` int NULL DEFAULT 0,
`P70` int NULL DEFAULT 0,
`P60` int NULL DEFAULT 0,
`P50` int NULL DEFAULT 0,
`P40` int NULL DEFAULT 0,
`P30` int NULL DEFAULT 0,
`P20` int NULL DEFAULT 0,
`P10` int NULL DEFAULT 0,
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`Factory`, `PrdDate`, `RequestSysId`, `JobSysId`) USING BTREE,
INDEX `CPJOBPROGRESS_Request`(`RequestSysId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpjobschedule
-- ----------------------------
DROP TABLE IF EXISTS `cpjobschedule`;
CREATE TABLE `cpjobschedule`  (
`RequestSysID` int NOT NULL DEFAULT 0,
`JobSysId` int NOT NULL DEFAULT 0,
`Factory` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WorkerCount` double NULL DEFAULT 0,
`AssignedQty` int NULL DEFAULT 0,
`ManHours` double NULL DEFAULT 0,
`TargetDate` date NULL DEFAULT NULL,
`WorkOrderNo` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrdLineID` int NULL DEFAULT 0,
`ActualSAM` double NULL DEFAULT 0,
`StartTime` datetime NULL DEFAULT NULL,
`FinishTime` datetime NULL DEFAULT NULL,
`Duration` double NULL DEFAULT 0,
`DefAsgUnits` double NULL DEFAULT 0,
`Efficiency` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`OutSourcing` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ResEnough` tinyint(1) NULL DEFAULT 0,
`EarlyStartDate` datetime NULL DEFAULT NULL,
`LaunchDate` datetime NULL DEFAULT NULL,
`CmpQty` double NULL DEFAULT 0,
`CmpDate` datetime NULL DEFAULT NULL,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLUDate` datetime NULL DEFAULT NULL,
`Source` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`RequestSysID`, `JobSysId`) USING BTREE,
INDEX `CPJOBSCHEDULE_PrdLineKey`(`Factory` ASC, `PrdLineID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpplan
-- ----------------------------
DROP TABLE IF EXISTS `cpplan`;
CREATE TABLE `cpplan`  (
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StartDate` date NULL DEFAULT NULL,
`LastPrdDate` date NULL DEFAULT NULL,
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`Factory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cprequest
-- ----------------------------
DROP TABLE IF EXISTS `cprequest`;
CREATE TABLE `cprequest`  (
`RequestSysID` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Division` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ProgramCode` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipDate` date NULL DEFAULT NULL,
`RequestQty` int NULL DEFAULT 0,
`SAM` double NULL DEFAULT 0,
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RequireDate` date NULL DEFAULT NULL,
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`RequestSysID`) USING BTREE,
INDEX `CPREQUEST_Order`(`OrderNo` ASC, `Style` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cprequestmachine
-- ----------------------------
DROP TABLE IF EXISTS `cprequestmachine`;
CREATE TABLE `cprequestmachine`  (
`RequestSysID` int NOT NULL DEFAULT 0,
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ResourceID` int NOT NULL DEFAULT 0,
`Rate` double NULL DEFAULT 0,
PRIMARY KEY (`RequestSysID`, `Factory`, `ResourceID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cprequestship
-- ----------------------------
DROP TABLE IF EXISTS `cprequestship`;
CREATE TABLE `cprequestship`  (
`RequestSysID` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ShipNo` int NOT NULL DEFAULT 0,
`ShipDate` date NULL DEFAULT NULL,
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`RequestSysID`, `ShipNo`) USING BTREE,
INDEX `CPREQUESTSHIP_Ship`(`OrderNo` ASC, `ShipNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpresource
-- ----------------------------
DROP TABLE IF EXISTS `cpresource`;
CREATE TABLE `cpresource`  (
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ResourceId` int NOT NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`ResourceName` char(6) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ResourceType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EQ` int NULL DEFAULT 0,
`MaxWorkHours` int NULL DEFAULT 0,
PRIMARY KEY (`Factory`, `ResourceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cprscldr
-- ----------------------------
DROP TABLE IF EXISTS `cprscldr`;
CREATE TABLE `cprscldr`  (
`Factory` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ResourceID` int NOT NULL DEFAULT 0,
`Period` char(6) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`QtyCount` char(93) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OperationHrs` char(124) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Factory`, `ResourceID`, `Period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cpsysid
-- ----------------------------
DROP TABLE IF EXISTS `cpsysid`;
CREATE TABLE `cpsysid`  (
`TableName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MaxSysId` int NULL DEFAULT 0,
PRIMARY KEY (`TableName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dncntrl
-- ----------------------------
DROP TABLE IF EXISTS `dncntrl`;
CREATE TABLE `dncntrl`  (
`CtrlType` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TraderName` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`D` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`E` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`F` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`G` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`H` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`I` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`J` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`K` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`L` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`M` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`O` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`P` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Q` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`R` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`T` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`CtrlType`, `Trader`) USING BTREE,
INDEX `DNCNTRL_NameKey`(`CtrlType` ASC, `TraderName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dncntype
-- ----------------------------
DROP TABLE IF EXISTS `dncntype`;
CREATE TABLE `dncntype`  (
`CtrlType` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DnType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DayStart` date NULL DEFAULT NULL,
`DayEnd` date NULL DEFAULT NULL,
`Caption` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`CtrlType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dnmdtls
-- ----------------------------
DROP TABLE IF EXISTS `dnmdtls`;
CREATE TABLE `dnmdtls`  (
`DnType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DnNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`RowNo` int NOT NULL DEFAULT 0,
`Particular` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemA` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemB` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemC` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` double NULL DEFAULT 0,
`FontName` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FontSize` int NULL DEFAULT 0,
`FontStyle` int NULL DEFAULT 0,
`Alignment` int NULL DEFAULT 0,
`NoTotal` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`DnType`, `DnNo`, `RowNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dnmstr
-- ----------------------------
DROP TABLE IF EXISTS `dnmstr`;
CREATE TABLE `dnmstr`  (
`DnType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DnNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DnDate` date NULL DEFAULT NULL,
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TraderName` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attention` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`SettleAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`SettleDate` date NULL DEFAULT NULL,
`SettleRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`DnType`, `DnNo`) USING BTREE,
INDEX `DNMSTR_CustKey`(`Trader` ASC, `DnDate` ASC) USING BTREE,
INDEX `DNMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dntmplt
-- ----------------------------
DROP TABLE IF EXISTS `dntmplt`;
CREATE TABLE `dntmplt`  (
`CtrlType` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`RowNo` int NOT NULL DEFAULT 0,
`Particular` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemA` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemB` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemC` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` double NULL DEFAULT 0,
`FontName` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FontSize` int NULL DEFAULT 0,
`FontStyle` int NULL DEFAULT 0,
`Alignment` int NULL DEFAULT 0,
`NoTotal` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`CtrlType`, `RowNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dntype
-- ----------------------------
DROP TABLE IF EXISTS `dntype`;
CREATE TABLE `dntype`  (
`DnType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CaptionP` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CaptionA` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CaptionB` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CaptionC` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DnType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_ctn
-- ----------------------------
DROP TABLE IF EXISTS `fg_ctn`;
CREATE TABLE `fg_ctn`  (
`CtnRef` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GWght` double NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`ShipMark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`WhCode` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnCnt` int NULL DEFAULT 0,
PRIMARY KEY (`CtnRef`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_ctn_dtls
-- ----------------------------
DROP TABLE IF EXISTS `fg_ctn_dtls`;
CREATE TABLE `fg_ctn_dtls`  (
`CtnRef` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CtnLine` int NOT NULL DEFAULT 0,
`Style` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
PRIMARY KEY (`CtnRef`, `CtnLine`) USING BTREE,
INDEX `fg_ctn_dtls_StyleKey`(`Style` ASC, `OrderNo` ASC, `LotRef` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_ctn_trx
-- ----------------------------
DROP TABLE IF EXISTS `fg_ctn_trx`;
CREATE TABLE `fg_ctn_trx`  (
`TrxSysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnRef` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnCnt` int NULL DEFAULT 0,
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSrcRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`TrxSysID`) USING BTREE,
INDEX `fg_ctn_trx_CtnKey`(`CtnRef` ASC, `TrxSysID` ASC) USING BTREE,
INDEX `fg_ctn_trx_SrcKey`(`SysSource` ASC, `SysSrcRef` ASC, `TrxSysID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_item
-- ----------------------------
DROP TABLE IF EXISTS `fg_item`;
CREATE TABLE `fg_item`  (
`ItemID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Style` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
`LastMoved` date NULL DEFAULT NULL,
PRIMARY KEY (`ItemID`) USING BTREE,
INDEX `fg_item_StyleKey`(`Style` ASC, `OrderNo` ASC, `LotRef` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_item_stock
-- ----------------------------
DROP TABLE IF EXISTS `fg_item_stock`;
CREATE TABLE `fg_item_stock`  (
`ItemID` int NOT NULL DEFAULT 0,
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
`LastMoved` date NULL DEFAULT NULL,
PRIMARY KEY (`ItemID`, `WhCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_item_stock_asm
-- ----------------------------
DROP TABLE IF EXISTS `fg_item_stock_asm`;
CREATE TABLE `fg_item_stock_asm`  (
`ItemID` int NOT NULL DEFAULT 0,
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
`LastMoved` date NULL DEFAULT NULL,
PRIMARY KEY (`ItemID`, `WhCode`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_item_trx
-- ----------------------------
DROP TABLE IF EXISTS `fg_item_trx`;
CREATE TABLE `fg_item_trx`  (
`TrxSysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemID` int NULL DEFAULT 0,
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxQty` double NULL DEFAULT 0,
`TrxAmt` double NULL DEFAULT 0,
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSrcRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`TrxSysID`) USING BTREE,
INDEX `fg_item_trx_ItemKey`(`ItemID` ASC, `WhCode` ASC, `TrxSysID` ASC) USING BTREE,
INDEX `fg_item_trx_TrxDate`(`TrxDate` ASC, `TrxSysID` ASC) USING BTREE,
INDEX `fg_item_trx_SrcKey`(`SysSource` ASC, `SysSrcRef` ASC, `TrxSysID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_item_trx_asm
-- ----------------------------
DROP TABLE IF EXISTS `fg_item_trx_asm`;
CREATE TABLE `fg_item_trx_asm`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`TrxSysID` int NULL DEFAULT 0,
`Color` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxQty` double NULL DEFAULT 0,
`TrxAmt` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `fg_item_trx_asm_AsmKey`(`TrxSysID` ASC, `Color` ASC, `Sizx` ASC, `Dim3` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote`;
CREATE TABLE `fg_mvnote`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WhCodeTo` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoPacking` tinyint(1) NULL DEFAULT 0,
`UCCPrefix` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`DocRefNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_ctns
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_ctns`;
CREATE TABLE `fg_mvnote_ctns`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocLineID` int NOT NULL DEFAULT 0,
`CtnRefFm` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnRefTo` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnTypeCode` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRefNo` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Prepack` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NPack` int NULL DEFAULT 0,
`Style` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorID` int NULL DEFAULT 0,
`SizeID` int NULL DEFAULT 0,
`Dim3ID` int NULL DEFAULT 0,
`Color` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`CtnCnt` int NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `DocLineID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_ctntypes
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_ctntypes`;
CREATE TABLE `fg_mvnote_ctntypes`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CtnTypeCode` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Weight` double NULL DEFAULT 0,
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`ShipMark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`DocRefNo`, `CtnTypeCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_item_asm
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_item_asm`;
CREATE TABLE `fg_mvnote_item_asm`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NULL DEFAULT 0,
`SizeID` int NULL DEFAULT 0,
`Dim3ID` int NULL DEFAULT 0,
`Color` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_item_colors
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_item_colors`;
CREATE TABLE `fg_mvnote_item_colors`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NULL DEFAULT 0,
`Color` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` double NULL DEFAULT 0,
`ColorExt` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocRefNo`, `Style`, `Color`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_item_dim3s
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_item_dim3s`;
CREATE TABLE `fg_mvnote_item_dim3s`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3ID` int NULL DEFAULT 0,
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_item_sizes
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_item_sizes`;
CREATE TABLE `fg_mvnote_item_sizes`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SizeID` int NULL DEFAULT 0,
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` double NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fg_mvnote_items
-- ----------------------------
DROP TABLE IF EXISTS `fg_mvnote_items`;
CREATE TABLE `fg_mvnote_items`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrcTrxID` int NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgcbin
-- ----------------------------
DROP TABLE IF EXISTS `fgcbin`;
CREATE TABLE `fgcbin`  (
`CtnRef` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`BinRef` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CtnCnt` int NULL DEFAULT 0,
PRIMARY KEY (`CtnRef`, `WhCode`, `BinRef`) USING BTREE,
INDEX `FGCBIN_WHKey`(`WhCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgcdtl
-- ----------------------------
DROP TABLE IF EXISTS `fgcdtl`;
CREATE TABLE `fgcdtl`  (
`CtnRef` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
PRIMARY KEY (`CtnRef`, `Style`, `Color`, `Sizx`, `Dim3`) USING BTREE,
INDEX `FGCDTL_StyleKey`(`Style` ASC, `OrderNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgctn
-- ----------------------------
DROP TABLE IF EXISTS `fgctn`;
CREATE TABLE `fgctn`  (
`CtnRef` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GWght` double NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`ShipMark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`CtnCnt` int NULL DEFAULT 0,
PRIMARY KEY (`CtnRef`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgctrx
-- ----------------------------
DROP TABLE IF EXISTS `fgctrx`;
CREATE TABLE `fgctrx`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnRef` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnCnt` int NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `FGCTRX_CtnKey`(`CtnRef` ASC, `SysID` ASC) USING BTREE,
INDEX `FGCTRX_DocKey`(`DocRefNo` ASC, `CtnRef` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fglasm
-- ----------------------------
DROP TABLE IF EXISTS `fglasm`;
CREATE TABLE `fglasm`  (
`LotID` int NOT NULL DEFAULT 0,
`WhCode` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
PRIMARY KEY (`LotID`, `WhCode`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fglot
-- ----------------------------
DROP TABLE IF EXISTS `fglot`;
CREATE TABLE `fglot`  (
`LotID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
`LastMoved` date NULL DEFAULT NULL,
`PckCnt` double NULL DEFAULT 0,
`PckQty` double NULL DEFAULT 0,
PRIMARY KEY (`LotID`) USING BTREE,
INDEX `FGLOT_StyleKey`(`Style` ASC, `OrderNo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgltrx
-- ----------------------------
DROP TABLE IF EXISTS `fgltrx`;
CREATE TABLE `fgltrx`  (
`TrxSysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotID` int NULL DEFAULT 0,
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxQty` double NULL DEFAULT 0,
`TrxAmt` double NULL DEFAULT 0,
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSrcRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`TrxSysID`) USING BTREE,
INDEX `FGLTRX_ItemKey`(`LotID` ASC, `TrxSysID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fglxasm
-- ----------------------------
DROP TABLE IF EXISTS `fglxasm`;
CREATE TABLE `fglxasm`  (
`TrxSysID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxQty` double NULL DEFAULT 0,
`TrxAmt` double NULL DEFAULT 0,
PRIMARY KEY (`TrxSysID`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fglxcst
-- ----------------------------
DROP TABLE IF EXISTS `fglxcst`;
CREATE TABLE `fglxcst`  (
`TrxSysID` int NOT NULL DEFAULT 0,
`itemNo` int NOT NULL DEFAULT 0,
`RefTrxID` int NULL DEFAULT 0,
`LotID` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CostClass` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CostType` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
PRIMARY KEY (`TrxSysID`, `itemNo`) USING BTREE,
INDEX `FGLXCST_ItemKey`(`LotID` ASC, `TrxSysID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmcarton
-- ----------------------------
DROP TABLE IF EXISTS `fgmcarton`;
CREATE TABLE `fgmcarton`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CtnTypeCode` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Weight` double NULL DEFAULT 0,
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`ShipMark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`DocRefNo`, `CtnTypeCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmiasm
-- ----------------------------
DROP TABLE IF EXISTS `fgmiasm`;
CREATE TABLE `fgmiasm`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmicolor
-- ----------------------------
DROP TABLE IF EXISTS `fgmicolor`;
CREATE TABLE `fgmicolor`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` double NULL DEFAULT 0,
`ColorExt` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocRefNo`, `Style`, `Color`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmidim3
-- ----------------------------
DROP TABLE IF EXISTS `fgmidim3`;
CREATE TABLE `fgmidim3`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3ID` int NULL DEFAULT 0,
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmisizx
-- ----------------------------
DROP TABLE IF EXISTS `fgmisizx`;
CREATE TABLE `fgmisizx`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SizeID` int NULL DEFAULT 0,
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` double NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `Style`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmitem
-- ----------------------------
DROP TABLE IF EXISTS `fgmitem`;
CREATE TABLE `fgmitem`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FgTrxID` int NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`PckQty` double NULL DEFAULT 0,
`PckCnt` int NULL DEFAULT 0,
`MatchPack` tinyint(1) NULL DEFAULT 0,
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocRefNo`, `Style`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmpacking
-- ----------------------------
DROP TABLE IF EXISTS `fgmpacking`;
CREATE TABLE `fgmpacking`  (
`DocRefNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocLineID` int NOT NULL DEFAULT 0,
`CtnRefFm` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnRefTo` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CtnTypeCode` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRefNo` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Prepack` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NPack` int NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ColorID` int NULL DEFAULT 0,
`SizeID` int NULL DEFAULT 0,
`Dim3ID` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`CtnCnt` int NULL DEFAULT 0,
PRIMARY KEY (`DocRefNo`, `DocLineID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fgmvnote
-- ----------------------------
DROP TABLE IF EXISTS `fgmvnote`;
CREATE TABLE `fgmvnote`  (
`DocRefNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WhCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WhCodeTo` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ProdLoc` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocRefNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpydis
-- ----------------------------
DROP TABLE IF EXISTS `fnpydis`;
CREATE TABLE `fnpydis`  (
`PyVchRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`InvNoRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayDate` date NULL DEFAULT NULL,
`Fx` double NULL DEFAULT 0,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`TaxAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`Remark` char(255) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`PyVchRef`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpyialc
-- ----------------------------
DROP TABLE IF EXISTS `fnpyialc`;
CREATE TABLE `fnpyialc`  (
`SysID` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`AlcAmt` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `OrderNo`, `Style`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpyinvc
-- ----------------------------
DROP TABLE IF EXISTS `fnpyinvc`;
CREATE TABLE `fnpyinvc`  (
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InvoiceNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InvType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayDate` date NULL DEFAULT NULL,
`DueDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`InvAmount` decimal(19, 4) NULL DEFAULT 0.0000,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`SysStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`Remark` char(255) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PyVchRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Tax` decimal(12, 6) NULL DEFAULT 0.000000,
`TaxAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`PayTaxExAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`PayTotalAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`PayType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT 'I',
`RefInvcNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PyVchCur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PyVchTaxAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`PyVchTaxExAmt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`Trader`, `InvoiceNo`) USING BTREE,
INDEX `FNPYINVC_InvoiceKey`(`InvoiceNo` ASC) USING BTREE,
INDEX `FNPYINVC_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpyinvc2
-- ----------------------------
DROP TABLE IF EXISTS `fnpyinvc2`;
CREATE TABLE `fnpyinvc2`  (
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InvoiceNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PyItemID` int NOT NULL DEFAULT 0,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`ActualQty` decimal(12, 6) NULL DEFAULT 0.000000,
`TaxExAmt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`Trader`, `InvoiceNo`, `PyItemID`) USING BTREE,
INDEX `FNPYINVC2_PyItemKey`(`PyItemID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpyitems
-- ----------------------------
DROP TABLE IF EXISTS `fnpyitems`;
CREATE TABLE `fnpyitems`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`SourceType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`InvType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PySysID` int NULL DEFAULT 0,
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`SourceRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Type` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChargeType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DueDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`VAT` decimal(19, 4) NULL DEFAULT 0.0000,
`VATRate` double NULL DEFAULT 0,
`InvoiceNos` char(100) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`InvAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`ItemNo` int NULL DEFAULT 0,
`Qty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `FNPYITEMS_LMDateKey`(`SysLMDate` ASC) USING BTREE,
INDEX `FNPYITEMS_PySysIDKey`(`PySysID` ASC) USING BTREE,
INDEX `FNPYITEMS_SourceKey`(`SourceType` ASC, `PySysID` ASC) USING BTREE,
INDEX `FNPYITEMS_SourceRefKey`(`SourceRef` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1139039 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpymnt
-- ----------------------------
DROP TABLE IF EXISTS `fnpymnt`;
CREATE TABLE `fnpymnt`  (
`PyVchRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PyVchDate` date NULL DEFAULT NULL,
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`PyVchRef`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fnpymnt2
-- ----------------------------
DROP TABLE IF EXISTS `fnpymnt2`;
CREATE TABLE `fnpymnt2`  (
`PyVchRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Trader` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InvoiceNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PISysID` int NULL DEFAULT 0,
`PymntType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT 'I',
PRIMARY KEY (`PyVchRef`, `Trader`, `InvoiceNo`) USING BTREE,
INDEX `FNPYMNT2_PyItemKey`(`PISysID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivaddoc
-- ----------------------------
DROP TABLE IF EXISTS `ivaddoc`;
CREATE TABLE `ivaddoc`  (
`AdjDocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`AdjustDate` date NULL DEFAULT NULL,
`Remark` char(255) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`AdjDocRef`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivaddtls
-- ----------------------------
DROP TABLE IF EXISTS `ivaddtls`;
CREATE TABLE `ivaddtls`  (
`AdjDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`LotID` int NULL DEFAULT 0,
`LotNo` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Warehouse` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BinNumber` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRemark` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Price` double NULL DEFAULT 0,
PRIMARY KEY (`AdjDocRef`, `ItemNo`) USING BTREE,
INDEX `IVADDTLS_LotKey`(`LotNo` ASC, `Warehouse` ASC, `LotRef` ASC) USING BTREE,
INDEX `IVADDTLS_MatrKey`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivadlot
-- ----------------------------
DROP TABLE IF EXISTS `ivadlot`;
CREATE TABLE `ivadlot`  (
`AdjDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LotID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`AdjDocRef`, `LotID`, `Color`, `Sizx`) USING BTREE,
INDEX `IVADLOT_LotKey`(`LotID` ASC, `Color` ASC, `Sizx` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivisdtls
-- ----------------------------
DROP TABLE IF EXISTS `ivisdtls`;
CREATE TABLE `ivisdtls`  (
`IssDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LotID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`IssQty` double NULL DEFAULT 0,
PRIMARY KEY (`IssDocRef`, `MatrClass`, `MatrCode`, `LotID`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivisjalc
-- ----------------------------
DROP TABLE IF EXISTS `ivisjalc`;
CREATE TABLE `ivisjalc`  (
`IssDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LotID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
`IssQty` double NULL DEFAULT 0,
`WorkOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
PRIMARY KEY (`IssDocRef`, `MatrClass`, `MatrCode`, `LotID`, `SeqNo`) USING BTREE,
INDEX `IVISJALC_Orderkey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivismatr
-- ----------------------------
DROP TABLE IF EXISTS `ivismatr`;
CREATE TABLE `ivismatr`  (
`IssDocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LotID` int NOT NULL DEFAULT 0,
`Qty` double NULL DEFAULT 0,
`IssUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssQty` double NULL DEFAULT 0,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`IssDocRef`, `MatrClass`, `MatrCode`, `LotID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivissdoc
-- ----------------------------
DROP TABLE IF EXISTS `ivissdoc`;
CREATE TABLE `ivissdoc`  (
`IssDocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DeliveryDate` date NULL DEFAULT NULL,
`ETADate` date NULL DEFAULT NULL,
`SendFrom` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SendTo` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipTo` char(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Type` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OnlyIssAmt` tinyint(1) NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`IssDocRef`) USING BTREE,
INDEX `IVISSDOC_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskalc2
-- ----------------------------
DROP TABLE IF EXISTS `ivskalc2`;
CREATE TABLE `ivskalc2`  (
`LotID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
PRIMARY KEY (`LotID`, `SeqNo`) USING BTREE,
INDEX `IVSKALC2_MrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE,
INDEX `IVSKALC2_Matr`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskalog
-- ----------------------------
DROP TABLE IF EXISTS `ivskalog`;
CREATE TABLE `ivskalog`  (
`LotID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`LogDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Log` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`LotID`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskbin
-- ----------------------------
DROP TABLE IF EXISTS `ivskbin`;
CREATE TABLE `ivskbin`  (
`LotID` int NOT NULL DEFAULT 0,
`ItmID` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItmIDx` int NOT NULL DEFAULT 0,
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SrLocSysID` int NOT NULL DEFAULT 0,
`ItmCount` int NULL DEFAULT 0,
PRIMARY KEY (`LotID`, `ItmID`, `ItmIDx`, `Warehouse`, `SrLocSysID`) USING BTREE,
INDEX `IVSKBIN_LocKey`(`Warehouse` ASC, `SrLocSysID` ASC) USING BTREE,
INDEX `ivskbin_itmid`(`ItmID` ASC, `LotID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskcrd
-- ----------------------------
DROP TABLE IF EXISTS `ivskcrd`;
CREATE TABLE `ivskcrd`  (
`LotID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`LotNo` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRemark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supp` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Article` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BinNumber` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`DocType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrfDocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRef` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmStkQty` double NULL DEFAULT 0,
`ItmDiffCount` double NULL DEFAULT 0,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`LotID`) USING BTREE,
INDEX `IVSKCRD_LotKey`(`LotNo` ASC, `Warehouse` ASC, `LotRef` ASC, `TrfDocRef` ASC) USING BTREE,
INDEX `IVSKCRD_MatrKey`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE,
INDEX `IVSKCRD_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69544819 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskcrd2
-- ----------------------------
DROP TABLE IF EXISTS `ivskcrd2`;
CREATE TABLE `ivskcrd2`  (
`LotID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`ItmStkQty` double NULL DEFAULT 0,
PRIMARY KEY (`LotID`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskhst
-- ----------------------------
DROP TABLE IF EXISTS `ivskhst`;
CREATE TABLE `ivskhst`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`LotID` int NULL DEFAULT 0,
`LotNo` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Warehouse` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrClass` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supp` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Article` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BinNumber` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrfDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`TrxSysID` int NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`TrxType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDocCmpy` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IsCostTrx` tinyint(1) NULL DEFAULT 0,
`PairSysID` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29893829 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskitm
-- ----------------------------
DROP TABLE IF EXISTS `ivskitm`;
CREATE TABLE `ivskitm`  (
`LotID` int NOT NULL DEFAULT 0,
`ItmID` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItmIDx` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue1` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue2` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue3` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue4` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmQty` double NULL DEFAULT 0,
`ItmQtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`LotID`, `ItmID`, `ItmIDx`) USING BTREE,
INDEX `IVSKITM_ItmKey`(`ItmID` ASC, `ItmIDx` ASC, `LotID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivskjalc
-- ----------------------------
DROP TABLE IF EXISTS `ivskjalc`;
CREATE TABLE `ivskjalc`  (
`LotID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
PRIMARY KEY (`LotID`, `SeqNo`) USING BTREE,
INDEX `IVSKJALC_MrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE,
INDEX `IVSKJALC_Matr`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivsktrx
-- ----------------------------
DROP TABLE IF EXISTS `ivsktrx`;
CREATE TABLE `ivsktrx`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`LotID` int NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDocCmpy` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`TrxQty` double NULL DEFAULT 0,
`TrxUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`IsCostTrx` tinyint(1) NULL DEFAULT 0,
`PairSysID` int NULL DEFAULT 0,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `IVSKTRX_CardRefKey`(`LotID` ASC, `TrxDate` ASC) USING BTREE,
INDEX `IVSKTRX_TrxDate`(`TrxDate` ASC) USING BTREE,
INDEX `IVSKTRX_TrxDocRef`(`TrxDocRef` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10274276 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivsktrx2
-- ----------------------------
DROP TABLE IF EXISTS `ivsktrx2`;
CREATE TABLE `ivsktrx2`  (
`SysID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`TrxQty` double NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`SysID`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ivwpmatr
-- ----------------------------
DROP TABLE IF EXISTS `ivwpmatr`;
CREATE TABLE `ivwpmatr`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`WorkOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtNo` int NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotID` int NULL DEFAULT 0,
`IssDocRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`IssTrxSysID` int NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `IVWPMATR_MatrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE,
INDEX `IVWPMATR_IssDocKey`(`IssDocRef` ASC, `LotID` ASC) USING BTREE,
INDEX `IVWPMATR_TrxKey`(`IssTrxSysID` ASC) USING BTREE,
INDEX `IVWPMATR_WorkOrderKey`(`WorkOrderNo` ASC, `ExtNo` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8451767 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jccdtls
-- ----------------------------
DROP TABLE IF EXISTS `jccdtls`;
CREATE TABLE `jccdtls`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`CostClass` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CostType` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`docinfo` varchar(128) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`Qty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amt` double NULL DEFAULT 0,
`AlcQty` double NULL DEFAULT 0,
`AlcAmt` double NULL DEFAULT 0,
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `JCCDTLS_CostKey`(`CostClass` ASC, `CostType` ASC, `DocRef` ASC) USING BTREE,
INDEX `JCCDTLS_LMDateKey`(`SysLMDate` ASC) USING BTREE,
INDEX `JCCDTLS_DocRefKey`(`DocRef` ASC, `CostClass` ASC, `CostType` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4678320 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jccjalc
-- ----------------------------
DROP TABLE IF EXISTS `jccjalc`;
CREATE TABLE `jccjalc`  (
`SysID` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`CostClass` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`AlcAmt` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `OrderNo`, `Style`, `WorkOrderNo`, `ExtNo`) USING BTREE,
INDEX `JCCJALC_JobKey`(`OrderNo` ASC, `Style` ASC, `CostClass` ASC) USING BTREE,
INDEX `JCCJALC_WorkOrderKey`(`WorkOrderNo` ASC, `ExtNo` ASC, `CostClass` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jccsheet
-- ----------------------------
DROP TABLE IF EXISTS `jccsheet`;
CREATE TABLE `jccsheet`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`QuotNo` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Version` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `Style`) USING BTREE,
INDEX `JCCSHEET_QuotKey`(`QuotNo` ASC, `Version` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcmprcs
-- ----------------------------
DROP TABLE IF EXISTS `jcmprcs`;
CREATE TABLE `jcmprcs`  (
`CostProcess` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CostDescription` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`CostProcess`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcmtype
-- ----------------------------
DROP TABLE IF EXISTS `jcmtype`;
CREATE TABLE `jcmtype`  (
`CostType` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CostDesc` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Account` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IsFixed` tinyint(1) NULL DEFAULT 0,
`FxAvgBy` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FxAvgType` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChargeType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`CostType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcqitems
-- ----------------------------
DROP TABLE IF EXISTS `jcqitems`;
CREATE TABLE `jcqitems`  (
`QuotNo` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Version` int NOT NULL DEFAULT 0,
`ItemNo` int NOT NULL DEFAULT 0,
`CostClass` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CostType` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VarValue` double NULL DEFAULT 0,
`Formula` char(80) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amount` double NULL DEFAULT 0,
PRIMARY KEY (`QuotNo`, `Version`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcqmatrs
-- ----------------------------
DROP TABLE IF EXISTS `jcqmatrs`;
CREATE TABLE `jcqmatrs`  (
`QuotNo` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Version` int NOT NULL DEFAULT 0,
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PartName` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UsageSpec` char(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supplier` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
`Allowance` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Price` double NULL DEFAULT 0,
`Factor1` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor2` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` double NULL DEFAULT 0,
`Remark` char(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GSM` double NULL DEFAULT 0,
PRIMARY KEY (`QuotNo`, `Version`, `ItemNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcqmkup
-- ----------------------------
DROP TABLE IF EXISTS `jcqmkup`;
CREATE TABLE `jcqmkup`  (
`QuotNo` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Version` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Markup` double NULL DEFAULT 0,
`UPrice` double NULL DEFAULT 0,
PRIMARY KEY (`QuotNo`, `Version`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcqmstr
-- ----------------------------
DROP TABLE IF EXISTS `jcqmstr`;
CREATE TABLE `jcqmstr`  (
`QuotNo` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Version` int NOT NULL DEFAULT 0,
`IssDate` date NULL DEFAULT NULL,
`season` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Division` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Manufacturer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dest` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtQuotCharge1` double NULL DEFAULT 0,
`ExtQuotCharge2` double NULL DEFAULT 0,
`ExtQuotCharge3` double NULL DEFAULT 0,
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustStyle` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ProgramCode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EstQty` double NULL DEFAULT 0,
`UnitCost` double NULL DEFAULT 0,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`CfmUPrice` double NULL DEFAULT 0,
`TtlFabric` double NULL DEFAULT 0,
`TtlAccessory` double NULL DEFAULT 0,
`TtlLabor` double NULL DEFAULT 0,
`TtlCost` double NULL DEFAULT 0,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`QuotNo`, `Version`) USING BTREE,
INDEX `JCQMSTR_CustomerKey`(`Customer` ASC, `Style` ASC) USING BTREE,
INDEX `JCQMSTR_ManufacturerKey`(`Manufacturer` ASC, `Style` ASC) USING BTREE,
INDEX `JCQMSTR_StyleKey`(`Style` ASC) USING BTREE,
INDEX `JCQMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jcqsktch
-- ----------------------------
DROP TABLE IF EXISTS `jcqsktch`;
CREATE TABLE `jcqsktch`  (
`QuotNo` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Version` int NOT NULL DEFAULT 0,
`SketchName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DefaultImage` tinyint(1) NULL DEFAULT 0,
`ImageID` int NULL DEFAULT 0,
PRIMARY KEY (`QuotNo`, `Version`, `SketchName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for johprc
-- ----------------------------
DROP TABLE IF EXISTS `johprc`;
CREATE TABLE `johprc`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `ShipNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jomasm
-- ----------------------------
DROP TABLE IF EXISTS `jomasm`;
CREATE TABLE `jomasm`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Mftr` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`UPrc` double NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `Mftr`, `ItemNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jomprc
-- ----------------------------
DROP TABLE IF EXISTS `jomprc`;
CREATE TABLE `jomprc`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Mftr` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `Mftr`, `ItemNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jooinst
-- ----------------------------
DROP TABLE IF EXISTS `jooinst`;
CREATE TABLE `jooinst`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`InsType` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Instruction` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`OrderNo`, `StyleID`, `InsType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jooinv
-- ----------------------------
DROP TABLE IF EXISTS `jooinv`;
CREATE TABLE `jooinv`  (
`Mftr` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MftrInv` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InvDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`Mftr`, `MftrInv`) USING BTREE,
INDEX `JOOINV_InvDateKey`(`InvDate` ASC) USING BTREE,
INDEX `JOOINV_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jooivitm
-- ----------------------------
DROP TABLE IF EXISTS `jooivitm`;
CREATE TABLE `jooivitm`  (
`Mftr` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MftrInv` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StyleID` int NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Qty` int NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Mftr`, `MftrInv`, `SeqNo`) USING BTREE,
INDEX `JOOIVITM_JobIdx`(`OrderNo` ASC, `StyleID` ASC, `Mftr` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joomftr
-- ----------------------------
DROP TABLE IF EXISTS `joomftr`;
CREATE TABLE `joomftr`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Mftr` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`ShipDate` date NULL DEFAULT NULL,
`IsAgent` tinyint(1) NULL DEFAULT 0,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtSubTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtSubTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `Mftr`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joomlord
-- ----------------------------
DROP TABLE IF EXISTS `joomlord`;
CREATE TABLE `joomlord`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`RuleCode` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ProgressRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Disable` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joomlstn
-- ----------------------------
DROP TABLE IF EXISTS `joomlstn`;
CREATE TABLE `joomlstn`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MStoneID` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OffsetOn` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Tolerance` int NULL DEFAULT 0,
`TrgDate` date NULL DEFAULT NULL,
`UsrAdjDay` date NULL DEFAULT NULL,
`CmpDate` date NULL DEFAULT NULL,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`StoreValues` varchar(128) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysChkMark` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`OrderNo`, `StyleID`, `MStoneID`) USING BTREE,
INDEX `JOOMLSTN_MStoneID`(`MStoneID` ASC, `OrderNo` ASC, `StyleID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joomstr
-- ----------------------------
DROP TABLE IF EXISTS `joomstr`;
CREATE TABLE `joomstr`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Version` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`ProdLoc` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`POExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AdjShipDays` int NULL DEFAULT 0,
`QtyAddPercent` double NULL DEFAULT 0,
`Qty` int NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AdjByShip` tinyint(1) NULL DEFAULT 0,
`VersionCount` int NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` varchar(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`iWorkStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`iWorkWrkOrder` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`iWorkLMDate` date NULL DEFAULT NULL,
PRIMARY KEY (`OrderNo`, `StyleID`) USING BTREE,
INDEX `JOOMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jooprc
-- ----------------------------
DROP TABLE IF EXISTS `jooprc`;
CREATE TABLE `jooprc`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jooprdn
-- ----------------------------
DROP TABLE IF EXISTS `jooprdn`;
CREATE TABLE `jooprdn`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`PNoteNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRef` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Style2` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssueDate` date NULL DEFAULT NULL,
`Handler` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PNExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VersionCount` int NULL DEFAULT 0,
`status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` varchar(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`OrderNo`, `StyleID`) USING BTREE,
INDEX `JOOPRDN_PNoteKey`(`PNoteNo` ASC) USING BTREE,
INDEX `JOOPRDN_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jooship
-- ----------------------------
DROP TABLE IF EXISTS `jooship`;
CREATE TABLE `jooship`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ShipNo` int NOT NULL DEFAULT 0,
`AdjShipDays` int NULL DEFAULT 0,
`QtyAddPercent` double NULL DEFAULT 0,
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `ShipNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jorvtrx
-- ----------------------------
DROP TABLE IF EXISTS `jorvtrx`;
CREATE TABLE `jorvtrx`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`JobNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MStoneID` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ProdLoc` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`Qty` double NULL DEFAULT 0,
`TrxUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` double NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`IsLastTrx` tinyint(1) NULL DEFAULT 0,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `JORVTRX_WorkDoc`(`JobNo` ASC, `Style` ASC) USING BTREE,
INDEX `JORVTRX_OrderDoc`(`OrderNo` ASC, `Style` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jorvtrx2
-- ----------------------------
DROP TABLE IF EXISTS `jorvtrx2`;
CREATE TABLE `jorvtrx2`  (
`SysID` int NOT NULL DEFAULT 0,
`Color` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jowpprcs
-- ----------------------------
DROP TABLE IF EXISTS `jowpprcs`;
CREATE TABLE `jowpprcs`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Process` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`ProdLoc` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceRef` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`TrxUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`IsLastTrx` tinyint(1) NULL DEFAULT 0,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `JOWPPRCS_Order`(`OrderNo` ASC, `Style` ASC, `TrxDate` ASC) USING BTREE,
INDEX `JOWPPRCS_SourceRef`(`SourceRef` ASC) USING BTREE,
INDEX `JOWPPRCS_ProLoc`(`ProdLoc` ASC, `TrxDate` ASC, `Process` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26724 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jowpprcs2
-- ----------------------------
DROP TABLE IF EXISTS `jowpprcs2`;
CREATE TABLE `jowpprcs2`  (
`SysID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joybmclr
-- ----------------------------
DROP TABLE IF EXISTS `joybmclr`;
CREATE TABLE `joybmclr`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtColorID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Supplier` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrCode`, `GmtColorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joybmship
-- ----------------------------
DROP TABLE IF EXISTS `joybmship`;
CREATE TABLE `joybmship`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrItemNo` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrItemNo`, `ShipNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joybmsze
-- ----------------------------
DROP TABLE IF EXISTS `joybmsze`;
CREATE TABLE `joybmsze`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrItemNo` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtSizeID` int NOT NULL DEFAULT 0,
`GmtDim3ID` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`GmtSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtDim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrItemNo`, `GmtSizeID`, `GmtDim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joybol
-- ----------------------------
DROP TABLE IF EXISTS `joybol`;
CREATE TABLE `joybol`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Process` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Manufacturer` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `Process`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joybom
-- ----------------------------
DROP TABLE IF EXISTS `joybom`;
CREATE TABLE `joybom`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrItemNo` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`PartName` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UsageSpec` varchar(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrSize` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PerGmt` int NULL DEFAULT 0,
`Allowance` double NULL DEFAULT 0,
`PurUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`SizeVar` tinyint(1) NULL DEFAULT 0,
`SizeDepend` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`ShipNo` int NULL DEFAULT 0,
`ItemConfirm` tinyint(1) NULL DEFAULT 0,
`ItemLock` tinyint(1) NULL DEFAULT 0,
`ColorAppr` tinyint(1) NULL DEFAULT 0,
`Purchaser` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supplier` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcFactor` double NULL DEFAULT 0,
`PrcFactorWay` int NULL DEFAULT 0,
`PrcFactorActual` double NULL DEFAULT 0,
`Remark` varchar(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`Process` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrItemNo`) USING BTREE,
INDEX `JOYBOM_SeqKey`(`OrderNo` ASC, `StyleID` ASC, `SeqNo` ASC) USING BTREE,
INDEX `JOYBOM_MatrKey`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joycway
-- ----------------------------
DROP TABLE IF EXISTS `joycway`;
CREATE TABLE `joycway`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorGrp` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtColorID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`GmtColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `ColorGrp`, `GmtColorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joymarker
-- ----------------------------
DROP TABLE IF EXISTS `joymarker`;
CREATE TABLE `joymarker`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MarkerID` int NOT NULL DEFAULT 0,
`MarkerName` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrItemNos` varchar(72) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MWidth` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MLength` double NULL DEFAULT 0,
`Wastage` double NULL DEFAULT 0,
`Active` tinyint(1) NULL DEFAULT 0,
`PicType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MarkerPic` mediumblob NULL,
`ExtRatioTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtRatioTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `MarkerID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joymcapp
-- ----------------------------
DROP TABLE IF EXISTS `joymcapp`;
CREATE TABLE `joymcapp`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`AppDate` date NULL DEFAULT NULL,
`AppRemark` varchar(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrCode`, `Color`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for joymratio
-- ----------------------------
DROP TABLE IF EXISTS `joymratio`;
CREATE TABLE `joymratio`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MarkerID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `MarkerID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mppctns
-- ----------------------------
DROP TABLE IF EXISTS `mppctns`;
CREATE TABLE `mppctns`  (
`DocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`FmCtn` int NOT NULL DEFAULT 0,
`ToCtn` int NULL DEFAULT 0,
`GWght` double NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
`WUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`MUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PUnit` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocNo`, `FmCtn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mppdtls
-- ----------------------------
DROP TABLE IF EXISTS `mppdtls`;
CREATE TABLE `mppdtls`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`RowIdx` int NOT NULL DEFAULT 0,
`ColIdx` int NOT NULL DEFAULT 0,
`FmCtn` int NULL DEFAULT 0,
`ToCtn` int NULL DEFAULT 0,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`PUnit` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocNo`, `ItemNo`, `RowIdx`, `ColIdx`) USING BTREE,
INDEX `MPPDTLS_CtnKey`(`DocNo` ASC, `FmCtn` ASC, `ItemNo` ASC, `RowIdx` ASC, `ColIdx` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mppitems
-- ----------------------------
DROP TABLE IF EXISTS `mppitems`;
CREATE TABLE `mppitems`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ShipMark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`DocNo`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mppmstr
-- ----------------------------
DROP TABLE IF EXISTS `mppmstr`;
CREATE TABLE `mppmstr`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocDate` date NULL DEFAULT NULL,
`Expter` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`LCNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssBank` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`LICNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`InvRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`IvExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipBy` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Vessel` varchar(45) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ETDHK` date NULL DEFAULT NULL,
`PortLoad` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortVia` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortDisc` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortDest` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AWB` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` date NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` date NULL DEFAULT NULL,
`ExtFormat` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`DocNo`) USING BTREE,
INDEX `MPPMSTR_CustomerKey`(`Customer` ASC) USING BTREE,
INDEX `MPPMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mraadj
-- ----------------------------
DROP TABLE IF EXISTS `mraadj`;
CREATE TABLE `mraadj`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ShipNo` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `ShipNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrbcnd
-- ----------------------------
DROP TABLE IF EXISTS `mrbcnd`;
CREATE TABLE `mrbcnd`  (
`BillID` int NOT NULL DEFAULT 0,
`SysID` int NOT NULL DEFAULT 0,
`MatchTable` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatchField` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatchValues` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`BillID`, `SysID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrbill
-- ----------------------------
DROP TABLE IF EXISTS `mrbill`;
CREATE TABLE `mrbill`  (
`BillID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`BillName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Priority` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`BillID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrbmatr
-- ----------------------------
DROP TABLE IF EXISTS `mrbmatr`;
CREATE TABLE `mrbmatr`  (
`BillID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrSize` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PerGmt` int NULL DEFAULT 0,
`Allowance` double NULL DEFAULT 0,
`PurUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`Purchaser` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supplier` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcFactor` double NULL DEFAULT 0,
`PrcFactorWay` int NULL DEFAULT 0,
`PrcFactorActual` double NULL DEFAULT 0,
`UseGmtSize` tinyint(1) NULL DEFAULT 0,
`Remark` varchar(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`BillID`, `MatrClass`, `MatrCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrbmcnd
-- ----------------------------
DROP TABLE IF EXISTS `mrbmcnd`;
CREATE TABLE `mrbmcnd`  (
`BillID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SysID` int NOT NULL DEFAULT 0,
`MatchField` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatchValues` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`BillID`, `MatrClass`, `MatrCode`, `SysID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrbmsze
-- ----------------------------
DROP TABLE IF EXISTS `mrbmsze`;
CREATE TABLE `mrbmsze`  (
`BillID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
PRIMARY KEY (`BillID`, `MatrClass`, `MatrCode`, `GmtSize`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrbord
-- ----------------------------
DROP TABLE IF EXISTS `mrbord`;
CREATE TABLE `mrbord`  (
`BillID` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`BillID`, `OrderNo`, `Style`) USING BTREE,
INDEX `MRBORD_OrderKey`(`OrderNo` ASC, `Style` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrjmarker
-- ----------------------------
DROP TABLE IF EXISTS `mrjmarker`;
CREATE TABLE `mrjmarker`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StyleID` int NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtColorID` double NULL DEFAULT 0,
`GmtColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MarkerID` int NULL DEFAULT 0,
`CutLayer` int NULL DEFAULT 0,
`MrkQty` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `MRJMARKER_MarkerKey`(`OrderNo` ASC, `StyleID` ASC, `MatrClass` ASC, `MatrCode` ASC, `MarkerID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrjmatr
-- ----------------------------
DROP TABLE IF EXISTS `mrjmatr`;
CREATE TABLE `mrjmatr`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`SeqNo` int NULL DEFAULT 0,
`ReqQty` double NULL DEFAULT 0,
`OrdQty` double NULL DEFAULT 0,
`StkQty` double NULL DEFAULT 0,
`IssQty` double NULL DEFAULT 0,
`SubQty` double NULL DEFAULT 0,
`BomQty` double NULL DEFAULT 0,
`MrkAdj` double NULL DEFAULT 0,
`WstAdj` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EstAmt` double NULL DEFAULT 0,
`OrdAmt` double NULL DEFAULT 0,
`StkAmt` double NULL DEFAULT 0,
`IssAmt` double NULL DEFAULT 0,
`SubAmt` double NULL DEFAULT 0,
`Cover` tinyint(1) NULL DEFAULT 0,
`CoverBy` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrConfirm` tinyint(1) NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ETADate` date NULL DEFAULT NULL,
`FinalTo` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrCode`) USING BTREE,
INDEX `MRJMATR_MaterialKey`(`MatrClass` ASC, `MatrCode` ASC, `OrderNo` ASC, `StyleID` ASC) USING BTREE,
INDEX `MRJMATR_PrtSeqKey`(`OrderNo` ASC, `Style` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrjmdtl
-- ----------------------------
DROP TABLE IF EXISTS `mrjmdtl`;
CREATE TABLE `mrjmdtl`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ReqQty` double NULL DEFAULT 0,
`OrdQty` double NULL DEFAULT 0,
`StkQty` double NULL DEFAULT 0,
`IssQty` double NULL DEFAULT 0,
`SubQty` double NULL DEFAULT 0,
`BomQty` double NULL DEFAULT 0,
`MrkAdj` double NULL DEFAULT 0,
`WastageMode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WstAdj` double NULL DEFAULT 0,
`EstAmt` double NULL DEFAULT 0,
`OrdAmt` double NULL DEFAULT 0,
`StkAmt` double NULL DEFAULT 0,
`IssAmt` double NULL DEFAULT 0,
`SubAmt` double NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrCode`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrjmrkasm
-- ----------------------------
DROP TABLE IF EXISTS `mrjmrkasm`;
CREATE TABLE `mrjmrkasm`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mrsmdtl
-- ----------------------------
DROP TABLE IF EXISTS `mrsmdtl`;
CREATE TABLE `mrsmdtl`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SubMatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SubMatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SubMatrColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SubMatrSize` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SubQtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `MatrClass`, `MatrCode`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for msmrcvr
-- ----------------------------
DROP TABLE IF EXISTS `msmrcvr`;
CREATE TABLE `msmrcvr`  (
`MstoneID` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MsgCode` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`RoleCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`MstoneID`, `MsgCode`, `RoleCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for msmrpri
-- ----------------------------
DROP TABLE IF EXISTS `msmrpri`;
CREATE TABLE `msmrpri`  (
`Priority` int NOT NULL DEFAULT 0,
`MatchFields` char(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatchValues` char(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RuleCode` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Priority`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for msrstone
-- ----------------------------
DROP TABLE IF EXISTS `msrstone`;
CREATE TABLE `msrstone`  (
`RuleCode` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MStoneID` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LeadTime` int NULL DEFAULT 0,
`OffsetOn` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Offset` int NULL DEFAULT 0,
`Tolerance` int NULL DEFAULT 0,
`RoleCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`RuleCode`, `MStoneID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngafield
-- ----------------------------
DROP TABLE IF EXISTS `ngafield`;
CREATE TABLE `ngafield`  (
`seGroup` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DBTableName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DBFieldName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`seGroup`, `DBTableName`, `DBFieldName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngaobject
-- ----------------------------
DROP TABLE IF EXISTS `ngaobject`;
CREATE TABLE `ngaobject`  (
`seGroup` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Module` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectParent` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Restriction` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`seGroup`, `Module`, `ObjectParent`, `ObjectName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngaprofile
-- ----------------------------
DROP TABLE IF EXISTS `ngaprofile`;
CREATE TABLE `ngaprofile`  (
`seGroup` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`seGroup`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngattachdtl
-- ----------------------------
DROP TABLE IF EXISTS `ngattachdtl`;
CREATE TABLE `ngattachdtl`  (
`DocID` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocFileName` char(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocFileSize` int NULL DEFAULT 0,
`DocFileCRC` int NULL DEFAULT 0,
`RealFileName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RealFileSize` int NULL DEFAULT 0,
`fileID` int NULL DEFAULT 0,
PRIMARY KEY (`DocID`, `DocFileName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngattachfile
-- ----------------------------
DROP TABLE IF EXISTS `ngattachfile`;
CREATE TABLE `ngattachfile`  (
`DocID` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`AttachCount` int NULL DEFAULT 0,
PRIMARY KEY (`DocID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngbackup
-- ----------------------------
DROP TABLE IF EXISTS `ngbackup`;
CREATE TABLE `ngbackup`  (
`DocId` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocKey` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VersionNo` int NOT NULL DEFAULT 0,
`CreateDate` date NULL DEFAULT NULL,
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BackupData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Remark` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocId`, `DocKey`, `VersionNo`) USING BTREE,
INDEX `NGBACKUP_Ind_DocKey`(`DocKey`) USING BTREE
) ENGINE = MyISAM AVG_ROW_LENGTH = 200000 CHARACTER SET = big5 COLLATE = big5_chinese_ci MAX_ROWS = 1000000 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngclicklog
-- ----------------------------
DROP TABLE IF EXISTS `ngclicklog`;
CREATE TABLE `ngclicklog`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`UserCode` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FormName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ControlName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ControlCaption` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ClickDate` date NULL DEFAULT NULL,
`ClickTime` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `NGCLICKLOG_ClickDate`(`ClickDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85568433 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngcmpny
-- ----------------------------
DROP TABLE IF EXISTS `ngcmpny`;
CREATE TABLE `ngcmpny`  (
`CompanyID` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CompanyName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Configuration` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`CompanyID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngcodemap
-- ----------------------------
DROP TABLE IF EXISTS `ngcodemap`;
CREATE TABLE `ngcodemap`  (
`Company` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TableName` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Code` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MapCode` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Company`, `TableName`, `Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngdeletelog
-- ----------------------------
DROP TABLE IF EXISTS `ngdeletelog`;
CREATE TABLE `ngdeletelog`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`DocId` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocKey` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DeleteBy` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DeleteDate` date NULL DEFAULT NULL,
`CreateBy` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CreateDate` date NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18708 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngdocapprove
-- ----------------------------
DROP TABLE IF EXISTS `ngdocapprove`;
CREATE TABLE `ngdocapprove`  (
`DocSysID` int NOT NULL DEFAULT 0,
`Sender` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ApprovedBy` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ApproveDate` date NULL DEFAULT NULL,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocSysID`, `ApprovedBy`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngdocapproveconfig
-- ----------------------------
DROP TABLE IF EXISTS `ngdocapproveconfig`;
CREATE TABLE `ngdocapproveconfig`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`DocType` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ApproveCondition` varchar(200) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ApprovedBy` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngdocbox
-- ----------------------------
DROP TABLE IF EXISTS `ngdocbox`;
CREATE TABLE `ngdocbox`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`FileName` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MailBox` int NULL DEFAULT 0,
`SendFrom` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SendTo` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SendDate` datetime NULL DEFAULT NULL,
`ReceiveDate` datetime NULL DEFAULT NULL,
`DocType` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ErrorMsg` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Owner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngdocboxcontent
-- ----------------------------
DROP TABLE IF EXISTS `ngdocboxcontent`;
CREATE TABLE `ngdocboxcontent`  (
`SysID` int NOT NULL DEFAULT 0,
`Content` mediumblob NULL,
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngdoclock
-- ----------------------------
DROP TABLE IF EXISTS `ngdoclock`;
CREATE TABLE `ngdoclock`  (
`Token` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LockKey` char(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LockDate` datetime NULL DEFAULT NULL,
`LockTime` datetime NULL DEFAULT NULL,
`UserCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StationName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SiteName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Token`, `LockKey`) USING BTREE,
INDEX `Idx_LockDate`(`LockDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngevents
-- ----------------------------
DROP TABLE IF EXISTS `ngevents`;
CREATE TABLE `ngevents`  (
`Code` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(128) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CompedExp` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`RemarkExp` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SysEvent` tinyint(1) NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngfield
-- ----------------------------
DROP TABLE IF EXISTS `ngfield`;
CREATE TABLE `ngfield`  (
`TableName` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`FieldName` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DescExt` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`TableName`, `FieldName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nggrpacs
-- ----------------------------
DROP TABLE IF EXISTS `nggrpacs`;
CREATE TABLE `nggrpacs`  (
`UserCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UserGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`AccessLevel` int NULL DEFAULT 0,
`IsDefault` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`UserCode`, `UserGroup`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nggxbox
-- ----------------------------
DROP TABLE IF EXISTS `nggxbox`;
CREATE TABLE `nggxbox`  (
`MsgID` varchar(35) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MailType` int NULL DEFAULT 0,
`DocType` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SendFrom` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SendTo` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Message` varchar(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SendDate` datetime NULL DEFAULT NULL,
`Content` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Status` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Viewed` tinyint(1) NULL DEFAULT 0,
`ResponseMsg` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SendUser` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtField01` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtField02` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtField03` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`MsgID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngimportconfig
-- ----------------------------
DROP TABLE IF EXISTS `ngimportconfig`;
CREATE TABLE `ngimportconfig`  (
`SYSID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Type` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SourceType` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IsExport` tinyint(1) NULL DEFAULT 0,
`ConvertProgramName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FileExt` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Company` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Configuration` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Options` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Script` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
## PRIMARY KEY (`SYSID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4282 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nginputrule
-- ----------------------------
DROP TABLE IF EXISTS `nginputrule`;
CREATE TABLE `nginputrule`  (
`DBTableName` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DBFieldName` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Rules` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`DBTableName`, `DBFieldName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nglabel
-- ----------------------------
DROP TABLE IF EXISTS `nglabel`;
CREATE TABLE `nglabel`  (
`LabelClass` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LabelName` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LabelWidth` double NULL DEFAULT 0,
`LabelHeight` double NULL DEFAULT 0,
`CRC` int NULL DEFAULT 0,
`FileSize` int NULL DEFAULT 0,
`FileDate` datetime NULL DEFAULT NULL,
`FileFormat` mediumblob NULL,
PRIMARY KEY (`LabelClass`, `LabelName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nglabelpaper
-- ----------------------------
DROP TABLE IF EXISTS `nglabelpaper`;
CREATE TABLE `nglabelpaper`  (
`PaperName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PaperInfo` char(255) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`PaperName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngmaster
-- ----------------------------
DROP TABLE IF EXISTS `ngmaster`;
CREATE TABLE `ngmaster`  (
`TableName` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`FullName` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SystemWide` tinyint(1) NULL DEFAULT 0,
`LookupInsert` tinyint(1) NULL DEFAULT 0,
`LookupRequired` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`TableName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngmastercode
-- ----------------------------
DROP TABLE IF EXISTS `ngmastercode`;
CREATE TABLE `ngmastercode`  (
`MasterTable` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MasterFields` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UsageTable` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UsageFields` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Optional` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`MasterTable`, `MasterFields`, `UsageTable`, `UsageFields`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngmodule
-- ----------------------------
DROP TABLE IF EXISTS `ngmodule`;
CREATE TABLE `ngmodule`  (
`ModuleCode` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Configuration` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`ModuleCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngmssgbx
-- ----------------------------
DROP TABLE IF EXISTS `ngmssgbx`;
CREATE TABLE `ngmssgbx`  (
`UserCode` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`KeyValue` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MsgCode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MsgDate` datetime NULL DEFAULT NULL,
`Message` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Status` int NULL DEFAULT 0,
`NextRemindDate` datetime NULL DEFAULT NULL,
`ExtMsg1` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtMsg2` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtMsg3` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`UserCode`, `KeyValue`, `MsgCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngobject
-- ----------------------------
DROP TABLE IF EXISTS `ngobject`;
CREATE TABLE `ngobject`  (
`Module` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectParent` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectSeqNo` int NULL DEFAULT 0,
`ObjectCaption` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ObjectType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DBTableName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DBFieldName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Module`, `ObjectParent`, `ObjectName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngobjectext
-- ----------------------------
DROP TABLE IF EXISTS `ngobjectext`;
CREATE TABLE `ngobjectext`  (
`Module` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectParent` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ObjectSeqNo` int NULL DEFAULT 0,
`ObjectCaption` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ObjectType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DBTableName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DBFieldName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Module`, `ObjectParent`, `ObjectName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngpaper
-- ----------------------------
DROP TABLE IF EXISTS `ngpaper`;
CREATE TABLE `ngpaper`  (
`Code` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ImageType` varchar(10) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CRC` int NULL DEFAULT 0,
`Image` mediumblob NULL,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngprofile
-- ----------------------------
DROP TABLE IF EXISTS `ngprofile`;
CREATE TABLE `ngprofile`  (
`PrfCode` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PrfKey` varchar(254) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PrfData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`PrfCode`, `PrfKey`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngrluser
-- ----------------------------
DROP TABLE IF EXISTS `ngrluser`;
CREATE TABLE `ngrluser`  (
`RoleCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UserCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`RoleCode`, `UserCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngrole
-- ----------------------------
DROP TABLE IF EXISTS `ngrole`;
CREATE TABLE `ngrole`  (
`RoleCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`RoleName` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`RoleCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngstation
-- ----------------------------
DROP TABLE IF EXISTS `ngstation`;
CREATE TABLE `ngstation`  (
`StationGUID` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StationName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SocketIP` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SiteName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LastLogin` datetime NULL DEFAULT NULL,
PRIMARY KEY (`StationGUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngtable
-- ----------------------------
DROP TABLE IF EXISTS `ngtable`;
CREATE TABLE `ngtable`  (
`TableName` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`TableGroup` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Content` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`DescExt` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`TableName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngtask
-- ----------------------------
DROP TABLE IF EXISTS `ngtask`;
CREATE TABLE `ngtask`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`TaskNo` int NULL DEFAULT 0,
`UserCode` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SubmitTime` datetime NULL DEFAULT NULL,
`StartTime` datetime NULL DEFAULT NULL,
`LatestActTime` datetime NULL DEFAULT NULL,
`ServerGUID` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Params` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`SysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1747 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nguser
-- ----------------------------
DROP TABLE IF EXISTS `nguser`;
CREATE TABLE `nguser`  (
`UserCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UserName` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Passwd` char(128) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Company` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Department` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EMail` char(48) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MsgLanguage` int NULL DEFAULT 0,
`ForwardMessage` tinyint(1) NULL DEFAULT 0,
`IsAdmin` tinyint(1) NULL DEFAULT 0,
`seGroup` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RegisterCount` int NULL DEFAULT 0,
`UseWebRpt` tinyint(1) NULL DEFAULT 0,
`PassWordLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`UserCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ngusrgrp
-- ----------------------------
DROP TABLE IF EXISTS `ngusrgrp`;
CREATE TABLE `ngusrgrp`  (
`UserGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocTypeID` char(80) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`UserGroup`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puiasm
-- ----------------------------
DROP TABLE IF EXISTS `puiasm`;
CREATE TABLE `puiasm`  (
`PuOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ClrPrc` double NULL DEFAULT 0,
`SzxPrc` double NULL DEFAULT 0,
`ClrSzxPrc` double NULL DEFAULT 0,
`OrdQty` double NULL DEFAULT 0,
`RcvQty` double NULL DEFAULT 0,
`RtnQty` double NULL DEFAULT 0,
`AdjQty` double NULL DEFAULT 0,
`OrdAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`RcvAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`RtnAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`AdjAmt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`PuOrderNo`, `ItemNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puichrg
-- ----------------------------
DROP TABLE IF EXISTS `puichrg`;
CREATE TABLE `puichrg`  (
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`ChargeType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgDesc` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`PuOrderNo`, `ItemNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puijalc
-- ----------------------------
DROP TABLE IF EXISTS `puijalc`;
CREATE TABLE `puijalc`  (
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrdAlcQty` double NULL DEFAULT 0,
`RcvAlcQty` double NULL DEFAULT 0,
PRIMARY KEY (`PuOrderNo`, `ItemNo`, `SeqNo`) USING BTREE,
INDEX `PUIJALC_MrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE,
INDEX `PUIJALC_Matr`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puijalc2
-- ----------------------------
DROP TABLE IF EXISTS `puijalc2`;
CREATE TABLE `puijalc2`  (
`PuOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrdAlcQty` double NULL DEFAULT 0,
`RcvAlcQty` double NULL DEFAULT 0,
PRIMARY KEY (`PuOrderNo`, `ItemNo`, `SeqNo`) USING BTREE,
INDEX `PUIJALC2_MrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE,
INDEX `PUIJALC2_Matr`(`MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puinvcharge
-- ----------------------------
DROP TABLE IF EXISTS `puinvcharge`;
CREATE TABLE `puinvcharge`  (
`SuppCmpy` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SuppInv` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`Type` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgDesc` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`SuppCmpy`, `SuppInv`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pulcodr
-- ----------------------------
DROP TABLE IF EXISTS `pulcodr`;
CREATE TABLE `pulcodr`  (
`LCNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`LCNo`, `PuOrderNo`) USING BTREE,
INDEX `PULCODR_OrderKey`(`PuOrderNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pumlcdt
-- ----------------------------
DROP TABLE IF EXISTS `pumlcdt`;
CREATE TABLE `pumlcdt`  (
`LCNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Bank` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssueDate` date NULL DEFAULT NULL,
`ExpireDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`Reference` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`LCNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puochrg
-- ----------------------------
DROP TABLE IF EXISTS `puochrg`;
CREATE TABLE `puochrg`  (
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`ChargeType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgDesc` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`PuOrderNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puoitem
-- ----------------------------
DROP TABLE IF EXISTS `puoitem`;
CREATE TABLE `puoitem`  (
`PuOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supp` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Article` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ShipTo` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EtdDate` date NULL DEFAULT NULL,
`EtaDate` date NULL DEFAULT NULL,
`DateStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FinalTo` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EtaFinal` date NULL DEFAULT NULL,
`OldEtaDate` date NULL DEFAULT NULL,
`CfmShpDate` date NULL DEFAULT NULL,
`ReqShpDate` date NULL DEFAULT NULL,
`ShipTerm` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipMark` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`UPrc` double NULL DEFAULT 0,
`UprcType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrdQty` double NULL DEFAULT 0,
`OrdAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`RcvSingle` tinyint(1) NULL DEFAULT 0,
`RcvMinPct` double NULL DEFAULT 0,
`RcvMaxPct` double NULL DEFAULT 0,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`RcvQty` double NULL DEFAULT 0,
`RcvAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`RtnQty` double NULL DEFAULT 0,
`RtnAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`AdjQty` double NULL DEFAULT 0,
`AdjAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`PuOrderNo`, `ItemNo`) USING BTREE,
INDEX `PUOITEM_SuppKey`(`Supp` ASC, `EtaDate` ASC) USING BTREE,
INDEX `PUOITEM_MatrKey`(`MatrClass` ASC, `MatrCode` ASC, `EtaDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puomstr
-- ----------------------------
DROP TABLE IF EXISTS `puomstr`;
CREATE TABLE `puomstr`  (
`PuOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Version` varchar(6) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supp` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`season` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EtdDate` date NULL DEFAULT NULL,
`EtaDate` date NULL DEFAULT NULL,
`ShipTo` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EtaFinal` date NULL DEFAULT NULL,
`FinalTo` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipTerm` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S2uppName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S2uppAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S2uppAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S2uppAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S2uppAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppContact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`OrderAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`VersionCount` int NULL DEFAULT 0,
`DocStatus` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ErrStatus` tinyint(1) NULL DEFAULT 0,
`SourceRef` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`VATRate` double NULL DEFAULT 0,
`PriceIncVAT` tinyint(1) NULL DEFAULT 0,
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`PuOrderNo`) USING BTREE,
INDEX `PUOMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for puprepay
-- ----------------------------
DROP TABLE IF EXISTS `puprepay`;
CREATE TABLE `puprepay`  (
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`PaidAmount` decimal(19, 4) NULL DEFAULT 0.0000,
`Balance` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`PuOrderNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pupyitem
-- ----------------------------
DROP TABLE IF EXISTS `pupyitem`;
CREATE TABLE `pupyitem`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemNo` int NULL DEFAULT 0,
`Supp` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`RcvSysID` int NULL DEFAULT 0,
`ChgSysID` int NULL DEFAULT 0,
`ChargeType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DueDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`VAT` decimal(19, 4) NULL DEFAULT 0.0000,
`OrgAmount` decimal(19, 4) NULL DEFAULT 0.0000,
`Type` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PostDate` date NULL DEFAULT NULL,
`PostRef` char(100) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `PUPYITEM_PuOrderKey`(`PuOrderNo` ASC, `ItemNo` ASC, `SysID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1064470 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purvalc2
-- ----------------------------
DROP TABLE IF EXISTS `purvalc2`;
CREATE TABLE `purvalc2`  (
`SysID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
`RcvQty` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `SeqNo`) USING BTREE,
INDEX `PURVALC2_MrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purvinv
-- ----------------------------
DROP TABLE IF EXISTS `purvinv`;
CREATE TABLE `purvinv`  (
`SuppCmpy` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SuppInv` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InvDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` double NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`ChrgAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`Approved` tinyint(1) NULL DEFAULT 0,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SuppCmpy`, `SuppInv`) USING BTREE,
INDEX `PURVINV_InvDateKey`(`InvDate` ASC) USING BTREE,
INDEX `PURVINV_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purvitm
-- ----------------------------
DROP TABLE IF EXISTS `purvitm`;
CREATE TABLE `purvitm`  (
`SysID` int NOT NULL DEFAULT 0,
`ItmID` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue1` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue2` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue3` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue4` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmQty` double NULL DEFAULT 0,
`ItmQtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmCount` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `ItmID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purvjalc
-- ----------------------------
DROP TABLE IF EXISTS `purvjalc`;
CREATE TABLE `purvjalc`  (
`SysID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AlcQty` double NULL DEFAULT 0,
`RcvQty` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `SeqNo`) USING BTREE,
INDEX `PURVJALC_MrReqKey`(`OrderNo` ASC, `Style` ASC, `MatrClass` ASC, `MatrCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purvtrx
-- ----------------------------
DROP TABLE IF EXISTS `purvtrx`;
CREATE TABLE `purvtrx`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`PuOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemNo` int NULL DEFAULT 0,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`DocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotNo` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BinNumber` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Mftr` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDoc` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RcvQty` double NULL DEFAULT 0,
`RcvUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AmtNoVAT` decimal(19, 4) NULL DEFAULT 0.0000,
`AtaDate` date NULL DEFAULT NULL,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SkTrxNo` int NULL DEFAULT 0,
`SuppCmpy` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SuppInv` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLmDate` datetime NULL DEFAULT NULL,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `PURVTRX_PuOrderKey`(`PuOrderNo` ASC, `ItemNo` ASC) USING BTREE,
INDEX `PURVTRX_SuppInvKey`(`SuppCmpy` ASC, `SuppInv` ASC) USING BTREE,
INDEX `PURVTRX_SkTrxKey`(`SkTrxNo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1277922 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purvtrx2
-- ----------------------------
DROP TABLE IF EXISTS `purvtrx2`;
CREATE TABLE `purvtrx2`  (
`SysID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`RcvQty` double NULL DEFAULT 0,
`UPrc` double NULL DEFAULT 0,
`FreeQty` double NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AmtNoVAT` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`SysID`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pycarton
-- ----------------------------
DROP TABLE IF EXISTS `pycarton`;
CREATE TABLE `pycarton`  (
`FactoryID` int NOT NULL DEFAULT 0,
`PackOrder` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CtnID` int NOT NULL DEFAULT 0,
`UCCCode` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustPo` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NPack` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SizeSeqNo` int NULL DEFAULT 0,
`PackQty` int NULL DEFAULT 0,
`PackDate` datetime NULL DEFAULT NULL,
`PackTime` datetime NULL DEFAULT NULL,
`Remark` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FactoryID`, `PackOrder`, `CtnID`) USING BTREE,
INDEX `PYCARTON_OrderIndex`(`Style` ASC, `OrderNo` ASC) USING BTREE,
INDEX `PYCARTON_LotRefIndex`(`LotRef` ASC) USING BTREE,
INDEX `PYCARTON_PackTimeIndex`(`PackDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pycolormap
-- ----------------------------
DROP TABLE IF EXISTS `pycolormap`;
CREATE TABLE `pycolormap`  (
`FactoryID` int NOT NULL DEFAULT 0,
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrgColor` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FactoryID`, `WrkOrder`, `Color`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pydim3map
-- ----------------------------
DROP TABLE IF EXISTS `pydim3map`;
CREATE TABLE `pydim3map`  (
`FactoryID` int NOT NULL DEFAULT 0,
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrgDim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FactoryID`, `WrkOrder`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pyfactory
-- ----------------------------
DROP TABLE IF EXISTS `pyfactory`;
CREATE TABLE `pyfactory`  (
`FactoryID` int NOT NULL DEFAULT 0,
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`FactoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pyhstcut
-- ----------------------------
DROP TABLE IF EXISTS `pyhstcut`;
CREATE TABLE `pyhstcut`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`FactoryID` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WrkDate` date NULL DEFAULT NULL,
`Color` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgColor` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgSizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgDim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `PYHSTCUT_WrkOrderKey`(`FactoryID` ASC, `WrkOrder` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pyhstwrk
-- ----------------------------
DROP TABLE IF EXISTS `pyhstwrk`;
CREATE TABLE `pyhstwrk`  (
`FactoryID` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Process` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StepNo` int NOT NULL DEFAULT 0,
`StepName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WrkDate` date NOT NULL DEFAULT '0000-00-00',
`WorkerCount` int NULL DEFAULT 0,
`Qty` double NULL DEFAULT 0,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`InDirectCost` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`FactoryID`, `WrkOrder`, `StepNo`, `WrkDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pylinemap
-- ----------------------------
DROP TABLE IF EXISTS `pylinemap`;
CREATE TABLE `pylinemap`  (
`FactoryID` int NOT NULL DEFAULT 0,
`FlowNo` char(42) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ResourceID` int NULL DEFAULT 0,
PRIMARY KEY (`FactoryID`, `FlowNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pylupdate
-- ----------------------------
DROP TABLE IF EXISTS `pylupdate`;
CREATE TABLE `pylupdate`  (
`FactoryID` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SysLUDate` date NULL DEFAULT NULL,
PRIMARY KEY (`FactoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pyordmap
-- ----------------------------
DROP TABLE IF EXISTS `pyordmap`;
CREATE TABLE `pyordmap`  (
`FactoryID` int NOT NULL DEFAULT 0,
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgStyle` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` date NULL DEFAULT NULL,
PRIMARY KEY (`FactoryID`, `WrkOrder`) USING BTREE,
INDEX `PYOrdMap_OrgOrder`(`OrgOrderNo` ASC, `OrgStyle` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pyprocessmap
-- ----------------------------
DROP TABLE IF EXISTS `pyprocessmap`;
CREATE TABLE `pyprocessmap`  (
`FactoryID` int NOT NULL DEFAULT 0,
`Process` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PrdtProcess` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FactoryID`, `Process`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pysizemap
-- ----------------------------
DROP TABLE IF EXISTS `pysizemap`;
CREATE TABLE `pysizemap`  (
`FactoryID` int NOT NULL DEFAULT 0,
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrgSizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FactoryID`, `WrkOrder`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pyworkorder
-- ----------------------------
DROP TABLE IF EXISTS `pyworkorder`;
CREATE TABLE `pyworkorder`  (
`FactoryID` int NOT NULL DEFAULT 0,
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`LastUpdateTime` datetime NULL DEFAULT NULL,
`Remark` char(200) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FactoryID`, `WrkOrder`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pywrkord
-- ----------------------------
DROP TABLE IF EXISTS `pywrkord`;
CREATE TABLE `pywrkord`  (
`FactoryID` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrgStyle` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`LastSWStepNo` double NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SaCutUpdated` tinyint(1) NULL DEFAULT 0,
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`SysLUDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`FactoryID`, `WrkOrder`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pywrkprogress
-- ----------------------------
DROP TABLE IF EXISTS `pywrkprogress`;
CREATE TABLE `pywrkprogress`  (
`FactoryID` int NOT NULL DEFAULT 0,
`WrkOrder` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`FlowNo` varchar(42) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Process` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WrkDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
`AdjAmt` double NULL DEFAULT 0,
PRIMARY KEY (`FactoryID`, `WrkOrder`, `FlowNo`, `Process`, `WrkDate`, `Color`, `Sizx`, `Dim3`) USING BTREE,
INDEX `PYWRKPROGRESS_OrderIndex`(`WrkOrder` ASC, `Process` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pywrkstp
-- ----------------------------
DROP TABLE IF EXISTS `pywrkstp`;
CREATE TABLE `pywrkstp`  (
`FactoryID` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WrkOrder` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StepNo` int NOT NULL DEFAULT 0,
`Process` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MachineType` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OperationCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StepTime` double NULL DEFAULT 0,
`Cost` double NULL DEFAULT 0,
`CostUnit` double NULL DEFAULT 0,
`CostUnitPerGmt` int NULL DEFAULT 0,
`CostFactor` double NULL DEFAULT 0,
`NextStep` int NULL DEFAULT 0,
`LastStep` tinyint(1) NULL DEFAULT 0,
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`FactoryID`, `WrkOrder`, `StepNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qumtype
-- ----------------------------
DROP TABLE IF EXISTS `qumtype`;
CREATE TABLE `qumtype`  (
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Code` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Description` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxSign` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcBase1` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcBase2` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcBase3` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcBase4` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcBase5` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Origin`, `Code`) USING BTREE,
INDEX `QUMTYPE_SeqKey`(`Origin` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for quqpbal
-- ----------------------------
DROP TABLE IF EXISTS `quqpbal`;
CREATE TABLE `quqpbal`  (
`QPoolSysID` int NOT NULL DEFAULT 0,
`TrxType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`BalQty` double NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
PRIMARY KEY (`QPoolSysID`, `TrxType`) USING BTREE,
INDEX `QUQPBAL_SeqNo`(`QPoolSysID` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for quqpool
-- ----------------------------
DROP TABLE IF EXISTS `quqpool`;
CREATE TABLE `quqpool`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Market` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Category` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Exporter` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`QuotaYear` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Reference` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StrDate` date NULL DEFAULT NULL,
`Expiry` date NULL DEFAULT NULL,
`Particular` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BalQty` double NULL DEFAULT 0,
`RsvQty` double NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `QUQPOOL_OriginKey`(`Origin` ASC, `Exporter` ASC, `Market` ASC, `Category` ASC, `QuotaYear` ASC, `Reference` ASC) USING BTREE,
INDEX `QUQPOOL_YearKey`(`QuotaYear` ASC, `Origin` ASC, `Exporter` ASC, `Market` ASC, `Category` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for quqptrx
-- ----------------------------
DROP TABLE IF EXISTS `quqptrx`;
CREATE TABLE `quqptrx`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`QPoolSysID` int NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`TrxRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`Price` double NULL DEFAULT 0,
`Particular` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ShipNo` int NULL DEFAULT 0,
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSrcRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `QUQPTRX_DateKey`(`QPoolSysID` ASC, `TrxDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qureq
-- ----------------------------
DROP TABLE IF EXISTS `qureq`;
CREATE TABLE `qureq`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Market` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Category` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Exporter` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ShipNo` int NULL DEFAULT 0,
`Customer` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrdShipDate` date NULL DEFAULT NULL,
`ExpShipDate` date NULL DEFAULT NULL,
`AdjShipDate` double NULL DEFAULT 0,
`OrdReqQty` double NULL DEFAULT 0,
`ExpReqQty` double NULL DEFAULT 0,
`AdjReqQty` double NULL DEFAULT 0,
`RsvQty` double NULL DEFAULT 0,
`LicensedQty` double NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `QUREQ_OriginKey`(`Origin` ASC, `Market` ASC, `Category` ASC) USING BTREE,
INDEX `QUREQ_OrderKey`(`OrderNo` ASC, `Style` ASC, `ShipNo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qursv
-- ----------------------------
DROP TABLE IF EXISTS `qursv`;
CREATE TABLE `qursv`  (
`ReqSysID` int NOT NULL DEFAULT 0,
`QPoolSysID` int NOT NULL DEFAULT 0,
`RsvQty` double NULL DEFAULT 0,
PRIMARY KEY (`ReqSysID`, `QPoolSysID`) USING BTREE,
INDEX `QURSV_ReqKey`(`QPoolSysID` ASC, `ReqSysID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sabackup
-- ----------------------------
DROP TABLE IF EXISTS `sabackup`;
CREATE TABLE `sabackup`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`VersionNo` int NOT NULL DEFAULT 0,
`CreateDate` date NULL DEFAULT NULL,
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BackupData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Remark` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `VersionNo`) USING BTREE
) ENGINE = MyISAM AVG_ROW_LENGTH = 200000 CHARACTER SET = big5 COLLATE = big5_chinese_ci MAX_ROWS = 1000000 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sacasm
-- ----------------------------
DROP TABLE IF EXISTS `sacasm`;
CREATE TABLE `sacasm`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`CutNo` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`CutDate` datetime NULL DEFAULT NULL,
`Remark` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysSource` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `CutNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sahasm
-- ----------------------------
DROP TABLE IF EXISTS `sahasm`;
CREATE TABLE `sahasm`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`UPrc` double NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `ShipNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sahpack
-- ----------------------------
DROP TABLE IF EXISTS `sahpack`;
CREATE TABLE `sahpack`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`PackNo` int NOT NULL DEFAULT 0,
`PrePack` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BuckQty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `ShipNo`, `PackNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sahprc
-- ----------------------------
DROP TABLE IF EXISTS `sahprc`;
CREATE TABLE `sahprc`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `ShipNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sahquot
-- ----------------------------
DROP TABLE IF EXISTS `sahquot`;
CREATE TABLE `sahquot`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`SysID` int NOT NULL DEFAULT 0,
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipDest` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Category` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Rate` double NULL DEFAULT 0,
`SharePercent` double NULL DEFAULT 0,
`ReqQty` double NULL DEFAULT 0,
`StyleID` int NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ShipDate` date NULL DEFAULT NULL,
PRIMARY KEY (`OrderNo`, `ShipNo`, `SysID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saiasm
-- ----------------------------
DROP TABLE IF EXISTS `saiasm`;
CREATE TABLE `saiasm`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`ShpDocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Color` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `ShipNo`, `ShpDocNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for salcodr
-- ----------------------------
DROP TABLE IF EXISTS `salcodr`;
CREATE TABLE `salcodr`  (
`LCNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
PRIMARY KEY (`LCNo`, `OrderNo`) USING BTREE,
INDEX `SALCODR_OrderKey`(`OrderNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for samcust
-- ----------------------------
DROP TABLE IF EXISTS `samcust`;
CREATE TABLE `samcust`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for samlcdt
-- ----------------------------
DROP TABLE IF EXISTS `samlcdt`;
CREATE TABLE `samlcdt`  (
`LCNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Bank` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssueDate` date NULL DEFAULT NULL,
`ExpireDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`LCNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saoinvc
-- ----------------------------
DROP TABLE IF EXISTS `saoinvc`;
CREATE TABLE `saoinvc`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`ShpDocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NULL DEFAULT 0,
`Style` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` double NULL DEFAULT 0,
`Qty` int NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`OrderNo`, `ShipNo`, `ShpDocNo`) USING BTREE,
INDEX `SAOINVC_ShpDocKey`(`ShpDocNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saomstr
-- ----------------------------
DROP TABLE IF EXISTS `saomstr`;
CREATE TABLE `saomstr`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`OrdType` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Division` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`season` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustPORef` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustPODate` date NULL DEFAULT NULL,
`Agent` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AgentComm` double NULL DEFAULT 0,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VersionCount` int NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ErrStatus` tinyint(1) NULL DEFAULT 0,
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` varchar(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`CustomerName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerContact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`) USING BTREE,
INDEX `SAOMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saoship
-- ----------------------------
DROP TABLE IF EXISTS `saoship`;
CREATE TABLE `saoship`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NULL DEFAULT 0,
`ShipNo` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ShipDate` date NULL DEFAULT NULL,
`ShipDate2` date NULL DEFAULT NULL,
`ShipDate3` date NULL DEFAULT NULL,
`ShipMode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortLoad` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortDisc` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipDest` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Label` varchar(80) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Qty` int NULL DEFAULT 0,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`ShpQty` int NULL DEFAULT 0,
`ShpAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`UsePrepack` tinyint(1) NULL DEFAULT 0,
`PackingMethod` int NULL DEFAULT 0,
`QtyPerCtn` int NULL DEFAULT 0,
`NoReqQuota` tinyint(1) NULL DEFAULT 0,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` varchar(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `ShipNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saostyle
-- ----------------------------
DROP TABLE IF EXISTS `saostyle`;
CREATE TABLE `saostyle`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`CustStyle` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AllowInput` tinyint(1) NULL DEFAULT 0,
`PriceByShip` tinyint(1) NULL DEFAULT 0,
`ConfirmBOM` tinyint(1) NULL DEFAULT 0,
`ProgramCode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PlanCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VersionCount` int NULL DEFAULT 0,
`Mftr` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MfcDate` date NULL DEFAULT NULL,
`RuleCode` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LinkTo` int NULL DEFAULT 0,
`WkCover` tinyint(1) NULL DEFAULT 0,
`WkCoverBy` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saotrx
-- ----------------------------
DROP TABLE IF EXISTS `saotrx`;
CREATE TABLE `saotrx`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`TrxNo` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ShipNo` int NULL DEFAULT 0,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`Level` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Qty` int NULL DEFAULT 0,
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`SourceRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`AllowAdjustAmt` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `TrxNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saotrx2
-- ----------------------------
DROP TABLE IF EXISTS `saotrx2`;
CREATE TABLE `saotrx2`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`TrxNo` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `TrxNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sapasm
-- ----------------------------
DROP TABLE IF EXISTS `sapasm`;
CREATE TABLE `sapasm`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`PackNo` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `ShipNo`, `PackNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saprgrm
-- ----------------------------
DROP TABLE IF EXISTS `saprgrm`;
CREATE TABLE `saprgrm`  (
`ProgramCode` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ProgramName` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`ProgramCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sayartno
-- ----------------------------
DROP TABLE IF EXISTS `sayartno`;
CREATE TABLE `sayartno`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ArticleNo` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE,
INDEX `SAYARTNO_ArticleKey`(`ArticleNo` ASC, `OrderNo` ASC, `StyleID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sayasm
-- ----------------------------
DROP TABLE IF EXISTS `sayasm`;
CREATE TABLE `sayasm`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`UPrc` double NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saycolor
-- ----------------------------
DROP TABLE IF EXISTS `saycolor`;
CREATE TABLE `saycolor`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2olor` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorExt` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Approved` tinyint(1) NULL DEFAULT 0,
`AppDate` date NULL DEFAULT NULL,
`AppRemark` varchar(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `ColorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saydim3
-- ----------------------------
DROP TABLE IF EXISTS `saydim3`;
CREATE TABLE `saydim3`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sayprc
-- ----------------------------
DROP TABLE IF EXISTS `sayprc`;
CREATE TABLE `sayprc`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sayscrft
-- ----------------------------
DROP TABLE IF EXISTS `sayscrft`;
CREATE TABLE `sayscrft`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`CraftCode` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CraftItem` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`Cost` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`OrderNo`, `StyleID`, `CraftCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saysize
-- ----------------------------
DROP TABLE IF EXISTS `saysize`;
CREATE TABLE `saysize`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `SizeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for saysktch
-- ----------------------------
DROP TABLE IF EXISTS `saysktch`;
CREATE TABLE `saysktch`  (
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SketchName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`DefaultImage` tinyint(1) NULL DEFAULT 0,
`ImageID` int NULL DEFAULT 0,
PRIMARY KEY (`OrderNo`, `StyleID`, `SketchName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sayssmsr
-- ----------------------------
DROP TABLE IF EXISTS `sayssmsr`;
CREATE TABLE `sayssmsr`  (
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SzSpecID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`SeqNo` int NULL DEFAULT 0,
`MsrName` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MsrSpec` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`M2srName` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`M2srSpec` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SizeSpec` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Unit` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrtFmt` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StartSize1` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WashAdj1` double NULL DEFAULT 0,
`StartSize2` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WashAdj2` double NULL DEFAULT 0,
`Tolerance` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`OrderNo`, `StyleID`, `SzSpecID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shdmstr
-- ----------------------------
DROP TABLE IF EXISTS `shdmstr`;
CREATE TABLE `shdmstr`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocDate` date NULL DEFAULT NULL,
`Expter` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`E2xpterName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`E2xpterAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`E2xpterAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`E2xpterAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`E2xpterAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExpterContact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerName` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2ustomerAddr4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustomerContact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCCPrefix` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`LCNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssBank` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`LICNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`InvRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`IvExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IvExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipBy` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Vessel` varchar(45) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ETDHK` date NULL DEFAULT NULL,
`PortLoad` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortVia` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortDisc` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PortDest` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AWB` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Approved` tinyint(1) NULL DEFAULT 0,
`SysStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`ExtFormat` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`VATRate` double NULL DEFAULT 0,
`PriceIncVAT` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`DocNo`) USING BTREE,
INDEX `SHDMSTR_CustomerKey`(`Customer` ASC) USING BTREE,
INDEX `SHDMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sheform
-- ----------------------------
DROP TABLE IF EXISTS `sheform`;
CREATE TABLE `sheform`  (
`FormID` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtRef` varchar(10) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PageNo` int NOT NULL DEFAULT 0,
`Remark` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PageData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`FontSize` int NULL DEFAULT 0,
`FontName` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Shipper` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`FormID`, `DocNo`, `ExtRef`, `PageNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shefprt
-- ----------------------------
DROP TABLE IF EXISTS `shefprt`;
CREATE TABLE `shefprt`  (
`Shipper` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Field` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`XPos` double NULL DEFAULT 0,
`YPos` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
PRIMARY KEY (`Shipper`, `Field`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shidtls
-- ----------------------------
DROP TABLE IF EXISTS `shidtls`;
CREATE TABLE `shidtls`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItemNo` int NOT NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`ItemType` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgType` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StyleID` int NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Qty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`NoAutoCalc` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`DocNo`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shifrmt
-- ----------------------------
DROP TABLE IF EXISTS `shifrmt`;
CREATE TABLE `shifrmt`  (
`ShDocFormat` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtFldDoc` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtFldLabel` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtFldPrtAt` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Lookup` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`ShDocFormat`, `ExtFldDoc`, `ExtFldLabel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shmcharg
-- ----------------------------
DROP TABLE IF EXISTS `shmcharg`;
CREATE TABLE `shmcharg`  (
`Type` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Class` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AccountCode` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shmucc
-- ----------------------------
DROP TABLE IF EXISTS `shmucc`;
CREATE TABLE `shmucc`  (
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UCCPrefix` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`NextUCC` int NULL DEFAULT 0,
`CartonLabel` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Users` varchar(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Customer`, `UCCPrefix`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpasm
-- ----------------------------
DROP TABLE IF EXISTS `shpasm`;
CREATE TABLE `shpasm`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`DocNo`, `StyleID`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpcolor
-- ----------------------------
DROP TABLE IF EXISTS `shpcolor`;
CREATE TABLE `shpcolor`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`ColorID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorExt` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
PRIMARY KEY (`DocNo`, `StyleID`, `ColorID`) USING BTREE,
INDEX `SHPCOLOR_SeqKey`(`DocNo` ASC, `StyleID` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpctns
-- ----------------------------
DROP TABLE IF EXISTS `shpctns`;
CREATE TABLE `shpctns`  (
`DocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`FmCtn` int NOT NULL DEFAULT 0,
`ToCtn` int NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Prepack` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NPack` int NULL DEFAULT 0,
`GWght` double NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`UCCPrefix` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocNo`, `StyleID`, `FmCtn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpcvshp
-- ----------------------------
DROP TABLE IF EXISTS `shpcvshp`;
CREATE TABLE `shpcvshp`  (
`DocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`OrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipNo` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`CustPORef` char(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CustStyle` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` char(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Label` char(80) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocNo`, `StyleID`, `OrderNo`, `ShipNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpdim3
-- ----------------------------
DROP TABLE IF EXISTS `shpdim3`;
CREATE TABLE `shpdim3`  (
`DocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
PRIMARY KEY (`DocNo`, `StyleID`, `Dim3ID`) USING BTREE,
INDEX `SHPDIM3_SeqNo`(`DocNo` ASC, `StyleID` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpdtls
-- ----------------------------
DROP TABLE IF EXISTS `shpdtls`;
CREATE TABLE `shpdtls`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SysID` int NOT NULL DEFAULT 0,
`FmCtn` int NULL DEFAULT 0,
`ToCtn` int NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`ColorID` int NULL DEFAULT 0,
`SizeID` int NULL DEFAULT 0,
`Dim3ID` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
`Prepack` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtCartonDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtCartonDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtCartonDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NPack` int NULL DEFAULT 0,
`UCCPrefix` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DocNo`, `StyleID`, `SysID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpprc
-- ----------------------------
DROP TABLE IF EXISTS `shpprc`;
CREATE TABLE `shpprc`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`DocNo`, `StyleID`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpsize
-- ----------------------------
DROP TABLE IF EXISTS `shpsize`;
CREATE TABLE `shpsize`  (
`DocNo` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Style` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`NWght` double NULL DEFAULT 0,
`NNWght` double NULL DEFAULT 0,
PRIMARY KEY (`DocNo`, `StyleID`, `SizeID`) USING BTREE,
INDEX `SHPSIZE_SeqKey`(`DocNo` ASC, `StyleID` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shpstyle
-- ----------------------------
DROP TABLE IF EXISTS `shpstyle`;
CREATE TABLE `shpstyle`  (
`DocNo` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`StyleID` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Origin` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PkExtStyleDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GWGHT` double NULL DEFAULT 0,
`NWGHT` double NULL DEFAULT 0,
`NNWGHT` double NULL DEFAULT 0,
`CtnWght` double NULL DEFAULT 0,
`WUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Lngth` double NULL DEFAULT 0,
`Width` double NULL DEFAULT 0,
`Height` double NULL DEFAULT 0,
`MUnit` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipMark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`PFormat` varchar(10) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrintOptions` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Remarks` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtData` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`DocNo`, `StyleID`) USING BTREE,
INDEX `SHPSTYLE_StyleKey`(`Style` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shucmstr
-- ----------------------------
DROP TABLE IF EXISTS `shucmstr`;
CREATE TABLE `shucmstr`  (
`UccCodeName` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UccFmtVer` int NULL DEFAULT 0,
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UccFormat` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`UccStart` int NULL DEFAULT 0,
`RunCtrl` int NULL DEFAULT 0,
`CartonLabel` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`DataMap` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`UccCodeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shucrctrl
-- ----------------------------
DROP TABLE IF EXISTS `shucrctrl`;
CREATE TABLE `shucrctrl`  (
`UCCPrefix` char(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`UCCNext` int NULL DEFAULT 0,
PRIMARY KEY (`UCCPrefix`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smdndtl
-- ----------------------------
DROP TABLE IF EXISTS `smdndtl`;
CREATE TABLE `smdndtl`  (
`DspNote` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`Qty` int NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`DspNote`, `SeqNo`) USING BTREE,
INDEX `SMDNDTL_SmOrderNoKey`(`SmOrderNo` ASC, `Style` ASC, `DspNote` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smdnhdr
-- ----------------------------
DROP TABLE IF EXISTS `smdnhdr`;
CREATE TABLE `smdnhdr`  (
`DspNote` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attention` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssBy` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AWBNo` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Mode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DBNote` varchar(10) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`DspNote`) USING BTREE,
INDEX `SMDNHDR_CustomerKey`(`Customer` ASC, `DspNote` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smintry
-- ----------------------------
DROP TABLE IF EXISTS `smintry`;
CREATE TABLE `smintry`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`Loc` varchar(10) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`Qty` int NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `SMINTRY_CustomerKey`(`Customer` ASC, `Style` ASC) USING BTREE,
INDEX `SMINTRY_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smoasm
-- ----------------------------
DROP TABLE IF EXISTS `smoasm`;
CREATE TABLE `smoasm`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NOT NULL DEFAULT 0,
`SizeID` int NOT NULL DEFAULT 0,
`Dim3ID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SmpQty` int NULL DEFAULT 0,
`DelQty` int NULL DEFAULT 0,
PRIMARY KEY (`SmOrderNo`, `ColorID`, `SizeID`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smobom
-- ----------------------------
DROP TABLE IF EXISTS `smobom`;
CREATE TABLE `smobom`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrItemNo` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PartName` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UsageSpec` varchar(240) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrSize` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PerGmt` int NULL DEFAULT 0,
`Allowance` double NULL DEFAULT 0,
`SizeVar` tinyint(1) NULL DEFAULT 0,
`SizeDepend` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PurUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`Purchaser` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supplier` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` varchar(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SmOrderNo`, `MatrClass`, `MatrItemNo`) USING BTREE,
INDEX `SMOBOM_SeqKey`(`SmOrderNo` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smoinst
-- ----------------------------
DROP TABLE IF EXISTS `smoinst`;
CREATE TABLE `smoinst`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`InsType` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Instruction` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`SmOrderNo`, `InsType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smomstr
-- ----------------------------
DROP TABLE IF EXISTS `smomstr`;
CREATE TABLE `smomstr`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`OrderRef` varchar(26) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrderDate` date NULL DEFAULT NULL,
`Division` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`season` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Customer` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Agent` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Mftr` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Designer` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Technician` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Pattern` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`ETDDate` date NULL DEFAULT NULL,
`SmpType` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VersionCount` int NULL DEFAULT 0,
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`CustStyle` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ProgramCode` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` varchar(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SmOrderNo`) USING BTREE,
INDEX `SMOMSTR_CustomerKey`(`Customer` ASC, `SmOrderNo` ASC) USING BTREE,
INDEX `SMOMSTR_MftrKey`(`Mftr` ASC, `SmOrderNo` ASC) USING BTREE,
INDEX `SMOMSTR_StyleKey`(`Style` ASC, `GmtType` ASC) USING BTREE,
INDEX `SMOMSTR_CustStyleKey`(`CustStyle` ASC, `Customer` ASC) USING BTREE,
INDEX `SMOMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smosktch
-- ----------------------------
DROP TABLE IF EXISTS `smosktch`;
CREATE TABLE `smosktch`  (
`SmOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SketchName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DefaultImage` tinyint(1) NULL DEFAULT 0,
`ImageID` int NULL DEFAULT 0,
PRIMARY KEY (`SmOrderNo`, `SketchName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smossmsr
-- ----------------------------
DROP TABLE IF EXISTS `smossmsr`;
CREATE TABLE `smossmsr`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SzSpecID` int NOT NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`MsrName` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MsrSpec` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`M2srName` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`M2srSpec` varchar(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SizeSpec` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Unit` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrtFmt` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StartSize1` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WashAdj1` double NULL DEFAULT 0,
`StartSize2` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WashAdj2` double NULL DEFAULT 0,
`Tolerance` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SmOrderNo`, `SzSpecID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smstype
-- ----------------------------
DROP TABLE IF EXISTS `smstype`;
CREATE TABLE `smstype`  (
`Code` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smybmsze
-- ----------------------------
DROP TABLE IF EXISTS `smybmsze`;
CREATE TABLE `smybmsze`  (
`SmOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrItemNo` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtSizeID` int NOT NULL DEFAULT 0,
`GmtDim3ID` int NOT NULL DEFAULT 0,
`GmtSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GmtDim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrSize` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UCons` double NULL DEFAULT 0,
PRIMARY KEY (`SmOrderNo`, `MatrClass`, `MatrItemNo`, `GmtSizeID`, `GmtDim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smycolor
-- ----------------------------
DROP TABLE IF EXISTS `smycolor`;
CREATE TABLE `smycolor`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorID` int NOT NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`C2olor` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SmOrderNo`, `ColorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smycway
-- ----------------------------
DROP TABLE IF EXISTS `smycway`;
CREATE TABLE `smycway`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ColorGrp` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtColorID` int NOT NULL DEFAULT 0,
`GmtColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SmOrderNo`, `ColorGrp`, `GmtColorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smydim3
-- ----------------------------
DROP TABLE IF EXISTS `smydim3`;
CREATE TABLE `smydim3`  (
`SmOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3ID` int NOT NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`Dim3` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SmOrderNo`, `Dim3ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smyprc
-- ----------------------------
DROP TABLE IF EXISTS `smyprc`;
CREATE TABLE `smyprc`  (
`SmOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` int NULL DEFAULT 0,
PRIMARY KEY (`SmOrderNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for smysize
-- ----------------------------
DROP TABLE IF EXISTS `smysize`;
CREATE TABLE `smysize`  (
`SmOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SizeID` int NOT NULL DEFAULT 0,
`SeqNo` int NULL DEFAULT 0,
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SmOrderNo`, `SizeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycadres
-- ----------------------------
DROP TABLE IF EXISTS `sycadres`;
CREATE TABLE `sycadres`  (
`CompanyCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`AddressCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`CompanyCode`, `AddressCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycagnt
-- ----------------------------
DROP TABLE IF EXISTS `sycagnt`;
CREATE TABLE `sycagnt`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCAGNT_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycbank
-- ----------------------------
DROP TABLE IF EXISTS `sycbank`;
CREATE TABLE `sycbank`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AccountNo` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SwiftNo` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`DepositBank` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TaxID` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCBANK_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syccust
-- ----------------------------
DROP TABLE IF EXISTS `syccust`;
CREATE TABLE `syccust`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NxAccount` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CreditLimit` double NULL DEFAULT 0,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCCUST_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycexpr
-- ----------------------------
DROP TABLE IF EXISTS `sycexpr`;
CREATE TABLE `sycexpr`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Officer` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`HKID` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTIR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTCR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoBR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoFCT` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoCMA` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoHKGCC` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoFHKI` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTTR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTTRFrom` date NULL DEFAULT NULL,
`NoTTRTo` date NULL DEFAULT NULL,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCEXPR_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycmftr
-- ----------------------------
DROP TABLE IF EXISTS `sycmftr`;
CREATE TABLE `sycmftr`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FactoryID` int NULL DEFAULT 0,
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VATRate` double NULL DEFAULT 0,
`PriceIncVAT` tinyint(1) NULL DEFAULT 0,
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Officer` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`HKID` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTIR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTCR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoBR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoFCT` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoCMA` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoHKGCC` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoFHKI` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTTR` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NoTTRFrom` date NULL DEFAULT NULL,
`NoTTRTo` date NULL DEFAULT NULL,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`AutoSend` tinyint(1) NULL DEFAULT 0,
`IWorkDBName` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCMFTR_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycmpny
-- ----------------------------
DROP TABLE IF EXISTS `sycmpny`;
CREATE TABLE `sycmpny`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Type` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCMPNY_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycodemap
-- ----------------------------
DROP TABLE IF EXISTS `sycodemap`;
CREATE TABLE `sycodemap`  (
`Company` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Format` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TableName` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Code` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MapCode` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Company`, `Format`, `TableName`, `Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sycsupp
-- ----------------------------
DROP TABLE IF EXISTS `sycsupp`;
CREATE TABLE `sycsupp`  (
`Code` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentCompany` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Country` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress1` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress2` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress3` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`A2ddress4` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Contact` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EmailAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DomainAddress` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`NxAccount` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VATRate` double NULL DEFAULT 0,
`PriceIncVAT` tinyint(1) NULL DEFAULT 0,
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`CreditLimit` double NULL DEFAULT 0,
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYCSUPP_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syedesc
-- ----------------------------
DROP TABLE IF EXISTS `syedesc`;
CREATE TABLE `syedesc`  (
`Code` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`, `Description`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syexadrs
-- ----------------------------
DROP TABLE IF EXISTS `syexadrs`;
CREATE TABLE `syexadrs`  (
`Type` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Format` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Company` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Configuration` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Type`, `Format`, `Company`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygccard
-- ----------------------------
DROP TABLE IF EXISTS `sygccard`;
CREATE TABLE `sygccard`  (
`CardNo` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Company` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`CardNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygcolor
-- ----------------------------
DROP TABLE IF EXISTS `sygcolor`;
CREATE TABLE `sygcolor`  (
`CardNo` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`D2escription` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorSeries` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorIntensity` int NULL DEFAULT 0,
`ReferenceCode` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`C2olor` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`CardNo`, `Color`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygcrft
-- ----------------------------
DROP TABLE IF EXISTS `sygcrft`;
CREATE TABLE `sygcrft`  (
`Code` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Cost` decimal(19, 4) NULL DEFAULT 0.0000,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygcrlk
-- ----------------------------
DROP TABLE IF EXISTS `sygcrlk`;
CREATE TABLE `sygcrlk`  (
`CraftCode` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CraftItem` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Cost` decimal(19, 4) NULL DEFAULT 0.0000,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`CraftCode`, `CraftItem`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygcser
-- ----------------------------
DROP TABLE IF EXISTS `sygcser`;
CREATE TABLE `sygcser`  (
`ColorSeries` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`C2olorSeries` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorRGB` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`ColorSeries`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syggcrf
-- ----------------------------
DROP TABLE IF EXISTS `syggcrf`;
CREATE TABLE `syggcrf`  (
`GmtType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CraftCode` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`GmtType`, `CraftCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syggmsr
-- ----------------------------
DROP TABLE IF EXISTS `syggmsr`;
CREATE TABLE `syggmsr`  (
`GmtType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(56) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`GmtType`, `Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmatr
-- ----------------------------
DROP TABLE IF EXISTS `sygmatr`;
CREATE TABLE `sygmatr`  (
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShortName` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute1` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute2` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute3` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute4` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute5` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute6` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute7` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute8` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute9` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute10` varchar(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`StkUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`BomUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PurUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`WMSManaged` tinyint(1) NULL DEFAULT 0,
`UniqueItmID` tinyint(1) NULL DEFAULT 0,
`PlanLevel` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PhotoFile` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RcvSingle` tinyint(1) NULL DEFAULT 0,
`RcvMinPct` double NULL DEFAULT 0,
`RcvMaxPct` double NULL DEFAULT 0,
`LeadTime` int NULL DEFAULT 0,
`Image` mediumblob NULL,
`ImageFileCRC` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`MatrClass`, `MatrCode`) USING BTREE,
INDEX `SYGMATR_Attribute1DKey`(`MatrClass` ASC, `Attribute1` ASC) USING BTREE,
INDEX `SYGMATR_Attribute2DKey`(`MatrClass` ASC, `Attribute2` ASC) USING BTREE,
INDEX `SYGMATR_Attribute3DKey`(`MatrClass` ASC, `Attribute3` ASC) USING BTREE,
INDEX `SYGMATR_Attribute4DKey`(`MatrClass` ASC, `Attribute4` ASC) USING BTREE,
INDEX `SYGMATR_Attribute5DKey`(`MatrClass` ASC, `Attribute5` ASC) USING BTREE,
INDEX `SYGMATR_Attribute6DKey`(`MatrClass` ASC, `Attribute6` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmcls
-- ----------------------------
DROP TABLE IF EXISTS `sygmcls`;
CREATE TABLE `sygmcls`  (
`Code` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute1` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute2` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute3` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute4` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute5` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute6` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute7` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute8` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute9` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Attribute10` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ColorVar` tinyint(1) NULL DEFAULT 0,
`ColorSupplier` tinyint(1) NULL DEFAULT 0,
`SizeVar` tinyint(1) NULL DEFAULT 0,
`SizeDepend` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SizeVarAttrb` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Category` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`AlwPrc` double NULL DEFAULT 0,
`WastagePercent` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`WastageUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FactorFormula` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`RcvSingle` tinyint(1) NULL DEFAULT 0,
`RcvMinPct` double NULL DEFAULT 0,
`RcvMaxPct` double NULL DEFAULT 0,
`NoChangePrice` tinyint(1) NULL DEFAULT 0,
`DefaultPrice` int NULL DEFAULT 0,
`WMSManaged` tinyint(1) NULL DEFAULT 0,
`UniqueItmID` tinyint(1) NULL DEFAULT 0,
`ItemAttribute1` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemAttribute2` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemAttribute3` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemAttribute4` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItemStoreCount` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`IssWithoutAloc` tinyint(1) NULL DEFAULT 0,
`NotDefQtyDecimal` tinyint(1) NULL DEFAULT 0,
`DetailQtyDecimal` int NULL DEFAULT 0,
`RoundMethod` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYGMCLS_PrtSeqKey`(`SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmcust
-- ----------------------------
DROP TABLE IF EXISTS `sygmcust`;
CREATE TABLE `sygmcust`  (
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Customer` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`CustCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`MatrClass`, `MatrCode`, `Customer`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmdsc
-- ----------------------------
DROP TABLE IF EXISTS `sygmdsc`;
CREATE TABLE `sygmdsc`  (
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` varchar(80) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`MatrClass`, `MatrCode`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmesr
-- ----------------------------
DROP TABLE IF EXISTS `sygmesr`;
CREATE TABLE `sygmesr`  (
`Name` char(56) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Spec` char(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`N2ame` char(28) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`S2pec` char(56) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmimg
-- ----------------------------
DROP TABLE IF EXISTS `sygmimg`;
CREATE TABLE `sygmimg`  (
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ImageID` int NOT NULL DEFAULT 0,
`ImageDesc` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ImageType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Image` mediumblob NULL,
`ImageFileCRC` int NULL DEFAULT 0,
PRIMARY KEY (`MatrClass`, `MatrCode`, `ImageID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmprice
-- ----------------------------
DROP TABLE IF EXISTS `sygmprice`;
CREATE TABLE `sygmprice`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Supplier` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`season` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VatRate` double NULL DEFAULT 0,
`ShipTerm` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`FactorWay` int NULL DEFAULT 0,
`PriceDate` date NULL DEFAULT NULL,
`LeadTime` int NULL DEFAULT 0,
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `SYGMPRICE_MatrKey`(`MatrClass` ASC, `MatrCode` ASC, `Supplier` ASC, `season` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 383452 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmpricedtl
-- ----------------------------
DROP TABLE IF EXISTS `sygmpricedtl`;
CREATE TABLE `sygmpricedtl`  (
`SysID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SuppColor` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`MinQty` double NULL DEFAULT 0,
`ItemNo` int NOT NULL DEFAULT 0,
PRIMARY KEY (`SysID`, `Color`, `Sizx`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmsupp
-- ----------------------------
DROP TABLE IF EXISTS `sygmsupp`;
CREATE TABLE `sygmsupp`  (
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Supplier` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Article` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`MatrClass`, `MatrCode`, `Supplier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygmusg
-- ----------------------------
DROP TABLE IF EXISTS `sygmusg`;
CREATE TABLE `sygmusg`  (
`Code` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygprcs
-- ----------------------------
DROP TABLE IF EXISTS `sygprcs`;
CREATE TABLE `sygprcs`  (
`Code` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Description` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysDefine` tinyint(1) NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`isSpecial` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygsize
-- ----------------------------
DROP TABLE IF EXISTS `sygsize`;
CREATE TABLE `sygsize`  (
`Sizx` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SzxGroup` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Sizx`) USING BTREE,
INDEX `SYGSIZE_PrtSeqKey`(`SzxGroup` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygstyle
-- ----------------------------
DROP TABLE IF EXISTS `sygstyle`;
CREATE TABLE `sygstyle`  (
`StyleNo` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`GmtType` varchar(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`season` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factory` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`HandleBy` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FullDesc` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`ExtDesc1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtDesc10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RuleCode` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DefSAM` double NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`StyleNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sygtype
-- ----------------------------
DROP TABLE IF EXISTS `sygtype`;
CREATE TABLE `sygtype`  (
`Code` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`DefSAM` double NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syimage
-- ----------------------------
DROP TABLE IF EXISTS `syimage`;
CREATE TABLE `syimage`  (
`ImageID` int NOT NULL DEFAULT 0,
`ImageDesc` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ImageParent` int NULL DEFAULT 0,
`ImageType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ImageBinary` mediumblob NULL,
`CRC` int NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`ImageID`) USING BTREE,
INDEX `SYIMAGE_DirKey`(`ImageParent`, `ImageID`) USING BTREE
) ENGINE = MyISAM AVG_ROW_LENGTH = 200000 CHARACTER SET = big5 COLLATE = big5_chinese_ci MAX_ROWS = 1000000 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syinfmt
-- ----------------------------
DROP TABLE IF EXISTS `syinfmt`;
CREATE TABLE `syinfmt`  (
`DocID` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ControlName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`RowNo` int NULL DEFAULT 0,
`ColNo` int NULL DEFAULT 0,
PRIMARY KEY (`DocID`, `ControlName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symchrg
-- ----------------------------
DROP TABLE IF EXISTS `symchrg`;
CREATE TABLE `symchrg`  (
`Type` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AccountCode` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` double NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`Type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symcnty
-- ----------------------------
DROP TABLE IF EXISTS `symcnty`;
CREATE TABLE `symcnty`  (
`Code` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Region` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GCode` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE,
INDEX `SYMCNTY_NameKey`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symcurr
-- ----------------------------
DROP TABLE IF EXISTS `symcurr`;
CREATE TABLE `symcurr`  (
`Code` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cent` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Format` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`FxDate` date NULL DEFAULT NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`HasCent` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symfxhst
-- ----------------------------
DROP TABLE IF EXISTS `symfxhst`;
CREATE TABLE `symfxhst`  (
`CurCode` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`EffDate` date NOT NULL DEFAULT '0000-00-00',
`Fx` double NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`CurCode`, `EffDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symport
-- ----------------------------
DROP TABLE IF EXISTS `symport`;
CREATE TABLE `symport`  (
`Code` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symprtm
-- ----------------------------
DROP TABLE IF EXISTS `symprtm`;
CREATE TABLE `symprtm`  (
`Description` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Description`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symptrm
-- ----------------------------
DROP TABLE IF EXISTS `symptrm`;
CREATE TABLE `symptrm`  (
`Description` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LC` tinyint(1) NULL DEFAULT 0,
`DueDays` int NULL DEFAULT 0,
`DueStart` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayDsc` double NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Description`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symquot
-- ----------------------------
DROP TABLE IF EXISTS `symquot`;
CREATE TABLE `symquot`  (
`OriginCnty` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`DestCnty` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Code` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GroupID` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EndMonth` int NULL DEFAULT 0,
`CFactor` double NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`OriginCnty`, `DestCnty`, `Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symshmd
-- ----------------------------
DROP TABLE IF EXISTS `symshmd`;
CREATE TABLE `symshmd`  (
`Description` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Description`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symstone
-- ----------------------------
DROP TABLE IF EXISTS `symstone`;
CREATE TABLE `symstone`  (
`MStoneID` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NULL DEFAULT 0,
`ShortName` char(36) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Type` int NULL DEFAULT 0,
`GroupName` char(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`GroupColor` int NULL DEFAULT 0,
`Tolerance` int NULL DEFAULT 0,
`RemindDays` int NULL DEFAULT 0,
`MarkMethod` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Affection` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PreOfLaunch` tinyint(1) NULL DEFAULT 0,
`RoleCode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysMstone` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`MStoneID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for symunit
-- ----------------------------
DROP TABLE IF EXISTS `symunit`;
CREATE TABLE `symunit`  (
`Code` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Name` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`UnitType` char(6) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Factor` double NULL DEFAULT 0,
`BaseUnit` tinyint(1) NULL DEFAULT 0,
`DecUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DecFactor` double NULL DEFAULT 0,
`DecDisplay` tinyint(1) NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syndivs
-- ----------------------------
DROP TABLE IF EXISTS `syndivs`;
CREATE TABLE `syndivs`  (
`Code` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for synmloc
-- ----------------------------
DROP TABLE IF EXISTS `synmloc`;
CREATE TABLE `synmloc`  (
`Code` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MFTRCode` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Name` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`City` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address1` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address2` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address3` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Address4` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Phone` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fax` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipMark` char(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`WmsActivated` tinyint(1) NULL DEFAULT 0,
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for synstim
-- ----------------------------
DROP TABLE IF EXISTS `synstim`;
CREATE TABLE `synstim`  (
`PortFm` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PortTo` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ShipMode` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LeadTime` int NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
`locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`PortFm`, `PortTo`, `ShipMode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syprfmt
-- ----------------------------
DROP TABLE IF EXISTS `syprfmt`;
CREATE TABLE `syprfmt`  (
`Form` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`FormatCode` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Options` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Paper` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
PRIMARY KEY (`Form`, `FormatCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syrclss
-- ----------------------------
DROP TABLE IF EXISTS `syrclss`;
CREATE TABLE `syrclss`  (
`Class` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Description` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Type` char(10) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Locked` tinyint(1) NULL DEFAULT 0,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`Class`) USING BTREE,
INDEX `SYRCLSS_NameKey`(`Description` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for syrremk
-- ----------------------------
DROP TABLE IF EXISTS `syrremk`;
CREATE TABLE `syrremk`  (
`Type` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Code` varchar(10) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`Locked` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`Type`, `Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wk_ivskcrd
-- ----------------------------
DROP TABLE IF EXISTS `wk_ivskcrd`;
CREATE TABLE `wk_ivskcrd`  (
`lotid` int UNSIGNED NOT NULL DEFAULT 0,
`qty` double NULL DEFAULT 0,
`amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`lotid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wk_ivskcrd2
-- ----------------------------
DROP TABLE IF EXISTS `wk_ivskcrd2`;
CREATE TABLE `wk_ivskcrd2`  (
`lotid` int NOT NULL DEFAULT 0,
`color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`qty` double NULL DEFAULT 0,
`amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`lotid`, `color`, `sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wk_lotid
-- ----------------------------
DROP TABLE IF EXISTS `wk_lotid`;
CREATE TABLE `wk_lotid`  (
`lotid` int UNSIGNED NOT NULL DEFAULT 0,
PRIMARY KEY (`lotid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wkoasm
-- ----------------------------
DROP TABLE IF EXISTS `wkoasm`;
CREATE TABLE `wkoasm`  (
`WorkOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`ColorID` int NULL DEFAULT 0,
`SizeID` int NULL DEFAULT 0,
`Dim3ID` int NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`Qty` double NULL DEFAULT 0,
`RcvQty` double NULL DEFAULT 0,
`RtnQty` double NULL DEFAULT 0,
PRIMARY KEY (`WorkOrderNo`, `ExtNo`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkochrg
-- ----------------------------
DROP TABLE IF EXISTS `wkochrg`;
CREATE TABLE `wkochrg`  (
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`ChgType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ChgDesc` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`WorkOrderNo`, `ExtNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkoclosematr
-- ----------------------------
DROP TABLE IF EXISTS `wkoclosematr`;
CREATE TABLE `wkoclosematr`  (
`WorkOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`MatrCode` varchar(24) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ReqQty` double NULL DEFAULT 0,
`RcvReqQty` double NULL DEFAULT 0,
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`WorkOrderNo`, `ExtNo`, `MatrClass`, `MatrCode`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkomstr
-- ----------------------------
DROP TABLE IF EXISTS `wkomstr`;
CREATE TABLE `wkomstr`  (
`WorkOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`OrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Style` varchar(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL,
`Processes` varchar(100) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ProdLoc` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`IssDate` date NULL DEFAULT NULL,
`PayTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PrcTerm` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`EtdDate` date NULL DEFAULT NULL,
`EtaDate` date NULL DEFAULT NULL,
`ShipTerm` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ShipTo` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Unit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`VATRate` double NULL DEFAULT 0,
`PriceIncVAT` tinyint(1) NULL DEFAULT 0,
`Fine` double NULL DEFAULT 0,
`OrdQty` double NULL DEFAULT 0,
`OrdAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`ChgAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`ExtTerm1` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` varchar(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`VersionCount` int NULL DEFAULT 0,
`RcvQty` double NULL DEFAULT 0,
`RcvAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`RtnQty` double NULL DEFAULT 0,
`RtnAmt` decimal(19, 4) NULL DEFAULT 0.0000,
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`StatusDate` date NULL DEFAULT NULL,
`StatusRemark` mediumtext CHARACTER SET big5 COLLATE big5_chinese_ci NULL,
`SysGroup` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`ShipNoRef` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`RcvStatus` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`iWorkStatus` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`iWorkWrkOrder` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`iWorkLMDate` date NULL DEFAULT NULL,
PRIMARY KEY (`WorkOrderNo`, `ExtNo`) USING BTREE,
INDEX `WKOMSTR_OrderKey`(`OrderNo` ASC, `Style` ASC, `WorkOrderNo` ASC) USING BTREE,
INDEX `WKOMSTR_LMDateKey`(`SysLMDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkoprcs
-- ----------------------------
DROP TABLE IF EXISTS `wkoprcs`;
CREATE TABLE `wkoprcs`  (
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`Process` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`PricePercent` double NULL DEFAULT 0,
PRIMARY KEY (`WorkOrderNo`, `ExtNo`, `Process`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkoprice
-- ----------------------------
DROP TABLE IF EXISTS `wkoprice`;
CREATE TABLE `wkoprice`  (
`WorkOrderNo` varchar(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`SeqNo` int NOT NULL DEFAULT 0,
`Colors` varchar(180) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Dim3s` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizes` varchar(40) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`WorkOrderNo`, `ExtNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkosktch
-- ----------------------------
DROP TABLE IF EXISTS `wkosktch`;
CREATE TABLE `wkosktch`  (
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`SketchName` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Remark` char(250) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DefaultImage` tinyint(1) NULL DEFAULT 0,
`ImageID` int NULL DEFAULT 0,
PRIMARY KEY (`WorkOrderNo`, `ExtNo`, `SketchName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkprepay
-- ----------------------------
DROP TABLE IF EXISTS `wkprepay`;
CREATE TABLE `wkprepay`  (
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ExtNo` int NOT NULL DEFAULT 0,
`TrxDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`PaidAmount` decimal(19, 4) NULL DEFAULT 0.0000,
`Balance` decimal(19, 4) NULL DEFAULT 0.0000,
PRIMARY KEY (`WorkOrderNo`, `ExtNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkpyitem
-- ----------------------------
DROP TABLE IF EXISTS `wkpyitem`;
CREATE TABLE `wkpyitem`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtNo` int NULL DEFAULT 0,
`ProdLoc` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`RcvSysID` int NULL DEFAULT 0,
`ChgSysID` int NULL DEFAULT 0,
`ChargeType` char(15) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Description` char(150) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Remark` char(120) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PayTerm` char(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DueDate` date NULL DEFAULT NULL,
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Amount` decimal(19, 4) NULL DEFAULT 0.0000,
`VAT` decimal(19, 4) NULL DEFAULT 0.0000,
`OrgAmount` decimal(19, 4) NULL DEFAULT 0.0000,
`Type` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`PostDate` date NULL DEFAULT NULL,
`PostRef` char(100) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`ExtTerm1` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm2` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm3` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm4` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm5` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm6` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm7` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm8` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm9` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtTerm10` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `WKPYITEM_WorkOrderKey`(`WorkOrderNo` ASC, `ExtNo` ASC, `SysID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkrvtrx
-- ----------------------------
DROP TABLE IF EXISTS `wkrvtrx`;
CREATE TABLE `wkrvtrx`  (
`SysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`WorkOrderNo` char(14) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ExtNo` int NULL DEFAULT 0,
`TrxType` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`TrxDate` date NULL DEFAULT NULL,
`DocRef` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`FreeQty` double NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Cur` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Fx` decimal(12, 6) NULL DEFAULT 0.000000,
`Price` double NULL DEFAULT 0,
`PrcUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Amt` decimal(19, 4) NULL DEFAULT 0.0000,
`AmtNoVAT` decimal(19, 4) NULL DEFAULT 0.0000,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLmDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`SysID`) USING BTREE,
INDEX `WKRVTRX_OrderKey`(`WorkOrderNo` ASC, `ExtNo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wkrvtrx2
-- ----------------------------
DROP TABLE IF EXISTS `wkrvtrx2`;
CREATE TABLE `wkrvtrx2`  (
`sysid` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Dim3` varchar(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Qty` double NULL DEFAULT 0,
`FreeQty` double NULL DEFAULT 0,
`Price` double NULL DEFAULT 0,
`Amt` double NULL DEFAULT 0,
`AmtNoVat` double NULL DEFAULT 0,
PRIMARY KEY (`sysid`, `Color`, `Sizx`, `Dim3`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmaccss
-- ----------------------------
DROP TABLE IF EXISTS `wmaccss`;
CREATE TABLE `wmaccss`  (
`Usercode` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Role` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`Usercode`, `Warehouse`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmitmctrl
-- ----------------------------
DROP TABLE IF EXISTS `wmitmctrl`;
CREATE TABLE `wmitmctrl`  (
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`WarehouseID` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LastDate` char(6) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LastItemNo` int NULL DEFAULT 0,
PRIMARY KEY (`Warehouse`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmopdtl
-- ----------------------------
DROP TABLE IF EXISTS `wmopdtl`;
CREATE TABLE `wmopdtl`  (
`WmOpOrderNo` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`LotID` int NULL DEFAULT 0,
`ItmID` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmIDx` int NULL DEFAULT 0,
`SrLocSysID` int NULL DEFAULT 0,
`ItmCount` int NULL DEFAULT 0,
`CutToQty` double NULL DEFAULT 0,
`CutToIDx` int NULL DEFAULT 0,
`SysLMDate` datetime NULL DEFAULT NULL,
PRIMARY KEY (`WmOpOrderNo`, `SeqNo`) USING BTREE,
INDEX `WMOPDTL_LotKey`(`LotID` ASC, `WmOpOrderNo` ASC, `SeqNo` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmopitm
-- ----------------------------
DROP TABLE IF EXISTS `wmopitm`;
CREATE TABLE `wmopitm`  (
`WmOpOrderNo` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`LotID` int NOT NULL DEFAULT 0,
`ItmID` varchar(32) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`ItmIDx` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue1` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue2` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue3` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmAValue4` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmQty` double NULL DEFAULT 0,
`ItmQtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`WmOpOrderNo`, `LotID`, `ItmID`, `ItmIDx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmopord
-- ----------------------------
DROP TABLE IF EXISTS `wmopord`;
CREATE TABLE `wmopord`  (
`WmOpOrderNo` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`OrdDate` date NULL DEFAULT NULL,
`OrdType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrcDocType` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrcDocRef` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Sourcer` char(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`DocRef` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Orders` char(160) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Styles` char(160) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`AssignTo` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ETCDate` date NULL DEFAULT NULL,
`Remark` char(60) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`Status` char(1) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ActionDate` date NULL DEFAULT NULL,
`SysGroup` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysOwner` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysCreateDate` datetime NULL DEFAULT NULL,
`SysLMUser` char(8) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` datetime NULL DEFAULT NULL,
`DisallowUnknownBarCode` tinyint(1) NULL DEFAULT 0,
PRIMARY KEY (`WmOpOrderNo`) USING BTREE,
INDEX `WMOPORD_SrcKey`(`SrcDocRef` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmoptkcmp
-- ----------------------------
DROP TABLE IF EXISTS `wmoptkcmp`;
CREATE TABLE `wmoptkcmp`  (
`WmOpOrderNo` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`SeqNo` int NOT NULL DEFAULT 0,
`LotID` int NULL DEFAULT 0,
`ItmID` char(32) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmIDx` int NULL DEFAULT 0,
`SrLocSysID` int NULL DEFAULT 0,
`PrvItmCount` int NULL DEFAULT 0,
`CurItmCount` int NULL DEFAULT 0,
PRIMARY KEY (`WmOpOrderNo`, `SeqNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmoptsk
-- ----------------------------
DROP TABLE IF EXISTS `wmoptsk`;
CREATE TABLE `wmoptsk`  (
`WmOpOrderNo` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TaskID` int NOT NULL DEFAULT 0,
`MatrClass` char(2) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`MatrCode` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotID` int NULL DEFAULT 0,
`LotNo` char(24) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`LotRef` char(16) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SkTrxNo` int NULL DEFAULT 0,
`QtyUnit` char(3) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
PRIMARY KEY (`WmOpOrderNo`, `TaskID`) USING BTREE,
INDEX `WMOPTSK_TrxKey`(`SkTrxNo` ASC) USING BTREE,
INDEX `WMOPTSK_LotKey`(`LotID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmsrcls
-- ----------------------------
DROP TABLE IF EXISTS `wmsrcls`;
CREATE TABLE `wmsrcls`  (
`SrClsSysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Warehouse` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrClsLevel` int NULL DEFAULT 0,
`SrClsDesc` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrClsD2esc` varchar(12) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrClsSymbol` mediumblob NULL,
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`SrClsSysID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmsrloc
-- ----------------------------
DROP TABLE IF EXISTS `wmsrloc`;
CREATE TABLE `wmsrloc`  (
`SrLocSysID` int UNSIGNED NOT NULL AUTO_INCREMENT,
`Warehouse` char(5) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SrClsSysID` int NULL DEFAULT 0,
`SrLocCode` char(4) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ParentSrLoc` int NULL DEFAULT 0,
`UseLocCode` tinyint(1) NULL DEFAULT 0,
`Quarantine` tinyint(1) NULL DEFAULT 0,
`SrLocIn` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`ItmCount` double NULL DEFAULT 0,
`StoreCount` int NULL DEFAULT 0,
`UsedStoreCount` int NULL DEFAULT 0,
`ChildCount` double NULL DEFAULT 0,
`Usable` tinyint(1) NULL DEFAULT 0,
`SrLocDesc` char(30) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT '',
`SysLMDate` double NULL DEFAULT 0,
PRIMARY KEY (`SrLocSysID`) USING BTREE,
INDEX `WMSRLOC_AddressKey`(`Warehouse` ASC, `SrLocCode` ASC, `SrLocIn` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24650 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for wmtskasm
-- ----------------------------
DROP TABLE IF EXISTS `wmtskasm`;
CREATE TABLE `wmtskasm`  (
`WmOpOrderNo` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TaskID` int NOT NULL DEFAULT 0,
`Color` varchar(64) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`Sizx` varchar(16) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL DEFAULT '',
`TrgStkQty` double NULL DEFAULT 0,
`ItmStkQty` double NULL DEFAULT 0,
PRIMARY KEY (`WmOpOrderNo`, `TaskID`, `Color`, `Sizx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Procedure structure for CheckPuoMstrMaxDate
-- ----------------------------
DROP PROCEDURE IF EXISTS `CheckPuoMstrMaxDate`;
delimiter ;;
CREATE PROCEDURE `CheckPuoMstrMaxDate`()
## BEGIN
SELECT MAX(SysCreateDate) AS CreateDate,MAX(SysLMDate) AS LMDate FROM puomstr;
## END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for CreateIGMSumQtyInsSql
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreateIGMSumQtyInsSql`;
delimiter ;;
CREATE PROCEDURE `CreateIGMSumQtyInsSql`(IN days INT)
## BEGIN
## SELECT CONCAT("
SELECT CONCAT(\"INSERT INTO CheckDBDiff VALUES ('\",DATABASE(),\"','IGM','\",a.Title,\"','\",a.`Value`,\"');\") AS command FROM((SELECT 'purvtrx.Qty' AS Title,SUM(Qty) AS Value FROM purvtrx  WHERE SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx.RcvQty' AS Title,SUM(RcvQty) AS Value FROM purvtrx  WHERE SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx.Amt' AS Title,SUM(Amt) AS Value FROM purvtrx  WHERE SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx.AmtNoVAT' AS Title,SUM(AmtNoVAT) AS Value FROM purvtrx  WHERE SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.Qty' AS Title,SUM(purvtrx2.Qty) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.RcvQty' AS Title,SUM(purvtrx2.RcvQty) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.UPrc' AS Title,SUM(purvtrx2.UPrc) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.FreeQty' AS Title,SUM(purvtrx2.FreeQty) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.Amt' AS Title,SUM(purvtrx2.Amt) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.AmtNoVAT' AS Title,SUM(purvtrx2.AmtNoVAT) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'ivsktrx.Qty' AS Title,SUM(Qty) AS Value FROM ivsktrx  WHERE TrxDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'ivsktrx.TrxQty' AS Title,SUM(TrxQty) AS Value FROM ivsktrx  WHERE TrxDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'ivsktrx.Amt' AS Title,SUM(Amt) AS Value FROM ivsktrx  WHERE TrxDate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(select 'ivsktrx2.Amt' AS Title,sum(ivsktrx2.amt) AS Value from ivsktrx left join ivsktrx2 on ivsktrx.sysid=ivsktrx2.sysid where ivsktrx.syslmdate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(select 'ivsktrx2.Qty' AS Title,sum(ivsktrx2.qty) AS Value from ivsktrx left join ivsktrx2 on ivsktrx.sysid=ivsktrx2.sysid where ivsktrx.syslmdate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00'))) UNION
(select 'ivsktrx2.TrxQty' AS Title,sum(ivsktrx2.trxqty) AS Value from ivsktrx left join ivsktrx2 on ivsktrx.sysid=ivsktrx2.sysid where ivsktrx.syslmdate <= (SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL ",days," DAY),'%Y-%m-%d 00:00:00')))) AS a into dsResult1;
") AS IGMSql;
## END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for CreateSumQtyInsSql
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreateSumQtyInsSql`;
delimiter ;;
CREATE PROCEDURE `CreateSumQtyInsSql`(IN days INT)
## BEGIN
DECLARE var_CheckDate VARCHAR(255);
DECLARE var_Command  VARCHAR(255);
DECLARE done INT DEFAULT FALSE;

DECLARE cur_WIP CURSOR FOR
SELECT CONCAT("INSERT INTO CheckDBDiff VALUES ('",DATABASE(),"','QVE','",a.Title,"','",a.`Value`,"');") AS command FROM
((SELECT 'purvtrx.Qty' AS Title,SUM(Qty) AS Value FROM purvtrx  WHERE SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx.RcvQty' AS Title,SUM(RcvQty) AS Value FROM purvtrx  WHERE SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx.Amt' AS Title,SUM(Amt) AS Value FROM purvtrx  WHERE SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx.AmtNoVAT' AS Title,SUM(AmtNoVAT) AS Value FROM purvtrx  WHERE SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.Qty' AS Title,SUM(purvtrx2.Qty) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.RcvQty' AS Title,SUM(purvtrx2.RcvQty) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.UPrc' AS Title,SUM(purvtrx2.UPrc) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.FreeQty' AS Title,SUM(purvtrx2.FreeQty) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.Amt' AS Title,SUM(purvtrx2.Amt) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'purvtrx2.AmtNoVAT' AS Title,SUM(purvtrx2.AmtNoVAT) AS Value FROM purvtrx LEFT JOIN purvtrx2 ON purvtrx.SysID=purvtrx2.SysID WHERE purvtrx.SysLmDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'ivsktrx.Qty' AS Title,SUM(Qty) AS Value FROM ivsktrx  WHERE TrxDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'ivsktrx.TrxQty' AS Title,SUM(TrxQty) AS Value FROM ivsktrx  WHERE TrxDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(SELECT 'ivsktrx.Amt' AS Title,SUM(Amt) AS Value FROM ivsktrx  WHERE TrxDate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(select 'ivsktrx2.Amt' AS Title,sum(ivsktrx2.amt) AS Value from ivsktrx left join ivsktrx2 on ivsktrx.sysid=ivsktrx2.sysid where ivsktrx.syslmdate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(select 'ivsktrx2.Qty' AS Title,sum(ivsktrx2.qty) AS Value from ivsktrx left join ivsktrx2 on ivsktrx.sysid=ivsktrx2.sysid where ivsktrx.syslmdate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00'))) UNION
(select 'ivsktrx2.TrxQty' AS Title,sum(ivsktrx2.trxqty) AS Value from ivsktrx left join ivsktrx2 on ivsktrx.sysid=ivsktrx2.sysid where ivsktrx.syslmdate <= (	SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00')))) AS a;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS tmp_res;

CREATE TEMPORARY TABLE tmp_res (
output_str VARCHAR(255)
);

OPEN cur_WIP;

WIP_loop: LOOP

FETCH cur_WIP INTO var_Command;

IF done THEN
LEAVE WIP_loop;
## END IF;

INSERT INTO tmp_res (output_str) VALUES(CONCAT(var_Command));

END LOOP WIP_loop;

CLOSE cur_WIP;

SELECT * FROM tmp_res;
SELECT DATE_FORMAT(DATE_ADD(NOW(),INTERVAL days DAY),'%Y-%m-%d 00:00:00') AS QueryDate;
## END
;;
delimiter ;

## SET FOREIGN_KEY_CHECKS = 1;