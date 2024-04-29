PL/SQL : Procedural Language extension to Structured Query Language (SQL)의 약자
        SQL을 확장한 순차적 처리 언어
        
PL/SQL의 기본 구조
PL/SQL의 기본 단위는 블록(BLOCK)
1) 선언부 (Declarative Part) : 사용할 변수나 상수를 선언 (선언부에만 변수와 상수 선언 가능)
2) 실행부 (Executable Part) : 실제 처리할 로직을 담당하는 부분
3) 예외처리부 (Exception - building Part) : 실행부에서 로직을 처리하던 중 발생할 수 있는 각종 오류들에 대해 처리

실행부만 명시한 형태
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!'); -- System.out.print();같은 느낌
END; -- 실행부 영역을 말함

변수 사용
DECLARE
--변수를 선언할 수 있는 선언부
message VARCHAR2(100);
BEGIN
--실행부에 사용할 변수는 선언부에서 미리 선언되어야 함
message := 'Hello World!!!';
DBMS_OUTPUT.PUT_LINE(message);
END;

변수 선언 및 초기화
DECLARE
--변수 선언 및 초기화
 message VARCHAR2(100) := 'Hello Oracle';
BEGIN
 DBMS_OUTPUT.PUT_LINE(message);
END;
-------------------------------------
DECLARE
--변수 선언 후 초기화를 하지 않으면 null
 counter INTEGER :=0 ;
BEGIN
 counter := counter + 1;
 IF counter IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('RESULT : counter is null');
 END IF;
 DBMS_OUTPUT.PUT_LINE(counter);
END;
-------------------------------------
DECLARE
 --변수 선언
 counter INTEGER;
 i INTEGER;
BEGIN
 FOR i IN 1..9 LOOP
    counter := 2*i;
    DBMS_OUTPUT.PUT_LINE('2 * ' || i || '= ' || counter);
 END LOOP;
END;

예외처리부
EXCEPTION WHEN 예외1 THEN 예외처리1
          WHEN 예외2 THEN 예외처리2
          WHEN OTHERS THEN 예외처리--exception과 비슷
          
DECLARE
 --변수선언
 counter INTEGER;
BEGIN
 --변수 초기화
 counter := 10;
 counter := counter/0;
 DBMS_OUTPUT.PUT_LINE(counter);
 EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('ERROR');
END;

변수와 상수

변수
emp_num1 NUMBER(9);
grade CHAR(2);
emp_num2 INTEGER := 1;

상수
nYear CONSTANT INTEGER :=30 (o)
nYear CONSTANT INTEGER; (x)

%TYPE : 참조할 테이블에 있는 컬럼의 데이터 타입을 자동으로 가져옴.
nSal emp.sal%TYPE;

%ROWTYPE : %TYPE은 하나의 값에 대해 적용되지만, %ROWTYPE은 하나의 값 이상의 값에 대해 적용.
           로우타입 변수를 선언해서 테이블에 있는 로우를 대입
           
콜랙션

VARRAY는 VARIABLE ARRAY 의 양자로 고정길이 (Fixed NUMBER)를 가진 배열

DECLARE
 TYPE varray_test IS VARRAY(3) OF INTEGER;
 varray1 VARRAY_TEST; --위에서 선언한  VARRAY_TEST 타입 변수
BEGIN
 varray1 := VARRAY_TEST(10,20,30);
 
 DBMS_OUTPUT.PUT_LINE(varray1(1));
 DBMS_OUTPUT.PUT_LINE(varray1(2));
 DBMS_OUTPUT.PUT_LINE(varray1(3));
END;

중첩 테이블 : VARRAY 와 흡사하지만 중첩 테이블은 선언 시에 전체 크기를 명시할 필요가 없음
DECLARE
 TYPE NESTED_TEST IS TABLE OF VARCHAR2(10); --(데이터의 자료형)사이즈 명시 x 넣는 만큼 정해짐
 nested1 NESTED_TEST;
BEGIN
 nested1 := NESTED_TEST('A','B','C','D');
 
 DBMS_OUTPUT.PUT_LINE(nested1(1));
 DBMS_OUTPUT.PUT_LINE(nested1(2));
 DBMS_OUTPUT.PUT_LINE(nested1(3));
 DBMS_OUTPUT.PUT_LINE(nested1(4));
END;

