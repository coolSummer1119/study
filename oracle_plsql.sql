PL/SQL : Procedural Language extension to Structured Query Language (SQL)�� ����
        SQL�� Ȯ���� ������ ó�� ���
        
PL/SQL�� �⺻ ����
PL/SQL�� �⺻ ������ ���(BLOCK)
1) ����� (Declarative Part) : ����� ������ ����� ���� (����ο��� ������ ��� ���� ����)
2) ����� (Executable Part) : ���� ó���� ������ ����ϴ� �κ�
3) ����ó���� (Exception - building Part) : ����ο��� ������ ó���ϴ� �� �߻��� �� �ִ� ���� �����鿡 ���� ó��

����θ� ����� ����
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!'); -- System.out.print();���� ����
END; -- ����� ������ ����

���� ���
DECLARE
--������ ������ �� �ִ� �����
message VARCHAR2(100);
BEGIN
--����ο� ����� ������ ����ο��� �̸� ����Ǿ�� ��
message := 'Hello World!!!';
DBMS_OUTPUT.PUT_LINE(message);
END;

���� ���� �� �ʱ�ȭ
DECLARE
--���� ���� �� �ʱ�ȭ
 message VARCHAR2(100) := 'Hello Oracle';
BEGIN
 DBMS_OUTPUT.PUT_LINE(message);
END;
-------------------------------------
DECLARE
--���� ���� �� �ʱ�ȭ�� ���� ������ null
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
 --���� ����
 counter INTEGER;
 i INTEGER;
BEGIN
 FOR i IN 1..9 LOOP
    counter := 2*i;
    DBMS_OUTPUT.PUT_LINE('2 * ' || i || '= ' || counter);
 END LOOP;
END;

����ó����
EXCEPTION WHEN ����1 THEN ����ó��1
          WHEN ����2 THEN ����ó��2
          WHEN OTHERS THEN ����ó��--exception�� ���
          
DECLARE
 --��������
 counter INTEGER;
BEGIN
 --���� �ʱ�ȭ
 counter := 10;
 counter := counter/0;
 DBMS_OUTPUT.PUT_LINE(counter);
 EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('ERROR');
END;

������ ���

����
emp_num1 NUMBER(9);
grade CHAR(2);
emp_num2 INTEGER := 1;

���
nYear CONSTANT INTEGER :=30 (o)
nYear CONSTANT INTEGER; (x)

%TYPE : ������ ���̺� �ִ� �÷��� ������ Ÿ���� �ڵ����� ������.
nSal emp.sal%TYPE;

%ROWTYPE : %TYPE�� �ϳ��� ���� ���� ���������, %ROWTYPE�� �ϳ��� �� �̻��� ���� ���� ����.
           �ο�Ÿ�� ������ �����ؼ� ���̺� �ִ� �ο츦 ����
           
�ݷ���

VARRAY�� VARIABLE ARRAY �� ���ڷ� �������� (Fixed NUMBER)�� ���� �迭

DECLARE
 TYPE varray_test IS VARRAY(3) OF INTEGER;
 varray1 VARRAY_TEST; --������ ������  VARRAY_TEST Ÿ�� ����
BEGIN
 varray1 := VARRAY_TEST(10,20,30);
 
 DBMS_OUTPUT.PUT_LINE(varray1(1));
 DBMS_OUTPUT.PUT_LINE(varray1(2));
 DBMS_OUTPUT.PUT_LINE(varray1(3));
END;

��ø ���̺� : VARRAY �� ��������� ��ø ���̺��� ���� �ÿ� ��ü ũ�⸦ ����� �ʿ䰡 ����
DECLARE
 TYPE NESTED_TEST IS TABLE OF VARCHAR2(10); --(�������� �ڷ���)������ ��� x �ִ� ��ŭ ������
 nested1 NESTED_TEST;
