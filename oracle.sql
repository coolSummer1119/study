select�� : �����ͺ��̽��κ��� ����Ǿ� �ִ� �����͸� �˻��ϴµ� ���

��ü �÷��� ������ �б�
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno FROM emp;
SELECT * FROM emp;

�κ� �÷��� ������ �б�
SELECT ename,sal FROM emp;

�ּ�
SELECT */* �ּ� */ FROM emp;

DUAL : �Լ� �� ����� ����� �� �� ����� �� �ִ� ����(public) ���̺�
       ����� �����Ͱ� �ִ� ���̺��� �������� ���� ��� ��
       �ǻ翭 (pseundo - comn),ǥ���� ���� ���� �� �ѹ��� �����ų� ���� ��¥, �ð��� �˰��� �� �� �̿�.
       �Ͻ����� ���, ��¥ ���� � �ַ� ���
       
SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT ASCII(0) FROM dual;
SELECT 7 + 10 FROM dual;

����
SELECT ename,sal,sal+300 FROM emp;
������ �켱����
SELECT ename,sal,(sal+300)*12 From emp;

//NULL���� ���� : NULL�� ����� �� ���ų�, �Ҵ���� �ʾҰų�, �� �� ���ų�, ������ �� ���� ��
              //(NULL�� 0�̳� ������� �ٸ�)
SELECT empno,ename,job,comm FROM emp;

������� NULL�� : NULL���� �����ϴ� ������� NULL�� ���
SELECT ename,(sal+comm)*12 FROM emp;

�� ALIAS : ���� ��Ī
���̸� �ٷ� �ڿ� ����. �� �̸��� ALIAS ���̿� ���� ������ AS Ű���尡 �� ���� ����. 
���̸� �ٷ� �ڿ� ��ĭ ��� ������ ������
�˸��ƽ��� ū����ǥ�� ����ϴ� ���
- ��ҹ��� ������ ���� ��
- ���� ���Խ�
- _,#�� Ư������ ���� (_�� ""���� �߰����� �� �� ������ �� �տ� ���� ���� �߻�)
- ���ڷ� ������ ���


SELECT sal*12 ASal FROM emp;
SELECT sal*12 AS ASal FROM emp;
SELECT sal*12 "Annual Salary" FROM emp;

���� ������ : ���̳� ���ڿ��� �ٸ� ���� ����, �� ���� ���μ� (||)���� ��Ÿ��
            ��� ���� ���ڽ��� ����
SELECT ename || ' has $' || sal AS ASal FROM emp;

���� �����ڿ� NULL�� : ���ڿ��� NULL���� ������ ��� ����� ���ڿ�
SELECT ename || comm FROM emp;

DISTINCT : �ߺ��� ����
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT (deptno) FROM emp;

[�ǽ�����]
1. emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
2. emp ���̺��� ����̸� �� ������ ����ϴµ� �÷����� "�� ��","�� ��"���� �ٲ㼭 ����Ͻÿ�.
3. emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷����� "�����ȣ","����̸�","����","����"���� ����Ͻÿ�
4. emp ���̺� ������ �ߺ����� �ʰ� ǥ���Ͻÿ�.

SELECT empno, ename, sal FROM emp;
SELECT ename "�� ��", sal "�� ��" FROM emp;
SELECT empno �����ȣ, ename ����̸�, sal ����, sal*12 ���� FROM emp;
SELECT distinct job FROM emp;

WHERE�� ��� : ���� üũ ��� �� �����ϱ�. ��ALIAS��� �Ұ���.

SELECT * FROM emp WHERE deptno = 10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE hiredate > '81-12-03';//��¥ ���� üũ�� - �̳� / �� �ؾ� ��¥�� �νĵ�.
SELECT * FROM emp WHERE hiredate < '81/12/03';
SELECT ename, sal, sal*12 ansal FROM emp WHERE ansal > 15000;//where ������ ALIAS��� �Ұ���!!!!!!!!!!!!!

SELECT * FROM emp WHERE hiredate != '80/12/17';
SELECT * FROM emp WHERE hiredate <> '80-12-17';
SELECT * FROM emp WHERE hiredate ^= '80-12-17';

SELECT * FROM emp WHERE sal > 2000 AND sal <=5000;
SELECT * FROM emp WHERE sal >= 800 AND sal <=3000;

BETWEEN ...AND ... : �� �� ���� (������ �� ����)
SELECT * FROM emp WHERE sal BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE sal NOT BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT * FROM emp WHERE ename NOT BETWEEN 'KING' AND 'SMITH';

IN : �� ��� ���� ���� ��ġ //or�� ����� ���
SELECT * FROM emp WHERE sal IN (1300,2450,3000);
SELECT * FROM emp WHERE sal NOT IN (1300,2450,3000);
SELECT ename,mgr,deptno FROM emp WHERE ename IN('ALLEN','FORD');
SELECT ename,mgr,deptno FROM emp WHERE ename NOT IN ('ALLEN','FORD');

[�ǽ�����]
1. emp ���̺��� �����ȣ�� 7698�� ����� �̸�, ����, �޿��� ����Ͻÿ�.
2. emp ���̺��� ����̸��� SMITH�� ����� �̸��� ����, �μ���ȣ�� ���Ͻÿ�.
3. ������ 2500�̻� 3500�̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�.
4. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����Ͻÿ�.

SELECT ename,job,sal FROM emp WHERE empno = 7698;
SELECT ename,sal,deptno FROM emp WHERE ename = 'SMITH';
SELECT ename,hiredate,sal FROM emp WHERE sal >= 2500 AND sal< 3500;
SELECT ename,job,sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;






//24-03-12
LIKE : ���ϰ� ��ġ�ϴ� �����͸� �˻�.
%�� 0�� �̻��� ���ڸ� ��Ÿ��
_�� �� ���ڸ� ��Ÿ��

S�� ó��,�߰�,���� ���� �̸��� �˻�
SELECT * FROM emp WHERE ename LIKE '%S%';
SELECT * FROM emp WHERE ename NOT LIKE '%S%';//����
�Ի����� 22�� ������ ��� ���� ���ϱ�
SELECT * FROM emp WHERE hiredate LIKE '%22';
SELECT * FROM emp WHERE hiredate NOT LIKE '%22';//����

FOR ������ �� �� ����
SELECT * FROM emp WHERE ename LIKE 'FOR_';

�ѱ��� ������ M, M������ ���ų� ������
SELECT * FROM emp WHERE ename LIKE '_M%';

NULL ���� ���(is ���)
SELECT * FROM emp WHERE comm is null; -- comm=null�� �Ұ�
SELECT * FROM emp WHERE comm is NOT null;--is�� �ڿ� not

�� ������ (AND,OR,NOT)�� ����Ͽ� ���� ����
AND
SELECT empno,ename,job,sal FROM emp WHERE sal >= 2000 AND job LIKE '%MAN%';
OR
SELECT empno,ename,job,sal FROM emp WHERE sal >= 2000 OR job LIKE '%MAN%';

SELECT ename,job FROM emp WHERE job NOT IN ('CLERK','SALESMAN');

[�ǽ�����]
1. 81�� 05�� 01�ϰ� 81�� 12�� 03�� ���̿� �Ի��� ����� �̸�, �޿�, �Ի����� ����Ͻÿ�.
2. �����ȣ�� 7566,7782,7934�� ����� ������ ������� �����ȣ, �̸� , ������ ����Ͻÿ�.
3. �޿��� $2,000�� $5,000 ���̰� �μ���ȣ�� 10 �Ǵ� 30�� ����� �̸��� �޿�, �μ���ȣ�� ����Ͻÿ�.
4. ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� $1,000, $2,975, $2,850�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ���Ͻÿ�.

SELECT ename, sal, hiredate FROM emp WHERE hiredate BETWEEN '81-05-01' AND '81-12-03';
SELECT empno, ename, sal FROM emp WHERE empno NOT IN (7566,7782,7934);
SELECT ename, sal, deptno FROM emp WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10,30);
SELECT ename, job, sal FROM emp WHERE job IN ('SALESMAN','MANAGER') AND sal NOT IN (1000,2975,2850);

ORDER BY �� : ����

�������� ����
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal ASC;

�������� ����
SELECT * FROM emp ORDER BY sal DESC;

