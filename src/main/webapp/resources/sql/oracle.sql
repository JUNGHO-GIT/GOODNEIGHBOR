CREATE TABLE admin (
admin_id VARCHAR2(20) PRIMARY KEY NOT NULL,
admin_pw VARCHAR2(20) NOT NULL,
admin_name VARCHAR2(30) NOT NULL,
admin_tel VARCHAR2(20) NOT NULL,
admin_regdate DATE NOT NULL
);

CREATE TABLE board (
board_number INT PRIMARY KEY NOT NULL,
board_writer VARCHAR2(20) NOT NULL,
board_title VARCHAR2(50) NOT NULL,
board_content CLOB NOT NULL,
board_pw VARCHAR2(20) NOT NULL,
board_regdate TIMESTAMP NOT NULL,
board_readcount INT NOT NULL,
board_group INT NOT NULL,
board_step INT NOT NULL,
board_level INT NOT NULL,
board_ip VARCHAR2(20) NOT NULL
);

CREATE TABLE member (
member_id VARCHAR2(20) PRIMARY KEY NOT NULL,
member_pw VARCHAR2(20) NOT NULL,
member_name VARCHAR2(30) NOT NULL,
member_tel VARCHAR2(20) NOT NULL,
member_email VARCHAR2(50) NOT NULL,
member_zipcode VARCHAR2(10) NOT NULL,
member_addr VARCHAR2(100) NOT NULL,
member_addr2 VARCHAR2(100) NOT NULL,
member_regdate TIMESTAMP NOT NULL
);

CREATE TABLE notice (
notice_number INT PRIMARY KEY NOT NULL,
notice_readcount INT NOT NULL,
notice_writer VARCHAR2(20) NOT NULL,
notice_title VARCHAR2(50) NOT NULL,
notice_content CLOB NOT NULL,
notice_regdate TIMESTAMP NOT NULL,
notice_fix CHAR(1) NOT NULL
);


CREATE TABLE product (
product_id INT PRIMARY KEY NOT NULL,
product_name VARCHAR2(50) NOT NULL,
product_detail CLOB NOT NULL,
product_price VARCHAR2(20) NOT NULL,
product_stock VARCHAR2(20) NOT NULL,
product_company VARCHAR2(30) NOT NULL,
product_date DATE NOT NULL,
product_image BLOB NOT NULL,
product_imageName VARCHAR2(50) NOT NULL
);

CREATE TABLE qna (
qna_number INT PRIMARY KEY NOT NULL,
qna_readcount INT NOT NULL,
qna_group INT NOT NULL,
qna_step INT NOT NULL,
qna_level INT NOT NULL,
qna_writer VARCHAR2(20) NOT NULL,
qna_pw VARCHAR2(20) NOT NULL,
qna_title VARCHAR2(50) NOT NULL,
qna_content CLOB NOT NULL,
qna_regdate TIMESTAMP NOT NULL
);