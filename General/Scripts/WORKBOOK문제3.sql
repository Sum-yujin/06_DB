/*1번*/
SELECT
	STUDENT_NAME "학생 이름",
	STUDENT_ADDRESS "주소지"
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

-----------------------------------------------
/*2번*/
SELECT
	STUDENT_NAME,
	STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-----------------------------------------------
/*3번*/
SELECT
	STUDENT_NAME "학생이름",
	STUDENT_NO "학번",
	STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '경기도%'
	AND STUDENT_NO LIKE '9%'; 

-----------------------------------------------
/*4번*/
SELECT
	PROFESSOR_NAME,
	PROFESSOR_SSN
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '법학과'
ORDER BY PROFESSOR_SSN ASC;

-----------------------------------------------
/*5번*/
SELECT
	STUDENT_NO ,
	TO_CHAR(ROUND(AVG(POINT),1),'FM9.00') "학점"
FROM TB_GRADE
WHERE CLASS_NO = 'C3118100'
	AND TERM_NO = '200402'
GROUP BY STUDENT_NO
ORDER BY 학점 DESC;

-----------------------------------------------
/*6번*/
SELECT
	STUDENT_NO,
	STUDENT_NAME,
	DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

-----------------------------------------------
/*7번*/
SELECT
	CLASS_NAME,
	DEPARTMENT_NAME
FROM TB_CLASS C, TB_DEPARTMENT D
WHERE C.DEPARTMENT_NO = D.DEPARTMENT_NO;

-----------------------------------------------
/*8번*/
SELECT
	CLASS_NAME,
	PROFESSOR_NAME
FROM TB_CLASS C, TB_PROFESSOR P
WHERE C.DEPARTMENT_NO = P.DEPARTMENT_NO
ORDER BY CLASS_TYPE;

-----------------------------------------------
/*9번*/
SELECT
	CLASS_NAME,
	PROFESSOR_NAME
FROM TB_CLASS
JOIN TB_PROFESSOR USING(DEPARTMENT_NO)
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE CATEGORY = '인문사회'
ORDER BY CLASS_NAME;

------------------------------------------------
/*10번*/
SELECT
	STUDENT_NO "학번",
	STUDENT_NAME "학생 이름",
	ROUND(AVG(POINT), 1) AS "전체 평점"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '음악학과'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY "학번" ASC;

------------------------------------------------
/*11번*/
SELECT
	DEPARTMENT_NAME "학과이름",
	STUDENT_NAME "학생이름",
	PROFESSOR_NAME "지도교수이름"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON(D.DEPARTMENT_NO=S.DEPARTMENT_NO)
JOIN TB_PROFESSOR P ON(P.PROFESSOR_NO=S.COACH_PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

------------------------------------------------
/*12번*/
SELECT
	STUDENT_NAME,
	TERM_NO "TERM_NAME"
FROM TB_STUDENT S
JOIN TB_GRADE G ON(G.STUDENT_NO=S.STUDENT_NO)
JOIN TB_CLASS C ON(C.CLASS_NO=G.CLASS_NO)
WHERE C.CLASS_NAME = '인간관계론'
	AND TERM_NO LIKE '2007%';

------------------------------------------------
/*13번*/
SELECT
	CLASS_NAME,
	DEPARTMENT_NAME
FROM TB_CLASS C
JOIN TB_DEPARTMENT D ON(D.DEPARTMENT_NO=C.DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR CP ON(CP.CLASS_NO=C.CLASS_NO)
WHERE CATEGORY = '예체능'
	AND CP.CLASS_NO IS NULL;

------------------------------------------------
/*14번*/
SELECT
 	STUDENT_NAME "학생이름",
 	NVL(PROFESSOR_NAME, '지도교수 미지정') "지도교수"
FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_PROFESSOR  ON(PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE DEPARTMENT_NAME = '서반아어학과'
ORDER BY STUDENT_NO ASC;

------------------------------------------------
/*15번*/
SELECT 
	STUDENT_NO "학번",
	STUDENT_NAME "이름",
	DEPARTMENT_NAME "학과 이름",
	TRUNC(AVG(POINT),8) "평점"
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_GRADE USING(STUDENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING AVG(POINT) >= 4
ORDER BY 학번 ;



------------------------------------------------
/*16번*/ 
SELECT	
	CLASS_NO,
	CLASS_NAME,
	TRUNC(AVG(POINT),2) "평점"
FROM TB_CLASS
JOIN TB_GRADE USING(CLASS_NO)
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '환경조경학과'
	AND CLASS_TYPE LIKE '전공%'
GROUP BY CLASS_NO,CLASS_NAME;

------------------------------------------------
/*17번*/ 
SELECT 
	STUDENT_NAME,
	STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (
	SELECT DEPARTMENT_NO
	FROM TB_STUDENT
	WHERE STUDENT_NAME ='최경희'
)
ORDER BY STUDENT_ADDRESS;

------------------------------------------------
/*18번*/
SELECT
	STUDENT_NO,
	STUDENT_NAME
FROM TB_STUDENT S
JOIN TB_GRADE G ON(G.STUDENT_NO=S.STUDENT_NO)
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE POINT = (
	SELECT MAX(POINT)
	FROM TB_GRADE
	WHERE 
);

------------------------------------------------
/*19번*/ 