1�� ���Ŀ��� �ߺ����� ���� ��� 2�� ���� ����
SELECT * FROM emp ORDER BY sal DESC, ename DESC;

��¥ ����
SELECT ename,job,deptno,hiredate FROM emp ORDER BY hiredate DESC //���������� �ֱ� ��

�� ALIAS �������� ����
SELECT empno, ename, sal*12 annsal FROM emp ORDER BY annsal;

���� ���� ��ġ�� ����Ͽ� ����
        1      2      3        4
SELECT ename, job, deptno, hiredate FROM emp ORDER BY 1;//����° ������ deptno������ ����

���̺� ������ ������� �� ���� ��ġ �ο�
SELECT * FROM emp ORDER BY 2; //Į���� ename�� �������� ����

null���� ���� �ִ� �÷��� ������ ��
NULLS FIRST �Ǵ� NULlS LAST Ű���带 ����Ͽ� ��ȯ�� �� �� NULL ���� �����ϴ� ���� ���� ������ �� ó���� ��Ÿ���ų� �� �������� ��Ÿ������ ����

SELECT * FROM emp ORDER BY comm;
SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm NULLS LAST;
SELECT * FROM emp ORDER BY comm NULLS LAST, ename DESC;--2������
SELECT * FROM emp ORDER BY comm DESC NULLS FIRST;

[�ǽ�����]
1. �����ȣ, ����̸�, �Ի����� ����ϴµ� �Ի����� ���� ��� ������ �����Ͻÿ�.
2. ����̸�, �޿�, ������ ���ϰ� ������ ���� ������ �����Ͻÿ�.
3. 10�� �Ǵ� 20�� �μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ���ȣ�� �̸� ������ �����Ͻÿ�.
4. comm �� ���� ��� ����� �̸�, �޿�, comm�� ����ϴµ� comm�� �������� �������� �����Ͻÿ�.

SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;
SELECT ename, sal, sal*12 annsal FROM emp ORDER BY annsal DESC;
SELECT ename, deptno FROM emp WHERE deptno IN (10,20) ORDER BY ename ASC;// �� ������ �ѰŹ��� �� �� ��ǥ ����
SELECT ename, sal, comm FROM emp ORDER BY comm DESC NULLS LAST;
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;//null�� �� ����


�Լ�

�����Լ�
��ҹ��� �����Լ�  - LOWER,UPPER,INITCAP
SELECT LOWER ('HELLO') FROM dual;
SELECT LOWER(ename) FROM emp;

SELECT UPPER('hello') FROM dual;
������ ù ���ڸ� �빮�ڷ� ����, �� ������ �ҹ��ڷ�
SELECT INITCAP('hello wORLD') FROM dual;

���� �����Լ�
CONCAT (���ڿ� 1, ���ڿ� 2) : ���ڿ� 1,2 �� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ  
SELECT CONCAT('Hello','World') FROM dual;
SELECT CONCAT(ename,job) FROM emp;

SUBSTR(����ڿ�,�ε���) : ����ڿ����� ������ �ε������� ���ڿ��� ����
[����]�ε��� 1���� ����
SELECT SUBSTR('Hello World',3) FROM dual;
SELECT SUBSTR('Hello World',3,3) FROM dual;--�ε��� 3���� ���� 3�� ����
--                    �ε��� ��谳��
SELECT SUBSTR('Hello World',-3) FROM dual;--�ڿ��� 3��°���� ������ ����
SELECT SUBSTR('Hello World',-3,2) FROM dual;--�ڿ��� 3��°���� �ΰ��� ����

LENGTH (����ڿ�) :  ���ڿ��� ����
SELECT LENGTH('Hello World')FROM dual;
SELECT LENGTH(ename)FROM emp;

INSTR(����ڿ�,�˻�����) : �˻������� ��ġ�� �˻�
SELECT INSTR('Hello World','e') FROM dual;
�˻� ���ڰ� ������� ->0
SELECT INSTR('Hello World','E') FROM dual;
SELECT INSTR('Hello World','o') FROM dual;--�տ��� ���� Ž�� 
SELECT INSTR('Hello World','o',6) FROM dual;--�ڿ� ���ں��� �˻� ���� / ����ڿ�, �˻����� �˻��ε���, �ش���ġ���� �˻�
SELECT INSTR('Hello World','o',1,2) FROM dual; --  ��� ���ڿ�, �˻� ���� �˻� �ε���, �ݺ�Ƚ��(����ڿ� ��ü�� ������ �˻��Ѵٴ� �ǹ̰� �ƴ϶� 1�� �˻�����           
                                               --  o�� ã���� ������ Ƚ����ŭ �� ���� ���ڸ� �˻��Ѵٴ� �ǹ�
                                               
LPAD(����ڿ�,�ѱ���,����): ������ ���̿� ���ڿ��� ����ϴµ� ������ ���ʿ� ������ ���ڷ� ä��
SELECT LPAD('Hello',10,'*') FROM dual;

RPAD(����ڿ�,�ѱ���,����): ������ ���̿� ���ڿ��� ����ϴµ� ������ �����ʿ� ������ ���ڷ� ä��
SELECT RPAD('Hello',10,'*') FROM dual;

TRIM : ���ڿ����� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
���� : ���� -> LEADING, ������ -> TRAILING, ���� -> BOTH <-DEFAULT
SELECT TRIM(LEADING 'h' FROM 'habchh') FROM DUAL; --���� H ����
SELECT TRIM(BOTH 'h' FROM 'habchh') FROM DUAL; --���� H����

LTRIM : ���ڿ��� ���ʿ��� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
RTRIM : ���ڿ��� �����ʿ��� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ

REPLACE (����ڿ�, OLD,NEW) :����ڿ����� OLD���ڸ� NEW���ڷ� ��ü
SELECT REPLACE('010.1234.5678','.','-') FROM dual;

�Լ� ��ø
SELECT ename, LOWER(SUBSTR(ename,1,3))FROM emp;

[�ǽ�����]
1. ������ ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
2. ����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �߿��� �տ��� 3�ڸ� ���Ͽ� ����Ͻÿ�.
3. �̸��� ����° ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�
4. �̸��� J,A,N���� �����ϴ� ��� ����� �̸�(ù���ڴ� �빮�� �������� �ҹ��ڷ� ǥ��) �� �̸��� ���̸� ǥ���Ͻÿ�.
    (�� ���̺��� name �� length�� ǥ��)

SELECT INITCAP(job) From emp;
SELECT SUBSTR(ename,1,3) FROM emp WHERE ename LIKE('A%');
SELECT ename FROM emp WHERE ename LIKE ('__A%'); -- SELECT ename FROM emp WHERE SUBSTR(ename,3,1)='A';
SELECT ename name, length(ename) length FROM emp WHERE ename LIKE('J%') OR ename LIKE ('A%') OR ename LIKE ('M%');
SELECT ename name, length(ename) length FROM emp WHERE SUBSTR(ename,1,1) IN ('J','A','M');

�����Լ�

CEIL(�Ǽ�) : �ø� ó���� ���� ���� ��ȯ
SELECT CEIL(2.3) FROM dual;

FLOOR(�Ǽ�) : ���� ó���� ���� ���� ��ȯ
SELECT FLOOR(2.3) FROM dual;

ROUND(������,�����ڸ���) : �ݿø�
SELECT ROUND (45.926,2) FROM dual;
SELECT ROUND (43.234) FROM dual;--�Ҽ��� �Ʒ��� �Ⱥ�����

SELECT empno, ename, sal, ROUND(sal*1.15,2) "new Salary",ROUND(sal*1.15)-sal "INCREASE" FROM emp;

TRUNC(������,�����ڸ���) : ����
SELECT TRUNC(45.897,2) FROM dual;
SELECT TRUNC(45.897) FROM dual;

MOD(������, ���� ����) : ��������
SELECT MOD(17,2) FROM dual;

��¥�Լ�

��¥�� ��� ������ ���
SELECT ename, TRUNC(SYSDATE-hiredate)/7 AS week, deptno FROM emp WHERE deptno =10;

MONTHS_BETWEEN (ū ��¥,���� ��¥) : �� ��¥ ���� �� ��
SELECT MONTHS_BETWEEN('2012-03-23','2010-01-23') FROM dual;

SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) AS months_worked FROM emp ORDER BY months_worked;

