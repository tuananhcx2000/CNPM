-- create database
DROP DATABASE IF EXISTS `Restaurant`;
CREATE DATABASE IF NOT EXISTS `Restaurant`;

USE `Restaurant`;

-- create table `User`
DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User`(
	`UserID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Email` 		VARCHAR(50) NOT NULL UNIQUE KEY,
    `PhoneNumber`	VARCHAR(12) NOT NULL UNIQUE KEY,
    `FirstName`		VARCHAR(35) NOT NULL,
    `LastName`		VARCHAR(15) NOT NULL,
    `PassWord`		VARCHAR(200) NOT NULL,
    `DateOfBirth`	DATETIME,
    `Gender`		ENUM('Male','Female','Unknown') DEFAULT("Unknown"),
    `Address`		VARCHAR(100) NOT NULL,
    `Role`			ENUM('User','Admin') DEFAULT("User"),
    `Status`		ENUM('Active','NotActive','Block') DEFAULT("NotActive"),
    `CreatedAt`		DATETIME DEFAULT NOW(),
    `UpdatedAt`		DATETIME DEFAULT NOW()
);

-- create table `Bill`
DROP TABLE IF EXISTS `Bill`;
CREATE TABLE IF NOT EXISTS `Bill`(
	`BillID`		BIGINT AUTO_INCREMENT PRIMARY KEY,
    `UserID`		TINYINT NOT NULL,
    `TotalPrice` 	DOUBLE DEFAULT 0,
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
    `FoodName` 		VARCHAR(50) NOT NULL,
    `Price`			DOUBLE NOT NULL,
    `Label`			VARCHAR(25),
    `Image`			VARCHAR(500) NOT NULL,
    `FoodAmount`	INT NOT NULL,
    FOREIGN KEY(`CategoryID`) REFERENCES `FoodCategory`(`CategoryID`)
);

-- create table `BillDetail`
DROP TABLE IF EXISTS `BillDetail`;
CREATE TABLE IF NOT EXISTS `BillDetail`(
	`BillID`		BIGINT NOT NULL,
    `FoodID`		TINYINT NOT NULL,
    `Ammount`		INT DEFAULT 1,
    PRIMARY KEY(`BillID`,`FoodID`),
    FOREIGN KEY(`BillID`) REFERENCES `Bill`(`BillID`),
    FOREIGN KEY(`FoodID`) REFERENCES `Food`(`FoodID`)
);

-- create table `resetPassToken`
DROP TABLE IF EXISTS `resetPassToken`;
CREATE TABLE IF NOT EXISTS `resetPassToken`(
	`id`			TINYINT AUTO_INCREMENT PRIMARY KEY,
    `token` 		VARCHAR(50) NOT NULL UNIQUE KEY,
    `userID`		TINYINT NOT NULL,
    `expiredDate`	DATETIME NOT NULL,
    FOREIGN KEY(`userID`) REFERENCES `User`(`UserID`)
);

-- create table `activeToken`
DROP TABLE IF EXISTS `activeToken`;
CREATE TABLE IF NOT EXISTS `activeToken`(
	`id`			TINYINT AUTO_INCREMENT PRIMARY KEY,
    `token` 		VARCHAR(50) NOT NULL UNIQUE KEY,
    `userID`		TINYINT NOT NULL,
    `expiredDate`	DATETIME NOT NULL,
    FOREIGN KEY(`userID`) REFERENCES `User`(`UserID`)
);
-- Insert Data -------------------------------
-- Insert into table `User`
INSERT INTO `User`
(`Email`					,`PhoneNumber`	,`FirstName`	,`LastName`		,`PassWord`		,`Gender`	,`Status`		,`Address`					)
VALUES
('JohnnyDang@gmail.com'		,'0956320111'	,'Johnny' 		,'Tu???n ?????ng'	,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('TommyTeo@gmail.com'		,'0987654321'	,'Tommy'		, 'Quang T??o'	,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('AnNguyen@gmail.com'		,'0967299999'	,'Nguy???n V??n'	, 'An'			,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('AnhTuanTran@gmail.com'	,'0956320333'	,'Tr???n Tu???n'	, 'Anh'			,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('NgaNgoNgan@gmail.com'		,'0956320444'	,'Nguy???n Th???'	, 'Nga'			,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Female'	,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('HungLieuViet@gmail.com'	,'0956320555'	,'Li???u Vi???t'	, ' H??ng'		,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('TranDoan@gmail.com'		,'0956777888'	,'Tr???n Ng???c'	, '??o??n'		,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('LeBao123@gmail.com'		,'0956888888'	,'L?? Ng???c'		, 'B???o'			,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('MrBaoBinhpro@gmail.com'	,'0956320145'	,'L?? B???o'		,'B??nh'			,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i'),
('TrungPhan3ke@gmail.com'	,'0964421412'	,'Phan T???n'		, 'Trung'		,'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,'Male'		,'Active'	,'20A ng?? 445 Nguy???n Khang, Y??n H??a, C???u Gi???y, H?? n???i');


-- Insert into table `FoodCategory`
INSERT INTO `FoodCategory`
(`CategoryName`		)
VALUES
('L???n'				),
('C??m'				),
('G??'			),
('B??'				),
('????? U???ng'			);

-- Insert into table `Food`
INSERT INTO `Food`
(`CategoryID`	,`FoodName`					,`Price`	,`Image`					,`FoodAmount`		,`Label`)
VALUES
(3				,'G?? B?? X??I THANH LONG'			,540000		,'https://dashboard-api.flyfood.vn/system/assets/5723/file.jpg'					,10			 ,'popular'),
(3				,'G?? H???P N?????C M???M - X??I CU???N 3 M??U'	,580000		,'https://dashboard-api.flyfood.vn/system/assets/5720/file.jpg'					,10			 ,'new'),
(3				,'G?? B?? X??I 3 M??U ??M TR???NG NON H???T SEN'	,520000		,'https://dashboard-api.flyfood.vn/system/assets/1921/file.jpg'					,10			 ,'bestseller'),
(3				,'G?? TA H???P C??CH TH???Y'			,390000		,'https://dashboard-api.flyfood.vn/system/assets/5734/file.jpg'					,10			 ,'popular'),
(3				,'G?? B?? X??I 2 M??U ??M TR???NG NON H???T SEN'	,515000		,'https://dashboard-api.flyfood.vn/system/assets/5720/file.jpg'					,10			 ,'popular'),
(2				,'C??M G?? L?? SEN'			,200000		,'https://dashboard-api.flyfood.vn/system/assets/5777/file.jpg'					,10			 ,'popular'),
(2				,'C??M CHI??N C?? M???N'			,200000		,'https://dashboard-api.flyfood.vn/system/assets/5769/file.jpg'					,10			,'popular'),
(2				,'C??M CHI??N H???I S???N'			,220000		,'https://dashboard-api.flyfood.vn/system/assets/5890/file.png'					,10			 ,'popular'),
(2				,'C??M CHI??N D????NG CH??U'			,200000		,'https://dashboard-api.flyfood.vn/system/assets/5773/file.jpg'					,10			 ,'popular'),
(2				,'S??P S?? ??I???P T??C TI??N'			,250000		,'https://dashboard-api.flyfood.vn/system/assets/5785/file.jpg'					,10			 ,'popular'),
(2				,'S??P ????NG C?? G?? X??'			,180000		,'https://dashboard-api.flyfood.vn/system/assets/5781/file.jpg'					,10			 ,'popular'),
(2				,'S??P H???I S???N'				,250000		,'https://dashboard-api.flyfood.vn/system/assets/5638/file.jpg'					,10			 ,'popular'),
(3				,'COMBO C??M G??'				,150000		,'https://kfcvietnam.com.vn/uploads/combo/ef4c16337a38c42b59331d24749fbbf4.jpg'					,10			 ,'popular'),
(5				,'Fresh Fruit Tea'			,20000		,'http://royaltea.vn/temp/uploaded-san%20pham_32974763_1198037793670751_2405859736541986816_n_thumbcr_364x271.png'					,10			 ,'new'),
(5				,'Fresh Fruit Smoothie'			,25000		,'http://royaltea.vn/temp/uploaded-san%20pham_33058655_1198037763670754_2207856225163411456_n_thumbcr_364x271.png'					,10			 ,'new'),
(5				,'Coffee'				,18000		,'http://royaltea.vn/temp/uploaded-san%20pham_33083909_1198037773670753_3116257398998695936_n_thumbcr_364x271.png',10			 ,'new'),
(5				,'Cheese Tea'				,19000		,'http://royaltea.vn/temp/uploaded-san%20pham_33081272_1198037760337421_3481262952676327424_n_thumbcr_364x271.png',10			 ,'new'),
(5				,'Royal Cheese'				,30000		,'http://royaltea.vn/temp/uploaded-san%20pham_33136425_1198037753670755_6011816456088453120_n_thumbcr_364x271.png'					,10			 ,'new'),
(5				,'Hottea'				,35000		,'http://royaltea.vn/temp/uploaded-san%20pham_33064447_1198037787004085_1830498504456273920_n_thumbcr_364x271.png'					,10			 ,'new'),
(5				,'Topping'				,5000		,'http://royaltea.vn/temp/uploaded-san%20pham_32978829_1198037757004088_5686036868789960704_n_thumbcr_364x271.png'					,10			 ,'new'),
(5				,'Milk Tea'				,25000		,'http://royaltea.vn/temp/uploaded-san%20pham_33038128_1198037780337419_1819453467773632512_n_thumbcr_364x271.png'					,10			 ,'new'),
(1				,'N???c D??m Heo Kho Ti??u'			,99000		,'https://image.cooky.vn/posproduct/g0/12932/s400x400/77ae7474-cfa0-4a48-a07a-24c4360a4d21.jpeg'					,10			 ,'new'),
(1				,'Th???t Heo X??o C???i Ng???t'		,80000		,'https://image.cooky.vn/posproduct/g0/12906/s400x400/259ca609-6761-4473-8be2-7b1447a79537.jpeg'					,10			 ,'new'),
(1				,'S?????n Non Heo Kho C??? C???i T??u H??'	,190000		,'https://image.cooky.vn/posproduct/g0/4362/s400x400/33fd922a-4b05-4750-9c5b-f7e7cac18a76.jpeg'					,10			 ,'new'),
(1				,'Ba R???i Heo Chi??n Da Gi??n'		,100000		,'https://image.cooky.vn/posproduct/g0/402/s400x400/a0dd4ed4-e063-4b20-a555-a86ddaa5a94e.jpeg'					,10			 ,'new'),
(1				,'Ba R???i Heo Kho N?????c D???a'		,100000		,'https://image.cooky.vn/posproduct/g0/13583/s400x400/d55d7f70-ae2d-4a49-ae6f-dce4f39ce769.jpeg'					,10			 ,'bestseller'),
(1				,'Ba R???i Heo Rim Chao'			,120000		,'https://image.cooky.vn/posproduct/g0/11919/s400x400/83002841-adb9-4233-876c-92ae1b2be4c0.jpeg'					,10			 ,'bestseller'),
(1				,'Ba R???i Heo Kho M??ng'			,140000		,'https://image.cooky.vn/posproduct/g0/12953/s400x400/ca8516dc-ea80-416a-9bc6-c3a5fa5a7136.jpeg'					,10			 ,'bestseller'),
(2				,'B???p B?? S???t Me'			,160000		,'https://image.cooky.vn/posproduct/g0/411/s400x400/148df84f-7497-4b7b-85ad-e7e4c65e11c6.jpeg'					,10			 ,'bestseller'),
(2				,'Th??n B?? X??o L?? L???t'			,175000		,'https://image.cooky.vn/posproduct/g0/13753/s400x400/e8d27bbc-a64a-4a0a-b95f-2763ccb52179.jpeg'					,10			 ,'bestseller'),
(2				,'Th??n B?? X??o C???i Ng???t'			,190000		,'https://image.cooky.vn/posproduct/g0/5837/s400x400/7eb6d980-4630-4ff8-923b-336617ad45b7.jpeg'					,10			,'bestseller' ),
(2				,'Th??n B?? X??o D???c M??ng'			,165000		,'https://image.cooky.vn/posproduct/g0/6966/s400x400/094d027d-21c6-4a50-b232-49cea4404279.jpeg'					,10			 ,'bestseller'),
(2				,'Th??n B?? X??o N???m Th???p C???m'		,155000		,'https://image.cooky.vn/posproduct/g0/13718/s400x400/c1b33fbd-a39d-4993-9d56-965136ff73ad.jpeg'					,10			 ,'bestseller'),
(2				,'Th??n B?? X??o B??ng C???i Xanh'		,130000		,'https://image.cooky.vn/posproduct/g0/6982/s400x400/f2c4648e-a8fc-431f-9f5e-46bdd2fd1f5b.jpeg'					,10			 ,'bestseller'),
(2				,'Th??n B?? X??o Sa T??? 	'		,110000		,'https://image.cooky.vn/posproduct/g0/10284/s400x400/45790592-445b-4698-8a38-3dd9848e2521.jpeg'					,10			 ,'bestseller'),
(2				,'B?? H???m Ti??u Xanh'			,98000		,'https://image.cooky.vn/posproduct/g0/33/s400x400/900ab1ce-4672-46cf-b9ed-a71cd6d1479d.jpeg'					,10			 ,'bestseller'),
(2				,'B?? Cu???n Ph?? Mai ????t L??'		,200000		,'https://image.cooky.vn/posproduct/g0/13654/s400x400/bd84dfa9-776c-4a40-93c3-39fa61b20728.jpeg'					,10			 ,'bestseller'),
(1				,'Ba R???i Heo Kho M???m Ru???c'		,150000		,'https://image.cooky.vn/posproduct/g0/10180/s400x400/58c6f42f-6b5d-4d94-81cb-7f8d60cd63fc.jpeg'					,10			 ,'bestseller');
-- Test data inserted

SELECT * FROM `User`;
SELECT * FROM `FoodCategory`;
SELECT * FROM `Food`;
SELECT * FROM `resetPassToken`;
SELECT * FROM `ActiveToken`;

DELETE FROM `User` WHERE `FirstName` = 'Son';
