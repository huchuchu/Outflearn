DROP TABLE REQ_LECTURER

DROP SEQUENCE REQ_SQ;

CREATE SEQUENCE REQ_SQ;

CREATE TABLE REQ_LECTURER(REQ_NUM NUMBER PRIMARY KEY,
USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM),
REQ_PHONE VARCHAR2(500),
REQ_PR VARCHAR2(4000),
REQ_CLASS VARCHAR2(4000));

SELECT * FROM REQ_LECTURER;

INSERT INTO REQ_LECTURER VALUES (REQ_SQ.NEXTVAL, 2, '010-1234-5678', 'PR', 'CLASS');

SELECT USER_NUM, USER_ID, USER_NICKNAME, USER_AUTHORITY, USER_EMAIL, USER_ENABLED FROM USER_INFO;

SELECT USER_NUM, REQ_NUM, REQ_PHONE, REQ_PR, REQ_CLASS, USER_ID, USER_NICKNAME, USER_EMAIL FROM REQ_LECTURER JOIN USER_INFO USING (USER_NUM);