ADD_MONTHS : Ư�� ��¥�� ���� ������ ���� ���� �ش� ��¥�� ��ȯ�ϴ� �Լ�
SELECT ADD_MONTHS('2021-01-01', 8)FROM dual;

NEXT_DAY : ������ ������ ���� ��¥
SELECT NEXT_DAY('2024-03-12','������') FROM dual;--�ٰ��� �������� ����.
SELECT NEXT_DAY('2024-03-12',2) FROM dual;
1(�Ͽ���)-7(�����)

LAST_DAY : ���� ������ ��
SELECT LAST_DAY ( '2012-11-01') FROM dual;

EXTRACT : ��¥ �������� Ư���� ����, ��, ��, �ð�, ��, �� ���� ����
SELECT EXTRACT(YEAR FROM SYSDATE),EXTRACT(MONTH FROM SYSDATE),EXTRACT(DAY FROM SYSDATE) FROM dual;

[�ǽ�����]
1. ��� ����� �̸��� �޿��� ǥ���Ͻÿ�.�޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� �������� ǥ���ϰ� �� ���̺��� SALARY�� �����Ͻÿ�
2. ��� ����� �̸�, ����, �޿�, �μ���ȣ�� ����Ͻÿ�.(�μ���ȣ �������� ����, ����̸��� 10�� ���� �������� ���)
3. ���ú��� �̹����� ������ �������� ���� �� ���� ���Ͻÿ�.
4. �� ����� ���� �����ȣ, �̸�, �޿� �� 15% �λ�� �޿��� New Salary�� �����ϰ� ����(�ݿø�)�� ǥ���Ͻÿ�.

SELECT ename, LPAD(sal,15,'$') SALARY FROM emp;
SELECT RPAD(ename,10,'*'), job, sal, deptno FROM emp ORDER BY deptno ASC;
SELECT LAST_DAY(SYSDATE) - SYSDATE FROM dual;
SELECT empno, ename,sal, ROUND(sal*1.15) "New Salary" FROM emp; 

��ȯ�Լ�
TO_CHAR : ����-> ����, ��¥ -> ����
TO_NUMBER : ���� -> ����
TO_DATE : ���� -> ��¥

TO_CHAR
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
--SELECT TO_CHAR(SYSDATE,'YYYY��MM��DD��') FROM dual;--�ѱ����� X
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual;

���� �ڸ����� ��ġ
SELECT TO_CHAR(1234,9999) FROM dual;
SELECT TO_CHAR(1234,'9999') FROM dual;--'�� �־ �۵������� ���� ����.
--SELECT TO_CHAR(1234,0000) FROM dual; -- ##�� ������ ������ ��. 0 �� �������·� ����ؾ���
SELECT TO_CHAR(1234,'0000') FROM dual;

�ڸ����� ���ڶ� ->####
SELECT TO_CHAR(1234,999) FROM dual;--�ڸ����� �� ��ġ ���Ѿ���
SELECT TO_CHAR(1234,'999') FROM dual;-- ���͵���
SELECT TO_CHAR(1234,'000') FROM dual;

���� �ڸ������� ���� �ڸ��� ����
SELECT TO_CHAR(1234,99999) FROM dual;--�տ� �������� �����
SELECT TO_CHAR(1234,'99999') FROM dual; -- ���͵���
SELECT TO_CHAR(1234,'00000') FROM dual; --01234 ���

�Ҽ��� �ڸ� ����
SELECT TO_CHAR(1234,9999.99) FROM dual;
SELECT TO_CHAR(1234,'9999.99') FROM dual;
SELECT TO_CHAR(1234,'0000.00') FROM dual;

�ݿø��ؼ� �Ҽ��� ��°�ڸ����� ǥ��
SELECT TO_CHAR(29.897,'99.99') FROM dual;
�λ�� �޿��� �Ҽ��� ù°�ڸ����� ǥ��
SELECT TO_CHAR(sal*1.15,'9,999.9') FROM emp;

��ȭǥ��
SELECT TO_CHAR(1234,'$0000') FROM dual;
������ȭǥ��
SELECT TO_CHAR(1234,'L0000') FROM dual;--\�� ��� �Ұ���

TO_DATE
SELECT TO_DATE('24-03-12','YYYY-MM-DD')FROM dual;
�������� ���� ����
SELECT TO_DATE('24-03-12')FROM dual;

TO_NUMBER
SELECT TO_NUMBER('100',999)FROM dual;
���� ���� ���� ����
SELECT TO_NUMBER('100')FROM dual;

1) emp ���̺��� ������ ������ ��ǥ(,)�� �����ؼ� ǥ���ϰ� �÷����� Employee and Job���� ǥ���Ͻÿ�.
SELECT ename || ',' || job AS "Employee and Job" FROM emp;
2) �μ���ȣ 30(deptno)���� �ٹ��ϸ� �� 2,000�޷� ���ϸ� �޴� 81�� 5�� 1�� ������ �Ի��� ����� �̸�, �޿�, �μ���ȣ, �Ի����� ����Ͻÿ�.
SELECT ename, sal, deptno, hiredate FROM emp WHERE deptno = 30 AND sal <= 2000 AND hiredate<'81-05-01';
3) emp ���̺��� �̸��� A�� E�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT ename FROM emp WHERE ename LIKE('%A%') AND ename LIKE('%E%');
4) emp ���̺��� ����̸� �� S�� ���Ե��� ���� ����� �� �μ���ȣ�� 20�� ������� �̸��� �μ���ȣ�� ����Ͻÿ�.
SELECT ename, deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;
5) emp ���̺��� ������(mgr)�� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�.
SElECT ename, job FROM emp WHERE mgr IS NULL;
6) emp ���̺��� Ŀ�̼� �׸��� �Էµ� ������� �̸��� �޿�, Ŀ�̼��� ���Ͻÿ�.
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL;
7) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�.
SELECT LOWER(ename) FROM emp WHERE LENGTH(ename)>=6;
8) �̸��� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.
SELECT SUBSTR(LOWER(ename),1,3) FROM emp WHERE LENGTH(ename)>=6;
9) �� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �� ��)�� ����Ͽ� �����̺��� MONTHS_WORKED�� �����Ͻʽÿ�. ����� ������ �ݿø��Ͽ� ǥ���ϰ� �ٹ� �� ���� �������� ������������ �����Ͻÿ�.
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS MONTHS_WORKED FROM emp ORDER BY MONTHS_WORKED ASC;
10) emp ���̺��� �̸�(�ҹ��ڷ� ǥ��), ����, �ٹ������� ����Ͻÿ�.
SELECT LOWER(ename),job, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)/12) AS YEAR_WORKED FROM emp;

�Ϲ��Լ�

NVL(value1,value2): value1�� null�̸� value2�� ����. value1�� value2�� �ڷ����� ��ġ
SELECT ename, sal, comm, (sal+NVL(comm,0))*12  FROM emp;
SELECT ename, NVL(TO_CHAR(comm),'No Commission') FROM emp;--no commission�� ���ڷ� �ٲ� �� ���� ������ ���ڸ� ���������� ��ȯ

NVL2(value1,value2,value3): value1�� null���� ��. null�̸� value3, null�� �ƴϸ� value2
                            �ڷ����� �������� �ʾƵ� ��**SELECT ename, NVL(TO_CHAR(comm),'No Commission') FROM emp;
SELECT NVL2(comm,'commission','no commission') FROM emp;

NULLIF(value1,value2): �� ���� ���� ��ġ�ϸ� NULL. �ΰ��� ���� ��ġ�ϸ� value1
SELECT NULLIF(LENGTH(ename),LENGTH(job)) "NULLIF" FROM emp;

COALESCE(value1,value2,value3...) : null���� �ƴ� ���� ��� (�ڷ� ��ġ�ؾ���)
SELECT comm, sal, COALESCE(comm,sal,0) FROM emp;
SELECT comm, mgr, sal, COALESCE(comm,mgr,sal) FROM emp;

CASE Į�� WHEN �񱳰� THEN �����  = IF
         WHEN        THEN
         WHEN        THEN
        (ELSE �����)
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

DECODE : =�񱳸� ����, ����Ŭ ���� DECODE(Į��,�񱳰�,��ȯ��,�� , ��, ��, ��, ��(ELSE���� ����)) = SWITCH

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

