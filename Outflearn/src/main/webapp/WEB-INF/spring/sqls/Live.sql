DROP TABLE LIVE;

DROP SEQUENCE LIVE_SQ;

CREATE SEQUENCE LIVE_SQ;

CREATE TABLE LIVE(LIVE_NUM NUMBER PRIMARY KEY,
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM),
LIVE_TITLE VARCHAR2(100),
LIVE_AUTHOR VARCHAR2(100) NOT NULL,
LIVE_TIME VARCHAR2(50)
);

INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 1, 'TEST페이지', 'TEST강사', '2019-08-15')
INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 1, 'qwer', 'qwer', '2019-08-15')
INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 2, 'TEST페이지2', 'TEST강사2', '2019-08-20')

SELECT * FROM LIVE;