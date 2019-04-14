/*
 * 주제 : PROC_STUDENT_SCORE1
 * 기능 : 과목의 학생 점수 출결, 필기, 실기 점수를 수정
 * F5를 눌러 아래 소스를 컴파일
 */
CREATE OR REPLACE PROCEDURE PROC_STUDENT_SCORE1
(
   p_subject_id IN NUMBER
 , p_attd IN NUMBER
 , p_note IN NUMBER
 , p_skill IN NUMBER
)
IS
BEGIN
   UPDATE SUBJECT A
      SET A.STUDENT_SCORE_ATTD = p_attd
        , A.STUDENT_SCORE_NOTE = p_note
        , A.STUDENT_SCORE_SKILL = p_skill
    WHERE 1=1
      AND A.ID = p_subject_id
   ;
   
   COMMIT;
END;