ASSOCIATIVE ARRAY (INDEX-BY TABLE) : 연관 배열
        키와 값의 쌍으로 구성된 콜랙션. 하나의키는 하나의 값과 연관.

DECLARE
 TYPE ASSOC_ARRAY_NUM_TYPE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
 --                                   (밸류타입)        (키의 타입  )
 -- 키는 PLS_INTEGER형이며, 값은 NUMBER형인 요소들로 구성
 assoc1 ASSOC_ARRAY_NUM_TYPE;
BEGIN
--키와 값 저장
--키는 3, 값은 33
 assoc1(3) :=33;
 DBMS_OUTPUT.PUT_LINE(assoc1(3));
END;

레코드 : 레블의 컬럼들이 서로 다른 유형의 데이터 타입으로 구성되듯이 레코드 역시 해당 필드(레코드에서는 요소란 말 대신 필드란 용어를 사용함)들이 각기 다른 데이터 타입을 가질 수 있음.

DECLARE
--TYPE으로 선언한 레코드
 TYPE RECORD1 IS RECORD (deptno NUMBER NOT NULL :=50, dname VARCHAR2(14), loc VARCHAR2(13));
 --위에서 선언한 RECORD를 받는 변수 선언
 rec1 RECORD1;
BEGIN
--RECORD1 타입의 rec1의 dname 필드에 값 할당
rec1.dname := 'RECORD';
rec1.loc := 'SEOUL';

--rec1 레코드 값을 dept 테이블에 insert
INSERT INTO dept VALUES rec1;
COMMIT;

EXCEPTION WHEN OTHERS THEN
 ROLLBACK;

END;

IF문

DECLARE
 grade CHAR(1);

BEGIN
 --변수의 초기화
 grade := 'B';

 IF grade = 'A' THEN
  DBMS_OUTPUT.PUT_LINE('Excellent');
 ELSIF grade = 'B' THEN
  DBMS_OUTPUT.PUT_LINE('Good');
 ELSIF grade = 'C' THEN
  DBMS_OUTPUT.PUT_LINE('Fair');
 ELSIF grade = 'C' THEN
  DBMS_OUTPUT.PUT_LINE('Poor');
 END IF;
END;    

CASE문

DECLARE
 grade CHAR(1);
BEGIN
 grade := 'C';
 
 CASE grade 
  WHEN 'A' THEN
   DBMS_OUTPUT.PUT_LINE('Excellent');
  WHEN 'B' THEN
   DBMS_OUTPUT.PUT_LINE('Good');
  WHEN 'C' THEN
   DBMS_OUTPUT.PUT_LINE('Fair');
  WHEN 'D' THEN
   DBMS_OUTPUT.PUT_LINE('Poor');
  ELSE
   DBMS_OUTPUT.PUT_LINE('Not Found');
  END CASE;
END;

LOOP문

DECLARE
 --변수 선언
 test_number INTEGER;
 result_num INTEGER;

BEGIN
 test_number :=1;--초기화
 
 LOOP
  result_num :=2 * test_number;
  IF result_num > 20 THEN
   EXIT; -- 블럭종료
  ELSE
   DBMS_OUTPUT.PUT_LINE(result_num);
  END IF;
  test_number:= test_number + 1;
 END LOOP;
 --loop블럭을 빠져나오면 아래 코드를 실행함
 DBMS_OUTPUT.PUT_LINE('프로그램 끝');
END;

DECLARE
 test_number INTEGER;
 result_num INTEGER;
 
BEGIN
 --변수 초기화
 test_number:=1;
 
 LOOP
  result_num :=2 * test_number;
  
  EXIT WHEN result_num > 20;
  
  DBMS_OUTPUT.PUT_LINE(result_num);
  test_number:= test_number + 1;
 END LOOP;
END;

WHILE-LOOP문

DECLARE
 test_number INTEGER;
 result_num INTEGER;
BEGIN
 test_number := 1;
 result_num :=0;
 
 WHILE result_num< 45 LOOP
  result_num :=2 * test_number;
  DBMS_OUTPUT.PUT_LINE(result_num);
  test_number := test_number +1;
 END LOOP;
 
END;

FOR .. LOOP 문

DECLARE
 test_number INTEGER;
 result_num INTEGER;
BEGIN
 FOR test_number IN 1..10 LOOP
  result_num :=2 * test_number;
   DBMS_OUTPUT.PUT_LINE(result_num);
 END LOOP;
END;

