select문 : 데이터베이스로부터 저장되어 있는 데이터를 검색하는데 사용

전체 컬럼의 데이터 읽기
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno FROM emp;
SELECT * FROM emp;

부분 컬럼의 데이터 읽기
SELECT ename,sal FROM emp;

주석
SELECT */* 주석 */ FROM emp;

DUAL : 함수 및 계산의 결과를 볼 때 사용할 수 있는 공용(public) 테이블
       사용자 데이터가 있는 테이블에서 유래하지 않은 상수 값
       의사열 (pseundo - comn),표현식 등의 값을 단 한번만 돌리거나 현재 날짜, 시각을 알고자 할 때 이용.
       일시적인 산술, 날짜 연산 등에 주로 사용
       
SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT ASCII(0) FROM dual;
SELECT 7 + 10 FROM dual;

연산
SELECT ename,sal,sal+300 FROM emp;
연산자 우선순위
SELECT ename,sal,(sal+300)*12 From emp;

//NULL값의 정의 : NULL은 사용할 수 없거나, 할당되지 않았거나, 알 수 없거나, 적용할 수 없는 값
              //(NULL은 0이나 공백과는 다름)
SELECT empno,ename,job,comm FROM emp;

산술식의 NULL값 : NULL값을 포함하는 산술식은 NULL로 계산
SELECT ename,(sal+comm)*12 FROM emp;

열 ALIAS : 열의 별칭
열이름 바로 뒤에 나옴. 열 이름과 ALIAS 사이에 선택 사항인 AS 키워드가 올 수도 있음. 
열이름 바로 뒤에 한칸 띄고 넣으면 인정됨
알리아스에 큰따옴표를 사용하는 경우
- 대소문자 구별을 원할 때
- 공백 포함시
- _,#등 특수문자 사용시 (_는 ""없이 중간에는 올 수 있으나 맨 앞에 오면 오류 발생)
- 숫자로 시작할 경우


SELECT sal*12 ASal FROM emp;
SELECT sal*12 AS ASal FROM emp;
SELECT sal*12 "Annual Salary" FROM emp;

연결 연산자 : 열이나 문자열을 다른 열에 연결, 두 개의 세로선 (||)으로 나타냄
            결과 열로 문자식을 생성
SELECT ename || ' has $' || sal AS ASal FROM emp;

연결 연산자와 NULL값 : 문자열에 NULL값을 결합할 경우 결과는 문자열
SELECT ename || comm FROM emp;

DISTINCT : 중복행 삭제
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT (deptno) FROM emp;

[실습문제]
1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
2. emp 테이블에서 사원이름 과 월급을 출력하는데 컬럼명은 "이 름","월 급"으로 바꿔서 출력하시오.
3. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 "사원번호","사원이름","월급","연봉"으로 출력하시오
4. emp 테이블에 업무를 중복되지 않게 표시하시오.

SELECT empno, ename, sal FROM emp;
SELECT ename "이 름", sal "월 급" FROM emp;
SELECT empno 사원번호, ename 사원이름, sal 월급, sal*12 연봉 FROM emp;
SELECT distinct job FROM emp;

WHERE절 사용 : 조건 체크 결과 행 제한하기. ※ALIAS사용 불가※.

SELECT * FROM emp WHERE deptno = 10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE hiredate > '81-12-03';//날짜 조건 체크는 - 이나 / 로 해야 날짜로 인식됨.
SELECT * FROM emp WHERE hiredate < '81/12/03';
SELECT ename, sal, sal*12 ansal FROM emp WHERE ansal > 15000;//where 절에는 ALIAS사용 불가능!!!!!!!!!!!!!

SELECT * FROM emp WHERE hiredate != '80/12/17';
SELECT * FROM emp WHERE hiredate <> '80-12-17';
SELECT * FROM emp WHERE hiredate ^= '80-12-17';

SELECT * FROM emp WHERE sal > 2000 AND sal <=5000;
SELECT * FROM emp WHERE sal >= 800 AND sal <=3000;

BETWEEN ...AND ... : 두 값 사이 (지정한 값 포함)
SELECT * FROM emp WHERE sal BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE sal NOT BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT * FROM emp WHERE ename NOT BETWEEN 'KING' AND 'SMITH';

IN : 값 목록 중의 값과 일치 //or의 개념과 비슷
SELECT * FROM emp WHERE sal IN (1300,2450,3000);
SELECT * FROM emp WHERE sal NOT IN (1300,2450,3000);
SELECT ename,mgr,deptno FROM emp WHERE ename IN('ALLEN','FORD');
SELECT ename,mgr,deptno FROM emp WHERE ename NOT IN ('ALLEN','FORD');

[실습문제]
1. emp 테이블에서 사원번호가 7698인 사원의 이릅, 업무, 급여를 출력하시오.
2. emp 테이블에서 사원이름이 SMITH인 사람의 이름과 월급, 부서번호를 구하시오.
3. 월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오.
4. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오.

SELECT ename,job,sal FROM emp WHERE empno = 7698;
SELECT ename,sal,deptno FROM emp WHERE ename = 'SMITH';
SELECT ename,hiredate,sal FROM emp WHERE sal >= 2500 AND sal< 3500;
SELECT ename,job,sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;






//24-03-12
LIKE : 패턴과 일치하는 데이터를 검색.
%는 0개 이상의 문자를 나타냄
_는 한 문자를 나타냄

S가 처음,중간,끝에 오는 이름을 검색
SELECT * FROM emp WHERE ename LIKE '%S%';
SELECT * FROM emp WHERE ename NOT LIKE '%S%';//부정
입사일이 22로 끝나는 사원 정보 구하기
SELECT * FROM emp WHERE hiredate LIKE '%22';
SELECT * FROM emp WHERE hiredate NOT LIKE '%22';//부정

FOR 다음에 꼭 한 글자
SELECT * FROM emp WHERE ename LIKE 'FOR_';

한글자 다음에 M, M다음에 없거나 여러개
SELECT * FROM emp WHERE ename LIKE '_M%';

NULL 조건 사용(is 사용)
SELECT * FROM emp WHERE comm is null; -- comm=null은 불가
SELECT * FROM emp WHERE comm is NOT null;--is는 뒤에 not

논리 연산자 (AND,OR,NOT)을 사용하여 조건 정의
AND
SELECT empno,ename,job,sal FROM emp WHERE sal >= 2000 AND job LIKE '%MAN%';
OR
SELECT empno,ename,job,sal FROM emp WHERE sal >= 2000 OR job LIKE '%MAN%';

SELECT ename,job FROM emp WHERE job NOT IN ('CLERK','SALESMAN');

[실습문제]
1. 81년 05월 01일과 81년 12월 03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하시오.
2. 사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호, 이름 , 월급을 출력하시오.
3. 급여가 $2,000와 $5,000 사이고 부서번호가 10 또는 30인 사원의 이름과 급여, 부서번호를 출력하시오.
4. 업무가 SALESMAN 또는 MANAGER이면서 급여가 $1,000, $2,975, $2,850이 아닌 모든 사원의 이름, 업무 및 급여를 구하시오.

SELECT ename, sal, hiredate FROM emp WHERE hiredate BETWEEN '81-05-01' AND '81-12-03';
SELECT empno, ename, sal FROM emp WHERE empno NOT IN (7566,7782,7934);
SELECT ename, sal, deptno FROM emp WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10,30);
SELECT ename, job, sal FROM emp WHERE job IN ('SALESMAN','MANAGER') AND sal NOT IN (1000,2975,2850);

ORDER BY 절 : 정렬

오름차순 정렬
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal ASC;

내림차순 정렬
SELECT * FROM emp ORDER BY sal DESC;

1차 정렬에서 중복값이 있을 경우 2차 정렬 수행
SELECT * FROM emp ORDER BY sal DESC, ename DESC;

날짜 정렬
SELECT ename,job,deptno,hiredate FROM emp ORDER BY hiredate DESC //내림차순은 최근 순

열 ALIAS 기준으로 정렬
SELECT empno, ename, sal*12 annsal FROM emp ORDER BY annsal;