BEGIN
 nested1 := NESTED_TEST('A','B','C','D');
 
 DBMS_OUTPUT.PUT_LINE(nested1(1));
 DBMS_OUTPUT.PUT_LINE(nested1(2));
 DBMS_OUTPUT.PUT_LINE(nested1(3));
 DBMS_OUTPUT.PUT_LINE(nested1(4));
END;

ASSOCIATIVE ARRAY (INDEX-BY TABLE) : ���� �迭
        Ű�� ���� ������ ������ �ݷ���. �ϳ���Ű�� �ϳ��� ���� ����.

DECLARE
 TYPE ASSOC_ARRAY_NUM_TYPE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
 --                                   (���Ÿ��)        (Ű�� Ÿ��  )
 -- Ű�� PLS_INTEGER���̸�, ���� NUMBER���� ��ҵ�� ����
 assoc1 ASSOC_ARRAY_NUM_TYPE;
BEGIN
--Ű�� �� ����
--Ű�� 3, ���� 33
 assoc1(3) :=33;
 DBMS_OUTPUT.PUT_LINE(assoc1(3));
END;

���ڵ� : ������ �÷����� ���� �ٸ� ������ ������ Ÿ������ �����ǵ��� ���ڵ� ���� �ش� �ʵ�(���ڵ忡���� ��Ҷ� �� ��� �ʵ�� �� �����)���� ���� �ٸ� ������ Ÿ���� ���� �� ����.

DECLARE
--TYPE���� ������ ���ڵ�
 TYPE RECORD1 IS RECORD (deptno NUMBER NOT NULL :=50, dname VARCHAR2(14), loc VARCHAR2(13));
 --������ ������ RECORD�� �޴� ���� ����
 rec1 RECORD1;
BEGIN
--RECORD1 Ÿ���� rec1�� dname �ʵ忡 �� �Ҵ�
rec1.dname := 'RECORD';
rec1.loc := 'SEOUL';

--rec1 ���ڵ� ���� dept ���̺� insert
INSERT INTO dept VALUES rec1;
COMMIT;

EXCEPTION WHEN OTHERS THEN
 ROLLBACK;

END;

IF��

DECLARE
 grade CHAR(1);

BEGIN
 --������ �ʱ�ȭ
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

CASE��

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

LOOP��

DECLARE
 --���� ����
 test_number INTEGER;
 result_num INTEGER;

BEGIN
 test_number :=1;--�ʱ�ȭ
 
 LOOP
  result_num :=2 * test_number;
  IF result_num > 20 THEN
   EXIT; -- ������
  ELSE
   DBMS_OUTPUT.PUT_LINE(result_num);
  END IF;
  test_number:= test_number + 1;
 END LOOP;
 --loop���� ���������� �Ʒ� �ڵ带 ������
 DBMS_OUTPUT.PUT_LINE('���α׷� ��');
END;

DECLARE
 test_number INTEGER;
 result_num INTEGER;
 
BEGIN
 --���� �ʱ�ȭ
 test_number:=1;
 
 LOOP
  result_num :=2 * test_number;
  
  EXIT WHEN result_num > 20;
  
  DBMS_OUTPUT.PUT_LINE(result_num);
  test_number:= test_number + 1;
 END LOOP;
END;

WHILE-LOOP��

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

FOR .. LOOP ��

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

CURSOR (Ŀ��) : ������ ���� ��ȯ�Ǵ� ����� �޸� �� ��ġ�ϰ� �Ǵµ� PL/SQL������ �ٷ� Ŀ�� (CURSOR)�� ����Ͽ� �� ��� ���տ� ������ �� �ִ�.

DECLARE
--Ŀ�� ���� : Ŀ���� �̸��� �ְ�, �� Ŀ���� �����Ϸ��� ������ ����
 CURSOR emp_csr IS
 SELECT empno
 FROM emp
 WHERE deptno = 10;

 emp_no emp.empno%TYPE;