DECLARE
 test_number INTEGER;
 result_num INTEGER;
BEGIN
 FOR test_number IN REVERSE 1..10 LOOP
  result_num :=2 * test_number;
   DBMS_OUTPUT.PUT_LINE(result_num);
 END LOOP;
END;

CURSOR (커서) : 쿼리에 의해 반환되는 결과는 메모리 상에 위치하게 되는데 PL/SQL에서는 바로 커서 (CURSOR)를 사용하여 이 결과 집합에 접근할 수 있다.

DECLARE
--커서 선언 : 커서의 이름을 주고, 이 커서가 접근하려는 쿼리를 정의
 CURSOR emp_csr IS
 SELECT empno
 FROM emp
 WHERE deptno = 10;

 emp_no emp.empno%TYPE;
BEGIN
 --커서열기 : 커서로 정의된 쿼리를 실행하는 역할
 OPEN emp_csr;
 
 LOOP
  FETCH emp_csr into emp_no;
  --%NOTFOUND : 커서에서만 사용가능한 속성 더이상 패치(할당)할 로우가 없음을 의미
  
  EXIT WHEN emp_csr%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(emp_no);
 END LOOP;
 
 --커서 닫기 : 패치 작업이 끝나면 사용된 커서를 닫는다
 CLOSE emp_csr;
END;

PL?SQL 서브프로그램

함수

입력받은 값으로부터 10%의 세율을 얻는 함수
CREATE OR REPLACE FUNCTION tax (p_value IN NUMBER)
--                        함수명 파라미터
 RETURN NUMBER --이게 없으면 함수로 인정안됨.
 --     자료형
IS

BEGIN
 RETURN p_value *0.1;--위에 리턴 자료형과 쌍을 이뤄야함.
END;

SELECT TAX(100) FROM DUAL;

SELECT empno, ename, sal, TAX(sal) tax FROM emp;

급여와 커미션을 합쳐서 세금을 계산.
CREATE OR REPLACE FUNCTION tax2(p_sal IN emp.sal%TYPE, p_comm emp.comm%TYPE)
 RETURN NUMBER
IS
BEGIN
 RETURN (p_sal + NVL(p_comm,0)) * 0.1;
END;

SELECT empno,ename,sal+NVL(comm,0) 실급여,TAX2(sal,comm) AS tax FROM emp;

급여 (커미션 포함)에 대한 세율을 다음과 같이 정의함. 급여가 월 $1,000보다 적으면세율을 5% 적용하며,$1,000이상 $2,000이하면 10%, $2,000을 초과하면 20%를 적용함
 
CREATE OR REPLACE FUNCTION tax3(p_sal IN emp.sal%type, p_comm emp.comm%TYPE)
 RETURN NUMBER
IS
--변수선언
 l_sum NUMBER;
 l_tax NUMBER;
BEGIN
 l_sum :=p_sal + NVL(p_comm,0);
 
 IF l_sum < 1000  THEN
  l_tax := l_sum * 0.05;
 ELSIF l_sum <=2000 THEN
  l_tax := l_sum * 0.1;
 ELSE
 l_tax := l_sum * 0.2;
 END IF;
  RETURN l_tax;

END;

SELECT empno, ename, sal+NVL(comm,0) 실급여, TAX3(sal,comm) Tax FROM emp;

사원번호를 통해서 급여를 알려주는 함수
CREATE OR REPLACE FUNCTION emp_salaries(emp_no NUMBER)
 RETURN NUMBER
IS
--변수 선언
 nSalaries NUMBER(9);
BEGIN
 SELECT sal
 --결과행이 단일행일 경우 INTO를 이용해서 읽어온 값을 변수에 담을 수 있음.
 INTO nSalaries
 FROM emp
 WHERE empno=emp_no;
 
 RETURN nSalaries;
END;

SELECT EMP_SALARIES(7839) FROM DUAL;
SELECT empno, ename, EMP_SALARIES(empno) FROM emp;

부서번호를 전달하면 부서명을 구할 수 있는 함수
CREATE OR REPLACE FUNCTION get_dept_name(dept_no NUMBER)
 RETURN VARCHAR2
IS
 sDeptName VARCHAR2(30);
BEGIN
 SELECT dname
 INTO sDeptName
 FROM dept
 WHERE deptno=dept_no;
 
 RETURN sDeptName;
END;