열의 숫자 위치를 사용하여 정렬
        1      2      3        4
SELECT ename, job, deptno, hiredate FROM emp ORDER BY 1;//세번째 순서인 deptno순으로 정렬

테이블에 생성된 순서대로 열 숫자 위치 부여
SELECT * FROM emp ORDER BY 2; //칼럼중 ename을 기준으로 정렬

null값을 갖고 있는 컬럼을 정렬할 때
NULLS FIRST 또는 NULlS LAST 키워드를 사용하여 반환된 행 중 NULL 값을 포함하는 행이 정렬 순서상 맨 처음에 나타나거나 맨 마지막에 나타나도록 지정

SELECT * FROM emp ORDER BY comm;
SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm NULLS LAST;
SELECT * FROM emp ORDER BY comm NULLS LAST, ename DESC;--2차정렬
SELECT * FROM emp ORDER BY comm DESC NULLS FIRST;

[실습문제]
1. 사원번호, 사원이름, 입사일을 출력하는데 입사일이 빠른 사람 순으로 정렬하시오.
2. 사원이름, 급여, 연봉을 구하고 연봉이 많은 순으로 정렬하시오.
3. 10번 또는 20번 부서에서 근무하고 있는 사원의 이름과 부서번호를 이름 순으로 정렬하시오.
4. comm 을 맺은 모든 사원의 이름, 급여, comm을 출력하는데 comm을 기준으로 내림차순 정렬하시오.

SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;
SELECT ename, sal, sal*12 annsal FROM emp ORDER BY annsal DESC;
SELECT ename, deptno FROM emp WHERE deptno IN (10,20) ORDER BY ename ASC;// 두 가지를 한거번에 쓸 떈 쉼표 빼기
SELECT ename, sal, comm FROM emp ORDER BY comm DESC NULLS LAST;
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;//null을 뺀 버전


함수

문자함수
대소문자 조작함수  - LOWER,UPPER,INITCAP
SELECT LOWER ('HELLO') FROM dual;
SELECT LOWER(ename) FROM emp;

SELECT UPPER('hello') FROM dual;
문장의 첫 글자를 대문자로 변경, 그 다음은 소문자로
SELECT INITCAP('hello wORLD') FROM dual;

문자 조작함수
CONCAT (문자열 1, 문자열 2) : 문자열 1,2 를 연결하여 하나의 문자열로 반환  
SELECT CONCAT('Hello','World') FROM dual;
SELECT CONCAT(ename,job) FROM emp;

SUBSTR(대상문자열,인덱스) : 대상문자열에서 지정한 인덱스부터 문자열을 추출
[주의]인덱스 1부터 시작
SELECT SUBSTR('Hello World',3) FROM dual;
SELECT SUBSTR('Hello World',3,3) FROM dual;--인덱스 3부터 문자 3개 추출
--                    인덱스 ↑↑개수
SELECT SUBSTR('Hello World',-3) FROM dual;--뒤에서 3번째부터 끝까지 추출
SELECT SUBSTR('Hello World',-3,2) FROM dual;--뒤에서 3번째부터 두개만 추출

LENGTH (대상문자열) :  문자열의 갯수
SELECT LENGTH('Hello World')FROM dual;
SELECT LENGTH(ename)FROM emp;

INSTR(대상문자열,검색문자) : 검색문자의 위치값 검색
SELECT INSTR('Hello World','e') FROM dual;
검색 문자가 없을경우 ->0
SELECT INSTR('Hello World','E') FROM dual;
SELECT INSTR('Hello World','o') FROM dual;--앞에서 부터 탐색 
SELECT INSTR('Hello World','o',6) FROM dual;--뒤에 숫자부터 검색 시작 / 대상문자열, 검색문자 검색인덱스, 해당위치부터 검색
SELECT INSTR('Hello World','o',1,2) FROM dual; --  대상 문자열, 검색 문자 검색 인덱스, 반복횟수(대상문자열 전체를 여러번 검색한다는 의미가 아니라 1번 검색으로           
                                               --  o를 찾으면 지정한 횟수만큼 그 뒤의 문자를 검색한다는 의미
                                               
LPAD(대상문자열,총길이,문자): 지정한 길이에 문자열을 출력하는데 공백은 왼쪽에 지정한 문자로 채움
SELECT LPAD('Hello',10,'*') FROM dual;

RPAD(대상문자열,총길이,문자): 지정한 길이에 문자열을 출력하는데 공백은 오른쪽에 지정한 문자로 채움
SELECT RPAD('Hello',10,'*') FROM dual;

TRIM : 문자열에서 공백이나 특정 문자를 제거한 다음 값을 반환
방향 : 왼쪽 -> LEADING, 오른쪽 -> TRAILING, 양쪽 -> BOTH <-DEFAULT
SELECT TRIM(LEADING 'h' FROM 'habchh') FROM DUAL; --왼쪽 H 제거
SELECT TRIM(BOTH 'h' FROM 'habchh') FROM DUAL; --양쪽 H제거

LTRIM : 문자열의 왼쪽에서 공백이나 특정 문자를 제거한 다음 값을 반환
RTRIM : 문자열의 오른쪽에서 공백이나 특정 문자를 제거한 다음 값을 반환

REPLACE (대상문자열, OLD,NEW) :대상문자열에서 OLD문자를 NEW문자로 대체
SELECT REPLACE('010.1234.5678','.','-') FROM dual;

함수 중첩
SELECT ename, LOWER(SUBSTR(ename,1,3))FROM emp;

[실습문제]
1. 업무의 첫글자는 대문자 나머지는 소문자로 출력하시오.
2. 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중에서 앞에서 3자만 구하여 출력하시오.
3. 이름의 세번째 문자가 A인 모든 사원의 이름을 표시하시오
4. 이름이 J,A,N으로 시작하는 모든 사원의 이름(첫글자는 대문자 나머지는 소문자로 표시) 및 이름의 길이를 표시하시오.
    (열 레이블은 name 과 length로 표시)

SELECT INITCAP(job) From emp;
SELECT SUBSTR(ename,1,3) FROM emp WHERE ename LIKE('A%');
SELECT ename FROM emp WHERE ename LIKE ('__A%'); -- SELECT ename FROM emp WHERE SUBSTR(ename,3,1)='A';
SELECT ename name, length(ename) length FROM emp WHERE ename LIKE('J%') OR ename LIKE ('A%') OR ename LIKE ('M%');
SELECT ename name, length(ename) length FROM emp WHERE SUBSTR(ename,1,1) IN ('J','A','M');

숫자함수

CEIL(실수) : 올림 처리한 정수 값을 반환
SELECT CEIL(2.3) FROM dual;

FLOOR(실수) : 버림 처리한 정수 값을 반환
SELECT FLOOR(2.3) FROM dual;

ROUND(대상숫자,지정자릿수) : 반올림
SELECT ROUND (45.926,2) FROM dual;
SELECT ROUND (43.234) FROM dual;--소숫점 아래를 안보여줌

SELECT empno, ename, sal, ROUND(sal*1.15,2) "new Salary",ROUND(sal*1.15)-sal "INCREASE" FROM emp;

TRUNC(대상숫자,지정자릿수) : 절삭
SELECT TRUNC(45.897,2) FROM dual;
SELECT TRUNC(45.897) FROM dual;

MOD(대상숫자, 나눌 숫자) : 나머지값
SELECT MOD(17,2) FROM dual;

날짜함수

날짜에 산술 연산자 사용
SELECT ename, TRUNC(SYSDATE-hiredate)/7 AS week, deptno FROM emp WHERE deptno =10;

MONTHS_BETWEEN (큰 날짜,작은 날짜) : 두 날짜 간의 월 수
SELECT MONTHS_BETWEEN('2012-03-23','2010-01-23') FROM dual;

SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) AS months_worked FROM emp ORDER BY months_worked;

ADD_MONTHS : 특정 날짜의 월에 정수를 더한 다음 해당 날짜를 반환하는 함수
SELECT ADD_MONTHS('2021-01-01', 8)FROM dual;

