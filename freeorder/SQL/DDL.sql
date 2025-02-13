
	DROP TABLE IF EXISTS `USERS`;

	CREATE TABLE `USERS` (
		`ID`			CHAR(50)  		PRIMARY KEY 	NOT NULL,
		`USERNAME`		VARCHAR(100)					NOT NULL,
		`PASSWORD`		VARCHAR(100)					NOT NULL,
		`NAME`			VARCHAR(100)					NOT NULL,
		`CREATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`ENABLED`		INT								NOT NULL	DEFAULT 1
	);

	DROP TABLE IF EXISTS `USER_AUTH`;

	CREATE TABLE `USER_AUTH` (
		`ID`		CHAR(50)		PRIMARY KEY     NOT NULL,
		`USERNAME`	VARCHAR(100)					NOT NULL,
		`AUTH`		VARCHAR(100)					NOT NULL
	);

	DROP TABLE IF EXISTS `PRODUCTS`;

	CREATE TABLE `PRODUCTS` (
		`ID`			CHAR(50) 		PRIMARY KEY 		NOT NULL,
		`OPTION_ID`		CHAR(50)								NULL,
		`NAME`			VARCHAR(100)						NOT NULL,
		`CATEGORY_ID`	CHAR(50)							NOT NULL,
		`DESCRIPTION`	VARCHAR(200)							NULL,
		`CONTENT`		TEXT									NULL,
		`PRICE`			INT									NOT NULL,
		`STOCK_CHECK`	BOOLEAN								NOT NULL	DEFAULT FALSE,
		`STOCK`			INT										NULL	DEFAULT 0,
		`SEQ`			INT									NOT NULL	DEFAULT 0,
		`CREATED_AT`	TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `CARTS`;

	CREATE TABLE `CARTS` (
		`ID`			CHAR(50)    PRIMARY KEY     NOT NULL,
		`PRODUCTS_ID`	CHAR(50)					NOT NULL,
		`AMOUNT`		INT							NOT NULL	DEFAULT 1,
		`PRICE`			INT							NOT NULL,
		`CREATED_AT`	TIMESTAMP					NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP					NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `ORDERS`;

	CREATE TABLE `ORDERS` (
		`ID`				CHAR(50)  		PRIMARY KEY    		NOT NULL,
		`USER_ID`			CHAR(50)							NOT NULL,
		`TITLE`				VARCHAR(100)						NOT NULL,
		`TOTAL_QUANTITY`	INT									NOT NULL	DEFAULT 1,
		`TOTAL_COUNT`		INT									NOT NULL	DEFAULT 1,
		`TOTAL_PRICE`		INT									NOT NULL	DEFAULT 0,
		`STATUS`			ENUM('PENDING','PAID','CANCELLED')	NOT NULL	DEFAULT 'PENDING'	COMMENT '결제대기, 결제완료, 주문취소',
		`ORDERED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`CREATED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `ORDER_ITEMS`;

	CREATE TABLE `ORDER_ITEMS` (
		`ID`			CHAR(50)  	PRIMARY KEY    	NOT NULL,
		`ORDERS_ID`		CHAR(50)					NOT NULL,
		`PRODUCTS_ID`	CHAR(50)					NOT NULL,
		`OPTION_ID`		CHAR(50)					NOT NULL,
		`QUANTITY`		INT							NOT NULL	DEFAULT 1,
		`PRICE`			INT							NOT NULL	DEFAULT 0,
		`AMOUNT`		INT								NULL,
		`CREATED_AT`	TIMESTAMP					NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP					NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `PAYMENTS`;

	CREATE TABLE `PAYMENTS` (
		`ID`				CHAR(50)  		PRIMARY KEY    		NOT NULL,
		`ORDERS_ID`			CHAR(50)							NOT NULL,
		`PAYMENT_METHOD`	VARCHAR(100)							NULL,
		`STATUS`			ENUM('PENDING','PAID','REFUND')		NOT NULL	DEFAULT 'PENDING'	COMMENT '결제대기, 결제완료, 환불',
		`PAID_AT`			TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`CREATED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `CANCELLATIONS`;

	CREATE TABLE `CANCELLATIONS` (
		`ID`				CHAR(50)  		PRIMARY KEY    		NOT NULL,
		`ORDERS_ID`			CHAR(50)							NOT NULL,
		`TYPE`				ENUM('cancel','return','exchange')	NOT NULL	DEFAULT 'cancel'	COMMENT '주문취소,반품,교환',
		`STATUS`			ENUM('pending','complete')				NULL	DEFAULT 'pending'	COMMENT '취소요청(대기), 처리완료',
		`REASON`			TEXT									NULL,
		`REFUNDED_AMOUNT`	INT									NOT NULL	DEFAULT 0,
		`IS_CONFIRMED`		TINYINT(1)							NOT NULL	DEFAULT 0	COMMENT '0: 미승인, 1: 승인',
		`IS_REFUND`			TINYINT(1)							NOT NULL	DEFAULT 0	COMMENT '0: 대기, 1: 처리완료',
		`ACCOUNT_NUMBER`	VARCHAR(100)							NULL,
		`BANK_NAME`			VARCHAR(100)							NULL,
		`DEPOSITOR`			VARCHAR(100)							NULL,
		`CANCELED_AT`		TIMESTAMP								NULL,
		`COMPLETED_AT`		TIMESTAMP								NULL,
		`CREATED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`		TIMESTAMP							NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `CATEGORIES`;

	CREATE TABLE `CATEGORIES` (
		`ID`			CHAR(50)  		PRIMARY KEY    	NOT NULL,
		`NAME`			VARCHAR(100)					NOT NULL,
		`SEQ`			INT								NOT NULL	DEFAULT 0,
		`CREATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `FILES`;

	CREATE TABLE `FILES` (
		`ID`			CHAR(50)  		PRIMARY KEY    	NOT NULL,
		`PARENT_TABLE`	VARCHAR(100)					NOT NULL,
		`PARENT_ID`		CHAR(50)						NOT NULL,
		`NAME`			TEXT							NOT NULL,
		`ORIGIN_NAME`	TEXT							NOT NULL,
		`PATH`			TEXT							NOT NULL,
		`SIZE`			INT								NOT NULL	DEFAULT 0,
		`IS_MAIN`		BOOLEAN							NOT NULL	DEFAULT FALSE,
		`SEQ`			INT								NOT NULL	DEFAULT 0,
		`CREATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `OPTIONS`;

	CREATE TABLE `OPTIONS` (
		`ID`			CHAR(50)			NOT NULL,
		`NAME`			VARCHAR(100)		NOT NULL,
		`STOCK_CHECK`	BOOLEAN				NOT NULL	DEFAULT FALSE,
		`STOCK`			INT						NULL	DEFAULT 0,
		`ESSENTIAL`		BOOLEAN				NOT NULL	DEFAULT FALSE,
		`SELECT_MIN`	INT						NULL,
		`SELECT_MAX`	INT						NULL,
		`CREATED_AT`	TIMESTAMP			NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP			NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `OPTION_ITEMS`;

	CREATE TABLE `OPTION_ITEMS` (
		`ID`			CHAR(50)			NOT NULL,
		`OPTION_ID`		CHAR(50)			NOT NULL,
		`NAME`			VARCHAR(100)		NOT NULL,
		`PRICE`			INT					NOT NULL	DEFAULT 0,
		`SEQ`			INT					NOT NULL	DEFAULT 0,
		`CREATED_AT`	TIMESTAMP			NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`	TIMESTAMP			NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

	DROP TABLE IF EXISTS `NOTICES`;

	CREATE TABLE `NOTICES` (
		`ID`			CHAR(50)  		PRIMARY KEY    	NOT NULL,
		`thumbnail`		VARCHAR(255)						NULL	COMMENT '이벤트 섬네일파일경로',
		`TYPE`			VARCHAR(30)						NOT NULL	COMMENT '타입(공지사항, 이벤트)',
		`TITLE`			VARCHAR(100)					NOT NULL	COMMENT '공지사항 제목',
		`CONTENT`		VARCHAR(1000)					NOT NULL	COMMENT '공지사항 내용',
		`CREATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
		`UPDATED_AT`	TIMESTAMP						NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자'
	);

	DROP TABLE IF EXISTS `RECOMMENDED_PRODUCTS`

	CREATE TABLE `RECOMMENDED_PRODUCTS` (
		`ID` 			CHAR(50) 		PRIMARY KEY 	NOT NULL 	COMMENT '추천메뉴 ID',
		`PRODUCTS_ID` 	CHAR(50) 						NOT NULL 	COMMENT '추천할 상품 ID',
		`REASON` 		VARCHAR(255) 						NULL 	COMMENT '추천 이유',
		`CREATED_AT` 	TIMESTAMP 						NOT NULL 	DEFAULT CURRENT_TIMESTAMP 	COMMENT '추천 등록일자',
		`UPDATED_AT` 	TIMESTAMP 						NOT NULL 	DEFAULT CURRENT_TIMESTAMP 	COMMENT '추천 수정일자'
	);

	DROP TABLE IF EXISTS `ORDER_OPTIONS`;

	CREATE TABLE `ORDER_OPTIONS` (
		`ID`				CHAR(50)		NOT NULL,
		`OPTION_ITEM_ID`	CHAR(50)		NOT NULL,
		`ORDER_ITEM_ID`		CHAR(50)		NOT NULL,
		`NAME`				VARCHAR(100)	NOT NULL,
		`CREATED_AT`		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
		`UPDATED_AT`		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP
	);

