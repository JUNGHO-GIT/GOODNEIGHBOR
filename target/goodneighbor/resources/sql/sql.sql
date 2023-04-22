Admin 테이블 생성 쿼리문:
CREATE TABLE Admin (
admin_id VARCHAR(20) PRIMARY KEY,
admin_pw VARCHAR(20),
admin_name VARCHAR(30),
admin_tel VARCHAR(20),
admin_regdate DATE
);

Board 테이블 생성 쿼리문:
CREATE TABLE Board (
board_number INT PRIMARY KEY AUTO_INCREMENT,
board_writer VARCHAR(20),
board_subject VARCHAR(50),
board_content TEXT,
board_pw VARCHAR(20),
board_regdate TIMESTAMP,
board_readcount INT,
board_ref INT,
board_re_step INT,
board_re_level INT,
board_ip VARCHAR(20)
);

Member 테이블 생성 쿼리문:
CREATE TABLE Member (
member_id VARCHAR(20) PRIMARY KEY,
member_pw VARCHAR(20),
member_name VARCHAR(30),
member_tel VARCHAR(20),
member_email VARCHAR(50),
member_zipcode VARCHAR(10),
member_addr VARCHAR(100),
member_addr2 VARCHAR(100),
member_regdate TIMESTAMP
);

Notice 테이블 생성 쿼리문:
CREATE TABLE Notice (
notice_number INT PRIMARY KEY AUTO_INCREMENT,
notice_readcount INT,
notice_writer VARCHAR(20),
notice_title VARCHAR(50),
notice_content TEXT,
notice_regdate TIMESTAMP,
notice_fix BOOLEAN
);

Product 테이블 생성 쿼리문:
CREATE TABLE Product (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50),
product_detail TEXT,
product_price VARCHAR(20),
product_stock VARCHAR(20),
product_company VARCHAR(30),
product_date DATE,
product_image LONGBLOB,
product_imageName VARCHAR(50)
);

Qna 테이블 생성 쿼리문:
CREATE TABLE Qna (
qna_number INT PRIMARY KEY AUTO_INCREMENT,
qna_readcount INT,
qna_ref INT,
qna_step INT,
qna_level INT,
qna_writer VARCHAR(20),
qna_pw VARCHAR(20),
qna_title VARCHAR(50),
qna_content TEXT,
qna_regdate TIMESTAMP
);