NEXT_DAY : 지정된 요일의 다음 날짜
SELECT NEXT_DAY('2024-03-12','월요일') FROM dual;--다가올 월요일을 구함.
SELECT NEXT_DAY('2024-03-12',2) FROM dual;
1(일요일)-7(토요일)

LAST_DAY : 월의 마지막 날
SELECT LAST_DAY ( '2012-11-01') FROM dual;

EXTRACT : 날짜 정보에서 특정한 연도, 월, 일, 시간, 분, 초 등을 추출
SELECT EXTRACT(YEAR FROM SYSDATE),EXTRACT(MONTH FROM SYSDATE),EXTRACT(DAY FROM SYSDATE) FROM dual;

[실습문제]
1. 모든 사원의 이름과 급여를 표시하시오.급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고 열 레이블을 SALARY로 지정하시오
2. 모든 사원의 이름, 업무, 급여, 부서번호를 출력하시오.(부서번호 오름차순 정렬, 사원이름은 10자 길이 형식으로 출력)
3. 오늘부터 이번달의 마지막 날까지의 남은 날 수를 구하시오.
4. 각 사원에 대해 사원번호, 이름, 급여 및 15% 인상된 급여를 New Salary로 지정하고 정수(반올림)로 표시하시오.

SELECT ename, LPAD(sal,15,'$') SALARY FROM emp;
SELECT RPAD(ename,10,'*'), job, sal, deptno FROM emp ORDER BY deptno ASC;
SELECT LAST_DAY(SYSDATE) - SYSDATE FROM dual;
SELECT empno, ename,sal, ROUND(sal*1.15) "New Salary" FROM emp; 

변환함수
TO_CHAR : 숫자-> 문자, 날짜 -> 문자
TO_NUMBER : 문자 -> 숫자
TO_DATE : 문자 -> 날짜

TO_CHAR
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
--SELECT TO_CHAR(SYSDATE,'YYYY년MM월DD일') FROM dual;--한글적용 X
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual;

실제 자리수와 일치
SELECT TO_CHAR(1234,9999) FROM dual;
SELECT TO_CHAR(1234,'9999') FROM dual;--'를 넣어도 작동간에는 문제 없음.
--SELECT TO_CHAR(1234,0000) FROM dual; -- ##이 나오는 오류가 남. 0 은 문자형태로 명시해야함
SELECT TO_CHAR(1234,'0000') FROM dual;

자리수가 모자람 ->####
SELECT TO_CHAR(1234,999) FROM dual;--자리수를 꼭 일치 시켜야함
SELECT TO_CHAR(1234,'999') FROM dual;-- 위와동일
SELECT TO_CHAR(1234,'000') FROM dual;

실제 자리수보다 많은 자리수 지정
SELECT TO_CHAR(1234,99999) FROM dual;--앞에 공백으로 비워짐
SELECT TO_CHAR(1234,'99999') FROM dual; -- 위와동일
SELECT TO_CHAR(1234,'00000') FROM dual; --01234 출력

소수점 자리 지정
SELECT TO_CHAR(1234,9999.99) FROM dual;
SELECT TO_CHAR(1234,'9999.99') FROM dual;
SELECT TO_CHAR(1234,'0000.00') FROM dual;

반올림해서 소숫점 둘째자리까지 표시
SELECT TO_CHAR(29.897,'99.99') FROM dual;
인상된 급여를 소수점 첫째자리까지 표시
SELECT TO_CHAR(sal*1.15,'9,999.9') FROM emp;

통화표시
SELECT TO_CHAR(1234,'$0000') FROM dual;
지역통화표시
SELECT TO_CHAR(1234,'L0000') FROM dual;--\는 사용 불가능

TO_DATE
SELECT TO_DATE('24-03-12','YYYY-MM-DD')FROM dual;
포멧형식 생략 가능
SELECT TO_DATE('24-03-12')FROM dual;

TO_NUMBER
SELECT TO_NUMBER('100',999)FROM dual;
포멧 형식 생략 가능
SELECT TO_NUMBER('100')FROM dual;

1) emp 테이블의 사원명과 업무를 쉼표(,)로 연결해서 표시하고 컬럼명은 Employee and Job으로 표시하시오.
SELECT ename || ',' || job AS "Employee and Job" FROM emp;
2) 부서번호 30(deptno)에서 근무하며 월 2,000달러 이하를 받는 81년 5월 1일 이전에 입사한 사원의 이름, 급여, 부서번호, 입사일을 출력하시오.
SELECT ename, sal, deptno, hiredate FROM emp WHERE deptno = 30 AND sal <= 2000 AND hiredate<'81-05-01';
3) emp 테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오.
SELECT ename FROM emp WHERE ename LIKE('%A%') AND ename LIKE('%E%');
4) emp 테이블에서 사원이름 중 S가 포함되지 않은 사람들 중 부서번호가 20인 사원들의 이름과 부서번호를 출력하시오.
SELECT ename, deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;
5) emp 테이블에서 관리자(mgr)가 없는 모든 사원의 이름과 업무를 표시하시오.
SElECT ename, job FROM emp WHERE mgr IS NULL;
6) emp 테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오.
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL;
7) 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오.
SELECT LOWER(ename) FROM emp WHERE LENGTH(ename)>=6;
8) 이름의 글자수가 6자이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 출력하시오.
SELECT SUBSTR(LOWER(ename),1,3) FROM emp WHERE LENGTH(ename)>=6;
9) 각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달 수)를 계산하여 열레이블을 MONTHS_WORKED로 지정하십시오. 결과는 정수로 반올림하여 표시하고 근무 달 수를 기준으로 오름차순으로 정렬하시오.
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS MONTHS_WORKED FROM emp ORDER BY MONTHS_WORKED ASC;
10) emp 테이블에서 이름(소문자로 표시), 업무, 근무연차를 출력하시오.
SELECT LOWER(ename),job, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)/12) AS YEAR_WORKED FROM emp;

일반함수

NVL(value1,value2): value1이 null이면 value2를 쓴다. value1과 value2의 자료형이 일치
SELECT ename, sal, comm, (sal+NVL(comm,0))*12  FROM emp;
SELECT ename, NVL(TO_CHAR(comm),'No Commission') FROM emp;--no commission을 숫자로 바꿀 수 없기 때문에 숫자를 문자형으로 변환

NVL2(value1,value2,value3): value1이 null인지 평가. null이면 value3, null이 아니면 value2
                            자료형이 일지하지 않아도 됨**SELECT ename, NVL(TO_CHAR(comm),'No Commission') FROM emp;
SELECT NVL2(comm,'commission','no commission') FROM emp;

NULLIF(value1,value2): 두 개의 값이 일치하면 NULL. 두개의 값이 일치하면 value1
SELECT NULLIF(LENGTH(ename),LENGTH(job)) "NULLIF" FROM emp;

COALESCE(value1,value2,value3...) : null값이 아닌 값을 사용 (자료 일치해야함)
SELECT comm, sal, COALESCE(comm,sal,0) FROM emp;
SELECT comm, mgr, sal, COALESCE(comm,mgr,sal) FROM emp;

CASE 칼럼 WHEN 비교값 THEN 결과값  = IF
         WHEN        THEN
         WHEN        THEN
        (ELSE 결과값)
END

SELECT ename, sal, job, CASE job WHEN 'SALESMAN' THEN sal*0.1 
                                 WHEN 'MANAGER' THEN sal*0.2 
                                 WHEN 'ANALYST' THEN sal*0.3 
                                 ELSE sal*0.4 
                                 END "BONUS" 
                                 FROM emp;
SELECT ename, sal, job, CASE WHEN sal>=4000 AND sal <=5000 THEN 'A'
                             WHEN sal>=3000 AND sal <4000 THEN 'B'
                             WHEN sal>=2000 AND sal <3000 THEN 'C'
                             WHEN sal>=1000 AND sal <2000 THEN 'D'
                             ELSE 'F'
                             END "GRADE"
                             FROM emp;