SELECT get_dept_name(10) FROM dual;
SELECT deptno, get_dept_name(deptno) "Department Name" FROM dept;
SELECT empno,ename,sal, get_dept_name(deptno) "Department Name" FROM emp;

[실습문제]
1. 두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의하시오.(add_num)
CREATE OR REPLACE FUNCTION add_num(num1 IN NUMBER, num2 IN NUMBER)
 RETURN NUMBER
 IS
BEGIN
 RETURN num1 + num2;
END;

SELECT add_num(20,50) FROM dual;
SELECT ename, add_num(sal,NVL(comm,0)) 실급여 FROM emp;

2. 부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의하시오.(get_emp_count)
CREATE OR REPLACE FUNCTION GET_EMP_COUNT(dept_no emp.deptno%TYPE)
 RETURN NUMBER
IS
 emp_count INTEGER;
BEGIN
SELECT COUNT(empno)
 INTO emp_count
 FROM emp
 WHERE deptno = dept_no;
 
 RETURN emp_count;
END;

SELECT deptno,dname,get_emp_count(deptno) FROM dept;

3. emp테이블의 입사일을 입력하면 근무연차를 구하는 함수를 정의하시오. (소수점 절삭,get_info_hiredate)
CREATE OR REPLACE FUNCTION get_info_hiredate(p_hiredate IN emp.hiredate%TYPE)
RETURN NUMBER
IS
BEGIN
  RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hiredate) / 12);
END;

4.emp테이블을 이용해서 사원번호를 입력하면 해당 사원의 관리자 이름을 구하는 함수를 정의하시오(get_mgr_name)
CREATE OR REPLACE FUNCTION get_mgr_name(p_mgr IN emp.empno%TYPE)
RETURN VARCHAR2
IS
 result VARCHAR2(100);
BEGIN
 SELECT m.ename INTO result FROM emp e, emp m WHERE m.empno = e.mgr AND e.empno = p_mgr;
 RETURN result;
END;

CREATE OR REPLACE FUNCTION get_mgr_name(p_mgr IN emp.empno%TYPE)--강사님 방법
RETURN VARCHAR2
IS
 result VARCHAR2(10);
BEGIN
 SELECT ename 
 INTO result
 FROM emp
 WHERE empno = (SELECT mgr FROM emp WHERE empno = p_mgr);
 RETURN result;
END;

CREATE OR REPLACE FUNCTION get_mgr_name(emp_no emp.empno%TYPE)--2
 RETURN VARCHAR2
IS
 m_name VARCHAR2(10);
BEGIN
 SELECT m.ename 
 INTO m_name 
 FROM emp e, emp m 
 WHERE e.mgr = m.empno AND e.empno = emp_no;
 
 RETURN m_name;
END;


SELECT GET_MGR_NAME(7654) FROM emp;
5.emp테이블을 이용해서 사원번호를 입력하면 급여 등급을 구하는 함수를 정의하시오.(get_sal_grade)
CREATE OR REPLACE FUNCTION get_sal_grade(p_empno IN NUMBER)
RETURN VARCHAR2
 IS
 result VARCHAR(100);
BEGIN

 SELECT s.grade
 INTO result
 FROM emp e JOIN salgrade s
 ON e.sal BETWEEN s.losal AND s.hisal
 WHERE p_empno = e.empno;

RETURN result;
END;

CREATE OR REPLACE FUNCTION get_sal_grade(emp_no emp.empno%TYPE)--강사님 
 RETURN CHAR
IS
 sgrade CHAR(1);
BEGIN
 SELECT CASE WHEN sal>=4000 THEN 'A'
             WHEN sal>=3000 AND sal < 4000 THEN 'B'
             WHEN sal>=2000 AND sal < 3000 THEN 'C'
             WHEN sal>=1000 AND sal < 2000 THEN 'D'
             ELSE 'F'
        END grade
 INTO sgrade
 FROM emp
 WHERE empno = emp_no;
 
 RETURN sgrade;
END;

SELECT get_sal_grade(7654) FROM emp;

6.사원 번호를 입력하면 근무지를 구하는 함수 (find_loc)
CREATE OR REPLACE FUNCTION find_loc(emp_no emp.empno%TYPE)
 RETURN VARCHAR2
IS
 loc1 VARCHAR2(10);
BEGIN
 SELECT loc
 INTO loc1
 FROM dept 
 WHERE deptno = (SELECT deptno FROM emp WHERE emp_no = empno);
 
 RETURN loc1;
