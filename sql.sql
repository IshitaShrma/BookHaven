-- Database: `test`
create database test;
use test;
-- --------------------------------------------------------

-- Table `books`
CREATE TABLE `books` (
  `isbn` int(10) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `pub` varchar(10) DEFAULT NULL,
  `cat` varchar(5) DEFAULT NULL,
  `price` int(5) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `test`.`books`
(`isbn`, `title`, `author`, `pub`, `cat`, `price`)
VALUES
(<{isbn: }>, <{title: }>, <{author: }>, <{pub: }>, <{cat: }>, <{price: }>);
-- --------------------------------------------------------

-- Table `orderitem`

CREATE TABLE `orderitem` (
  `ordid` int(5) NOT NULL,
  `isbn` int(10) NOT NULL,
  `price` int(5) DEFAULT NULL,
  `qty` int(3) DEFAULT NULL,
  PRIMARY KEY (`ordid`,`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

-- Table `orders`

CREATE TABLE `orders` (
  `ordid` int(5) NOT NULL AUTO_INCREMENT,
  `userid` int(5) DEFAULT NULL,
  `orddate` timestamp NULL DEFAULT NULL,
  `totamt` int(6) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `isbn` int(11) NOT NULL,
  PRIMARY KEY (`ordid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO `test`.`orders`
(`ordid`, `userid`, `orddate`, `totamt`, `status`, `isbn`)
VALUES
(<{ordid: }>, <{userid: }>, <{orddate: }>, <{totamt: }>, <{status: }>, <{isbn: }>);
-- --------------------------------------------------------

-- Table `users`

CREATE TABLE `users` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
-- --------------------------------------------------------
