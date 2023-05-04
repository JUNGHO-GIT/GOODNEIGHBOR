CREATE TABLE admin (
admin_id VARCHAR(20) PRIMARY KEY NOT NULL,
admin_pw VARCHAR(20) NOT NULL,
admin_name VARCHAR(30) NOT NULL,
admin_tel VARCHAR(20) NOT NULL,
admin_regdate DATE NOT NULL
);

CREATE TABLE board (
board_number INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
board_writer VARCHAR(20) NOT NULL,
board_title VARCHAR(50) NOT NULL,
board_content TEXT NOT NULL,
board_pw VARCHAR(20) NOT NULL,
board_regdate TIMESTAMP NOT NULL,
board_readcount INT NOT NULL,
board_group INT NOT NULL,
board_step INT NOT NULL,
board_level INT NOT NULL,
board_ip VARCHAR(20) NOT NULL
);

CREATE TABLE member (
member_id VARCHAR(20) PRIMARY KEY NOT NULL,
member_pw VARCHAR(20) NOT NULL,
member_name VARCHAR(30) NOT NULL,
member_tel VARCHAR(20) NOT NULL,
member_email VARCHAR(50) NOT NULL,
member_zipcode VARCHAR(10) NOT NULL,
member_addr VARCHAR(100) NOT NULL,
member_addr2 VARCHAR(100) NOT NULL,
member_regdate TIMESTAMP NOT NULL
);

CREATE TABLE notice (
notice_number INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
notice_readcount INT NOT NULL,
notice_writer VARCHAR(20) NOT NULL,
notice_title VARCHAR(50) NOT NULL,
notice_content TEXT NOT NULL,
notice_regdate TIMESTAMP NOT NULL,
notice_fix BOOLEAN NOT NULL,
);

CREATE TABLE product (
product_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
product_name VARCHAR(50) NOT NULL,
product_detail TEXT NOT NULL,
product_price VARCHAR(20) NOT NULL,
product_stock VARCHAR(20) NOT NULL,
product_company VARCHAR(30) NOT NULL,
product_date DATE NOT NULL,
product_image LONGBLOB NOT NULL,
product_imageName VARCHAR(50) NOT NULL,
);

CREATE TABLE qna (
qna_number INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
qna_readcount INT NOT NULL,
qna_group INT NOT NULL,
qna_step INT NOT NULL,
qna_level INT NOT NULL,
qna_writer VARCHAR(20) NOT NULL,
qna_pw VARCHAR(20) NOT NULL,
qna_title VARCHAR(50) NOT NULL,
qna_content TEXT NOT NULL,
qna_regdate TIMESTAMP NOT NULL
);