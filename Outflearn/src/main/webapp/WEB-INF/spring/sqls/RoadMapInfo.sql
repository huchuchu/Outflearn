
--USER_INFO 테이블/ MAIN_STREAM 테이블 먼저 만들어야함!
DROP TABLE ROADMAP_INFO;
DROP SEQUENCE ROADMAP_SQ;

CREATE SEQUENCE ROADMAP_SQ;

CREATE TABLE ROADMAP_INFO(

ROADMAP_NUM NUMBER PRIMARY KEY, --NEW
USER_NUM NUMBER NOT NULL REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE, --USER_INFO : USER_NUM
ROADMAP_TITLE VARCHAR2(1000) NOT NULL, --NEW
ROADMAP_CONTENT CLOB, --NEW
ROADMAP_SUBSCRIBE NUMBER DEFAULT 0 NOT NULL, --NEW 
ROADMAP_LIKE NUMBER DEFAULT 0 NOT NULL, --NEW
ROADMAP_SHARE NUMBER DEFAULT 0 NOT NULL, --NEW
MAIN_NUM NUMBER NOT NULL REFERENCES MAIN_STREAM(MAIN_NUM) ON DELETE CASCADE --MAIN STREAM :MAIN_NUM
);



SELECT * FROM ROADMAP_INFO;

select ROADMAP_SQ.nextval from dual;

SELECT R.ROADMAP_NUM, R.USER_NUM, R.ROADMAP_TITLE, R.ROADMAP_CONTENT, R.ROADMAP_CONTENT, R.ROADMAP_SUBSCRIBE, R.ROADMAP_LIKE, R.ROADMAP_SHARE,
	   R.MAIN_NUM, U.USER_NICKNAME
	   FROM ROADMAP_INFO R, USER_INFO U
	   WHERE R.USER_NUM = U.USER_NUM
	   AND R.ROADMAP_NUM=4;
delete from ROADMAP_INFO;
