CREATE DATABASE booksmanagementsystem;

USE booksmanagementsystem;

DROP TABLE IF EXISTS sys_user;

CREATE TABLE sys_user (
  user_id int(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  user_name varchar(50) NOT NULL COMMENT '用户名称',
  user_password varchar(32) NOT NULL COMMENT '用户密码',
  user_state int(1) NOT NULL COMMENT '1:正常,0:暂停',
  PRIMARY KEY (user_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert  into sys_user(user_id,user_name,user_password,user_state) values (1,'root','123',1),(2,'admin01','456','1'),(3,'admin02','456','0');

DROP TABLE IF EXISTS book_info;

CREATE TABLE book_info (
  book_id int(32) NOT NULL AUTO_INCREMENT COMMENT '书籍id',
  book_name varchar(50) NOT NULL COMMENT '书名',
  book_author varchar(50) NOT NULL COMMENT '作者',
  book_press varchar(50) NOT NULL COMMENT '出版社',
  book_presstime varchar(50) DEFAULT NULL COMMENT '出版时间',
  book_price double DEFAULT NULL COMMENT '价格',
  book_number int(32) NOT NULL COMMENT '数量',
  book_location varchar(50) NOT NULL COMMENT '位置',
  PRIMARY KEY (book_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert  into book_info(book_id,book_name,book_author,book_press,book_presstime,book_price,book_number,book_location) values (1,'零基础学Python','张志强，赵越 等 著','机械工业出版社','2015/03/01','79.00',5,'小组'),
(2,'零基础学算法（第2版）','戴艳','机械工业出版社','2012/04/01','69.10',1,'dxl');