[�ǽ�����]
1. ����̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿� ��� �ؼ� ����Ͻÿ�.
    (��, NULL���� ��Ÿ���� �ʰ� �ۼ��Ͻÿ�.)
SELECT ename, sal, comm, NVL2(comm,sal+comm,sal) "�Ǳ޿�" FROM emp;
SELECT ename, sal, comm, sal + NVL(comm,0) "�Ǳ޿�" FROM emp;--���� ����
2. ���ް� Ŀ�̼��� ��ģ �ݾ��� 2000�̻��� �޿��� ���� ����� �̸�, ����, ����, Ŀ�̼�, ��볯¥�� ����Ͻÿ�.(��, ��볯¥�� 1981 - 12-17���·� ����Ͻÿ�.
SELECT ename, job, sal, comm, TO_CHAR(hiredate,'yyyy-mm-dd') FROM emp WHERE sal+NVL(comm,0) >2000 ;

�׷��Լ� : �� ���� ������ �����Ͽ� �׷캰�� �ϳ��� ����� ����

AVG() : NULL�� ������ ��� ������ ����� ��ȯ, NULL���� ��� ��꿡�� ���õ�.
SELECT TRUNC(AVG(sal),2) FROM emp;

COUNT() : NULL�� ������ ���� ���� ��� ���ڵ� ���� ��ȯ. COUNT(*)�� ������ ����ϸ� NULL���� ����
SELECT COUNT(empno) FROM emp;
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX() : ���ڵ� ���� �ִ� ���� �� �� ���� ū ���� ��ȯ
SELECT MAX(sal) FROM emp;
SELECT MAX(ename) FROM emp;--���� �� ���� �ڿ�
SELECT MAX(hiredate) FROM emp;--�Ի����� ���� ���� ���

MIN() : ���ڵ� ���� �ִ� ���� �� �� ���� ���� ���� ��ȯ
SELECT MIN(sal) FROM emp;
SELECT MIN(ename) FROM emp;--���� �� ���� �տ�
SELECT MIN(hiredate) FROM emp;--�Ի����� ���� ���� ���

SUM() : ���ڵ���� �����ϰ� �ִ� ��� ���� ���Ͽ� ��ȯ
SELECT SUM(sal) FROM emp;

SELECT MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp;

SELECT MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp WHERE deptno=10; 

SELECT COUNT(*) FROM emp WHERE deptno =20; --where���� ���� �����ϰ�  count�� ���� ���ϱ�

SELECT MAX(sal) FROM emp WHERE deptno =10;

SELECT deptno, MAX(sal) FROM emp;(X) --�Ұ��� �ƽ��ϸ� ���� �ϳ��� �ٰ� �ѹ��� 12�� ->���� ���� �ʾ� ���� �Ұ�
        �谳���÷�
GROUP BY : SELECT���� �����Լ� ����� ���� �÷��� ������ �� ����.���� �÷��� ������ ��쿡�� �ݵ�� GROUP BY���� ������ �÷��� ����
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno ORDER BY deptno;

�μ����� ��� �� ���ϱ�
SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno ORDER BY deptno; --�μ��� ��� ��

���� ������ GROUP BY�� ����ϱ�
SELECT deptno , job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

HAVING : �׷��Լ��� �̿��ؼ� ���� üũ�� �� ��� �˸��ƽ� ���x
�׷��Լ��� ����� �߸��� Query
[�����߻�]
SELECT deptno, AVG(sal) FROM emp WHERE AVG(sal)>=2000 GROUP BY deptno; --(x) where ���� �׷��Լ��� �̿��ؼ� ������ üũ�ϸ� ���� �߻�
[���� ����]
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>=2000;

�μ����� �ִ�޿��� ���ϴµ� 3000�� �ʰ��� �ִ�޿� ���ϱ�
SELECT deptno,MAX(sal) FROM emp GROUP BY deptno HAVING MAX(sal)>3000;

�׷� �Լ� ��ø
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

�б⺰�� �Ի��� ����� ��
SELECT TO_CHAR(hiredate,'Q') quarter, COUNT(empno) FROM emp GROUP BY TO_CHAR(hiredate,'Q') ORDER BY quarter;

[�ǽ�����]
1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ǥ���Ͻÿ�.
    �� ���̺��� ���� maximum,minimum,sum,average �� �����ϰ� ����� ������ �ݿø��ϰ� ���ڸ� ������ ,���
SELECT TO_CHAR(MAX(sal),'9,999') maximum, MIN(sal) minimum, TO_CHAR(SUM(sal),'99,999') sum, TO_CHAR(ROUND(AVG(sal)),'9,999') average FROM emp;
2. �޿��� Ŀ�̼��� ���� �ݾ��� �ְ�, ����, ��� �ݾ��� ���Ͻÿ�.
    ��ձݾ��� �Ҽ��� ù°�ڸ� ���� ǥ���Ͻÿ�.
SELECT MAX(sal+NVL(comm,0)), MIN(sal+NVL(comm,0)), TRUNC(AVG(sal+NVL(comm,0)),1) FROM emp;
3. ������ ������ ������ ����� ���� ǥ���Ͻÿ�.(������ ��� ���� ���Ͻÿ�)
SELECT job, COUNT(empno) FROM emp GROUP BY job ORDER BY job;
4. 30�� �μ��� ������� ���Ͻÿ�.
SELECT deptno, COUNT(deptno) FROM emp GROUP BY deptno HAVING deptno = 30;--SELECT COUNT(*) FROM emp WHERE deptno;�׷�� ��� ���� ���
5. ������ �ְ� ������ ���ϰ� ����, �ְ� ������ ����Ͻÿ�.
SELECT job,MAX(sal) FROM emp GROUP BY job;
6. 20�� �μ��� �޿� �հ踦 ���ϰ� �޿� �հ� �ݾ��� ����Ͻÿ�.
SELECT SUM(sal) FROM emp GROUP BY deptno HAVING deptno =20;
7. �μ����� ���޵Ǵ� �� ���޿��� �ݾ��� 9,000�̻� �޴� ������� �μ� ��ȣ, �� ������ ���Ͻÿ�
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>=9000;
8. �������� ����� ���� ���� ����� ���ϰ� �� ��� ������ ����� '79'�� �����ϴ� ����� �����ּ���.
SELECT job, MAX(empno) FROM emp GROUP BY job HAVING MAX(empno) LIKE '79%';
SELECT job, MAX(empno) FROM emp WHERE empno LIKE '79%' GROUP BY job;
9. ������ �� ������ ����ϴµ� ������ 'MANAGER'�� ������� �����ϰ� �ѿ����� 5000���� ���� ������ �ѿ��޸� ����Ͻÿ�.
SELECT job, SUM(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job HAVING SUM(sal)>5000;  -- where,group , having������ ���
10. �������� ����� ���� 4�� �̻��� ������ �ο� ���� ����Ͻÿ�.
SELECT job, COUNT(*) FROM emp GROUP BY job HAVING COUNT(*)>=4;

�м��Լ�
RANK() : ������ ǥ���� �� ����ϴ� �Լ�
RANK(���ǰ�) WITHIN GROUP (ORDER BY ���ǰ� Į����) : Ư�� �������� ���� Ȯ���ϱ�
(����) RANK�ڿ� ������ �����Ϳ� ORDER BY �ڿ� ������ �����ʹ� ���� �÷��̾����.

SELECT RANK('SMITH') WITHIN GROUP(ORDER BY ename DESC) "RANK" FROM emp;
SELECT * FROM emp ORDER BY ename DESC;

RANK() OVER(ORDER BY �÷���) : ��ü �������� --PARTITION BY Į�� (�׷찰�� ����/,�� 2������)
������� empno, ename, sal, �޿� ������ ���
SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) FROM emp;

10�� �μ��� ���� �������� ����� �̸�, �޿�, �ش� �μ� ���� �޿� ������ ���
SELECT empno,ename,sal,RANK() OVER(ORDER BY sal DESC) "RANK" FROM emp WHERE deptno=10;

emp ���̺��� ��ȸ�Ͽ� ���, �̸�, �޿�, �μ���ȣ, �μ��� �޿� ������ ���\
SELECT empno,ename,sal,deptno, RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) "RANK" FROM emp;

