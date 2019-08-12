------------------------------------------ 강좌 데이터
DROP TABLE CLASS_DATA;

DROP SEQUENCE DATA_CHAPTER_SQ;

CREATE SEQUENCE DATA_CHAPTER_SQ;

CREATE TABLE CLASS_DATA(
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
DATA_CHAPTER NUMBER NOT NULL,
DATA_SUBHEAD VARCHAR2(250) DEFAULT '소제목',
DATA_SQ NUMBER NOT NULL,
DATA_TITLE VARCHAR2(250) DEFAULT '타이틀',
DATA_YOUTUBE VARCHAR2(200) DEFAULT '유튜브 링크',
DATA_DATA CLOB DEFAULT '영상'
);

SELECT * FROM CLASS_DATA;

INSERT INTO CLASS_DATA VALUES(1,DATA_CHAPTER_SQ.NEXTVAL,'소제목', 1, '과정제목','유튜브 링크', '과정영상')

------------------------------------------ 요기부터는 수정중 이거나 작성 중 입니다.
------------------------------------------ 컬럼 1개 들어간다. 추가적으로  들어가게 하는 방법
UPDATE CLASS_DATA 	 
SET DATA_DATA = '프리즈 갓'
WHERE DATA_CHAPTER = 3 AND DATA_SQ IN (SELECT DATA_SQ
			 	       		   		   FROM (SELECT * FROM CLASS_DATA WHERE DATA_CHAPTER = 3)
        	  		  		   		   WHERE DATA_SQ = 1);
												           	 
        	  		  	