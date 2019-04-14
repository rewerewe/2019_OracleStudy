/*
 * 주제 : PROC_STUDENT_SCORE1
 * 기능 : 과목의 학생 점수 출결, 필기, 실기 점수를 수정
 * 아래와 같이 따로 실행 탭을 만들어 실행(CTRL + F5 등).
 */

-- 관리자
-- 1. 프로시저를 실행
-- EX) EXEC PROC_STUDENT_SCORE1(p_subject_id, p_student_score_attd, p_student_score_note, p_student_score_skill);
EXEC PROC_STUDENT_SCORE1(1, 10, 40, 50);

-- 2. 실제 반영이 되었는지 확인
SELECT *
  FROM SUBJECT
 WHERE 1=1
   AND ID = 1
;