emp ���̺��� ���� �μ����� job���� �޿� ������, empno, ename,sal,deptno,job�� ���
SELECT empno, ename, sal, deptno, job, RANK() OVER(PARTITION BY deptno,job ORDER BY sal) "RANK" FROM emp;

*****JOIN***** : �� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���.
                ���� �� �̻��� ����� ����� �� PRIMARY KEY �� FOREIGN KEY ���� ����Ͽ� ����
                �� ���� ���̺��� SELECT ���� �ȿ��� �����Ϸ��� ��� �ϳ��� �÷��� �� �� ���̺� ���̿��� ���� �Ǿ�� ��.

Cartesian Product (īƼ�� ��) : �˻��ϰ��� �ߴ� ������ �� �ƴ϶� ���ο� ���� ���̺���� ��� �����Ͱ� ��ȯ�Ǵ� ����.
                                1.���� ������ �������� �ʾ��� ���
                                2.���� ������ �߸��� ���
SELECT * FROM emp,dept; -- īƼ�� �� ����

[ORACLE ����]
���� ����(Equi Join) : �������� = ���ǿ� ���Ͽ� ������ �̷����.

SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

SELECT emp.ename, dept.dname FROM emp, dept WHERE emp.deptno = dept.deptno;

���̺� �˸��ƽ� �ο��ϱ�
SELECT * FROM emp e,dept d WHERE e.deptno = d.deptno;

�÷� ���� ȣ���� �� ���̺� �� �Ǵ� ���̺� �˸��ƽ��� ����
SELECT ename,dname FROM emp e, dept d WHERE e.deptno = d.deptno; --����� Į���� ȣ���� ��� �� �տ� ���

�߰����� ���� ����ϱ�

ALLEN�� �ٹ��ϴ� �μ��� �̸��� ����� �̸� ����ϱ� -- where ���� and�� ����
SELECT e.ename,d.dname FROM emp e, dept d WHERE e.deptno = d.deptno AND e.ename = 'ALLEN';
--                                             (      ��������      )   (  �߰����� ����    )

3000 �̻� 4000���� �޿��� �޴� ����� �̸��� �޿�, �μ����� ����Ͻÿ�
SELECT ename, sal, dname FROM emp e, dept d WHERE d.deptno = e.deptno AND sal BETWEEN 3000 AND 4000;

�񵿵� ����(Non Equi Join) : ���̺��� � �÷��� Join��
                           ���̺��� �÷��� ��ġ���� ���� �� ����ϰ� ���� ������ ����(=)�̿��� �����ڸ� ����
                           (between and, is null, in)
                           SELECT ename, sal, dname FROM emp e, dept d WHERE d.deptno = e.deptno AND sal BETWEEN 3000 AND 4000;
����̸�, �޿�, �޿���� ���ϱ� (emp,salgrade ���̺��̿�)
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

SELF JOIN : ������ ���̺� ���� / ���� ������ �����Ͱ� ������ SELF JOIN
��� �̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ����� ����)
SELECT e.ename ����̸�, m.ename �������̸� FROM emp e, emp m WHERE e.mgr=m.empno ;--KING ����

�ܺ�����(Outer Join) : Equi Join ������� �� ���� �������� �װ͵��� ������ �����Ϸ� �ϴ� �ΰ��� ���̺��� �� ��
                    �÷����� ����� ���� ���ٸ� ���̺�κ��� �����͸� ��ȯ���� �ʴ´ٴ� ��
                    ���������� ���� ������ �������� �� �ϴ� ����� ���� ���� ���

������ ���� ǥ���ϱ� ���ؼ��� ������ ���� �ִ� ���̺��� �ݴ� ���̺��� ���� ���ǿ� + ���
SELECT DISTINCT(e.deptno),d.deptno FROM emp e, dept d WHERE e.deptno(+)= d.deptno;

����̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ����� ǥ��)  ��� ��      �������
SELECT e.ename ����̸�, m.ename �������̸� FROM emp e,emp m WHERE e.mgr=m.empno(+);

[�ǽ�����]
1. ��� ����� �̸�, �μ���ȣ, �μ��̸��� �����Ͻÿ�,(emp,dept)
SELECT e.ename, e.deptno, d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;
2. ������ MANAGER�� ����� ������ �̸� ���� �μ��� �ٹ��� ������ ��� (���� ����)
SELECT e.ename, job, d.dname, loc FROM emp e, dept d WHERE e.deptno = d.deptno AND job = 'MANAGER';
3. Ŀ�̼��� �ް� �޿��� 1600�̻��� ����� ����̸�, �޿�, �μ���, �ٹ����� ����Ͻÿ�
SELECT ename, sal, dname,loc FROM emp e, dept d WHERE e.deptno = d.deptno AND e.comm IS NOT NULL AND sal>=1600;
4. �ٹ����� CHICAGO �� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�,
SELECT ename, job, e.deptno, dname FROM emp e, dept d WHERE e.deptno=d.deptno AND d.loc = 'CHICAGO';
5. �ٹ������� �ٹ��ϴ� ����� ���� 5�� ������ ���, �ο��� ���� ���� ������ �����Ͻÿ�.(�ٹ��ο� 0���� ���� ǥ��)Outer join
SELECT loc, COUNT(loc) FROM emp e, dept d WHERE e.deptno(+) = d.deptno GROUP BY loc HAVING COUNT(loc) <= 5 ORDER BY COUNT(loc) ASC; --(x) �� 133�� ������ A.���� ���ڸ� �ҷ��ͼ��׷�
SELECT d.loc, COUNT(e.empno) emp_member FROM emp e, dept d WHERE e.deptno(+) = d.deptno GROUP BY d.loc HAVING COUNT(e.empno) <= 5 ORDER BY emp_member ASC;
6. ����� �̸� �� ��� ��ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ� ������ �� ���̺��� employee, emp#, manager, mgr# ���� �����Ͻÿ�, (�����ڰ� ���� ��� �����)
SELECT e.ename employee, e.empno emp#, m.ename manager, m.empno mgr# FROM emp e, emp m WHERE e.mgr = m.empno;
7. �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ǥ���ϰ� �� ���̺��� employee, emp hired, manager, mgr hired�� �����Ͻÿ�.(�����ڰ� ���� ��� �����)
SELECT e.ename employee, e.hiredate "emp hired", m.ename manager, m.hiredate "mgr hired" FROM emp e, emp m WHERE e.mgr=m.empno AND m.hiredate > e.hiredate;

[ǥ�� SQL]

���� ����(Inner Join)
SELECT emp.ename,dept.deptno
FROM emp INNER JOIN dept--��ǥ ��ſ� INNER JOIN
ON emp.deptno = dept.deptno;--WHERE ��� ON

SELECT emp.ename,dept.deptno
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

SELECT e.ename, d.dname--ALIAS ����
FROM emp e JOIN dept d
ON e.deptno = d.deptno;

���� Į���� �˸��ƽ� ���� �Ұ���
SELECT ename,dname,d.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno;

ON���� JOIN ������ ����ϰ� WHERE�� �ΰ� ������ ���
SELECT e.ename,d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE e.ename = 'ALLEN';--������ ������ ����

���� ���� ���ǿ� ���� �÷��� �̸��� ���ٸ� ������ ���� USING���� ����Ͽ� ���� ������ ���� �� �� ����
(����)USING(�÷���) ���� ����� �÷� ���� ȣ���� ���� ���̺� �� �Ǵ� �˸��ƽ��� ����ؼ� ȣ��Ұ�
SELECT * FROM emp e JOIN dept d USING(deptno);--deptno �� ������
SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno;--deptno�и�

SELECT ename, deptno, dname FROM emp JOIN dept USING(deptno); -- �̷������� ALIAS�� ��� ���ص� ��.

SELECT e.ename,deptno
FROM emp e JOIN dept d
USING(deptno) WHERE e.ename='ALLEN';

SELF JOIN
����̸��� �ش� ����� ������ �̸� ���ϱ� (�����ڰ� ���� ����� ����)
SELECT e.ename name, m.ename manager_name FROM emp e JOIN emp m ON e.mgr = m.empno;

�ܺ�����(OUTER JOIN)--RIGHT
SELECT DISTINCT(e.deptno),d.deptno FROM emp e RIGHT JOIN dept d ON e.deptno = d.deptno; --������ �����Ϳ� ���� �߻��ߴٰ� RIGHTǥ��

