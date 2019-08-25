---------------------------------- 질문 답변
DROP TABLE QA;
-- 글 번호 시퀀스 ( 삭제 )
DROP SEQUENCE QA_NUM_SQ;
-- 그룹 번호 시퀀스 ( 삭제 )
DROP SEQUENCE QA_GROUP_NO_SQ;


-- 글 번호 시퀀스
CREATE SEQUENCE QA_NUM_SQ;
-- 그룹 번호 시퀀스
CREATE SEQUENCE QA_GROUP_NO_SQ;

CREATE TABLE QA(
   QA_NUM NUMBER PRIMARY KEY,
   CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
   USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL,
   USER_NICKNAME VARCHAR2(50) NOT NULL,
   QA_TITLE VARCHAR2(500) NOT NULL,
   QA_CONTENT VARCHAR2(4000) NOT NULL,
   QA_GROUP_NO NUMBER NOT NULL,
   QA_GROUP_SQ NUMBER NOT NULL
);

SELECT * FROM QA;

UPDATE QA SET QA_CONTENT = '첫번째 테스트 수정완료' WHERE QA_NUM = 1 AND QA_GROUP_SQ = 1
INSERT INTO CLASS_QUESTION VALUES(QUESTION_NUM_SQ.NEXTVAL, '7', '1', '질문 제목 테스트', '질문 내용 테스트입니다.', QUESTION_GROUP_NO_SQ.NEXTVAL, '1');
										  
INSERT INTO CLASS_QUESTION VALUES(QUESTION_NUM_SQ.NEXTVAL, '7', '1', '질문 제목 테스트', '질문 내용 테스트입니다.', QUESTION_GROUP_NO_SQ.NEXTVAL, '1');
