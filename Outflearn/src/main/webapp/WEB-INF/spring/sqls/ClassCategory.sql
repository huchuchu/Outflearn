DROP TABLE CLASS_CATEGORY;


CREATE TABLE CLASS_CATEGORY(
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
MAIN_NUM NUMBER REFERENCES MAIN_STREAM(MAIN_NUM) ON DELETE CASCADE NOT NULL,
SUB_NUM	NUMBER REFERENCES SUB_STREAM(SUB_NUM) ON DELETE CASCADE NOT NULL
)

SELECT * FROM CLASS_CATEGORY;

INSERT INTO CLASS_CATEGORY VALUES(1,1,1);

INSERT INTO CLASS_CATEGORY VALUES(1,1,1);