DECODE : =비교만 가능, 오라클 전용 DECODE(칼럼,비교값,반환값,비 , 반, 비, 반, 반(ELSE역할 수행)) = SWITCH

SELECT ename,sal,job,
        DECODE(job,'SALESMAN',sal*0.1,
                    'MANAGER',sal*0.2,
                    'ANALYST',sal*0.3,
                    sal*0.4) "BONUS"
FROM emp;

SELECT ename,sal,job,
        DECODE(TRUNC(sal/1000),5,'A',
                               4,'A',
                               3,'B',
                               2,'C',
                               1,'D',
                               'F') "GRADE"
FROM emp;

[실습문제]
1. 사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여 라고 해서 출력하시오.
    (단, NULL값은 나타나지 않게 작성하시오.)
SELECT ename, sal, comm, NVL2(comm,sal+comm,sal) "실급여" FROM emp;
SELECT ename, sal, comm, sal + NVL(comm,0) "실급여" FROM emp;--위와 동일
2. 월급과 커미션을 합친 금액이 2000이상인 급여를 받은 사원의 이름, 업무, 월급, 커미션, 고용날짜를 출력하시오.(단, 고용날짜는 1981 - 12-17형태로 출력하시오.
SELECT ename, job, sal, comm, TO_CHAR(hiredate,'yyyy-mm-dd') FROM emp WHERE sal+NVL(comm,0) >2000 ;

그룹함수 : 행 집합 연산을 수행하여 그룹별로 하나의 결과를 산출

AVG() : NULL을 제외한 모든 값들의 평균을 반환, NULL값은 평균 계산에서 무시됨.
SELECT TRUNC(AVG(sal),2) FROM emp;

COUNT() : NULL을 제외한 값을 가진 모든 레코드 수를 반환. COUNT(*)의 형식을 사용하면 NULL값도 포함
SELECT COUNT(empno) FROM emp;
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX() : 레코드 내에 있는 여러 값 중 가장 큰 값을 반환
SELECT MAX(sal) FROM emp;
SELECT MAX(ename) FROM emp;--사전 순 가장 뒤에
SELECT MAX(hiredate) FROM emp;--입사일이 가장 늦은 사람

MIN() : 레코드 내에 있는 여러 값 중 가장 작은 값을 반환
SELECT MIN(sal) FROM emp;
SELECT MIN(ename) FROM emp;--사전 순 가장 앞에
SELECT MIN(hiredate) FROM emp;--입사일이 가장 빠른 사람

SUM() : 레코드들이 포함하고 있는 모든 값을 더하여 반환
SELECT SUM(sal) FROM emp;

SELECT MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp;

SELECT MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp WHERE deptno=10; 

SELECT COUNT(*) FROM emp WHERE deptno =20; --where절로 범위 제한하고  count로 숫자 구하기

SELECT MAX(sal) FROM emp WHERE deptno =10;

SELECT deptno, MAX(sal) FROM emp;(X) --불가능 맥스하면 행이 하나로 줄고 넘버는 12개 ->행이 맞지 않아 실행 불가
        ↑개별컬럼
GROUP BY : SELECT절에 집합함수 적용시 개별 컬럼을 지정할 수 없음.개별 컬럼을 지정할 경우에는 반드시 GROUP BY절에 지정된 컬럼만 가능
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno ORDER BY deptno;

부서별로 사원 수 구하기
SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno ORDER BY deptno; --부서별 사원 수

다중 열에서 GROUP BY절 사용하기
SELECT deptno , job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

HAVING : 그룹함수를 이용해서 조건 체크할 떄 사용 알리아스 사용x
그룹함수를 사용한 잘못된 Query
[오류발생]
SELECT deptno, AVG(sal) FROM emp WHERE AVG(sal)>=2000 GROUP BY deptno; --(x) where 절에 그룹함수를 이용해서 조건을 체크하면 오류 발생
[정상 구문]
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>=2000;

부서별로 최대급여를 구하는데 3000를 초과한 최대급여 구하기
SELECT deptno,MAX(sal) FROM emp GROUP BY deptno HAVING MAX(sal)>3000;

그룹 함수 중첩
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

분기별로 입사한 사원의 수
SELECT TO_CHAR(hiredate,'Q') quarter, COUNT(empno) FROM emp GROUP BY TO_CHAR(hiredate,'Q') ORDER BY quarter;

[실습문제]
1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 표시하시오.
    열 레이블을 각각 maximum,minimum,sum,average 로 지정하고 결과를 정수로 반올림하고 세자리 단위로 ,명시
SELECT TO_CHAR(MAX(sal),'9,999') maximum, MIN(sal) minimum, TO_CHAR(SUM(sal),'99,999') sum, TO_CHAR(ROUND(AVG(sal)),'9,999') average FROM emp;
2. 급여와 커미션을 더한 금액의 최고, 최저, 평균 금액을 구하시오.
    평균금액은 소수점 첫째자리 까지 표시하시오.
SELECT MAX(sal+NVL(comm,0)), MIN(sal+NVL(comm,0)), TRUNC(AVG(sal+NVL(comm,0)),1) FROM emp;
3. 업무와 업무가 동일한 사원의 수를 표시하시오.(업무별 사원 수를 구하시오)
SELECT job, COUNT(empno) FROM emp GROUP BY job ORDER BY job;
4. 30번 부서의 사원수를 구하시오.
SELECT deptno, COUNT(deptno) FROM emp GROUP BY deptno HAVING deptno = 30;--SELECT COUNT(*) FROM emp WHERE deptno;그룹명 명시 안할 경우
5. 업무별 최고 월급을 구하고 업무, 최고 월급을 출력하시오.
SELECT job,MAX(sal) FROM emp GROUP BY job;
6. 20번 부서의 급여 합계를 구하고 급여 합계 금액을 출력하시오.
SELECT SUM(sal) FROM emp GROUP BY deptno HAVING deptno =20;
7. 부서별로 지급되는 총 월급에서 금액이 9,000이상 받는 사원들의 부서 번호, 총 월급을 구하시오
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>=9000;
8. 업무별로 사번이 제일 늦은 사람을 구하고 그 결과 내에서 사번이 '79'로 시작하는 결과만 보여주세요.
SELECT job, MAX(empno) FROM emp GROUP BY job HAVING MAX(empno) LIKE '79%';
SELECT job, MAX(empno) FROM emp WHERE empno LIKE '79%' GROUP BY job;
9. 업무별 총 월급을 출력하는데 업무가 'MANAGER'인 사원들은 제외하고 총월급이 5000보다 많은 업무와 총월급만 출력하시오.
SELECT job, SUM(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job HAVING SUM(sal)>5000;  -- where,group , having순으로 사용
10. 업무별로 사원의 수가 4명 이상인 업무와 인원 수를 출력하시오.
SELECT job, COUNT(*) FROM emp GROUP BY job HAVING COUNT(*)>=4;

분석함수
RANK() : 순위를 표현할 때 사용하는 함수
RANK(조건값) WITHIN GROUP (ORDER BY 조건값 칼럼명) : 특정 데이터의 순위 확인하기
(주의) RANK뒤에 나오는 데이터와 ORDER BY 뒤에 나오는 데이터는 같은 컬럼이어야함.

SELECT RANK('SMITH') WITHIN GROUP(ORDER BY ename DESC) "RANK" FROM emp;
SELECT * FROM emp ORDER BY ename DESC;

RANK() OVER(ORDER BY 컬럼명) : 전체 순위보기 --PARTITION BY 칼럼 (그룹같은 느낌/,로 2개가능)
사원들의 empno, ename, sal, 급여 순위를 출력
SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) FROM emp;

10번 부서에 속한 직원들의 사번과 이름, 급여, 해당 부서 내의 급여 순위를 출력
SELECT empno,ename,sal,RANK() OVER(ORDER BY sal DESC) "RANK" FROM emp WHERE deptno=10;

emp 테이블을 조회하여 사번, 이름, 급여, 부서번호, 부서별 급여 순위를 출력\
SELECT empno,ename,sal,deptno, RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) "RANK" FROM emp;