����̸��� �ش� ����� ������ �̸� ���ϱ� (������ ���� ����� ǥ��) --LEFT �ƿ��� ���� ����
SELECT e.ename name, m.ename manager_name FROM emp e LEFT OUTER JOIN emp m ON e.mgr=m.empno;

[�ǽ�����]
1. ��� ����� �̸�, �μ���ȣ, �μ��̸�, �ٹ����� ǥ���Ͻÿ�.(emp,dept)
SELECT ename, deptno, dname, loc FROM emp JOIN dept USING(deptno);
2. ������ 'SALESMAN'�� ����� ������ �̸�,����,�μ���, �ٹ��� ������ ����Ͻÿ�.
SELECT ename, job, dname, loc FROM emp JOIN dept USING(deptno) WHERE job = 'SALESMAN';
3. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, �޿�+Ŀ�̼�, �޿������ ����ϴµ� ������ �÷����� "�����ȣ","�̸�","����","�Ǳ޿�","�޿����"���� ����Ͻÿ�.
(�� Ŀ�̼��� null�� ���� �����ϰ� ���)(emp,salgrade,�Ǳ޿��� �޿���� ���ϱ�)
SELECT empno �����ȣ, ename �̸�, sal*12 ����, sal+comm �Ǳ޿�, grade �޿���� FROM emp JOIN salgrade ON sal+comm BETWEEN losal AND hisal WHERE comm IS NOT NULL;
4. 10�� �μ����� �ٹ��ϴ� ������� �μ���ȣ, �μ��̸�, ����̸�, ����, �޿������ ����Ͻÿ�.(emp,dept,salgrade)
[����Ŭ ����]
SELECT d.deptno, d.dname, e.ename, e.sal, s.grade FROM emp e, dept d, salgrade s WHERE e.deptno = d.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.deptno=10;
[ǥ�� SQL]
SELECT deptno, dname, ename, sal, grade FROM emp  JOIN dept USING(deptno) JOIN salgrade ON sal BETWEEN losal AND hisal WHERE deptno =10;

���տ�����

UNION : ������ �ߺ��� ����
        union�� �� ���̺��� ������ ��Ÿ����, ���ս�Ű�� �� ���̺��� �ߺ����� ���� ������ ��ȯ
    
SELECT deptno FROM emp --������ + DISTRICT
UNION
SELECT deptno FROM dept;

UNION ALL : UNION �� ������ �� ���̺��� �ߺ��Ǵ� ������ ��ȯ

SELECT deptno FROM emp -- ������
UNION ALL
SELECT deptno FROM dept;

INTERSECT : �� ���� ���� �� ����� ���� ��ȯ

SELECT deptno FROM emp 
INTERSECT
SELECT deptno FROM dept;

MINUS : ù��° SELECT���� ���� ��ȯ�Ǵ� ���߿��� �ι��� SELECT���� ���� ��ȯ�Ǵ� �࿡ �������� �ʴ� ����� ������

SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;

SUBQUERY : �ٸ� �ϳ��� SQL������ ���� NESTED(����)�� SELECT����

������ �������� : ���� �� ���� ��(��)�� ��ȯ

SELECT job FROM emp WHERE empno =7369;
SELECT empno,ename,job FROM emp WHERE job='CLERK';--SUBQUERY�� �Ⱦ��� ����ó�� �ι����� ����ؾ���
->���� �ΰ��� ���ڸ� ���������� ����ؼ� �ۼ�
SELECT empno,ename,job FROM emp WHERE job = (SELECT job FROM emp WHERE empno = 7369);
--(             ��������                     (                ��������              ))

7698�� �޿����� ���� �޿��� �޴� ������� �����ȣ, ����̸�, �޿��� ����Ͻÿ�.
SELECT empno ,ename, sal FROM emp
WHERE sal > (SELECT sal FROM emp WHERE empno = 7698);

���� �� �������� : �ϳ� �̻��� ���� ��ȯ�ϴ� ��������

������� �������� ���� : 1���� ���� ��ȯ�ϸ� ���� ex) JOHNS 2�� �̻��� ���� ex) 1250 1600 5000

IN �������� ���

�μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� ������ ����Ͻÿ�.
SELECT empno,ename,sal, deptno FROM emp
WHERE sal IN(SELECT MIN(sal) FROM emp GROUP BY deptno);--���������� ��ġ�ϴ� ������ �ִ� �����͵鸸 ����

ANY �������� ���
ANY �����ڴ� ���������� ����� �� ��� �ϳ��� ���̶� ������ �Ǹ� ������� ��ȯ

SELECT sal FROM emp WHERE job = 'SALESMAN';
SELECT ename, sal FROM emp WHERE sal>1250 OR sal > 1500 OR sal >1600;
->�� ������ ���������� �ۼ�
SELECT ename, sal FROM emp WHERE sal>any(SELECT sal FROM emp WHERE job ='SALESMAN');--��� ���Ҷ� ANY�� ���

ALL �������� ���
���������� ����� ��� ���� ��ġ --AND�� ���
SELECT sal FROM emp WHERE deptno =20;--20�� �μ��� �޿� ���
SELECT empno, ename, sal, deptno FROM emp WHERE sal >800 AND sal>2975 AND sal>3000;--20�� �μ��� �������� ������ ���� ��� ���
->�� ������ ���������� �ۼ�
SELECT empno, ename, sal, deptno FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE deptno = 20);

���� �� ��������
���� ������ ����� �� �� �̻��� �÷����� ��ȯ�Ǿ� ���� ������ �����ϴ� ����

SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno,sal) IN (SELECT deptno, sal--WHERE �տ� �� �Ұ�ȣ �ʼ�
                       FROM emp WHERE deptno =30);

�μ����� ���� �޿��� ���� �޴� ��� ������ ���--�μ��� �Ѹ�
SELECT empno, ename, sal, deptno FROM emp WHERE (deptno,sal) IN (SELECT deptno,MIN(sal) FROM emp GROUP BY deptno); --���� ��
�μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ��� ���� ��� --�ٸ��μ����� ���� ���� �޴� ��� �� ����
SELECT empno, ename, sal, deptno FROM emp WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno); --���� ��

�ζ��κ� : ���� ������ FROM���� ���� ������ �̿��ϴ� ���/ ������ ���̺� ����
�޿��� 20�� �μ��� ��� �޿����� ���� �޿��� ���� ����� �����ȣ, �̸�, �μ��� ���
SELECT e.empno, e.ename, d.dname FROM (SELECT empno, ename, sal, deptno FROM emp WHERE sal> (SELECT AVG(sal) FROM emp WHERE deptno = 20)) e JOIN dept d ON e.deptno=d.deptno;
                                    --(                                  �ϳ��� ���̺� ����                                               ) 
                                    
SELECT e.empno,e.ename, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE sal>(SELECT AVG(sal) FROM emp WHERE deptno=20);

�μ����� �ѱ޿� ����ϴµ� �μ���ȣ, �μ���, �ѱ޿��� ����Ͻÿ�.
SELECT deptno, dname, total FROM dept JOIN(
SELECT deptno, SUM(sal) total FROM emp GROUP BY deptno) USING(deptno);

��Į�� ��������
��Į�� ���� ���� ���� �ǹ�
������� ���� ��, ���� ���� ��Į�� ������ ��ȯ ��.
���� ������� ���� ���̰ų� ���� ���̶�� EBMS�� �� �� ��� ��, ��� ���� ����ؾ� �ϴ��� �� �� ���� ������ ���.
        
SELECT deptno, (SELECT dname FROM dept WHERE deptno=e.deptno), SUM(sal) FROM emp e GROUP BY deptno;