END;

SELECT find_loc(7654) FROM dual;

CREATE OR REPLACE FUNCTION find_loc(emp_no emp.empno%TYPE)--강사님
 RETURN VARCHAR2
IS
 loc1 VARCHAR2(10);
BEGIN
 SELECT d.loc
 INTO loc1
 FROM emp e JOIN dept d
 ON e.deptno = d.deptno
 WHERE e.empno = emp_no;
 
 RETURN loc1;
END;

생성된 함수 확인하기 
데이터 사전(DATA Dictionary)을 통해 검색. 데이터 사전에 저장된 모든 값은 대문자로 저장되기 때문에 대문자로 검색

SELECT object_name,object_type FROM user_objects
WHERE object_type='FUNCTION';

작성된 함수의 소스 코드 확인
SELECT text FROM user_source
WHERE type='FUNCTION' AND name = 'TAX';

프로시저
CREATE OR REPLACE PROCEDURE hello_world
IS
--변수선언
 message VARCHAR2(100);
BEGIN
 message := 'Hello World~~';
 DBMS_OUTPUT.PUT_LINE(message);
END;

프로시저 실행
EXECUTE HELLO_WORLD;

CREATE OR REPLACE PROCEDURE hello_oracle(p_message IN VARCHAR2)
IS
BEGIN
 DBMS_OUTPUT.PUT_LINE(p_message);
END;

EXEC HELLO_ORACLE('KOREA');

작성된 Stored Procedure 확인
SELECT object_name,object_type
FROM user_objects
WHERE object_type = 'PROCEDURE';

작성된 Procedure의 소스코드 확인
SELECT text
FROM user_source
WHERE type = 'PROCEDURE' AND name = 'HELLO_ORACLE';

부서 테이블에 부서 정보를 입력하는 프로시저를 생성
CREATE OR REPLACE PROCEDURE add_department(p_deptno IN dept.deptno%TYPE, p_dname IN dept.dname%TYPE, p_loc IN dept.loc%TYPE)
IS
BEGIN
--파라미터 변수에 입력받은 값으로 부서 (dept)테이블의 각 컬럼에 데이터를 추가한 다음 정상적으로 트랜잭션 종료
 INSERT INTO dept
 VALUES (p_deptno,p_dname,p_loc);
 COMMIT;
 EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(p_dname || ' register is failed');
    ROLLBACK;
END;

EXEC ADD_DEPARTMENT(60,'IT SERVICE','BUSAN');
SELECT*FROM DEPT;

사원테이블에 사원 정보를 저장
CREATE OR REPLACE PROCEDURE register_emp(e_empno IN emp.empno%TYPE, 
                                         e_ename IN emp.ename%TYPE,
                                         e_job IN emp.job%TYPE, 
                                         e_mgr IN emp.mgr%TYPE, 
                                         e_sal IN emp.sal%TYPE, 
                                         e_comm IN emp.comm%TYPE, 
                                         e_deptno IN emp.deptno%TYPE)
IS
BEGIN
 INSERT INTO emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
 VALUES (e_empno,e_ename,e_job,e_mgr,SYSDATE,e_sal,e_comm,e_deptno);
 COMMIT;
 EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(e_ename || ' register failed');
  ROLLBACK;
END;

EXEC REGISTER_EMP(9000,'PETER','MANAGER',7902,6000,200,30);
SELECT* FROM emp;

부서번호를 통해서 부서명과 부서 위치 구하기
CREATE OR REPLACE PROCEDURE output_department(p_dept_no IN dept.deptno%TYPE)
IS
 --변수선언
 d_dname dept.dname%TYPE;
 d_loc dept.loc%TYPE;
BEGIN
 --파라미터 변수로부터 부서번호를 받아 해당 부서의 정보 질의
 SELECT dname,loc
 INTO d_dname,d_loc
 FROM dept
 WHERE deptno = p_dept_no;
 
 DBMS_OUTPUT.PUT_LINE(d_dname||', '||d_loc);
END;

EXEC OUTPUT_DEPARTMENT(10);

사원의 입사한 연도를 입력해서 사원정보 구하기
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
 --%ROWTYPE으로 데이터 타입이 지정되어 있는 사원테이블(EMP)의 하나의 행이 가지는 모든 컬럼의 데이터 타입을 가져옴.
 e_emp emp%ROWTYPE;
