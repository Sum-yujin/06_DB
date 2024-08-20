/*1번*/
SELECT 
	STUDENT_NO "학번",
  STUDENT_NAME "이름",
  ENTRANCE_DATE "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE ASC;

-----------------------------------------
/*2번*/
SELECT 
	PROFESSOR_NAME,
	PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3
ORDER BY PROFESSOR_NAME DESC;

-----------------------------------------
/*3번*/
SELECT PROFESSOR_NAME 교수이름,
   FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE(19||SUBSTR(PROFESSOR_SSN, 1, 6),'RRMMDD'))/12) "나이"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY 나이 ASC;
	
-----------------------------------------
/*4번*/
SELECT 
	SUBSTR(PROFESSOR_NAME, 2) "이름"
FROM TB_PROFESSOR;

-----------------------------------------
/*5번*/
SELECT
	STUDENT_NO,
	STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - (SUBSTR(STUDENT_NO, 1, 2) + 1900) = 19;  


----------------------------------------------

/*6번*/
SELECT 
	STUDENT_NO,
	STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

------------------------------------------------
/*7번*/
SELECT 
	ROUND(AVG(POINT),1) "평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

--------------------------------------------------
/*8번*/
SELECT
	DEPARTMENT_NO "학과번호",
	COUNT(*) "학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

--------------------------------------------------
/*9번*/
SELECT
	COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL
GROUP BY COACH_PROFESSOR_NO;

--------------------------------------------------
/*10번*/
SELECT 
	SUBSTR(TERM_NO, 1, 4) "년도",
	ROUND(AVG(POINT), 1) "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY SUBSTR(TERM_NO, 1, 4);

----------------------------------------------------
/*11번*/
SELECT 
	DEPARTMENT_NO "학과코드명",
	COUNT(DECODE(ABSENCE_YN,'Y','Y','NO',0)) "휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

---------------------------------------------------
/*12번*/
SELECT 
	STUDENT_NAME "동일이름",
	COUNT(*) "동명인 수"
FROM TB_STUDENT
WHERE STUDENT_NAME = STUDENT_NAME
GROUP BY STUDENT_NAME
HAVING COUNT(*) != 1
ORDER BY STUDENT_NAME;

---------------------------------------------------
/*13번*/
SELECT
	NVL(SUBSTR(TERM_NO, 1, 4), ' ') "년도",
	NVL(SUBSTR(TERM_NO, 5, 2), ' ') "학기",
	ROUND(AVG(POINT),1) "평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1, 4),SUBSTR(TERM_NO, 5, 2));
