-- create database
DROP DATABASE IF EXISTS `Restaurant`;
CREATE DATABASE IF NOT EXISTS `Restaurant`;

USE `Restaurant`;

-- create table `User`
DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User`(
	`UserID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Email` 		VARCHAR(35) NOT NULL UNIQUE KEY,
    `PhoneNumber`	VARCHAR(12) NOT NULL UNIQUE KEY,
    `FullName`		VARCHAR(35) NOT NULL,
    `PassWord`		VARCHAR(16) NOT NULL,
    `Age`			INT NOT NULL CHECK (`Age`>16),
    `Gender`		ENUM('Male','Female','Unknown') NOT NULL,
    `Address`		VARCHAR(100) NOT NULL,
    `CreatedAt`		DATETIME DEFAULT NOW(),
    `UpdatedAat`	DATETIME DEFAULT NOW()
);

-- create table `Bill`
DROP TABLE IF EXISTS `Bill`;
CREATE TABLE IF NOT EXISTS `Bill`(
	`BillID`		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `UserID`		TINYINT NOT NULL,
    `TotalPrice` 	DOUBLE NOT NULL,
    `CreatedAt`		DATETIME DEFAULT NOW(),
    `UpdatedAat`	DATETIME DEFAULT NOW(),
    FOREIGN KEY(`UserID`) REFERENCES `User`(`UserID`)
);

-- create table `FoodCategory`
DROP TABLE IF EXISTS `FoodCategory`;
CREATE TABLE IF NOT EXISTS `FoodCategory`(
	`CategoryID`		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `CategoryName` 		VARCHAR(30) NOT NULL
);

-- create table `Food`
DROP TABLE IF EXISTS `Food`;
CREATE TABLE IF NOT EXISTS `Food`(
	`FoodID`		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `CategoryID`    TINYINT NOT NULL,
    `FoodName` 		VARCHAR(30) NOT NULL,
    `Price`			DOUBLE NOT NULL,
    `FoodAmount`	INT NOT NULL,
    FOREIGN KEY(`CategoryID`) REFERENCES `FoodCategory`(`CategoryID`)
);

-- create table `BillDetail`
DROP TABLE IF EXISTS `BillDetail`;
CREATE TABLE IF NOT EXISTS `BillDetail`(
	`BillID`		TINYINT NOT NULL,
    `FoodID`		TINYINT NOT NULL,
    `Ammount`		INT DEFAULT 1,
    PRIMARY KEY(`BillID`,`FoodID`),
    FOREIGN KEY(`BillID`) REFERENCES `Bill`(`BillID`),
    FOREIGN KEY(`FoodID`) REFERENCES `Food`(`FoodID`)
);

-- Insert Data -------------------------------
-- Insert into table `User`
INSERT INTO `User`
(`Email`					,`PhoneNumber`	,`FullName`			,`PassWord`		,`Age`	,`Gender`	,`Address`					)
VALUES
('JohnnyDang@gmail.com'		,'0956320111'	,'Johnny Tuấn Đặng'		,'Thuhanoi123'	,45		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('TommyTeo@gmail.com'		,'0987654321'	,'Tommy Quang Tèo'		,'Anhyeuem123'	,23		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('AnNguyen@gmail.com'		,'0967299999'	,'Nguyễn Văn An'		,'Anngu102102'	,20		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('AnhTuanTran@gmail.com'	,'0956320333'	,'Trần Tuấn Anh'		,'Thuhanoi123'	,20		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('NgaNgoNgan@gmail.com'		,'0956320444'	,'Nguyễn Thị Nga'		,'Thuhanoi123'	,32		,'Female'	,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('HungLieuViet@gmail.com'	,'0956320555'	,'Liễu Việt Hùng'		,'Thuhanoi123'	,20		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('TranDoan@gmail.com'		,'0956777888'	,'Trần Ngọc Đoàn'		,'Thuhanoi123'	,27		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('LeBao123@gmail.com'		,'0956888888'	,'Lê Ngọc Bảo'			,'Thuhanoi123'	,19		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('MrBaoBinhpro@gmail.com'	,'0956320145'	,'Lê Bảo Bình'			,'Thuhanoi123'	,45		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội'),
('TrungPhan3ke@gmail.com'	,'0964421412'	,'Phan Tấn Trung'		,'Thuhanoi123'	,45		,'Male'		,'20A ngõ 445 Nguyễn Khang, Yên Hòa, Cầu Giấy, Hà nội');


-- Insert into table `FoodCategory`
INSERT INTO `FoodCategory`
(`CategoryName`		)
VALUES
('Pork'				),
('Fish'				),
('Chicken'			),
('Drink'			);

-- Insert into table `Food`
INSERT INTO `Food`
(`CategoryID`	,`FoodName`					,`Price`	,`FoodAmount`)
VALUES
(1				,'Heo Sữa Quay'				,1950		,10			 ),
(2				,'Cá tai tượng chiên xù'	,1950		,8			 ),
(3				,'Gà bó xôi'				,580		,20			 ),
(3				,'Gà hấp nước mắm'			,549		,15			 ),
(3				,'Gà ta hấp cách thủy'		,599		,15			 ),
(4				,'Coca Cola'				,12			,300		 );

-- Test data inserted

SELECT * FROM `User`;
SELECT * FROM `FoodCategory`;
SELECT * FROM `Food`;