emp 테이블에서 같은 부서내의 job별로 급여 순위를, empno, ename,sal,deptno,job을 출력
SELECT empno, ename, sal, deptno, job, RANK() OVER(PARTITION BY deptno,job ORDER BY sal) "RANK" FROM emp;

*****JOIN***** : 둘 이상의 테이블을 연결하여 데이터를 검색하는 방법.
                보통 둘 이상의 행들의 공통된 값 PRIMARY KEY 및 FOREIGN KEY 값을 사용하여 조인
                두 개의 테이블을 SELECT 문장 안에서 조인하려면 적어도 하나의 컬럼이 그 두 테이블 사이에서 공유 되어야 함.

Cartesian Product (카티션 곱) : 검색하고자 했던 데이터 뿐 아니라 조인에 사용된 테이블들의 모든 데이터가 반환되는 현상.
                                1.조인 조건을 정의하지 않았을 경우
                                2.조인 조건이 잘못된 경우
SELECT * FROM emp,dept; -- 카티션 곱 예시

[ORACLE 전용]
동등 조인(Equi Join) : 조건절에 = 조건에 의하여 조인이 이루어짐.

SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

SELECT emp.ename, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;

테이블 알리아스 부여하기
SELECT * FROM emp e,dept d WHERE e.deptno = d.deptno;

컬럼 명을 호출할 때 테이블 명 또는 테이블 알리아스를 생략
SELECT ename,dname FROM emp e, dept d WHERE e.deptno = d.deptno; --공통된 칼럼을 호출할 경우 꼭 앞에 명시

추가적인 조건 명시하기

ALLEN이 근무하는 부서의 이름과 사원의 이름 출력하기 -- where 이후 and로 연결
SELECT e.ename,d.dname FROM emp e, dept d WHERE e.deptno = d.deptno AND e.ename = 'ALLEN';
--                                             (      조인조건      )   (  추가적인 조건    )

3000 이상 4000이하 급여를 받는 사원의 이름과 급여, 부서명을 출력하시오
SELECT ename, sal, dname FROM emp e, dept d WHERE d.deptno = e.deptno AND sal BETWEEN 3000 AND 4000;

비동등 조인(Non Equi Join) : 테이블이 어떤 컬럼도 Join함
                           테이블의 컬럼에 일치하지 않을 때 사용하고 조인 조건은 동등(=)이외의 연산자를 갖음
                           (between and, is null, in)
                           SELECT ename, sal, dname FROM emp e, dept d WHERE d.deptno = e.deptno AND sal BETWEEN 3000 AND 4000;
사원이름, 급여, 급여등급 구하기 (emp,salgrade 테이블이용)
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

SELF JOIN : 동일한 테이블 조인 / 같은 종류의 데이터가 있을때 SELF JOIN
사원 이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원은 제외)
SELECT e.ename 사원이름, m.ename 관리자이름 FROM emp e, emp m WHERE e.mgr=m.empno ;--KING 없음

외부조인(Outer Join) : Equi Join 문장들의 한 가지 제약점은 그것들이 조인을 생성하려 하는 두개의 테이블의 두 개
                    컬럼에서 공통된 값이 없다면 테이블로부터 데이터를 반환하지 않는다는 것
                    정상적으로 조인 조건을 만족하지 못 하는 행들을 보기 위해 사용

누락된 행을 표시하기 위해서는 누락된 행이 있는 테이블의 반대 테이블의 조인 조건에 + 명시
SELECT DISTINCT(e.deptno),d.deptno FROM emp e, dept d WHERE e.deptno(+)= d.deptno;

사원이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원도 표시)  사원 ↓      ↓관리자
SELECT e.ename 사원이름, m.ename 관리자이름 FROM emp e,emp m WHERE e.mgr=m.empno(+);

[실습문제]
1. 모든 사원의 이름, 부서번호, 부서이름을 포시하시오,(emp,dept)
SELECT e.ename, e.deptno, d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;
2. 업무가 MANAGER인 사원의 정보를 이름 업무 부서명 근무지 순으로 출력 (위와 동일)
SELECT e.ename, job, d.dname, loc FROM emp e, dept d WHERE e.deptno = d.deptno AND job = 'MANAGER';
3. 커미션을 받고 급여가 1600이상인 사원의 사원이름, 급여, 부서명, 근무지를 출력하시오
SELECT ename, sal, dname,loc FROM emp e, dept d WHERE e.deptno = d.deptno AND e.comm IS NOT NULL AND sal>=1600;
4. 근무지가 CHICAGO 인 모든 사원의 이름, 업무, 부서번호 및 부서이름을 표시하시오,
SELECT ename, job, e.deptno, dname FROM emp e, dept d WHERE e.deptno=d.deptno AND d.loc = 'CHICAGO';
5. 근무지별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시 순으로 정렬하시오.(근무인원 0명인 곳도 표시)Outer join
SELECT loc, COUNT(loc) FROM emp e, dept d WHERE e.deptno(+) = d.deptno GROUP BY loc HAVING COUNT(loc) <= 5 ORDER BY COUNT(loc) ASC; --(x) 왜 133이 나오지 A.행의 숫자를 불러와서그럼
SELECT d.loc, COUNT(e.empno) emp_member FROM emp e, dept d WHERE e.deptno(+) = d.deptno GROUP BY d.loc HAVING COUNT(e.empno) <= 5 ORDER BY emp_member ASC;
6. 사원의 이름 및 사원 번호를 관리자의 이름과 관리자 번호와 함께 표시하고 각각의 열 레이블은 employee, emp#, manager, mgr# 으로 지정하시오, (관리자가 없는 사원 미출력)
SELECT e.ename employee, e.empno emp#, m.ename manager, m.empno mgr# FROM emp e, emp m WHERE e.mgr = m.empno;
7. 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 표시하고 열 레이블은 employee, emp hired, manager, mgr hired로 지정하시오.(관리자가 없는 사원 미출력)
SELECT e.ename employee, e.hiredate "emp hired", m.ename manager, m.hiredate "mgr hired" FROM emp e, emp m WHERE e.mgr=m.empno AND m.hiredate > e.hiredate;

[표준 SQL]

내부 조인(Inner Join)
SELECT emp.ename,dept.deptno
FROM emp INNER JOIN dept--쉼표 대신에 INNER JOIN
ON emp.deptno = dept.deptno;--WHERE 대신 ON

SELECT emp.ename,dept.deptno
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

SELECT e.ename, d.dname--ALIAS 버전
FROM emp e JOIN dept d
ON e.deptno = d.deptno;

공통 칼럼은 알리아스 없이 불가능
SELECT ename,dname,d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno;

ON절은 JOIN 조건을 명시하고 WHERE에 부가 조건을 명시
SELECT e.ename,d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE e.ename = 'ALLEN';--조인이 끝난뒤 조건

만약 조인 조건에 사용된 컬럼의 이름이 같다면 다음과 같이 USING절을 사용하여 조인 조건을 정의 할 수 있음
(주의)USING(컬럼명) 절에 명시한 컬럼 명을 호출할 때는 테이블 명 또는 알리아스를 명시해서 호출불가
SELECT * FROM emp e JOIN dept d USING(deptno);--deptno 가 합쳐짐
SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno;--deptno분리

SELECT ename, deptno, dname FROM emp JOIN dept USING(deptno); -- 이런식으로 ALIAS를 사용 안해도 됨.

SELECT e.ename,deptno
FROM emp e JOIN dept d
USING(deptno) WHERE e.ename='ALLEN';

SELF JOIN
사원이름과 해당 사원의 관리자 이름 구하기 (관리자가 없는 사원은 제외)
SELECT e.ename name, m.ename manager_name FROM emp e JOIN emp m ON e.mgr = m.empno;

외부조인(OUTER JOIN)--RIGHT
SELECT DISTINCT(e.deptno),d.deptno FROM emp e RIGHT JOIN dept d ON e.deptno = d.deptno; --오른쪽 데이터에 누락 발생했다고 RIGHT표기