BEGIN
 --Ŀ������ : Ŀ���� ���ǵ� ������ �����ϴ� ����
 OPEN emp_csr;
 
 LOOP
  FETCH emp_csr into emp_no;
  --%NOTFOUND : Ŀ�������� ��밡���� �Ӽ� ���̻� ��ġ(�Ҵ�)�� �ο찡 ������ �ǹ�
  
  EXIT WHEN emp_csr%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(emp_no);
 END LOOP;
 
 --Ŀ�� �ݱ� : ��ġ �۾��� ������ ���� Ŀ���� �ݴ´�
 CLOSE emp_csr;
END;

PL?SQL �������α׷�

�Լ�

�Է¹��� �����κ��� 10%�� ������ ��� �Լ�
CREATE OR REPLACE FUNCTION tax (p_value IN NUMBER)
--                        �Լ��� �Ķ����
 RETURN NUMBER --�̰� ������ �Լ��� �����ȵ�.
 --     �ڷ���
IS

BEGIN
 RETURN p_value *0.1;--���� ���� �ڷ����� ���� �̷����.
END;

SELECT TAX(100) FROM DUAL;

SELECT empno, ename, sal, TAX(sal) tax FROM emp;

�޿��� Ŀ�̼��� ���ļ� ������ ���.
CREATE OR REPLACE FUNCTION tax2(p_sal IN emp.sal%TYPE, p_comm emp.comm%TYPE)
 RETURN NUMBER
IS
BEGIN
 RETURN (p_sal + NVL(p_comm,0)) * 0.1;
END;

SELECT empno,ename,sal+NVL(comm,0) �Ǳ޿�,TAX2(sal,comm) AS tax FROM emp;

�޿� (Ŀ�̼� ����)�� ���� ������ ������ ���� ������. �޿��� �� $1,000���� �����鼼���� 5% �����ϸ�,$1,000�̻� $2,000���ϸ� 10%, $2,000�� �ʰ��ϸ� 20%�� ������
 
CREATE OR REPLACE FUNCTION tax3(p_sal IN emp.sal%type, p_comm emp.comm%TYPE)
 RETURN NUMBER
IS
--��������
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

SELECT empno, ename, sal+NVL(comm,0) �Ǳ޿�, TAX3(sal,comm) Tax FROM emp;

�����ȣ�� ���ؼ� �޿��� �˷��ִ� �Լ�
CREATE OR REPLACE FUNCTION emp_salaries(emp_no NUMBER)
 RETURN NUMBER
IS
--���� ����
 nSalaries NUMBER(9);
BEGIN
 SELECT sal
 --������� �������� ��� INTO�� �̿��ؼ� �о�� ���� ������ ���� �� ����.
 INTO nSalaries
 FROM emp
 WHERE empno=emp_no;
 
 RETURN nSalaries;
END;

SELECT EMP_SALARIES(7839) FROM DUAL;
SELECT empno, ename, EMP_SALARIES(empno) FROM emp;

�μ���ȣ�� �����ϸ� �μ����� ���� �� �ִ� �Լ�
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

[�ǽ�����]
1. �� ���ڸ� �����ϸ� ������ �ؼ� ������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.(add_num)
CREATE OR REPLACE FUNCTION add_num(num1 IN NUMBER, num2 IN NUMBER)
 RETURN NUMBER
 IS
BEGIN
 RETURN num1 + num2;
END;

SELECT add_num(20,50) FROM dual;
SELECT ename, add_num(sal,NVL(comm,0)) �Ǳ޿� FROM emp;

2. �μ���ȣ�� �Է��ϸ� �ش� �μ����� �ٹ��ϴ� ��� ���� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.(get_emp_count)
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

3. emp���̺��� �Ի����� �Է��ϸ� �ٹ������� ���ϴ� �Լ��� �����Ͻÿ�. (�Ҽ��� ����,get_info_hiredate)
CREATE OR REPLACE FUNCTION get_info_hiredate(p_hiredate IN emp.hiredate%TYPE)
RETURN NUMBER
IS
BEGIN
  RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hiredate) / 12);
