
DROP TABLE IF EXISTS `ORDER_ITEMS`;

CREATE TABLE `ORDER_ITEMS` (
	`ID`	BIGINT  PRIMARY KEY   AUTO_INCREMENT 	NOT NULL,
	`ORDERS_ID`	BIGINT	NOT NULL,
	`PRODUCTS_ID`	BIGINT	NOT NULL,
	`QUANTITY`	INT	NOT NULL	DEFAULT 1,
	`PRICE`	INT	NOT NULL	DEFAULT 0,
	`AMOUNT`	INT	NULL,
	`CREATED_AT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`UPDATED_AT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);