사원이름과 해당 사원의 관리자 이름 구하기 (관리자 없는 사원도 표시) --LEFT 아우터 생략 가능
SELECT e.ename name, m.ename manager_name FROM emp e LEFT OUTER JOIN emp m ON e.mgr=m.empno;

[실습문제]
1. 모든 사원의 이름, 부서번호, 부서이름, 근무지를 표시하시오.(emp,dept)
SELECT ename, deptno, dname, loc FROM emp JOIN dept USING(deptno);
2. 업무가 'SALESMAN'인 사원의 정보를 이름,업무,부서명, 근무지 순으로 출력하시오.
SELECT ename, job, dname, loc FROM emp JOIN dept USING(deptno) WHERE job = 'SALESMAN';
3. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 급여+커미션, 급여등급을 출력하는데 각각의 컬럼명을 "사원번호","이름","연봉","실급여","급여등급"으로 출력하시오.
(단 커미션이 null인 것은 제외하고 출력)(emp,salgrade,실급여로 급여등급 구하기)
SELECT empno 사원번호, ename 이름, sal*12 연봉, sal+comm 실급여, grade 급여등급 FROM emp JOIN salgrade ON sal+comm BETWEEN losal AND hisal WHERE comm IS NOT NULL;
4. 10번 부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하시오.(emp,dept,salgrade)
[오라클 전용]
SELECT d.deptno, d.dname, e.ename, e.sal, s.grade FROM emp e, dept d, salgrade s WHERE e.deptno = d.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.deptno=10;
[표준 SQL]
SELECT deptno, dname, ename, sal, grade FROM emp  JOIN dept USING(deptno) JOIN salgrade ON sal BETWEEN losal AND hisal WHERE deptno =10;

집합연산자

UNION : 합집합 중복값 제거
        union은 두 테이블의 결합을 나타내며, 결합시키는 두 테이블의 중복되지 않은 값들을 반환
    
SELECT deptno FROM emp --교집합 + DISTRICT
UNION
SELECT deptno FROM dept;

UNION ALL : UNION 과 같으나 두 테이블의 중복되는 값까지 반환

SELECT deptno FROM emp -- 교집합
UNION ALL
SELECT deptno FROM dept;

INTERSECT : 두 행의 집합 중 공통된 행을 반환

SELECT deptno FROM emp 
INTERSECT
SELECT deptno FROM dept;

MINUS : 첫번째 SELECT문에 의해 반환되는 행중에서 두번쨰 SELECT문에 의해 반환되는 행에 존재하지 않는 행들을 보여줌

SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;

SUBQUERY : 다른 하나의 SQL문장의 절에 NESTED(내장)된 SELECT문장

단일행 서브쿼리 : 오직 한 개의 행(값)을 반환

SELECT job FROM emp WHERE empno =7369;
SELECT empno,ename,job FROM emp WHERE job='CLERK';--SUBQUERY를 안쓰면 위에처럼 두문장을 사용해야함
->위의 두개의 문자를 서브쿼리를 사용해서 작성
SELECT empno,ename,job FROM emp WHERE job = (SELECT job FROM emp WHERE empno = 7369);
--(             메인쿼리                     (                서브쿼리              ))

7698의 급여보다 많은 급여를 받는 사원들의 사원번호, 사원이름, 급여를 출력하시오.
SELECT empno ,ename, sal FROM emp
WHERE sal > (SELECT sal FROM emp WHERE empno = 7698);

다중 행 서브쿼리 : 하나 이상의 행을 반환하는 서브쿼리

단일행과 다중행의 차이 : 1개의 값을 반환하면 단일 ex) JOHNS 2개 이상은 다중 ex) 1250 1600 5000

IN 연산자의 사용

부서별로 가장 급여를 적게 받는 사원과 동일한 급여를 받는 사원의 정보를 출력하시오.
SELECT empno,ename,sal, deptno FROM emp
WHERE sal IN(SELECT MIN(sal) FROM emp GROUP BY deptno);--서브쿼리와 일치하는 값들이 있는 데이터들만 추출

ANY 연산자의 사용
ANY 연산자는 서브쿼리의 결과값 중 어느 하나의 값이라도 만족이 되면 결과값을 반환

SELECT sal FROM emp WHERE job = 'SALESMAN';
SELECT ename, sal FROM emp WHERE sal>1250 OR sal > 1500 OR sal >1600;
->위 문장을 서브쿼리로 작성
SELECT ename, sal FROM emp WHERE sal>any(SELECT sal FROM emp WHERE job ='SALESMAN');--대소 비교할때 ANY를 사용

ALL 연산자의 사용
서브쿼리의 결과와 모든 값이 일치 --AND와 비슷
SELECT sal FROM emp WHERE deptno =20;--20번 부서의 급여 출력
SELECT empno, ename, sal, deptno FROM emp WHERE sal >800 AND sal>2975 AND sal>3000;--20번 부서의 누구보다 월급이 많은 사람 출력
->위 문장을 서브쿼리로 작성
SELECT empno, ename, sal, deptno FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE deptno = 20);

다중 열 서브쿼리
서브 쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리

SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno,sal) IN (SELECT deptno, sal--WHERE 앞에 꼭 소괄호 필수
                       FROM emp WHERE deptno =30);

부서별로 가장 급여를 적게 받는 사원 정보를 출력--부서당 한명씩
SELECT empno, ename, sal, deptno FROM emp WHERE (deptno,sal) IN (SELECT deptno,MIN(sal) FROM emp GROUP BY deptno); --다중 열
부서별로 가장 급여를 적게 받는 사원과 동일한 급여를 받는 사원 정보 출력 --다른부서에도 같이 조금 받는 사람 도 추출
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno); --단일 열

인라인뷰 : 메인 쿼리의 FROM절을 서브 쿼리로 이용하는 방법/ 가상의 테이블 제작
급여가 20인 부서의 평균 급여보다 많은 급여를 받은 사원의 사원번호, 이름, 부서명 출력
SELECT e.empno, e.ename, d.dname FROM (SELECT empno, ename, sal, deptno FROM emp WHERE sal> (SELECT AVG(sal) FROM emp WHERE deptno = 20)) e JOIN dept d ON e.deptno=d.deptno;
                                    --(                                  하나의 테이블 역할                                               ) 
                                    
SELECT e.empno,e.ename, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE sal>(SELECT AVG(sal) FROM emp WHERE deptno=20);

부서별로 총급여 출력하는데 부서번호, 부서명, 총급여를 출력하시오.
SELECT deptno, dname, total FROM dept JOIN(
SELECT deptno, SUM(sal) total FROM emp GROUP BY deptno) USING(deptno);

스칼라 서브쿼리
스칼라 값은 단일 값을 의미
결과값이 단일 행, 단일 열의 스칼라 값으로 반환 됨.
단의 결과값이 다중 행이거나 다중 열이라면 EBMS는 그 중 어떠한 행, 어떠한 열을 출력해야 하는지 알 수 없어 에러를 출력.
        
SELECT deptno, (SELECT dname FROM dept WHERE deptno=e.deptno), SUM(sal) FROM emp e GROUP BY deptno;

[실습문제]
1. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 입사일을 구하는데 'BLAKE'는 제외하고 출력하시오.
SELECT ename, hiredate FROM emp WHERE deptno IN (SELECT deptno FROM emp WHERE ename ='BLAKE') AND ename <> 'BLAKE';
2. 평균 급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을 출력하는데 월급이 높은 사람 순으로 출력하시오.
SELECT empno, ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp) ORDER BY sal DESC;
3. 10번 부서에서 급여를 가장 적게 받는 사원과 동일한 급여를 받는 사람의 이름과 월급을 출력하시오.
SELECT ename, sal FROM emp WHERE sal = (SELECT MIN(sal) FROM emp WHERE deptno =10);
4. (부서별 사원 수를 구하고) 사원 수가 3명이하의 부서의 부서명과 사원 수를 출력하시오.
SELECT a.dname,b.cnt FROM dept a, (SELECT deptno, COUNT(empno) cnt FROM emp GROUP BY deptno) b WHERE a.deptno = b.deptno AND b.cnt<=3;--인라인 뷰 사용 ****다시보기
SELECT d.dname, COUNT(e.empno) cnt FROM emp e, dept d WHERE e.deptno = d.deptno GROUP BY d.dname HAVING COUNT(e.empno)<=3;
5. 사원 번호가 7844인 사원보다 빨리 입사한 사원의 이름과 입사일을 출력하시오.
SELECT ename, hiredate FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE empno = 7844);
6. 직속 상사(mgr)가 king 인 모든 사원의 이름과 급여를 출력하시오.
SELECT ename, sal FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');
                                     ↑ IN 으로 바꿔도됨        