END;

4.emp���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ� �ش� ����� ������ �̸��� ���ϴ� �Լ��� �����Ͻÿ�(get_mgr_name)
CREATE OR REPLACE FUNCTION get_mgr_name(p_mgr IN emp.empno%TYPE)
RETURN VARCHAR2
IS
 result VARCHAR2(100);
BEGIN
 SELECT m.ename INTO result FROM emp e, emp m WHERE m.empno = e.mgr AND e.empno = p_mgr;
 RETURN result;
END;

CREATE OR REPLACE FUNCTION get_mgr_name(p_mgr IN emp.empno%TYPE)--����� ���
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
5.emp���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ� �޿� ����� ���ϴ� �Լ��� �����Ͻÿ�.(get_sal_grade)
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

CREATE OR REPLACE FUNCTION get_sal_grade(emp_no emp.empno%TYPE)--����� 
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

6.��� ��ȣ�� �Է��ϸ� �ٹ����� ���ϴ� �Լ� (find_loc)
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

CREATE OR REPLACE FUNCTION find_loc(emp_no emp.empno%TYPE)--�����
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

������ �Լ� Ȯ���ϱ� 
������ ����(DATA Dictionary)�� ���� �˻�. ������ ������ ����� ��� ���� �빮�ڷ� ����Ǳ� ������ �빮�ڷ� �˻�

SELECT object_name,object_type FROM user_objects
WHERE object_type='FUNCTION';

�ۼ��� �Լ��� �ҽ� �ڵ� Ȯ��
SELECT text FROM user_source
WHERE type='FUNCTION' AND name = 'TAX';

���ν���
CREATE OR REPLACE PROCEDURE hello_world
IS
--��������
 message VARCHAR2(100);
BEGIN
 message := 'Hello World~~';
 DBMS_OUTPUT.PUT_LINE(message);
END;

���ν��� ����
EXECUTE HELLO_WORLD;

CREATE OR REPLACE PROCEDURE hello_oracle(p_message IN VARCHAR2)
IS
BEGIN
 DBMS_OUTPUT.PUT_LINE(p_message);
END;

EXEC HELLO_ORACLE('KOREA');

�ۼ��� Stored Procedure Ȯ��
SELECT object_name,object_type
FROM user_objects
WHERE object_type = 'PROCEDURE';

�ۼ��� Procedure�� �ҽ��ڵ� Ȯ��
SELECT text
FROM user_source
WHERE type = 'PROCEDURE' AND name = 'HELLO_ORACLE';

�μ� ���̺� �μ� ������ �Է��ϴ� ���ν����� ����
CREATE OR REPLACE PROCEDURE add_department(p_deptno IN dept.deptno%TYPE, p_dname IN dept.dname%TYPE, p_loc IN dept.loc%TYPE)
IS
BEGIN
--�Ķ���� ������ �Է¹��� ������ �μ� (dept)���̺��� �� �÷��� �����͸� �߰��� ���� ���������� Ʈ����� ����
 INSERT INTO dept
 VALUES (p_deptno,p_dname,p_loc);
 COMMIT;
 EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(p_dname || ' register is failed');
    ROLLBACK;
END;

EXEC ADD_DEPARTMENT(60,'IT SERVICE','BUSAN');
SELECT*FROM DEPT;

������̺� ��� ������ ����
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

�μ���ȣ�� ���ؼ� �μ���� �μ� ��ġ ���ϱ�
CREATE OR REPLACE PROCEDURE output_department(p_dept_no IN dept.deptno%TYPE)
IS
 --��������
 d_dname dept.dname%TYPE;
 d_loc dept.loc%TYPE;