[�ǽ�����]
1. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� �Ի����� ���ϴµ� 'BLAKE'�� �����ϰ� ����Ͻÿ�.
SELECT ename, hiredate FROM emp WHERE deptno IN (SELECT deptno FROM emp WHERE ename ='BLAKE') AND ename <> 'BLAKE';
2. ��� �޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������ ����ϴµ� ������ ���� ��� ������ ����Ͻÿ�.
SELECT empno, ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp) ORDER BY sal DESC;
3. 10�� �μ����� �޿��� ���� ���� �޴� ����� ������ �޿��� �޴� ����� �̸��� ������ ����Ͻÿ�.
SELECT ename, sal FROM emp WHERE sal = (SELECT MIN(sal) FROM emp WHERE deptno =10);
4. (�μ��� ��� ���� ���ϰ�) ��� ���� 3�������� �μ��� �μ���� ��� ���� ����Ͻÿ�.
SELECT a.dname,b.cnt FROM dept a, (SELECT deptno, COUNT(empno) cnt FROM emp GROUP BY deptno) b WHERE a.deptno = b.deptno AND b.cnt<=3;--�ζ��� �� ��� ****�ٽú���
SELECT d.dname, COUNT(e.empno) cnt FROM emp e, dept d WHERE e.deptno = d.deptno GROUP BY d.dname HAVING COUNT(e.empno)<=3;
5. ��� ��ȣ�� 7844�� ������� ���� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT ename, hiredate FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE empno = 7844);
6. ���� ���(mgr)�� king �� ��� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT ename, sal FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');
                                     �� IN ���� �ٲ㵵��        
7. 20�� �μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� �̸��� �μ���, �޿� , �޿������ ����Ͻÿ�.
SELECT ename, dname, sal, grade FROM emp e, dept d, salgrade s WHERE e.deptno = d.deptno AND e.sal BETWEEN losal AND hisal AND e.sal = (SELECT MAX(sal) FROM emp WHERE deptno = 20);
SELECT e.ename, d.dname, e.sal,s.grade FROM emp e JOIN dept d ON e.deptno=d.deptno JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal WHERE e.sal = (SELECT MAX(sal) FROM emp WHERE deptno = 20);

8. �� �޿�(sal+comm)�� ��� �޿����� ���� �޿��� �޴� ����� �μ���ȣ,�̸�,�ѱ޿�,Ŀ�̼��� ����Ͻÿ�.(Ŀ�̼��� ��(o), ��(x)�� ǥ���ϰ� �÷����� "comm����"�� ���)
SELECT deptno, ename, sal+NVL(comm,0), NVL2(comm,'o','x') comm���� FROM emp WHERE sal+NVL(comm,0) > (SELECT AVG(sal) FROM emp); 
SELECT deptno, ename, sal+NVL(comm,0), --when then else�� �̿��� �ڵ�
        CASE WHEN comm IS NOT NULL THEN'o'
        ELSE'x'
        END comm����
FROM emp 
WHERE sal+NVL(comm,0)>(SELECT AVG(sal) FROM emp);
9. CHICAGO �������� �ٹ��ϴ� ����� ��� �޿����� ���� �޿��� �޴� ����� �̸��� �޿�, �������� ����Ͻÿ�.
SELECT ename, sal, loc FROM emp JOIN dept USING(deptno) WHERE sal >(SELECT AVG(sal) FROM emp e, dept d where e.deptno = d.deptno GROUP BY (loc) HAVING loc = 'CHICAGO');
                                                                                                                                =AND loc='CHICAGO';�� �ٿ�����
SELECT AVG(sal) FROM emp--���������� ������ �Ⱦ��°��
WHERE deptno IN
(SELECT deptno FROM dept WHERE loc = 'CHICAGO');
10. Ŀ�̼��� ���� ����� �� ������ ���� ���� ����� �̸��� �޿� ����� ����Ͻÿ�.
SELECT ename, grade FROM emp JOIN salgrade ON sal BETWEEN losal AND hisal WHERE sal = (SELECT MAX(sal) FROM emp WHERE comm IS NULL);
11. SMITH�� ���� ���(mgr)�� �̸��� �μ���, �ٹ������� ����Ͻÿ�.
SELECT m.ename, dname, loc FROM emp e, emp m, dept d WHERE e.mgr = m.empno AND m.deptno = d.deptno AND e.ename = 'SMITH';--����Ŭ
SELECT e.ename,d.dname,d.loc FROM emp e JOIN dept d USING(deptno) WHERE e.empno IN(--ǥ�� SQL
SELECT mgr FROM emp WHERE ename = 'SMITH');
12. ALLEN���� �޿��� ���� �޴� ��� �߿��� �Ի����� ���� ���� ����� ������ ��¥�� �Ի��� ����� �̸��� �Ի���, �޿��� ����Ͻÿ�.
SELECT ename,hiredate,sal FROM emp WHERE hiredate =
(SELECT MIN(hiredate) FROM emp WHERE sal >
(SELECT sal FROM emp WHERE ename='ALLEN'));

INSERT �� : ���̺� ���� ����

��ü ������ ����(��ü �÷� ��ý�)
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8000,'DENNIS','SALESMAN',7698,'99/01/22',1700,200,30);

��ü ������ ������ ���� �÷��� ���� ���� 
INSERT INTO emp
VALUES (8001,'SUNNY','SALESMAN',7698,'99/03/01',1000,300,30);

[NULL ���� ���]
���� �Էµ��� �ʴ� �÷��� ����(NULL ó��)
INSERT INTO emp (empno,ename,job,mgr,hiredate, sal, deptno)
VALUES (8003,'PETER','CLERK',7698,'22/11/06',1700,20);

���� �Էµ��� �ʴ� �÷��� �������� �ʾ��� ���
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8004,'ANNIE','CLERK',7698,'22/11/06',1800,NULL,30);

��¥�� ����
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8005,'MICHEAL','CLERK',7698,TO_DATE('22/11/06','YY/MM/DD'),1800,NULL,30);

UPDATE�� : �� ������ ������ ���� (��, WHERE�� �ȳ����� ��ü �࿡ ������Ʈ ****����****)
UPDATE emp SET mgr = 7900 WHERE empno = 8000;
UPDATE emp SET ename = 'MICHAEL' WHERE empno = 8005;
UPDATE emp SET ename = 'MARIA',sal=2500,comm=500 WHERE empno = 8000;
where�� ������ ����
UPDATE emp SET ename = 'KINGKONG';

DELETE�� : ���� ����
DELETE FROM emp WHERE empno = 7369;

WHERE ���� ������� ������ ��� ���� ����
DELETE FROM emp;

�����ͺ��̽� Ʈ�����
Ʈ������� ������ ó���� �� ����
����Ŭ �������� �߻��ϴ� SQL������ �ϳ��� ������ �۾� �����ν� �����ϰų� �����ϴ� �Ϸ��� SQL���� Ʈ������̶�� �� �� ����
Ʈ������� �����͸� �ϰ��ǰ� �����ϴ� DML�������� ������

�����ͺ��̽� ��ü

���̺� : �⺻ ���� ������ ��� ���� ����
���̺��� �⺻���� ������ �������
���ڵ�� �÷����� ����
���ڵ�(record, row) : ���̺��� �����ʹ� �࿡ ����
Į��(column): ���̺��� �� �÷��� �����͸� ������ �� �ִ� �Ӽ��� ǥ��

�̸� ������Ģ
-���ڷ� �����ؾ���
-1~30�ڱ��� ����
-A~Z,a~z,0~9,_,$,#�� �����ؾ���
-������ ����ڰ� ������ �ٸ� ��ü�� �̸��� �ߺ����� �ʾƾ���(����)
-ORACLE SERVER �� ���� �ƴϾ�� ��

-����ڰ� ������ ���̺��� �̸� 
SELECT table_name FROM user_tables;

-����ڰ� ������ ���� ��ü ����
SELECT DISTINCT object_type FROM user_objects;

-����ڰ� ������ ���̺�, ��, ���Ǿ� �� ������
SELECT * FROM user_catalog;

���̺��� ����
CREATE TABLE employee(--�Ұ�ȣ ġ�� �ٹٲ� ���ֱ�
empno NUMBER(6),
name VARCHAR2(30) NOT NULL,--30byte �ѱ� 10�� ����, �ڹٿ��� 1���ڴ� 2byte ����Ŭ 3byte
salary NUMBER(8,2),
hire_date DATE DEFAULT SYSDATE,
CONSTRAINT employee_pk PRIMARY KEY (empno)--�ĺ��� �ε��� ���� �� ���.
);
������ �߰�
INSERT INTO employee (empno,name,salary)
VALUES (100,'ȫ�浿',1000.23);
COMMIT;

SELECT * FROM employee;

���̺� ���� �� PRIMARY KEY �� FOREIGN KEY ���� ���� �߰��ϱ�
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