7. 20번 부서에서 가장 급여를 많이 받는 사원과 동일한 급여를 받는 사원의 이름과 부서명, 급여 , 급여등급을 출력하시오.
SELECT ename, dname, sal, grade FROM emp e, dept d, salgrade s WHERE e.deptno = d.deptno AND e.sal BETWEEN losal AND hisal AND e.sal = (SELECT MAX(sal) FROM emp WHERE deptno = 20);
SELECT e.ename, d.dname, e.sal,s.grade FROM emp e JOIN dept d ON e.deptno=d.deptno JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal WHERE e.sal = (SELECT MAX(sal) FROM emp WHERE deptno = 20);

8. 총 급여(sal+comm)가 평균 급여보다 많은 급여를 받는 사람의 부서번호,이름,총급여,커미션을 출력하시오.(커미션은 유(o), 무(x)로 표시하고 컬럼명은 "comm유무"로 출력)
SELECT deptno, ename, sal+NVL(comm,0), NVL2(comm,'o','x') comm유무 FROM emp WHERE sal+NVL(comm,0) > (SELECT AVG(sal) FROM emp); 
SELECT deptno, ename, sal+NVL(comm,0), --when then else를 이용한 코드
        CASE WHEN comm IS NOT NULL THEN'o'
        ELSE'x'
        END comm유무
FROM emp 
WHERE sal+NVL(comm,0)>(SELECT AVG(sal) FROM emp);
9. CHICAGO 지역에서 근무하는 사원의 평균 급여보다 높은 급여를 받는 사원의 이름과 급여, 지역명을 출력하시오.
SELECT ename, sal, loc FROM emp JOIN dept USING(deptno) WHERE sal >(SELECT AVG(sal) FROM emp e, dept d where e.deptno = d.deptno GROUP BY (loc) HAVING loc = 'CHICAGO');
                                                                                                                                =AND loc='CHICAGO';로 줄여도됨
SELECT AVG(sal) FROM emp--서브쿼리를 조인을 안쓰는경우
WHERE deptno IN
(SELECT deptno FROM dept WHERE loc = 'CHICAGO');
10. 커미션이 없는 사원들 중 월급이 가장 높은 사원의 이릅과 급여 등급을 출력하시오.
SELECT ename, grade FROM emp JOIN salgrade ON sal BETWEEN losal AND hisal WHERE sal = (SELECT MAX(sal) FROM emp WHERE comm IS NULL);
11. SMITH의 직속 상사(mgr)의 이름과 부서명, 근무지역을 출력하시오.
SELECT m.ename, dname, loc FROM emp e, emp m, dept d WHERE e.mgr = m.empno AND m.deptno = d.deptno AND e.ename = 'SMITH';--오라클
SELECT e.ename,d.dname,d.loc FROM emp e JOIN dept d USING(deptno) WHERE e.empno IN(--표준 SQL
SELECT mgr FROM emp WHERE ename = 'SMITH');
12. ALLEN보다 급여를 많이 받는 사람 중에서 입사일이 가장 빠른 사람과 동일한 날짜에 입사한 사원의 이름과 입사일, 급여를 출력하시오.
SELECT ename,hiredate,sal FROM emp WHERE hiredate =
(SELECT MIN(hiredate) FROM emp WHERE sal >
(SELECT sal FROM emp WHERE ename='ALLEN'));

INSERT 문 : 테이블에 행을 삽입

전체 데이터 삽입(전체 컬럼 명시시)
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8000,'DENNIS','SALESMAN',7698,'99/01/22',1700,200,30);

전체 데이터 삽입할 때는 컬럼명 생략 가능 
INSERT INTO emp
VALUES (8001,'SUNNY','SALESMAN',7698,'99/03/01',1000,300,30);

[NULL 삽입 방법]
값이 입력되지 않는 컬럼은 제외(NULL 처리)
INSERT INTO emp (empno,ename,job,mgr,hiredate, sal, deptno)
VALUES (8003,'PETER','CLERK',7698,'22/11/06',1700,20);

값이 입력되지 않는 컬럼을 제외하지 않았을 경우
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8004,'ANNIE','CLERK',7698,'22/11/06',1800,NULL,30);

날짜의 삽입
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8005,'MICHEAL','CLERK',7698,TO_DATE('22/11/06','YY/MM/DD'),1800,NULL,30);

UPDATE문 : 행 단위로 데이터 갱신 (단, WHERE을 안넣으면 전체 행에 업데이트 ****주의****)
UPDATE emp SET mgr = 7900 WHERE empno = 8000;
UPDATE emp SET ename = 'MICHAEL' WHERE empno = 8005;
UPDATE emp SET ename = 'MARIA',sal=2500,comm=500 WHERE empno = 8000;
where절 없을때 주의
UPDATE emp SET ename = 'KINGKONG';

DELETE문 : 행을 삭제
DELETE FROM emp WHERE empno = 7369;

WHERE 절을 명시하지 않으면 모든 행이 삭제
DELETE FROM emp;

데이터베이스 트랜잭션
트랜잭션은 데이터 처리의 한 단위
오라클 서버에서 발생하는 SQL문들을 하나의 논리적인 작업 단위로써 성공하거나 실패하는 일련의 SQL문을 트랜잭션이라고 할 수 있음
트랜잭션은 데이터를 일관되게 변경하는 DML문장으로 구성됨

데이터베이스 객체

테이블 : 기본 저장 단위로 행과 열로 구성
테이블은 기본적인 데이터 저장단위
레코드와 컬럼으로 구성
레코드(record, row) : 테이블의 데이터는 행에 저장
칼럼(column): 테이블의 각 컬럼은 데이터를 구별할 수 있는 속성을 표현

이름 지정규칙
-문자로 시작해야함
-1~30자까지 가능
-A~Z,a~z,0~9,_,$,#만 포함해야함
-동일한 사용자가 소유한 다른 객체의 이름과 중복되지 않아야함(계정)
-ORACLE SERVER 의 예약어가 아니어야 함

-사용자가 소유한 테이블의 이름 
SELECT table_name FROM user_tables;

-사용자가 소유한 개별 객체 유형
SELECT DISTINCT object_type FROM user_objects;

-사용자가 소유한 테이블, 뷰, 동의어 및 시퀀스
SELECT * FROM user_catalog;

테이블의 생성
CREATE TABLE employee(--소괄호 치고 줄바꿈 해주기
empno NUMBER(6),
name VARCHAR2(30) NOT NULL,--30byte 한글 10자 저장, 자바에서 1글자당 2byte 오라클 3byte
salary NUMBER(8,2),
hire_date DATE DEFAULT SYSDATE,
CONSTRAINT employee_pk PRIMARY KEY (empno)--식별자 인덱스 만들 때 사용.
);
데이터 추가
INSERT INTO employee (empno,name,salary)
VALUES (100,'홍길동',1000.23);
COMMIT;

SELECT * FROM employee;

테이블 생성 시 PRIMARY KEY 및 FOREIGN KEY 제약 조건 추가하기
CREATE TABLE SUSER(
ID VARCHAR2(20),
NAME VARCHAR2(30),
CONSTRAINT suser_pk PRIMARY KEY (id)
);

CREATE TABLE sboard(
num NUMBER,
id VARCHAR2(20) NOT NULL,
content VARCHAR2(4000) NOT NULL,
CONSTRAINT sboard_pk PRIMARY KEY (num),
CONSTRAINT sboard_fk FOREIGN KEY (id) REFERENCES suser(id)
);