BEGIN
 --�Ķ���� �����κ��� �μ���ȣ�� �޾� �ش� �μ��� ���� ����
 SELECT dname,loc
 INTO d_dname,d_loc
 FROM dept
 WHERE deptno = p_dept_no;
 
 DBMS_OUTPUT.PUT_LINE(d_dname||', '||d_loc);
END;

EXEC OUTPUT_DEPARTMENT(10);

����� �Ի��� ������ �Է��ؼ� ������� ���ϱ�
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
 --%ROWTYPE���� ������ Ÿ���� �����Ǿ� �ִ� ������̺�(EMP)�� �ϳ��� ���� ������ ��� �÷��� ������ Ÿ���� ������.
 e_emp emp%ROWTYPE;
BEGIN
 SELECT empno,ename,sal
 --�������� ��쿡 INTO�� ����� �� ������
 --�������� ��쿡�� ���� �߻�.(�������� ��� Ŀ���� ����ؾ� ��)
 INTO e_emp.empno,e_emp.ename,e_emp.sal
 FROM emp
 WHERE TO_CHAR(hiredate,'YYYY')=p_year;
 
 DBMS_OUTPUT.PUT_LINE(e_emp.empno|| ', ' || e_emp.ename|| ', ' || e_emp.sal);
END;

�ϳ��� ���� ��ȯ�Ǿ� ������ �߻����� ����
EXEC INFO_HIREDATE(1980);
�������� ���� ��ȯ�Ǿ� �����߻�
EXEC INFO_HIREDATE(1981);

Ŀ���� �̿��Ͽ� ���� ���� ��� ��ȯ�Ǵ� ������ ó��
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
 e_emp emp%ROWTYPE;
 --Ŀ�� ����
 CURSOR emp_cur IS
 SELECT empno,ename,sal
 FROM emp
 WHERE TO_CHAR(hiredate,'YYYY')=p_year;
BEGIN
 --Ŀ�� ����
 OPEN emp_cur;
 
 --Ŀ���κ��� ������ �б�
 LOOP
  FETCH emp_cur INTO e_emp.empno,e_emp.ename,e_emp.sal;
  EXIT WHEN emp_cur%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(e_emp.empno|| ', ' || e_emp.ename|| ', ' || e_emp.sal);
 END LOOP;
 --Ŀ�� �ݱ�
 CLOSE emp_cur;
END;

EXEC INFO_HIREDATE(1981);

SALES �μ��� ���� ����� ���� ����
CREATE OR REPLACE PROCEDURE emp_info(p_dept dept.dname%TYPE)
IS
 --Ŀ�� ����
 CURSOR emp_cur IS
 SELECT empno,ename
 FROM emp e JOIN dept d
 ON e.deptno=d.deptno
 WHERE dname = UPPER(p_dept);
 --��������
 e_empno emp.empno%TYPE;
 e_ename emp.ename%TYPE;
BEGIN
    OPEN emp_cur;
    --Ŀ���κ��� ������ �б�
    LOOP
    FETCH emp_cur INTO e_empno,e_ename;
    EXIT WHEN emp_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(e_empno || ', ' || e_ename);
    
    END LOOP;
    CLOSE emp_cur;
END;

EXEC EMP_INFO('SALES');

[�ǽ�����]
1. ����(JOB)�� �Է��Ͽ� �ش� ������ �����ϴ� ������� �����ȣ,�̸�,�޿�, ������ ����Ͻÿ�.
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

2.�����ȣ�� �� ������ �Է��ϸ� EMP���̺��� �ش� ����� ������ ������ �� �ִ� ���ν����� �ۼ��Ͻÿ�.
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
 
INSERT INTO book VALUES (1,'�ڹٸ� ã�Ƽ�','����',30000);
INSERT INTO book VALUES (2,'����','õ��',10000);
INSERT INTO book VALUES (3,'�ϴ�','�Ŷ�',50000);
COMMIT;

SELECT * FROM book;