BEGIN
 SELECT empno,ename,sal
 --단일행일 경우에 INTO를 사용할 수 있지만
 --다중행일 경우에는 오류 발생.(다중행일 경우 커서를 사용해야 함)
 INTO e_emp.empno,e_emp.ename,e_emp.sal
 FROM emp
 WHERE TO_CHAR(hiredate,'YYYY')=p_year;
 
 DBMS_OUTPUT.PUT_LINE(e_emp.empno|| ', ' || e_emp.ename|| ', ' || e_emp.sal);
END;

하나의 행이 반환되어 에러가 발생하지 않음
EXEC INFO_HIREDATE(1980);
여러개의 행이 반환되어 에러발생
EXEC INFO_HIREDATE(1981);

커서를 이용하여 질의 수행 결과 반환되는 여러행 처리
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
 e_emp emp%ROWTYPE;
 --커서 선언
 CURSOR emp_cur IS
 SELECT empno,ename,sal
 FROM emp
 WHERE TO_CHAR(hiredate,'YYYY')=p_year;
BEGIN
 --커서 열기
 OPEN emp_cur;
 
 --커서로부터 데이터 읽기
 LOOP
  FETCH emp_cur INTO e_emp.empno,e_emp.ename,e_emp.sal;
  EXIT WHEN emp_cur%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(e_emp.empno|| ', ' || e_emp.ename|| ', ' || e_emp.sal);
 END LOOP;
 --커서 닫기
 CLOSE emp_cur;
END;

EXEC INFO_HIREDATE(1981);

SALES 부서에 속한 사원의 정보 보기
CREATE OR REPLACE PROCEDURE emp_info(p_dept dept.dname%TYPE)
IS
 --커서 선언
 CURSOR emp_cur IS
 SELECT empno,ename
 FROM emp e JOIN dept d
 ON e.deptno=d.deptno
 WHERE dname = UPPER(p_dept);
 --변수선언
 e_empno emp.empno%TYPE;
 e_ename emp.ename%TYPE;
BEGIN
    OPEN emp_cur;
    --커서로부터 데이터 읽기
    LOOP
    FETCH emp_cur INTO e_empno,e_ename;
    EXIT WHEN emp_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(e_empno || ', ' || e_ename);
    
    END LOOP;
    CLOSE emp_cur;
END;

EXEC EMP_INFO('SALES');

[실습문제]
1. 업무(JOB)을 입력하여 해당 업무를 수행하는 사원들의 사원번호,이름,급여, 업무를 출력하시오.
CREATE OR REPLACE PROCEDURE JOB_info(emp_job IN emp.job%TYPE)
IS
 CURSOR emp_csr IS
 SELECT empno,ename,sal,job
 FROM emp
 WHERE job= emp_job;
 
 e_emp emp%ROWTYPE;
BEGIN
 OPEN emp_csr;
    LOOP
        FETCH emp_csr INTO e_emp.empno,e_emp.ename,e_emp.sal,e_emp.job;
        EXIT WHEN emp_csr%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_emp.empno || ', ' || e_emp.ename || ', ' || e_emp.sal || ', ' || e_emp.job);
    END LOOP;
 CLOSE emp_csr;
END;

EXEC JOB_INFO('MANAGER');

2.사원번호와 새 업무를 입력하면 EMP테이블의 해당 사원의 업무를 갱신할 수 있는 프로시저를 작성하시오.
CREATE OR REPLACE PROCEDURE job_upt(p_empno IN emp.empno%TYPE, p_job IN emp.job%TYPE)
IS
BEGIN
 UPDATE emp SET job = p_job WHERE empno = p_empno;
 COMMIT;
 EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('UPDATE FAILD');
  ROLLBACK;
END;

EXEC JOB_UPT(7654, 'MANAGER');

CREATE TABLE book(
 bookid INTEGER PRIMARY KEY,
 bookname VARCHAR2(60) NOT NULL,
 publisher VARCHAR2(60) NOT NULL,
 price NUMBER NOT NULL
 );
 
INSERT INTO book VALUES (1,'자바를 찾아서','서울',30000);
INSERT INTO book VALUES (2,'도시','천국',10000);
INSERT INTO book VALUES (3,'하늘','신라',50000);
COMMIT;

SELECT * FROM book;