INSERT INTO suser (id,name) VALUES ('Dragon','길동햄');
INSERT INTO suser (id,name) VALUES ('Cool42','박문치');

INSERT INTO sboard (num,id,content) VALUES (1,'Dragon','오늘은 불타는 금요일');
INSERT INTO sboard (num,id,content) VALUES (2,'Cool42','내일은 식어가는 토요일');

--INSERT INTO sboard (num,id,content) VALUES (3,'blue','모레는 일요일');--제약 조건을 갖게되면서 suser.id에 없는 데이터를 출력하려하면 오류 발생

Delete FROM suser WHERE id='Dragon';--자식키 연동이 되어있기 때문에 삭제 불가능

COMMIT;

두개의 테이블 조인
SELECT * FROM suser JOIN sboard USING (id);

SELECT*FROM suser;
SELECT*FROM sboard;

테이블의 관리
ADD 연산자 : 테이블에 새로운 컬럼을 추가
ALTER TABLE employee ADD (eddr VARCHAR(2));

제약조건 추가
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY (empno); -- 하나의 키만 가지고 있음

MODIFY 연산자 : 테이블의 컬럼을 수정하거나 NOT NULL컬럼으로 변경할 수 있음
ALTER TABLE employee MODIFY(salary NUMBER(10,2) NOT NULL);

컬럼명 변경 
ALTER TABLE employee RENAME COLUMN salary TO sal;
ALTER TABLE employee RENAME COLUMN eddr TO addr;
ALTER TABLE employee RENAME COLUMN hite_date TO hire_date;

테이블명 변경
RENAME employee TO employee2;

테이블의 삭제
DROP TABLE employee2; -- rollback이 안되니까 꼭 백업.

ON DELETE CASCADE
부모 테이블의 컬럼을 삭제하면서 자식 테이블의 자식 데이터를 모두 삭제

CREATE TABLE s_member(
id VARCHAR2(20) PRIMARY KEY,
name VARCHAR2(30)
);

자식테이블
CREATE TABLE s_member_detail(
num NUMBER PRIMARY KEY,
content VARCHAR2(4000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES s_member (id) ON DELETE CASCADE
);

INSERT INTO s_member(id,name) VALUES ( 'dragon', '홍길동');
INSERT INTO s_member(id,name) VALUES ( 'sky', '박문수');
COMMIT;

INSERT INTO s_member_detail(num,content,id) VALUES (1, '오늘은 금요일', 'sky');
INSERT INTO s_member_detail(num,content,id) VALUES (2, '내일은 토요일', 'sky');
INSERT INTO s_member_detail(num,content,id) VALUES (3, '모레은 일요일', 'sky');

DELETE FROM s_member WHERE id ='sky';

COMMIT;

[실습문제]
1.student라는 이름으로 테이블 생성
컬럼명       id             name          age             score
데이터타입varchar2(10)   varchar2(30)    number(3)       number(3)
제약 조건 primary key   not null        not null        not null

CREATE TABLE student (
id VARCHAR2(10) PRIMARY KEY,
name VARCHAR2(30) NOT NULL,
age NUMBER(3) NOT NULL,
score NUMBER(3) NOT NULL
);

2.데이터를 아래와 같이 입력하시오.
id          name            age         score
dragon      홍길동           21          100
sky         장영실           22          99
blue        박문수           34          88

INSERT INTO student(id, name, age, score) VALUES ('dragon','홍길동',21,100);
INSERT INTO student(id, name, age, score) VALUES ('sky','장영실',22,99);
INSERT INTO student(id, name, age, score) VALUES ('blue','박문수',34,88);
COMMIT;

3. 데이터 읽기
student 테이블에서 성적 합계를 구하시오.
SELECT SUM(score) FROM student;

뷰(VIEW)
논리적으로 하나 이상의 테이블에 있는 데이터의 부분 집합.
- 데이터 액세스를 제한하기 위해
- 복잡한 질의를 쉽게 작성하기 위해
- 데이터 독립성을 제공하기 위해
- 동일한 데이터로부터 다양한 결과를 얻기 위해
뷰는 가상으로 만들어진 칼럼(virtual Column)을 제외하면
수정이 가능하고 삭제도 가능하다. 수정, 삭제하면 원래 테이블에
반영,삽입은 여러 제약 조건과 virtual column  사용으로 제약이 많음

VIEW 생성
CREATE OR REPLACE VIEW emp10_view
AS SELECT empno id_member, ename name, sal*12 ann_salary FROM emp WHERE deptno=10;

SELECT * FROM emp10_view;

CREATE OR REPLACE VIEW emp_info_view
AS SELECT e.empno,e.ename,d.deptno,d.loc,d.dname
FROM emp e, dept d WHERE e.deptno = d.deptno;

SELECT * FROM emp_info_view;--마치 하나의 테이블을 보듯이.

VEIW를 통한 데이터 변경하기
일반적으로 view는 조회용으로 많이 사용되지만 아래와 같이 
데이터를 변경할 수 있음.
UPDATE emp10_view SET name='SCOTT' WHERE id_member = 7839;

가상열 때문에 등록 제한, 가상 열을 제외하면 삽입 가능.
INSERT INTO emp10_view(id_member,name,ann_salary)
VALUES (8000,'JOHN',19000);

SELECT *FROM emp10_view;
SELECT *FROM emp;

WITH READ ONLY : 읽기 전용 뷰를 생성하는 옵션

CREATE OR REPLACE VIEW emp20_view
AS SELECT empno id_number,ename name,sal*12 ann_salary
FROM emp
WHERE deptno=20
WITH READ ONLY;

UPDATE emp20_view SET name = 'DAVID' WHERE id_number = '7902'; 
읽기 전용 뷰에서는 dml작업을 수행할 수 없습니다.

VIEW의 수정
CREATE OR REPLACE VIEW emp10_view
(id_number,name,sal,department_id)
AS SELECT empno,ename,sal,deptno
FROM emp
WHERE deptno=10;

SELECT * FROM emp10_view;

VIEW 의 삭제
DROP VIEW emp10_view;

SEQUENCE : 유일한 값을 생성해주는 오라클 객체 시퀀스를 생성하면 기본키와 같이 순차적으로 증가하는 컬럼을 자동적으로 생성할 수 있음
            보통 PRIMARY KEY값을 생성하기 위해 사용.
            
시퀀스 생성
CREATE SEQUENCE test_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;
시작 값이 1이고 1씩 증가하고 최대값이 100000이 되는 시퀀스 생성

CURRVAL: 현재 값을 반환
NEXTVAL: 현재 시퀀스 값의 다른 값 반환

SELECT test_seq.nextval FROM dual;
SELECT test_seq.currval FROM dual;

sboard 테이블에 데이터를 삽입할 때 시퀀스 활용
INSERT INTO sboard(num,id,content)
VALUES(test_seq.nextval,'sky','여기서는 강남');
SELECT * FROM sboard;

시퀀스 수정
START WITH는 수정할 수 없음

ALTER SEQUENCE test_seq
INCREMENT BY 5;  --5씩 증가

시퀀스 삭제
DROP SEQUENCE test_seq;

240318
인덱스 (INDEX)
인덱스는 데이터 검색을 빨리하기 위해 사용한다.

테이블의 컬럼에 대한 제약 조건을 설정할 때 PRIMARY KEY나 UNIQUE로 설정하면 ORACLE은 자동으로 이 컬럼에 대해 UNIQUE INDEX를 설정한다.

인덱스 만들기

-유일한 값을 가지는 컬럼의 인덱스 설정 : UNIQUE INDEX
CREATE UNIQUE INDEX dname_idx ON dept (dname);

-유일한 값을 가지지 않는 컬럼에 인덱스 설정 : NON UNIQUE INDEX
CREATE INDEX emp_ename_idx ON emp (ename);\

동의어(객체의 다른 이름,별칭)를 생성하여 객체 엑세스를 단순화

동의어 생성
CREATE SYNONYM emp20 FOR emp20_view;
SELECT*FROM emp20;

동의어 삭제
DROP SYNONYM emp20;