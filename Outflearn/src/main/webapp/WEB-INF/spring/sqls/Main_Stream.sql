DROP TABLE MAIN_STREAM;

DROP SEQUENCE MAIN_SQ;

CREATE SEQUENCE MAIN_SQ;

CREATE TABLE MAIN_STREAM(

MAIN_NUM NUMBER NOT NULL PRIMARY KEY,
MAIN_NAME VARCHAR2(100) NOT NULL

);

INSERT INTO MAIN_STREAM VALUES(MAIN_SQ.NEXTVAL, '서버');
INSERT INTO MAIN_STREAM VALUES(MAIN_SQ.NEXTVAL, '웹 개발');
INSERT INTO MAIN_STREAM VALUES(MAIN_SQ.NEXTVAL, '데이터베이스');

SELECT * FROM MAIN_STREAM;