������ ������ �ִ��� ������ �� ������ ������ ������ �����ϰ�, ������ ������ ������ ������ ������Ʈ�ϴ� ���ν����� �ۼ��Ͻÿ�.
(book_info)
CREATE OR REPLACE PROCEDURE book_info(mybookid book.bookid%TYPE,
                                      mybookname book.bookname%TYPE,
                                      mypublisher book.publisher%TYPE,
                                      myprice book.price%TYPE)
IS
 --���� ����
 mycount NUMBER;
BEGIN
 SELECT COUNT(*) INTO mycount FROM book --������ 1 ������ 0 ��ȯ
 WHERE bookname = mybookname;
 IF mycount!=0 THEN
  --���� �����ϴ°��
  UPDATE book SET price = myprice WHERE bookname = mybookname;
 ELSE
  INSERT INTO book (bookid,bookname,publisher,price) VALUES (mybookid,mybookname,mypublisher,myprice);
 END IF;
 COMMIT;
 EXCEPTION WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('ERROR');
 ROLLBACK;
END;

EXEC BOOK_INFO(4,'������','�𼭿�',20000);
SELECT * FROM book;
EXEC BOOK_INFO(5,'����','õ��',50000);

240320
��Ű��(Package)
��Ű���� ������ ���õ�Stored Procedure �� Stored Function�� �����ϰ�, �̸� ��Ű�� ������ ������ �� �����ϰ� ����.

��Ű���� ����ο� �������� ����

����� ����

CREATE OR REPLACE PACKAGE employee_pkg AS 
 PROCEDURE print_ename(p_empno NUMBER);
 PROCEDURE print_sal(p_empno NUMBER);
END employee_pkg;

���� ����
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

����
EXECUTE EMPLOYEE_PKG.PRINT_ENAME(7369);
EXECUTE EMPLOYEE_PKG.PRINT_SAL(7369);
EXECUTE EMPLOYEE_PKG.PRINT_ENAME(8000);

Ʈ����(Trigger)
Ʈ���Ŵ� �������� ����(INSERT,DELETE,UPDATE)���� ����� �� �ڵ����� ���� ����Ǵ� ���ν����� ����. ����Ŭ�� �⺻������ ������(BEFORE)�� ������(AFTER) Ʈ���� ���� 

CREATE OR REPLACE TRIGGER print_message
AFTER INSERT ON dept
BEGIN
 DBMS_OUTPUT.PUT_LINE('DEPT ���̺� ���������� �����Ͱ� �߰��Ǿ����ϴ�.');
END;

Ʈ���Ÿ� ������ �� DEPT���̺� �����͸� �߰��ϸ� ��ϵ� Ʈ���Ű� �����ϸ鼭
'DEPT ���̺� �����Ͱ� �߰��Ǿ����ϴ�.'�� ���

INSERT INTO dept VALUES(70,'EDUCATION','JEJU');
COMMIT;

book ���̺� �����͸� �����ϸ� book_log�� ���� �����͸� �����ϴ� Ʈ���� ����

CREATE TABLE book_log(
 bookid_lo NUMBER,
 bookname_lo VARCHAR2(60),
 publisher_lo VARCHAR2(60),
 price_lo NUMBER
);

CREATE OR REPLACE TRIGGER afterinsertbook
--FOR EACH ROW�� �Ź� �߰��Ǵ� ���� �� ��ŭ Ʈ���� �߻�
 AFTER INSERT ON book FOR EACH ROW
 BEGIN
  INSERT INTO book_log
  --:new. �÷��̸��� �������� �߰�, ������ �� �ش� �÷��� ���ο� ���� ������.
  VALUES (:new.bookid,:new.bookname,:new.publisher,:new.price);
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('������ �����͸� book_log ���̺� ����߽��ϴ�.');
  EXCEPTION WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('ERROR!');
   ROLLBACK;
 END;

INSERT INTO book VALUES (6,'�̱� ����','�Ƹ޸�ī �̵��',10000);
SELECT *FROM BOOK;

