INSERT INTO suser (id,name) VALUES ('Dragon','�浿��');
INSERT INTO suser (id,name) VALUES ('Cool42','�ڹ�ġ');

INSERT INTO sboard (num,id,content) VALUES (1,'Dragon','������ ��Ÿ�� �ݿ���');
INSERT INTO sboard (num,id,content) VALUES (2,'Cool42','������ �ľ�� �����');

--INSERT INTO sboard (num,id,content) VALUES (3,'blue','�𷹴� �Ͽ���');--���� ������ ���ԵǸ鼭 suser.id�� ���� �����͸� ����Ϸ��ϸ� ���� �߻�

Delete FROM suser WHERE id='Dragon';--�ڽ�Ű ������ �Ǿ��ֱ� ������ ���� �Ұ���

COMMIT;

�ΰ��� ���̺� ����
SELECT * FROM suser JOIN sboard USING (id);

SELECT*FROM suser;
SELECT*FROM sboard;

���̺��� ����
ADD ������ : ���̺� ���ο� �÷��� �߰�
ALTER TABLE employee ADD (eddr VARCHAR(2));

�������� �߰�
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY (empno); -- �ϳ��� Ű�� ������ ����

MODIFY ������ : ���̺��� �÷��� �����ϰų� NOT NULL�÷����� ������ �� ����
ALTER TABLE employee MODIFY(salary NUMBER(10,2) NOT NULL);

�÷��� ���� 
ALTER TABLE employee RENAME COLUMN salary TO sal;
ALTER TABLE employee RENAME COLUMN eddr TO addr;
ALTER TABLE employee RENAME COLUMN hite_date TO hire_date;

���̺�� ����
RENAME employee TO employee2;

���̺��� ����
DROP TABLE employee2; -- rollback�� �ȵǴϱ� �� ���.

ON DELETE CASCADE
�θ� ���̺��� �÷��� �����ϸ鼭 �ڽ� ���̺��� �ڽ� �����͸� ��� ����

CREATE TABLE s_member(
id VARCHAR2(20) PRIMARY KEY,
name VARCHAR2(30)
);

�ڽ����̺�
CREATE TABLE s_member_detail(
num NUMBER PRIMARY KEY,
content VARCHAR2(4000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES s_member (id) ON DELETE CASCADE
);

INSERT INTO s_member(id,name) VALUES ( 'dragon', 'ȫ�浿');
INSERT INTO s_member(id,name) VALUES ( 'sky', '�ڹ���');
COMMIT;

INSERT INTO s_member_detail(num,content,id) VALUES (1, '������ �ݿ���', 'sky');
INSERT INTO s_member_detail(num,content,id) VALUES (2, '������ �����', 'sky');
INSERT INTO s_member_detail(num,content,id) VALUES (3, '���� �Ͽ���', 'sky');

DELETE FROM s_member WHERE id ='sky';

COMMIT;

[�ǽ�����]
1.student��� �̸����� ���̺� ����
�÷���       id             name          age             score
������Ÿ��varchar2(10)   varchar2(30)    number(3)       number(3)
���� ���� primary key   not null        not null        not null

CREATE TABLE student (
id VARCHAR2(10) PRIMARY KEY,
name VARCHAR2(30) NOT NULL,
age NUMBER(3) NOT NULL,
score NUMBER(3) NOT NULL
);

2.�����͸� �Ʒ��� ���� �Է��Ͻÿ�.
id          name            age         score
dragon      ȫ�浿           21          100
sky         �念��           22          99
blue        �ڹ���           34          88

INSERT INTO student(id, name, age, score) VALUES ('dragon','ȫ�浿',21,100);
INSERT INTO student(id, name, age, score) VALUES ('sky','�念��',22,99);
INSERT INTO student(id, name, age, score) VALUES ('blue','�ڹ���',34,88);
COMMIT;

3. ������ �б�
student ���̺��� ���� �հ踦 ���Ͻÿ�.
SELECT SUM(score) FROM student;

��(VIEW)
�������� �ϳ� �̻��� ���̺� �ִ� �������� �κ� ����.
- ������ �׼����� �����ϱ� ����
- ������ ���Ǹ� ���� �ۼ��ϱ� ����
- ������ �������� �����ϱ� ����
- ������ �����ͷκ��� �پ��� ����� ��� ����
��� �������� ������� Į��(virtual Column)�� �����ϸ�
������ �����ϰ� ������ �����ϴ�. ����, �����ϸ� ���� ���̺�
�ݿ�,������ ���� ���� ���ǰ� virtual column  ������� ������ ����

VIEW ����
CREATE OR REPLACE VIEW emp10_view
AS SELECT empno id_member, ename name, sal*12 ann_salary FROM emp WHERE deptno=10;

SELECT * FROM emp10_view;

CREATE OR REPLACE VIEW emp_info_view
AS SELECT e.empno,e.ename,d.deptno,d.loc,d.dname
FROM emp e, dept d WHERE e.deptno = d.deptno;

SELECT * FROM emp_info_view;--��ġ �ϳ��� ���̺��� ������.

VEIW�� ���� ������ �����ϱ�
�Ϲ������� view�� ��ȸ������ ���� �������� �Ʒ��� ���� 
�����͸� ������ �� ����.
UPDATE emp10_view SET name='SCOTT' WHERE id_member = 7839;

���� ������ ��� ����, ���� ���� �����ϸ� ���� ����.
INSERT INTO emp10_view(id_member,name,ann_salary)
VALUES (8000,'JOHN',19000);

SELECT *FROM emp10_view;
SELECT *FROM emp;

WITH READ ONLY : �б� ���� �並 �����ϴ� �ɼ�

CREATE OR REPLACE VIEW emp20_view
AS SELECT empno id_number,ename name,sal*12 ann_salary
FROM emp
WHERE deptno=20
WITH READ ONLY;

UPDATE emp20_view SET name = 'DAVID' WHERE id_number = '7902'; 
�б� ���� �信���� dml�۾��� ������ �� �����ϴ�.

VIEW�� ����
CREATE OR REPLACE VIEW emp10_view
(id_number,name,sal,department_id)
AS SELECT empno,ename,sal,deptno
FROM emp
WHERE deptno=10;

SELECT * FROM emp10_view;

VIEW �� ����
DROP VIEW emp10_view;

SEQUENCE : ������ ���� �������ִ� ����Ŭ ��ü �������� �����ϸ� �⺻Ű�� ���� ���������� �����ϴ� �÷��� �ڵ������� ������ �� ����
            ���� PRIMARY KEY���� �����ϱ� ���� ���.
            
������ ����
CREATE SEQUENCE test_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;
���� ���� 1�̰� 1�� �����ϰ� �ִ밪�� 100000�� �Ǵ� ������ ����

CURRVAL: ���� ���� ��ȯ
NEXTVAL: ���� ������ ���� �ٸ� �� ��ȯ

SELECT test_seq.nextval FROM dual;
SELECT test_seq.currval FROM dual;

sboard ���̺� �����͸� ������ �� ������ Ȱ��
INSERT INTO sboard(num,id,content)
VALUES(test_seq.nextval,'sky','���⼭�� ����');
SELECT * FROM sboard;

������ ����
START WITH�� ������ �� ����

ALTER SEQUENCE test_seq
INCREMENT BY 5;  --5�� ����

������ ����
DROP SEQUENCE test_seq;

240318
�ε��� (INDEX)
�ε����� ������ �˻��� �����ϱ� ���� ����Ѵ�.

���̺��� �÷��� ���� ���� ������ ������ �� PRIMARY KEY�� UNIQUE�� �����ϸ� ORACLE�� �ڵ����� �� �÷��� ���� UNIQUE INDEX�� �����Ѵ�.

�ε��� �����

-������ ���� ������ �÷��� �ε��� ���� : UNIQUE INDEX
CREATE UNIQUE INDEX dname_idx ON dept (dname);

-������ ���� ������ �ʴ� �÷��� �ε��� ���� : NON UNIQUE INDEX
CREATE INDEX emp_ename_idx ON emp (ename);\

���Ǿ�(��ü�� �ٸ� �̸�,��Ī)�� �����Ͽ� ��ü �������� �ܼ�ȭ

���Ǿ� ����
CREATE SYNONYM emp20 FOR emp20_view;
SELECT*FROM emp20;

���Ǿ� ����
DROP SYNONYM emp20;