동일한 도서가 있는지 점검한 후 동일한 도서가 없으면 삽입하고, 동일한 도서가 있으면 가격을 업데이트하는 프로시저를 작성하시오.
(book_info)
CREATE OR REPLACE PROCEDURE book_info(mybookid book.bookid%TYPE,
                                      mybookname book.bookname%TYPE,
                                      mypublisher book.publisher%TYPE,
                                      myprice book.price%TYPE)
IS
 --변수 선언
 mycount NUMBER;
BEGIN
 SELECT COUNT(*) INTO mycount FROM book --있으면 1 없으면 0 반환
 WHERE bookname = mybookname;
 IF mycount!=0 THEN
  --도서 존재하는경우
  UPDATE book SET price = myprice WHERE bookname = mybookname;
 ELSE
  INSERT INTO book (bookid,bookname,publisher,price) VALUES (mybookid,mybookname,mypublisher,myprice);
 END IF;
 COMMIT;
 EXCEPTION WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('ERROR');
 ROLLBACK;
END;

EXEC BOOK_INFO(4,'스포츠','쿨서울',20000);
SELECT * FROM book;
EXEC BOOK_INFO(5,'도시','천국',50000);

240320
패키지(Package)
패키지는 업무와 관련된Stored Procedure 및 Stored Function을 관리하고, 이를 패키지 단위로 배포할 때 유용하게 사용됨.

패키지는 선언부와 본문으로 구분

선언부 생성

CREATE OR REPLACE PACKAGE employee_pkg AS 
 PROCEDURE print_ename(p_empno NUMBER);
 PROCEDURE print_sal(p_empno NUMBER);
END employee_pkg;

본문 생성
CREATE OR REPLACE PACKAGE BODY employee_pkg AS
 PROCEDURE print_ename(p_empno NUMBER) IS
  e_name emp.ename%TYPE;
 BEGIN
  SELECT ename
  INTO e_name
  FROM emp
  WHERE empno=p_empno;
  DBMS_OUTPUT.PUT_LINE(e_name);
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('invaild Employee Number');
 END print_ename;

 PROCEDURE print_sal(p_empno NUMBER) IS
  e_sal emp.sal%TYPE;
 BEGIN
  SELECT sal
  INTO e_sal
  FROM emp
  WHERE empno = p_empno;
  DBMS_OUTPUT.PUT_LINE(e_sal);
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('invaild Employee Number');
 END print_sal;
END employee_pkg;

실행
EXECUTE EMPLOYEE_PKG.PRINT_ENAME(7369);
EXECUTE EMPLOYEE_PKG.PRINT_SAL(7369);
EXECUTE EMPLOYEE_PKG.PRINT_ENAME(8000);

트리거(Trigger)
트리거는 데이터의 변형(INSERT,DELETE,UPDATE)문이 실행될 때 자동으로 같이 실행되는 프로시저를 말함. 오라클은 기본적으로 실행전(BEFORE)과 실행후(AFTER) 트리거 지원 

CREATE OR REPLACE TRIGGER print_message
AFTER INSERT ON dept
BEGIN
 DBMS_OUTPUT.PUT_LINE('DEPT 테이블에 정상적으로 데이터가 추가되었습니다.');
END;

트리거를 생성한 후 DEPT테이블에 데이터를 추가하면 등록된 트리거가 동작하면서
'DEPT 테이블에 데이터가 추가되었습니다.'를 출력

INSERT INTO dept VALUES(70,'EDUCATION','JEJU');
COMMIT;

book 테이블에 데이터를 저장하면 book_log에 같은 데이터를 저장하는 트리거 생성

CREATE TABLE book_log(
 bookid_lo NUMBER,
 bookname_lo VARCHAR2(60),
 publisher_lo VARCHAR2(60),
 price_lo NUMBER
);

CREATE OR REPLACE TRIGGER afterinsertbook
--FOR EACH ROW는 매번 추가되는 행의 수 만큼 트리거 발생
 AFTER INSERT ON book FOR EACH ROW
 BEGIN
  INSERT INTO book_log
  --:new. 컬럼이름의 형식으로 추가, 수정할 떄 해당 컬럼의 새로운 값을 저장함.
  VALUES (:new.bookid,:new.bookname,:new.publisher,:new.price);
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('삽입한 데이터를 book_log 테이블에 백업했습니다.');
  EXCEPTION WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('ERROR!');
   ROLLBACK;
 END;

INSERT INTO book VALUES (6,'미국 여행','아메리카 미디어',10000);
SELECT *FROM BOOK;

































