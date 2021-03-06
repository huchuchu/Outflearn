------------------------------------------ 강좌 정보

------------------------------------------ DROP 할때는 ClassIntroduce랑 ClassData 먼저 DROP시켜야된다.
DROP TABLE CLASS_INFO;

DROP SEQUENCE CLASS_INFO_SQ;

CREATE SEQUENCE CLASS_INFO_SQ;

CREATE TABLE CLASS_INFO(
CLASS_NUM NUMBER PRIMARY KEY NOT NULL,
USER_NUM REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL,
CLASS_TITLE VARCHAR2(250) NOT NULL,
CLASS_AUTHOR VARCHAR2(50) NOT NULL,
CLASS_INTRO VARCHAR2(4000),
CLASS_IMG CLOB,
CLASS_LIVE VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK(CLASS_LIVE IN('Y', 'N','y','n')),
CLASS_RATING NUMBER  DEFAULT 0,
CLASS_PRICE NUMBER  DEFAULT 0,
CLASS_SUBCOUNT NUMBER DEFAULT 0,
CLASS_STUDENTLEVEL VARCHAR2(200) NOT NULL
);

SELECT (SELECT SUM(USER_STAR) FROM CLASS_REVIEW WHERE CLASS_NUM = 2)/(SELECT CLASS_SUBCOUNT FROM CLASS_INFO WHERE CLASS_NUM = 2) FROM CLASS_INFO WHERE CLASS_NUM = 2;
SELECT * FROM (SELECT * FROM CLASS_INFO ORDER BY CLASS_SUBCOUNT DESC) WHERE ROWNUM <= 6

SELECT * FROM CLASS_INFO;
DELETE FROM CLASS_INFO;
DELETE FROM CLASS_INFO WHERE CLASS_NUM = 4;
SELECT * FROM CLASS_INFO A WHERE ROWNUM < 6;

INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL, 2, 'TEST', 'TEST', 'TEST', NULL, 'Y', 0, 0, 0, 'LEVEL');
INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL, 1, 'TEST', 'TEST', 'TEST', NULL, 'Y', 0, 0, 0, 'LEVEL');


INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL,1, 'title: TEST03', 'abc', 'intro: test01', '이미지', 'N',0,0,0,'상급자' );

SELECT * FROM CLASS_INFO WHERE CLASS_NUM = 1 OR CLASS_NUM=2;

SELECT * FROM CLASS_INFO WHERE CLASS_NUM = (SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM=1) 
						 OR CLASS_NUM = (SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM=2) ;

INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL, 42,'제목', '저자', '인트로', '파일', 'Y', 5, 3000, 0, '상')

SELECT * FROM CLASS_INFO WHERE USER_NUM = 41

SELECT * FROM CLASS_INFO WHERE CLASS_NUM IN(SELECT CLASS_NUM FROM BASKET WHERE USER_NUM = 1) AND ROWNUM < 3;
SELECT * FROM CLASS_INFO WHERE CLASS_NUM=1 OR CLASS_NUM=2;
SELECT * FROM (SELECT * FROM CLASS_INFO ORDER BY CLASS_SUBCOUNT DESC) WHERE ROWNUM <= 6

SELECT * FROM CLASS_INFO WHERE CLASS_NUM = 3
update class_info set CLASS_SUBCOUNT = (select CLASS_SUBCOUNT from class_info where class_num = 3) + 1 where class_num = 3
UPDATE CLASS_INFO SET CLASS_SUBCOUNT = 2 WHERE CLASS_NUM = 2

UPDATE CLASS_INFO SET CLASS_PRICE = 2000;
UPDATE CLASS_INFO SET CLASS_SUBCOUNT = 2 WHERE CLASS_NUM = 2


SELECT * FROM CLASS_INFO WHERE CLASS_NUM = (SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM= 1)
SELECT * FROM CLASS_INFO WHERE CLASS_NUM = (SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM= 1)

SELECT * FROM CLASS_INFO WHERE CLASS_NUM IN ((SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM = 1));

SELECT count(*)
		FROM CLASS_INFO WHERE CLASS_NUM IN (SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM = 1);
