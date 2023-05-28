CREATE TABLE product (
  product_number INTEGER NOT NULL,
  product_name VARCHAR2(255),
  product_detail VARCHAR2(4000),
  product_price VARCHAR2(255),
  product_stock VARCHAR2(255),
  product_company VARCHAR2(255),
  product_readcount INTEGER,
  product_group INTEGER,
  product_step INTEGER,
  product_level INTEGER,
  product_image VARCHAR2(255),
  product_regdate TIMESTAMP,
  PRIMARY KEY (product_number)
);

CREATE SEQUENCE product_number_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER product_number_trg
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
  SELECT product_number_seq.NEXTVAL
  INTO :new.product_number
  FROM dual;
END;
/

INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('지구를 사랑하는 물통', '사용 후 재활용 가능한 소재로 제작된 이 물통은 지속 가능한 생활을 지향합니다.', '15000', '100', 'EcoLovers', 0, 1, 0, 0, '1.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('후원자 전용 에코 양말', '100% 오가닉 코튼으로 만든 후원자 전용 양말입니다.', '7000', '200', 'OrganicTouch', 0, 1, 0, 0, '2.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('희망을 담은 팔찌', '후원자의 소중한 기여를 기리는 팔찌. 모든 수익은 자선 활동에 사용됩니다.', '10000', '150', 'CharityBeads', 0, 1, 0, 0, '3.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('후원자를 위한 오가닉 코튼 세트', '100% 오가닉 코튼으로 제작된 후원자 전용 상하의 세트입니다.', '50000', '70', 'OrganicWear', 0, 1, 0, 0, '4.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('나무를 사랑하는 연필', '재활용 재료로 만든 이 연필은 환경을 보호하는 데 동참합니다.', '2000', '300', 'EcoWriters', 0, 1, 0, 0, '5.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('지구를 생각하는 캔버스 가방', '재활용 소재를 사용하여 제작된 이 가방은 지속 가능한 패션을 추구합니다.', '25000', '80', 'GreenFashion', 0, 1, 0, 0, '6.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('사회적 기업의 에코 신발', '공정무역 소재로 만든 이 신발은 지역 공동체를 지원합니다.', '60000', '50', 'FairTradeFootwear', 0, 1, 0, 0, '7.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('후원을 기리는 모자', '후원자의 기부를 상징하는 모자. 모든 수익은 자선 활동에 사용됩니다.', '15000', '100', 'HopeCaps', 0, 1, 0, 0, '8.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('지속 가능한 선글라스', '재활용 가능한 소재로 제작된 선글라스. 지구를 위한 스타일을 보여주세요.', '30000', '60', 'EcoEyes', 0, 1, 0, 0, '9.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('지구를 위한 에코백', '재활용 소재로 만든 이 에코백으로 지속 가능한 쇼핑을 경험해보세요.', '20000', '120', 'GreenCarriers', 0, 1, 0, 0, '10.png', SYSDATE);
INSERT INTO product (product_name, product_content, product_price, product_stock, product_company, product_readcount, product_group, product_step, product_level, product_image, product_regdate)
VALUES ('친환경 휴대폰 케이스', '재활용 소재로 만든 이 케이스는 환경 보호에 기여합니다.', '18000', '100', 'EcoCases', 0, 1, 0, 0, '11.png', SYSDATE);