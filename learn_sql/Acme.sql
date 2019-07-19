CREATE TABLE `customer` (
`id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`fname` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`Iname` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`dbay` date NOT NULL,
`phone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `lineitem` (
`xorderid` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`productid` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`quanitity` decimal(20,0) NOT NULL,
`sale_price` decimal(20,0) NOT NULL,
PRIMARY KEY (`xorderid`, `productid`) ,
INDEX `fk_productid` (`productid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `product` (
`id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`list_price` decimal(20,2) NOT NULL,
`describe` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `xorder` (
`id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`customerid` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`delivery` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`wrap` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`xdate` date NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `fk_cunstomerid` (`customerid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `lineitem` ADD CONSTRAINT `fk_productid` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);
ALTER TABLE `lineitem` ADD CONSTRAINT `fk_xorderid` FOREIGN KEY (`xorderid`) REFERENCES `xorder` (`id`);
ALTER TABLE `xorder` ADD CONSTRAINT `fk_cunstomerid` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`);

