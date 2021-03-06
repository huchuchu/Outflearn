DROP TABLE LIVE;

DROP SEQUENCE LIVE_SQ;

CREATE SEQUENCE LIVE_SQ;

CREATE TABLE LIVE(LIVE_NUM NUMBER PRIMARY KEY,
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE,
LIVE_TITLE VARCHAR2(100),
LIVE_AUTHOR VARCHAR2(100) NOT NULL,
LIVE_TIME VARCHAR2(50)
);

INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 2, 'TEST페이지', 'TEST강사', '2019-08-15');
INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 2, 'qwer', 'qwer', '2019-08-15');
INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 2, 'TEST페이지2', 'TEST강사2', '2019-08-20');
INSERT INTO LIVE(LIVE_NUM, LIVE_TITLE, LIVE_AUTHOR, LIVE_TIME) VALUES(LIVE_SQ.NEXTVAL,'TEST페이지3', 'TEST강사3', '2019-08-25');

SELECT * FROM LIVE;

SELECT * FROM CLASS_INFO WHERE CLASS_NUM = (SELECT CLASS_NUM FROM LIVE WHERE LIVE_NUM = 1);

INSERT INTO LIVE VALUES(LIVE_SQ.NEXTVAL, 2, 'TEST페이지2', 'TEST강사2', '2019-08-20');