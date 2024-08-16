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
			