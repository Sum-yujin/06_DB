/*1번*/
SELECT 
	DEPARTMENT_NAME "학과 명",
	CATEGORY "계열"
FROM TB_DEPARTMENT;

----------------------------------------
/*2번*/
SELECT
	DEPARTMENT_NAME||'의 정원은'|| CAPACITY||'명입니다.' "학과별 정원"
FROM TB_DEPARTMENT;

------------------------------------------
/*3번*/
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '001'
			AND
			ABSENCE_YN = 'Y';
		
------------------------------------------
/*4번*/
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO 
			IN('A513079','A513090','A513091','A513110','A513119');
		
-------------------------------------------
/*5번*/
SELECT 
	DEPARTMENT_NAME,
	CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;
		
-------------------------------------------
/*6번*/
SELECT 
	PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-------------------------------------------
/*7번*/
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL ;

-------------------------------------------
/*8번*/
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;
		
------------------------------------------
/*9번*/
SELECT 
	STUDENT_NO,
	STUDENT_NAME,
	STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N';
