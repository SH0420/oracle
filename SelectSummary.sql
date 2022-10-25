-- HEAD
--DQL(���Ǿ�) ������ ��ȸ 
--select �÷���
--from ���̺��

desc emp;

--��ü ������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

--�κ��÷� ������
select empno,ename,sal
from emp;

select deptno
from emp;

select DISTINCT(deptno)
from emp;

select job
from emp;

select distinct(job)
from emp;
-- +,-,*,/ ������ �����ڴ� ����
--�÷��� ������� �����Ѵ�.
-- null ���� ����Ұ��ϴ�.
--�÷��� ��Ī�� ����Ҽ� �ִ�.
select ename as �����,sal,sal * 12+ nvl(comm,0)as ����,comm
from emp;

--����������
--select �÷���
--from ���̺��
--order by �÷���(���ı����� �Ǵ� ��) asc(��������)/desc(��������)

select *
from emp
order by hiredate;  --������������,���������� ���������ϴ�

-- ����(1 ~10),��¥(���ų�¥ ~ �ֱٳ�¥), ����(��������)

--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�(�÷��� = ��); <,>, != / <>,<=,>=, and, or

SELECT *
FROM EMP
where sal >= 3000; --�޿��� 3000 �̻��� ���

SELECT *
FROM EMP
where deptno = 30;

-- adn �ΰ��� �̻��� ������ ��� ���ΰ��
SELECT *
FROM EMP
where deptno = 30 and job ='SALESMAN'and empno =7499;
--���ڸ� �������� ����Ҷ�
--���ڰ��� ��ҹ��� ������ Ȯ���ϰ��ؾ���
--���ڰ���''�����

SELECT *
FROM EMP
where ename = 'FORD'; --�ҹ��� ford�� ����.

--��¥�� �������� ����Ҷ�
--��¥��''�����
--��¥�� ũ�Ⱑ �ִ�.
-- 80/12/20 ->  1980 12 20 �ð� �� �� ����
SELECT *
FROM EMP
where hiredate < '1982/01/01';

-- or �ΰ��̻��� �����߿� �ϳ��̻� ���� ��� ����
SELECT *
FROM EMP
where deptno = 10 or sal >= 2000;

--not ������ ������
SELECT *
FROM EMP
where sal != 3000;

SELECT *
FROM EMP
where not sal = 3000;

-- and , or
--���� ������ ǥ�� �Ҷ� ���
SELECT *
FROM EMP
where sal>= 1000 and sal <= 3000;

SELECT *
FROM EMP
where sal <= 1000 or sal >= 3000;

--between and
SELECT *
FROM EMP
where sal between 1000 and 3000;

-- in 
SELECT *
FROM EMP
where sal = 800 or sal = 3000 or sal = 5000;

SELECT *
FROM EMP
where sal in(800,3000,5000);

--like ������ 
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���ϵ� ī�带 ����Ѵ�(%, _)
--% ��� ���ڸ� ��ü�Ѵ�.
--_�ѹ��ڸ� ��ü�Ѵ�.
SELECT *
FROM EMP
where ename like 'F%';

SELECT *
FROM EMP
where ename like '%D';

SELECT *
FROM EMP
where ename like '%O%';

SELECT *
FROM EMP
where ename like '___D';

SELECT *
FROM EMP
where ename like 'S___%';

-- null ������
-- is null / in not null

SELECT *
FROM EMP
where comm is null; -- null�� �񱳺Ұ�

SELECT *
FROM EMP
where comm is not null;

----------------------------------------
--���տ�����
--�ΰ��� seclect ������ ����Ѵ�.
--�÷��� ������ �����ؾ� �Ѵ�.
--�÷��� Ÿ���� �����ؾ� �Ѵ�.
--�÷��� �̸��� ��� ����.
--������(UNION),������(INTERSECT),������(MINUS)

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION -- ������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION ALL-- ������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10; --�ߺ��Ǿ����� �ϳ��� ��Ÿ����. ALL ���� �� �ٳ�Ž

SELECT EMPNO,ENAME,SAL,DEPTNO --�������� �ĺ��� -->�÷� Ȯ��
FROM EMP
MINUS --������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
INTERSECT --������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

-- where
-- �񱳿�����, ��������, like, is null/is not null, ���տ�����
--<,>,<=,>=,=,!=
--and, or, not, between and , in
--like( % , _ )
--is null, is not null
--UNION, UNION ALL, MINUS , INTERSECT

--Q1
SELECT *
FROM EMP
where ename like('____S'); --'%S';

--Q2
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
where deptno=30 and job='SALESMAN';

--Q3
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
where deptno=20 or deptno=30 and sal>2000; --deptno in(20,30) --���տ����� ��������??

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;      --���տ����� �������??
--Q4
SELECT *
FROM EMP
where sal<2000 OR sal>3000;

--Q5
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND ENAME LIKE '%E%'
   AND SAL NOT BETWEEN 1000 AND 2000;

--Q6
SELECT *
  FROM EMP
 WHERE COMM IS NULL
   AND MGR IS NOT NULL
   AND JOB IN ('MANAGER', 'CLERK')
   AND ENAME NOT LIKE '_L%';
   
   --����Ŭ�Լ� P127
   --�Լ�
   --�����Լ� :upper,lower,substr,instr,replace,rpad,lpad,concat
   --�����Լ�
   --��¥�Լ�
   
   --UPPER ��ȣ �� ���� �����͸� ��� �빮�ڷκ�ȯ
   select 'Welcome',upper('Welcome')
   from dual;
   --LOWER ��ȣ �� ���� �����͸���� �ҹ���κ�ȯ
   select lower(ename),upper(ename)
   from emp;
   
   SELECT *
   FROM EMP
   where lower(ename) ='scott';
   
   SELECT ENAME,LENGTH(ENAME)
   FROM EMP;
   
   SELECT 'WELCOME TO ORACLE',SUBSTR('WELCOME TO ORACLE',2,3),SUBSTR('WELCOME TO ORACLE',10)
   FROM DUAL;
   
   SELECT 'WELCOME TO ORACLE',SUBSTR('WELCOME TO ORACLE',-3,3),SUBSTR('WELCOME TO ORACLE',-17)
   FROM DUAL;
   --���ڿ� ������ �ȿ��� Ư�� ���� ��ġ�� ã�� INSTR�Լ�
   SELECT INSTR('WELCOME TO ORACLE','O')
   FROM DUAL;
   
   SELECT INSTR('WELCOME TO ORACLE','O',6)
   FROM DUAL;
   
   SELECT INSTR('WELCOME TO ORACLE','O',3,2)
   FROM DUAL;
   
   SELECT 'WELCOME TO ORACLE',REPLACE('WELCOME TO ORACLE','TO','OF')
   FROM DUAL;
   
   SELECT 'Oracle',LPAD('ORACLE',10,'#'),RPAD('ORACLE',10,'*'),LPAD('ORACLE',10)
   FROM DUAL;
   
   SELECT RPAD('990103-',14,'*')
   FROM DUAL;
   
   SELECT CONCAT(EMPNO,ENAME), EMPNO ||''|| ENAME
   FROM EMP;
   
 ==========����============
 select 
          round(1234.5678),
          round(1234.5678,0),
          round(1234.5678,1), --�Ҽ��� ù°�ڸ�����ǥ��, ��°�ڸ����� �ݿø� 
          round(1234.5678,2),
          round(1234.5678,-1), --������ ������ �ݿø� ->1230
          round(1234.5678,-2)  --> 1200
 from dual;
 
 select 
          trunc(1234.5678),
          trunc(1234.5678,0),
          trunc(1234.5678,1), --�ش��ڸ��������츮�� ������������ -> 1234.5  
          trunc(1234.5678,2),
          trunc(1234.5678,-1), --> 1230
          trunc(1234.5678,-2)  
 from dual;
 
 select 
          ceil(3.14),  --�ڽź��� ū ���� ����� ����   -->4
          floor(3.14), --�ڽź��� ���� ���� ����� ���� -->3
          ceil(-3.14), --> -3
          floor(-3.14) --> -4
 from dual;
 
 select mod(5,2),mod(10,4)
 from dual;
 
 select *
 from emp
--<<<<<<< HEAD
 where mod(empno,2) = 1;
 
 --��¥ �Լ�
 select sysdata- 1 ����, sysdate, sysdate + 1 ����
 from dual;
 
 select sysdate - hiredate as �ٹ��ϼ� -- ���̰� �ϼ� ��ȯ
 from emp;
 
 select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
 from dual;
 
 select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as �Ի�����
 from emp;
 --- �ټӳ��
 
 select trunc((sysdate - hiredate) / 365) �ټӳ��
 from emp;
 --sysdate, round ,trunc
 select hiredate
 from emp;
 SELECT SYSDATE,
        ROUND(SYSDATE, 'CC') AS FORMAT_CC,
        ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY,
        ROUND(SYSDATE,'Q') AS FORMAT_Q,
        ROUND(SYSDATE,'DDD') AS FORMAT_DDD,
        ROUND(SYSDATE,'HH') AS FORMAT_HH
        FROM DUAL;
        
--�ڷ�����ȯ �Լ�
--to_char()
--to_number()
--to_date()

--��¥�� ���ڷ�
select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

--���ڸ� ����
select to_char(123456,'L999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;
--0���� ���ڸ��� 0����ä����

--���ڸ� ���ڷ�

select '20000' -10000  --�ڵ�����ȯ
from dual;

select '20000' -'10000'
from dual;

select '20000' -'5000'
from dual;

select '20,000' -'5,000' --to_number()����ȯ�� �ؾ��Ѵ�.
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--���ڸ� ��¥��
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

-- null������ ó��
--nvl(null,�ٲٰ����������)
--nvl�� null�������� Ÿ�԰� ���� Ÿ���� �����ؾ��Ѵ�.
--nvl(����,����) , nvl(����,����)
select ename �����,sal,sal *12 + nvl(comm,0) as ����,comm
from emp;

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr  --���� �����ʹ� �������ʴ´�.
from emp
where mgr is null;    

select comm, nvl2(comm,'O','X') --Ÿ�������� �������
from emp;

--���ǹ� ǥ���ϴ� �Լ�
--decode() -> switch
--case     -> if

select ename,job,deptno,
         decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ') as �μ��� 
from emp;
--decode�� �ܼ� �񱳹ۿ��Ҽ�����.

--������ ���ǽ����� ���� �Ҽ� �ִ�.
case 
         when ���ǽ� then ���๮
         when ���ǽ� then ���๮
         when ���ǽ� then ���๮
         else ���๮
end as ��Ī         
         
select ename,job,deptno,
        case 
         when deptno = 10 then 'AAA'
         when deptno = 20 then 'BBB'
         when deptno = 30 then 'CCC'
         else '��Ÿ'
         end as �μ���      
from emp;

select ename,job,sal,
          case 
                when sal between 3000 and 5000 then '�ӿ�'
                when sal >= 2000 and sal < 3000 then '������'
                when sal >= 500 and sal < 2000 then '���'
                else '��Ÿ'
           end as ����
from emp;

Q1
select empno,rpad(substr(empno,1,2),4,'*'),ename
          enmae, rpad(substr(ename,1,1),length(ename),'*')
from emp;
where length(ename)>= 5
   and length(ename)< 6;
Q2
select empno,ename,sal,
         TRUNC(sal / 21.5,2) as Day_pay,
         ROUND(sal/21.5 /8,1) as time_pay
from emp;
Q4
select empno,ename,mgr,
         case
                  when substr(mgr,1,2) = '75'then '5555'
                  when substr(mgr,1,2) = '76'then '6666'
                  when substr(mgr,1,2) = '77'then '7777'
                  when substr(mgr,1,2) = '78'then '8888'
                  when mgr is null then '0000'
                  else to_char(mgr)
         end as CHG_MGR
from emp;

===============================7��
--sum(),avg(),count(),max(),min()
--�Ϲ��÷��� ���� ��� �Ұ�
--ũ�� �񱳰� ������ ��� Ÿ�Կ� ��밡��

select sum(sal) --sum�Լ��� ��ȸ�� �࿡ ������ �� ���� ��� ���Ѱ����� ��ȯ
from emp;

select avg(sal) --avg�Լ��� ������ �������� ��հ� ��ȯ
from emp;

select count(*),count(comm) --count�Լ��� ������ �������� ���� ��ȯ
from emp;

select max(sal),min(sal) --max ������ ������ �� �ִ� ��ȯ
from emp;                --min ������ ������ �� �ּڰ� ��ȯ    

select ename,max(sal)
from emp;

select min(hiredate), max(hiredate)
from emp
where deptno = 20;

--select �÷���
--from ���̺��
--where ���ǽ�(�׷��Լ� ���Ұ�/group by ,having ���� ��������)
--group by �����÷���
--order by �÷��� ���Ĺ�� ==> �� �������� �ۼ�
--having ���ǽ�(�׷��Լ� ����Ѵ�)  -->group by�� ���������ؾ���
----------group by ��----------
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;

select avg(sal)
from emp
group by deptno;  
-------group order �� ------
select deptno,avg(sal)
from emp
group by deptno
order by deptno;

select deptno, job, avg(sal)
from emp
group by deptno,job;

select deptno, job, avg(sal)
from emp
group by deptno,job
order by deptno;

select deptno, job, avg(sal)
from emp
group by deptno,job
order by deptno,job desc;
-------------------------having ��
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; --group by���ؼ� ��ȸ ����� ������ �ش�
                         --���ǽ��� �ۼ��Ҷ� �׷��Լ��� ����Ѵ�.
                         
                        
select deptno, avg(sal)
from emp
where deptno !=10
group by deptno
having avg(sal) >=2000;

-------
=======
 where mod(empno,2) = 1;
>>>>>>> 1fa4dde7c683476d8b39d02b701f00b45d3b3a9a

-- sql developer
-----------------------------------------------10/20
--����(Join)
-- 2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� �ΰ��̻��� ���̺��� �ۼ��Ѵ�
-- where�� ���� ������ �ۼ��Ѵ�.
-- cross join (where�� ���� ����)- ���ǾȾ�
-- equi join (where�� ��� ������� :=)
-- non equi join (where ���� ������ : and ,or )
-- self join(where �ϳ��� ���̺��� ����Ѵ�)
-- out join (where �� ���� �Ǵ� �����͸� ���� ��ȸ�ϱ����� :(+))

select ename,job,e.deptno,dname,loc -->���ʿ� �Ȱ��� �÷��� ���ɶ��� �Ҽ��� ��������Ѵ�
from emp e,dept d -->���̺� ��Ī�� �ο��Ѵ������� ���� �̸��� ����Ҽ�����.
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade,losal,hisal
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal<= s.hisal; -���� ����� ������ 

--���, �̸�, �޿�, �μ���ȣ, �μ���, �޿����
--emp               dept          salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal ;

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m --�������� ��� �ݵ�� ��Ī �ο�
where e.mgr =m.empno;

select ename,deptno
from emp
where deptno =20;

-- scott ���� �μ��� �ٹ��ϴ� ���
ename   ename
scott   smith
scott   jones
scott   adams
scott   ford

select work.ename, friend.ename
from emp work,emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

--�ܺ�����
--��� �����Ǵ� �����͸� ���� ��ȸ�ϱ����ؼ� ���

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m 
where e.mgr =m.empno(+); --�����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�.

select ename, sal, d.deptno, dname
from emp e,dept d
where e.deptno(+) = d.deptno;

-- ANSI-JOIN(ǥ������ ���)
--cross join
--natural join
--inner join(equi, non equi, self join)
--outer join((+)) -- [left, right, full] outer join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;


select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) --���� ���̺��� �÷����� ������ ��� ��� ����
where ename ='SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --�����Ͱ� �ִ� ���� �����Ѵ�
on e.mgr = m.empno;

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select ename, sal, d.deptno, dname
from emp e,dept d
where e.deptno(+) = d.deptno;

select ename, sal, d.deptno, dname
from emp e right outer join dept d
on e.deptno = d.deptno;

Q1 
select d.deptno,d.dname,e.empno,e.ename,e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal > 2000;

Q2 
select 
       e.deptno,
       d.dname,
       trunc(avg(sal)),
       max(sal),
       min(sal),
       count(*)
from emp e inner join dept d
on e.deptno = d.deptno --using(deptno) ��Ī ���� ������ ���ѵȴ�.
group by e.deptno,d.dname;

Q3
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno , e.ename;

Q4
select d.deptno,d.dname,
       e.empno,e.ename,e.mgr,e.sal,e.deptno,
       s.losal,s.hisal,s.grade,
       m.empno,m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno;
---------------P242 
--�������� 
-- select ������ ��ø�ؼ� ����ϴ°�(where)

select ename, max(sal)
from emp;

select ename,sal
from emp
where sal =(
                 select max(sal)
                 from emp
           );

select dname
from dept 
where deptno = 20;

--��������
select dname
from dept
where deptno =(--��������
               select deptno
               from emp
               where ename = 'SCOTT'
               );
            
-- DALLAS               
--�̸�, �μ���ȣ
select ename, deptno
from emp
where deptno = (
                  select deptno 
                  from dept
                  where loc = 'DALLAS'
               );
               
               
-- �ڽ��� ���ӻ����KING�� ����� �̸��� �޿��� ��ȸ�ϼ���
select ename,sal
from emp
where mgr = (
                select empno
                from emp
                where ename = 'KING'
                );

select *
from emp
where sal in(5000,3000,2800);
--������ ��������
--in ����߿� �ϳ��� �����ϸ� �ȴ�.
-- > any : ����߿� ���� ������ ���� ũ��ȴ�
-- > all : ����߿� ���� ū �� ���� ũ�� �ȴ�.
select *
from emp
where sal >= any( --���� ���������� ũ�� o   ->  < ����ū������ ������
            select max(sal)
            from emp
            group by deptno
            );
            
select ename,sal
from emp
where sal > all(select sal --���� ū������ ũ��ȴ�
                from emp
                where deptno = 30);

select *
from emp
where (deptno,sal) in (
                             select deptno,max(sal)
                             from emp
                             group by deptno 
                       ); 
                       
----------------------10/21 p 266 scott����
-- DML(���������۾�) : insert, update, delete
-- insert : ���̺� ������ ����
-- insert into ���̺�� (�÷���1,�÷���2,......)
-- values(��1,��2,....)
-- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�.
-- �ۼ� ������� 1 : 1 ��Ī�ȴ�.


--DML ���۾�
create table dept_temp
as
select * from  dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --�÷� ����
values (70,'HTML','SEOUL');

insert into dept_temp  --�÷� ����, ����� NULL�����ͻ���
values (80,NULL,'SEOUL');

insert into dept_temp (deptno,dname) -- ������ null ������ ����
values (60,'JSP'); 

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'��û��','MANAGER',9999,SYSDATE,4000,NULL,30);

-- UPDATE : �÷��� �����͸� ����(����)
-- UPDATE ���̺��
-- SET �÷��� = ��,�÷��� = ��, .....
-- where ���ǽ�
-- �������� ������� ������ �ش� �÷��� ��� ����ȴ�.

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';

ROLLBACK;

update dept_temp2
set dname ='DATABASE',loc ='SEOUL'
where deptno = 40;

-- delete(������ ����)
-- delete from ���̺��
-- where ���ǽ�
-- �������� ������� ������ ��� �����Ͱ� �����ȴ�.

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2;

drop table emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';

-- TCL(�������� �������� �Ǵ� ���)
-- Ʈ������
-- commit, rollback, save point
-- commit : ������ ���� ����(���̺��� ������ �ݿ�)
--          create ������ ����ؼ� ��ü������??(�ڵ�)
-- rollback : ������ ���� ���(���̺��� ������ �̹ݿ�)���󺹱�
--             õ������,����,����(�ڵ�)
create table dept01
as
select * 
from dept;

delete from dept01;

commit; -- commit ���Ĵ� rollback�Ұ� //rollback�� commit�� ��������

select * 
from dept01;

-- Ʈ������ ���� ����
drop table dept01;

truncate table dept01;-- drop table dept01 �� �������� but rollback�Ұ�,�������ÿ� commit�Ͼ

rollback;

-- DDL(������ ���Ǿ�) : table(��簴ü)�� ����,����,�����ϴ� ��ɾ�
-- create(����), alter(����) ,drop(����)

create table ���̺��( --table(��ü)
     �÷���1 Ÿ��,     -- column(�Ӽ�)
     �÷���2 Ÿ��,     
     �÷���3 Ÿ��  
);   


--DDL


create table emp_ddl(
--    ���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
    empno number(4),
    ename varchar2(10), -- byte
    job varchar2(9),
    mgr number(4),
    hiredate date, 
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);
select * from emp_ddl;

insert into emp_ddl
values (9999,'�̼���','MANNAGER',1111,SYSDATE,1000,NULL,10);

create table dept_ddl --���̺��� ����
as
select * from dept;

create table dept_30
as
select * from dept
where deptno = 30;

create table dept_m
as
select dname,loc
from dept;

create table dept_d
as
select * from dept
where 1 != 1;   --���̺��� ������ �����Ѵ�.

-- ���̺� ����(�÷��� ���� ����)
-- ���ο� �÷��߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ����
-- alter 


create table emp_alter
as
select * from emp;

select *
from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

select *
from emp_alter;

--rename
--modify
--drop

--���̺���� DROP
--drop table ���̺��

drop table emp_alter;

Q1.
create table EMP_HW(
    empno number(4),
    ename varchar2(10), -- byte
    job varchar2(9),
    mgr number(4),
    hiredate date, 
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

Q2
alter table emp_hw
add BIGO varchar2(20);

Q3
alter table emp_hw
modify bigo varchar2(30);

Q4
alter table emp_hw
rename column bigo to remark; 

Q5
insert into emp_hw
select  empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

Q6
drop table emp_hw;

select *
from emp_Hw;

-----327P
-- �����ͻ���
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;

--index(�˻��ӵ��� ����ϱ����� ��� ��ü)
--select ������ �˼��� ��� ��Ų��
--��ü ���ڵ��� 3% ~5% ���� �϶�
--index��ü�� �÷��� �����ؼ� ����Ѵ�

create index �ε�����
on ���̺��(�÷���);

create table emp01
as
select * from emp;

insert into emp01
select *
from emp01;

insert into emp01(empno,ename)
values(1111,'bts');

--index ��ü ������(0.030 ~ 0.040)
select empno,ename
from emp01
where ename = 'bts';

create index idx_emp01_ename
on emp01(ename);
-- index ��ü ������(0��)
select empno,ename
from emp01
where ename ='bts';

drop index idx_emp01_ename; --����

select *
from emp01;

drop table emp01;

-- ���̺� ������ ����
 show recyclebin; -- ������ ���̺� ����
 
 flashback table EMP_HW  --����
 to before drop;

 purge recyclebin; --������ ����
 
 -----------p360
 
 -- ��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ� ��
 -- not null
 -- unique  --> �ߺ��� ����� 
 -- primary key
 -- foreign key
 -- check
 
 -- emp,dept
 
 
 
 insert into emp
 values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);
 
 drop table emp02;
 
 create table emp02(
          empno number(4) primary key, -- (not null + unique) =primary key  
          ename varchar2(10) not null, -->not null�� ���������� ��
          job varchar2(9),
          deptno number(2)
 );
 --�⺻Ű �����ȣ�� ������
insert into emp02
values (1111,'ȫ�浿','MANAGER',30);
 
insert into emp02
values (2222,'ȫ�浿','MANAGER',30); 
 
insert into emp02
values (null,'������','SALESMAN',20);  
 
insert into emp02
values (2222,'������','SALESMAN',10);  
--���Ἲ ���� ����(SCOTT.SYS_C0011064)�� ����˴ϴ�
--���Ἲ ���� ����(SCOTT.EMP02_EMPNO_PK)�� ����˴ϴ�
delete from emp02;

 create table emp02(
          empno number(4) constraint emp02_empno_pk primary key, --���������� �츮��Ȯ���Ҽ��ְ� �����ϴ¹�
          ename varchar2(10) constraint emp02_ename_nn not null, --constraint �������Ǹ�     
          job varchar2(9),
          deptno number(2)
 );

select *
from emp02;
=======
--DQL(���Ǿ�) ������ ��ȸ 
--select �÷���
--from ���̺��

desc emp;

--��ü ������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

--�κ��÷� ������
select empno,ename,sal
from emp;

select deptno
from emp;

select DISTINCT(deptno)
from emp;

select job
from emp;

select distinct(job)
from emp;
-- +,-,*,/ ������ �����ڴ� ����
--�÷��� ������� �����Ѵ�.
-- null ���� ����Ұ��ϴ�.
--�÷��� ��Ī�� ����Ҽ� �ִ�.
select ename as �����,sal,sal * 12+ nvl(comm,0)as ����,comm
from emp;

--����������
--select �÷���
--from ���̺��
--order by �÷���(���ı����� �Ǵ� ��) asc(��������)/desc(��������)

select *
from emp
order by hiredate;  --������������,���������� ���������ϴ�

-- ����(1 ~10),��¥(���ų�¥ ~ �ֱٳ�¥), ����(��������)

--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�(�÷��� = ��); <,>, != / <>,<=,>=, and, or

SELECT *
FROM EMP
where sal >= 3000; --�޿��� 3000 �̻��� ���

SELECT *
FROM EMP
where deptno = 30;

-- adn �ΰ��� �̻��� ������ ��� ���ΰ��
SELECT *
FROM EMP
where deptno = 30 and job ='SALESMAN'and empno =7499;
--���ڸ� �������� ����Ҷ�
--���ڰ��� ��ҹ��� ������ Ȯ���ϰ��ؾ���
--���ڰ���''�����

SELECT *
FROM EMP
where ename = 'FORD'; --�ҹ��� ford�� ����.

--��¥�� �������� ����Ҷ�
--��¥��''�����
--��¥�� ũ�Ⱑ �ִ�.
-- 80/12/20 ->  1980 12 20 �ð� �� �� ����
SELECT *
FROM EMP
where hiredate < '1982/01/01';

-- or �ΰ��̻��� �����߿� �ϳ��̻� ���� ��� ����
SELECT *
FROM EMP
where deptno = 10 or sal >= 2000;

--not ������ ������
SELECT *
FROM EMP
where sal != 3000;

SELECT *
FROM EMP
where not sal = 3000;

-- and , or
--���� ������ ǥ�� �Ҷ� ���
SELECT *
FROM EMP
where sal>= 1000 and sal <= 3000;

SELECT *
FROM EMP
where sal <= 1000 or sal >= 3000;

--between and
SELECT *
FROM EMP
where sal between 1000 and 3000;

-- in 
SELECT *
FROM EMP
where sal = 800 or sal = 3000 or sal = 5000;

SELECT *
FROM EMP
where sal in(800,3000,5000);

--like ������ 
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���ϵ� ī�带 ����Ѵ�(%, _)
--% ��� ���ڸ� ��ü�Ѵ�.
--_�ѹ��ڸ� ��ü�Ѵ�.
SELECT *
FROM EMP
where ename like 'F%';

SELECT *
FROM EMP
where ename like '%D';

SELECT *
FROM EMP
where ename like '%O%';

SELECT *
FROM EMP
where ename like '___D';

SELECT *
FROM EMP
where ename like 'S___%';

-- null ������
-- is null / in not null

SELECT *
FROM EMP
where comm is null; -- null�� �񱳺Ұ�

SELECT *
FROM EMP
where comm is not null;

----------------------------------------
--���տ�����
--�ΰ��� seclect ������ ����Ѵ�.
--�÷��� ������ �����ؾ� �Ѵ�.
--�÷��� Ÿ���� �����ؾ� �Ѵ�.
--�÷��� �̸��� ��� ����.
--������(UNION),������(INTERSECT),������(MINUS)

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION -- ������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION ALL-- ������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10; --�ߺ��Ǿ����� �ϳ��� ��Ÿ����. ALL ���� �� �ٳ�Ž

SELECT EMPNO,ENAME,SAL,DEPTNO --�������� �ĺ��� -->�÷� Ȯ��
FROM EMP
MINUS --������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
INTERSECT --������
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

-- where
-- �񱳿�����, ��������, like, is null/is not null, ���տ�����
--<,>,<=,>=,=,!=
--and, or, not, between and , in
--like( % , _ )
--is null, is not null
--UNION, UNION ALL, MINUS , INTERSECT

--Q1
SELECT *
FROM EMP
where ename like('____S'); --'%S';

--Q2
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
where deptno=30 and job='SALESMAN';

--Q3
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
where deptno=20 or deptno=30 and sal>2000; --deptno in(20,30) --���տ����� ��������??

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;      --���տ����� �������??
--Q4
SELECT *
FROM EMP
where sal<2000 OR sal>3000;

--Q5
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND ENAME LIKE '%E%'
   AND SAL NOT BETWEEN 1000 AND 2000;

--Q6
SELECT *
  FROM EMP
 WHERE COMM IS NULL
   AND MGR IS NOT NULL
   AND JOB IN ('MANAGER', 'CLERK')
   AND ENAME NOT LIKE '_L%';
   
   --����Ŭ�Լ� P127
   --�Լ�
   --�����Լ� :upper,lower,substr,instr,replace,rpad,lpad,concat
   --�����Լ�
   --��¥�Լ�
   
   --UPPER ��ȣ �� ���� �����͸� ��� �빮�ڷκ�ȯ
   select 'Welcome',upper('Welcome')
   from dual;
   --LOWER ��ȣ �� ���� �����͸���� �ҹ���κ�ȯ
   select lower(ename),upper(ename)
   from emp;
   
   SELECT *
   FROM EMP
   where lower(ename) ='scott';
   
   SELECT ENAME,LENGTH(ENAME)
   FROM EMP;
   
   SELECT 'WELCOME TO ORACLE',SUBSTR('WELCOME TO ORACLE',2,3),SUBSTR('WELCOME TO ORACLE',10)
   FROM DUAL;
   
   SELECT 'WELCOME TO ORACLE',SUBSTR('WELCOME TO ORACLE',-3,3),SUBSTR('WELCOME TO ORACLE',-17)
   FROM DUAL;
   --���ڿ� ������ �ȿ��� Ư�� ���� ��ġ�� ã�� INSTR�Լ�
   SELECT INSTR('WELCOME TO ORACLE','O')
   FROM DUAL;
   
   SELECT INSTR('WELCOME TO ORACLE','O',6)
   FROM DUAL;
   
   SELECT INSTR('WELCOME TO ORACLE','O',3,2)
   FROM DUAL;
   
   SELECT 'WELCOME TO ORACLE',REPLACE('WELCOME TO ORACLE','TO','OF')
   FROM DUAL;
   
   SELECT 'Oracle',LPAD('ORACLE',10,'#'),RPAD('ORACLE',10,'*'),LPAD('ORACLE',10)
   FROM DUAL;
   
   SELECT RPAD('990103-',14,'*')
   FROM DUAL;
   
   SELECT CONCAT(EMPNO,ENAME), EMPNO ||''|| ENAME
   FROM EMP;
   
 ==========����============
 select 
          round(1234.5678),
          round(1234.5678,0),
          round(1234.5678,1), --�Ҽ��� ù°�ڸ�����ǥ��, ��°�ڸ����� �ݿø� 
          round(1234.5678,2),
          round(1234.5678,-1), --������ ������ �ݿø� ->1230
          round(1234.5678,-2)  --> 1200
 from dual;
 
 select 
          trunc(1234.5678),
          trunc(1234.5678,0),
          trunc(1234.5678,1), --�ش��ڸ��������츮�� ������������ -> 1234.5  
          trunc(1234.5678,2),
          trunc(1234.5678,-1), --> 1230
          trunc(1234.5678,-2)  
 from dual;
 
 select 
          ceil(3.14),  --�ڽź��� ū ���� ����� ����   -->4
          floor(3.14), --�ڽź��� ���� ���� ����� ���� -->3
          ceil(-3.14), --> -3
          floor(-3.14) --> -4
 from dual;
 
 select mod(5,2),mod(10,4)
 from dual;
 
 select *
 from emp
--<<<<<<< HEAD
 where mod(empno,2) = 1;
 
 --��¥ �Լ�
 select sysdata- 1 ����, sysdate, sysdate + 1 ����
 from dual;
 
 select sysdate - hiredate as �ٹ��ϼ� -- ���̰� �ϼ� ��ȯ
 from emp;
 
 select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
 from dual;
 
 select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as �Ի�����
 from emp;
 --- �ټӳ��
 
 select trunc((sysdate - hiredate) / 365) �ټӳ��
 from emp;
 --sysdate, round ,trunc
 select hiredate
 from emp;
 SELECT SYSDATE,
        ROUND(SYSDATE, 'CC') AS FORMAT_CC,
        ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY,
        ROUND(SYSDATE,'Q') AS FORMAT_Q,
        ROUND(SYSDATE,'DDD') AS FORMAT_DDD,
        ROUND(SYSDATE,'HH') AS FORMAT_HH
        FROM DUAL;
        
--�ڷ�����ȯ �Լ�
--to_char()
--to_number()
--to_date()

--��¥�� ���ڷ�
select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

--���ڸ� ����
select to_char(123456,'L999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;
--0���� ���ڸ��� 0����ä����

--���ڸ� ���ڷ�

select '20000' -10000  --�ڵ�����ȯ
from dual;

select '20000' -'10000'
from dual;

select '20000' -'5000'
from dual;

select '20,000' -'5,000' --to_number()����ȯ�� �ؾ��Ѵ�.
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--���ڸ� ��¥��
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

-- null������ ó��
--nvl(null,�ٲٰ����������)
--nvl�� null�������� Ÿ�԰� ���� Ÿ���� �����ؾ��Ѵ�.
--nvl(����,����) , nvl(����,����)
select ename �����,sal,sal *12 + nvl(comm,0) as ����,comm
from emp;

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr  --���� �����ʹ� �������ʴ´�.
from emp
where mgr is null;    

select comm, nvl2(comm,'O','X') --Ÿ�������� �������
from emp;

--���ǹ� ǥ���ϴ� �Լ�
--decode() -> switch
--case     -> if

select ename,job,deptno,
         decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ') as �μ��� 
from emp;
--decode�� �ܼ� �񱳹ۿ��Ҽ�����.

--������ ���ǽ����� ���� �Ҽ� �ִ�.
case 
         when ���ǽ� then ���๮
         when ���ǽ� then ���๮
         when ���ǽ� then ���๮
         else ���๮
end as ��Ī         
         
select ename,job,deptno,
        case 
         when deptno = 10 then 'AAA'
         when deptno = 20 then 'BBB'
         when deptno = 30 then 'CCC'
         else '��Ÿ'
         end as �μ���      
from emp;

select ename,job,sal,
          case 
                when sal between 3000 and 5000 then '�ӿ�'
                when sal >= 2000 and sal < 3000 then '������'
                when sal >= 500 and sal < 2000 then '���'
                else '��Ÿ'
           end as ����
from emp;

Q1
select empno,rpad(substr(empno,1,2),4,'*'),ename
          enmae, rpad(substr(ename,1,1),length(ename),'*')
from emp;
where length(ename)>= 5
   and length(ename)< 6;
Q2
select empno,ename,sal,
         TRUNC(sal / 21.5,2) as Day_pay,
         ROUND(sal/21.5 /8,1) as time_pay
from emp;
Q4
select empno,ename,mgr,
         case
                  when substr(mgr,1,2) = '75'then '5555'
                  when substr(mgr,1,2) = '76'then '6666'
                  when substr(mgr,1,2) = '77'then '7777'
                  when substr(mgr,1,2) = '78'then '8888'
                  when mgr is null then '0000'
                  else to_char(mgr)
         end as CHG_MGR
from emp;

===============================7��
--sum(),avg(),count(),max(),min()
--�Ϲ��÷��� ���� ��� �Ұ�
--ũ�� �񱳰� ������ ��� Ÿ�Կ� ��밡��

select sum(sal) --sum�Լ��� ��ȸ�� �࿡ ������ �� ���� ��� ���Ѱ����� ��ȯ
from emp;

select avg(sal) --avg�Լ��� ������ �������� ��հ� ��ȯ
from emp;

select count(*),count(comm) --count�Լ��� ������ �������� ���� ��ȯ
from emp;

select max(sal),min(sal) --max ������ ������ �� �ִ� ��ȯ
from emp;                --min ������ ������ �� �ּڰ� ��ȯ    

select ename,max(sal)
from emp;

select min(hiredate), max(hiredate)
from emp
where deptno = 20;

--select �÷���
--from ���̺��
--where ���ǽ�(�׷��Լ� ���Ұ�/group by ,having ���� ��������)
--group by �����÷���
--order by �÷��� ���Ĺ�� ==> �� �������� �ۼ�
--having ���ǽ�(�׷��Լ� ����Ѵ�)  -->group by�� ���������ؾ���
----------group by ��----------
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;

select avg(sal)
from emp
group by deptno;  
-------group order �� ------
select deptno,avg(sal)
from emp
group by deptno
order by deptno;

select deptno, job, avg(sal)
from emp
group by deptno,job;

select deptno, job, avg(sal)
from emp
group by deptno,job
order by deptno;

select deptno, job, avg(sal)
from emp
group by deptno,job
order by deptno,job desc;
-------------------------having ��
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; --group by���ؼ� ��ȸ ����� ������ �ش�
                         --���ǽ��� �ۼ��Ҷ� �׷��Լ��� ����Ѵ�.
                         
                        
select deptno, avg(sal)
from emp
where deptno !=10
group by deptno
having avg(sal) >=2000;

-------
=======
 where mod(empno,2) = 1;
>>>>>>> 1fa4dde7c683476d8b39d02b701f00b45d3b3a9a

-- sql developer
-----------------------------------------------10/20
--����(Join)
-- 2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� �ΰ��̻��� ���̺��� �ۼ��Ѵ�
-- where�� ���� ������ �ۼ��Ѵ�.
-- cross join (where�� ���� ����)- ���ǾȾ�
-- equi join (where�� ��� ������� :=)
-- non equi join (where ���� ������ : and ,or )
-- self join(where �ϳ��� ���̺��� ����Ѵ�)
-- out join (where �� ���� �Ǵ� �����͸� ���� ��ȸ�ϱ����� :(+))

select ename,job,e.deptno,dname,loc -->���ʿ� �Ȱ��� �÷��� ���ɶ��� �Ҽ��� ��������Ѵ�
from emp e,dept d -->���̺� ��Ī�� �ο��Ѵ������� ���� �̸��� ����Ҽ�����.
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade,losal,hisal
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal<= s.hisal; -���� ����� ������ 

--���, �̸�, �޿�, �μ���ȣ, �μ���, �޿����
--emp               dept          salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal ;

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m --�������� ��� �ݵ�� ��Ī �ο�
where e.mgr =m.empno;

select ename,deptno
from emp
where deptno =20;

-- scott ���� �μ��� �ٹ��ϴ� ���
ename   ename
scott   smith
scott   jones
scott   adams
scott   ford

select work.ename, friend.ename
from emp work,emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

--�ܺ�����
--��� �����Ǵ� �����͸� ���� ��ȸ�ϱ����ؼ� ���

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m 
where e.mgr =m.empno(+); --�����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�.

select ename, sal, d.deptno, dname
from emp e,dept d
where e.deptno(+) = d.deptno;

-- ANSI-JOIN(ǥ������ ���)
--cross join
--natural join
--inner join(equi, non equi, self join)
--outer join((+)) -- [left, right, full] outer join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;


select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) --���� ���̺��� �÷����� ������ ��� ��� ����
where ename ='SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --�����Ͱ� �ִ� ���� �����Ѵ�
on e.mgr = m.empno;

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select ename, sal, d.deptno, dname
from emp e,dept d
where e.deptno(+) = d.deptno;

select ename, sal, d.deptno, dname
from emp e right outer join dept d
on e.deptno = d.deptno;

Q1 
select d.deptno,d.dname,e.empno,e.ename,e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal > 2000;

Q2 
select 
       e.deptno,
       d.dname,
       trunc(avg(sal)),
       max(sal),
       min(sal),
       count(*)
from emp e inner join dept d
on e.deptno = d.deptno --using(deptno) ��Ī ���� ������ ���ѵȴ�.
group by e.deptno,d.dname;

Q3
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno , e.ename;

Q4
select d.deptno,d.dname,
       e.empno,e.ename,e.mgr,e.sal,e.deptno,
       s.losal,s.hisal,s.grade,
       m.empno,m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno;
---------------P242 
--�������� 
-- select ������ ��ø�ؼ� ����ϴ°�(where)

select ename, max(sal)
from emp;

select ename,sal
from emp
where sal =(
                 select max(sal)
                 from emp
           );

select dname
from dept 
where deptno = 20;

--��������
select dname
from dept
where deptno =(--��������
               select deptno
               from emp
               where ename = 'SCOTT'
               );
            
-- DALLAS               
--�̸�, �μ���ȣ
select ename, deptno
from emp
where deptno = (
                  select deptno
                  from dept
                  where loc = 'DALLAS'
               );
               
               
-- �ڽ��� ���ӻ����KING�� ����� �̸��� �޿��� ��ȸ�ϼ���
select ename,sal
from emp
where mgr = (
                select empno
                from emp
                where ename = 'KING'
                );

select *
from emp
where sal in(5000,3000,2800);
--������ ��������
--in ����߿� �ϳ��� �����ϸ� �ȴ�.
-- > any : ����߿� ���� ������ ���� ũ��ȴ�
-- > all : ����߿� ���� ū �� ���� ũ�� �ȴ�.
select *
from emp
where sal >= any( --���� ���������� ũ�� o   ->  < ����ū������ ������
            select max(sal)
            from emp
            group by deptno
            );
            
select ename,sal
from emp
where sal > all(select sal --���� ū������ ũ��ȴ�
                from emp
                where deptno = 30);

select *
from emp
where (deptno,sal) in (
                             select deptno,max(sal)
                             from emp
                             group by deptno 
                       );      

----------------------10/21 p 266 scott����
-- DML(���������۾�) : insert, update, delete
-- insert : ���̺� ������ ����
-- insert into ���̺�� (�÷���1,�÷���2,......)
-- values(��1,��2,....)
-- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�.
-- �ۼ� ������� 1 : 1 ��Ī�ȴ�.


--DML ���۾�
create table dept_temp
as
select * from  dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --�÷� ����
values (70,'HTML','SEOUL');

insert into dept_temp  --�÷� ����, ����� NULL�����ͻ���
values (80,NULL,'SEOUL');

insert into dept_temp (deptno,dname) -- ������ null ������ ����
values (60,'JSP'); 

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'��û��','MANAGER',9999,SYSDATE,4000,NULL,30);

-- UPDATE : �÷��� �����͸� ����(����)
-- UPDATE ���̺��
-- SET �÷��� = ��,�÷��� = ��, .....
-- where ���ǽ�
-- �������� ������� ������ �ش� �÷��� ��� ����ȴ�.

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';

ROLLBACK;

update dept_temp2
set dname ='DATABASE',loc ='SEOUL'
where deptno = 40;

-- delete(������ ����)
-- delete from ���̺��
-- where ���ǽ�
-- �������� ������� ������ ��� �����Ͱ� �����ȴ�.

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2;

drop table emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';

-- TCL(�������� �������� �Ǵ� ���)
-- Ʈ������
-- commit, rollback, save point
-- commit : ������ ���� ����(���̺��� ������ �ݿ�)
--          create ������ ����ؼ� ��ü�����ҋ�(�ڵ�)
-- rollback : ������ ���� ���(���̺��� ������ �̹ݿ�)���󺹱�
--             õ������,����,����(�ڵ�)
create table dept01
as
select * 
from dept;

delete from dept01;

commit; -- commit ���Ĵ� rollback�Ұ� //rollback�� commit�� ��������

select * 
from dept01;

-- Ʈ������ ���� ����
drop table dept01;

truncate table dept01;-- drop table dept01 �� �������� but rollback�Ұ�,�������ÿ� commit�Ͼ

rollback;

-- DDL(������ ���Ǿ�) : table(��簴ü)�� ����,����,�����ϴ� ��ɾ�
-- create(����), alter(����) ,drop(����)

create table ���̺��( --table(��ü)
     �÷���1 Ÿ��,     -- column(�Ӽ�)
     �÷���2 Ÿ��,     
     �÷���3 Ÿ��  
);   


--DDL


create table emp_ddl(
--    ���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
    empno number(4),
    ename varchar2(10), -- byte
    job varchar2(9),
    mgr number(4),
    hiredate date, 
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);
select * from emp_ddl;

insert into emp_ddl
values (9999,'�̼���','MANNAGER',1111,SYSDATE,1000,NULL,10);

create table dept_ddl --���̺��� ����
as
select * from dept;

create table dept_30
as
select * from dept
where deptno = 30;

create table dept_m
as
select dname,loc
from dept;

create table dept_d
as
select * from dept
where 1 != 1;   --���̺��� ������ �����Ѵ�.

-- ���̺� ����(�÷��� ���� ����)
-- ���ο� �÷��߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ����
-- alter 


create table emp_alter
as
select * from emp;

select *
from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

select *
from emp_alter;

--rename
--modify
--drop

--���̺���� DROP
--drop table ���̺��

drop table emp_alter;

Q1.
create table EMP_HW(
    empno number(4),
    ename varchar2(10), -- byte
    job varchar2(9),
    mgr number(4),
    hiredate date, 
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

Q2
alter table emp_hw
add BIGO varchar2(20);

Q3
alter table emp_hw
modify bigo varchar2(30);

Q4
alter table emp_hw
rename column bigo to remark; 

Q5
insert into emp_hw
select  empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

Q6
drop table emp_hw;

select *
from emp_Hw;

-----327P
-- �����ͻ���
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;

--index(�˻��ӵ��� ����ϱ����� ��� ��ü)
--select ������ �˼��� ��� ��Ų��
--��ü ���ڵ��� 3% ~5% ���� �϶�
--index��ü�� �÷��� �����ؼ� ����Ѵ�

create index �ε�����
on ���̺��(�÷���);

create table emp01
as
select * from emp;

insert into emp01
select *
from emp01;

insert into emp01(empno,ename)
values(1111,'bts');

--index ��ü ������(0.030 ~ 0.040)
select empno,ename
from emp01
where ename = 'bts';

create index idx_emp01_ename
on emp01(ename);
-- index ��ü ������(0��)
select empno,ename
from emp01
where ename ='bts';

drop index idx_emp01_ename; --����

select *
from emp01;

drop table emp01;

-- ���̺� ������ ����
 show recyclebin; -- ������ ���̺� ����
 
 flashback table EMP_HW  --����
 to before drop;

 purge recyclebin; --������ ����
 
 -----------p360
 
 -- ��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ� ��
 -- not null
 -- unique  --> �ߺ� ���x
 -- primary key(�⺻Ű)
 -- foreign key(�ܷ�Ű/����Ű)
 -- 1.�θ�� �ڽ��� ���踦 ������ �ڽ��� ���̺� �÷��� �����Ѵ�.
 -- 2.�θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique�ؾ� �Ѵ�.
 -- 3.null�����͸� ����մϴ�.
 -- check
 -- default
 
 -- emp,dept
 
 insert into emp
 values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);
 
 drop table emp02;
 
 create table emp02(
          empno number(4) primary key, -- (not null + unique) =primary key  
          ename varchar2(10) not null, -->not null�� ���������� ��
          job varchar2(9),
          deptno number(2)
 );
 --�⺻Ű �����ȣ�� ������
insert into emp02
values (1111,'ȫ�浿','MANAGER',30);
 
insert into emp02
values (2222,'ȫ�浿','MANAGER',30); 
 
insert into emp02
values (null,'������','SALESMAN',20);  
 
insert into emp02
values (2222,'������','SALESMAN',10);  
--���Ἲ ���� ����(SCOTT.SYS_C0011064)�� ����˴ϴ�
--���Ἲ ���� ����(SCOTT.EMP02_EMPNO_PK)�� ����˴ϴ�
delete from emp02;

 create table emp02(
          empno number(4) constraint emp02_empno_pk primary key, --���������� �츮��Ȯ���Ҽ��ְ� �����ϴ¹�
          ename varchar2(10) constraint emp02_ename_nn not null, --constraint �������Ǹ�     
          job varchar2(9),
          deptno number(2)
 );

select *
from emp02;
-------------------------------10 24
create table emp07(
  empno  number(4) constraint emp07_empno_pk primary key,
  ename varchar2(9) constraint emp07_empno_nn not null,
  job varchar2(9),
  deptno number(2) constraint emp07_deptno_fk references dept07(deptno)
);

create table dept07(
   deptno number(2) constraint dept07_empno_pk primary key,
   dname varchar2(20) constraint dept07_dname_nn not null,
   loc varchar2(20) constraint dept07_loc_nn not null
);

select *from emp07;
select *from dept07;

insert into dept07
select *from empno,ename,job,deptno from emp;

insert into emp07
values (1111,'aaa','MANAGE',50);

--check
create table emp08(
   empno number(4) primary key,
   ename varchar(10) not null,
   sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000), 
   gender varchar2(2) constraint emp08_gender_ck check(gender in ('M','F'))
);   
select *from emp08;

insert into emp08
values (1111,'hong',1000,'M');

insert into emp08
values (2222,'hong',200,'M');

insert into emp08
values (3333,'hong',1000,'A');


------default

create table dept08(
    deptno number(2) primary key,
    dname varchar2(10) not null,
    loc varchar2(15) default 'SEOUL'
);

insert into dept08(deptno,dname)
values(10,'SALES');

insert into dept08(deptno,dname,loc)
values(20,'SALES','BUSAN');

select * from dept08;

-- ���� ���� �������
-- �÷� ������ ����(not null �� �÷� ���������� ����)
-- ���̺� ������ ����(not null �� �����Ҽ� ����)

create table emp09(
   empno number(4),
   ename varchar2(20) constraint emp09_ename_nn not null,
   job varchar2(20),
   deptno number(20),
   
   constraint emp09_empno_pk primary key(empno),
   constraint emp09_job_uk unique(job),
   constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
);

insert into emp09
values (3333,'hong','PRESIDENT',80);

-- ����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
-- ���̺� ���� ������θ� ���� ����
-- 1. ���̺�ȿ��� �����ϴ� ���
-- 2. Alter ��ɾ� �����

create table member(
   name varchar2(10),   --�ڿ� �������ǻ��Ұ� ���̺���������� �����
   address varchar2(30),
   hphone varchar2(10),
    
   constraint member_name_address_pk primary key(name,address)
);

create table emp10(
   empno number(4),
   ename varchar2(20), 
   job varchar2(20),
   deptno number(20)
);

alter table emp10
add constraint emp10_empno_pk primary key(empno);
 
alter table emp10
add constraint emp10_empno_fk foreign key(empno) references dept(deptno);

--not null�� ������ ����(null -> not null)
alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;

select * from emp10;

alter table emp10
drop constraint emp10_empno_pk;-- �������Ǹ�(constraint) �Ǵ� ��������(primary key)

create table dept11(
    deptno number(2) ,
    dname varchar2(10) ,
    loc varchar2(15) 
);

alter table dept11
add constraint dept11_deptno_pk primary key(deptno);

select * from emp11;
select * from dept11;

create table emp11(
   empno number(4),
   ename varchar2(20), 
   job varchar2(20),
   deptno number(20)
);

alter table emp11
add constraint emp11_empno_pk primary key(empno);

alter table emp11
add constraint emp11_deptno_fk foreign key(deptno) references dept11(deptno);

insert into dept11
select *from dept;

insert into emp11
select empno,ename,job,deptno
from emp;

delete from dept11
where deptno = 10;

alter table dept11
disable primary key cascade; -->cascade����ϸ� �θ��������

alter table dept11
drop primary key cascade;

select * from dept11;

--���̺�����Ŀ����� 
--Q1,2
create table DEPT_CONST (
    deptno number(2), 
    dname varchar2(14), 
    loc varchar2(13) 
);

create table EMP_CONST (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7),
    comm number(7),
    deptno number(2)
);   

alter table dept_const
add constraint dept_const_deptno_pk primary key(deptno);

alter table  dept_const
add constraint dept_const_dname_unq unique(dname);

alter table dept_const
modify loc constraint dept_const_loc_nn not null;


alter table emp_const
add constraint emp_const_empno_pk primary key(empno);

alter table emp_const
modify ename constraint emp_const_ename_nn not null;

alter table emp_const
add constraint emp_const_tel_unq unique(tel);

alter table emp_const
add constraint emp_const_sal_ck check(sal between 1000 and 9999);

alter table emp_const
add constraint emp_const_deptno_fk foreign key(deptno) references dept_const(deptno);

drop table emp_const;

-----338p
--�� :�������Ѹ���
--1.����
--2.����(���� �Ұ�)

--��ü :table, index, view
-- create or replace view �����̺��(a[lias])
-- as 
-- ��������(select)
-- with check option
-- with read only

create table dept_copy
as
select * from dept;

create table emp_copy -- ����Ǵ� ���̺��� ���������� �� �Ѿ�´�
as
select * from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy; --14

create or replace view emp_view30
as
select empno,ename,sal,deptno 
from emp_copy
where deptno = 30;

--�̰� system�������� ����-------------------------------
grant create view --view ���̺��� �����Ҽ� �ִ� ���Ѻο�
to scott;
--------------------------------------------------------
select *
from emp_view30;

insert into emp_view30
values (1111,'hong',1000,30);

insert into emp_view30
values (2222,'hong',2000);

select *
from emp_copy;

insert into emp_view30(empno,ename,sal)
values (2222,'hong',2000);

insert into emp_view30(empno,ename,sal,deptno)
values (2222,'hong',2000,50);

select * from emp_view30;
select * from emp_copy;

-----as
create or replace view emp_view(�����ȣ,�����,�޿�,�μ���ȣ)
as
select empno,ename,sal,deptno
from emp_copy;

select * from emp_view;

select *
from emp_view
where �μ���ȣ =20;
--where deptno =20; ->���� �÷����� ���Ұ�

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

--�μ��� �ּұ޿��� �ִ�޿�
--dname min_sal max_sal

create or replace view sal_view
as
select dname,min(sal) as min_sal, max(sal) as max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select * from sal_View;

drop view sal_view;


---------10 25
--��� ��ü�� �̸��� �ߺ��ɼ� ����.

create or replace view sal_view --or replace ���־ �ߺ����� ��������
as
select dname,min(sal) as min_sal, max(sal) as max_sal, avg(sal) as avg_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;


--with check option
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; -- �������� �÷��� �������� ���ϰ� �Ѵ�.

update view_chk30
set deptno = 10; -- ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�

--with read only
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only; 
-- ��� �÷��� ���� C U D�� �Ұ���(��ȸ�� ����)

update view_read30
set deptno = 10; 
--�б� ���� �信���� DML �۾��� ������ �� �����ϴ�.(insert, update, delete)

-- ���� Ȱ��
-- TOP -N ��ȸ�ϱ�
-- Rownum (�ǻ��÷�)
select * from emp;

--�Ի����� ���� ���� 5���� ����� ��ȸ
select *
from emp
order by hiredate asc;

select * 
from emp
where hiredate <= '81/05/01';

DESC emp;

select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate
from emp
order by hiredate asc;

create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

select rownum,empno,ename,hiredate 
from view_hiredate
where rownum <= 7;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5; -- rownum�� �������� ���� ���� �ݵ�� 1�� �����ϴ� ���ǽ��� ������ �Ѵ�.

create or replace view view_hiredate_rm --rownum�� ��ȸ������ �������⶧���� ���������� ����ϱ����ؼ��� �����ؾ���
as
select rownum rm,empno,ename,hiredate
from view_hiredate;

select rm,empno,ename,hiredate 
from view_hiredate_rm
where rm >=2 and rm <=5; -- =rm between 2 and 5;

--�ζ��κ�
select rm,b.*
from( 
     select rownum rm,a.*
     from (
           select rownum empno,ename,hiredate
           from emp
           order by hiredate asc
           )a
     )b
where rm >=2 and rm <=5;

--�Ի����� ���� ���� 5���� ��ȸ�ϼ���
select rownum,empno,ename,hiredate
from (
       select empno,ename,hiredate
       from emp
       order by hiredate asc
      )
where rownum <=5;

-- ������
-- �ڵ����� ��ȣ�� ������Ű�� ��ɼ���
-- create, drop
-- nextval,currval

--create sequence ��������
--start with  ���۰� -> 1
--increment by  ����ġ => 1
--maxvalue    �ִ밪 => 10�� 1027
--minvalue    �ּҰ� => 10�� -1027

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno,ename,hiredate from emp
where 1 != 1;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);

create table product(
    pid varchar2(10),
    pname varchar2(10),
    price number(5),

    constraint product_pid_pk primary key(pid)
);    

create sequence idx_product_id
start with 1000;

insert into product(pid,pname,price)
values ('pid' || idx_product_id.nextval,'ġ��',2000);

select * from product;

drop sequence idx_product_id;

--p396
-- ����� ����(��ü)
-- ������ �������� ����(system)
-- create, drop
-- create user ������ identified by �н�����
-- alter user ������ identified by �н�����
-- drop user ������ cascade

--�ý��۰������ο���
create user user01 identified by 1234; 
--> user USER01 lacks CREATE SESSION privilege; logon denied ������
grant CREATE SESSION
to user01;

-- DCL(�����)
-- grant(���Ѻο�), revoke(����ȸ��)
-- grant �ý��۱��� to ������
-- revoke �ý��۱��� from ������

--user01�������� ����
create table test
(
  id varchar2(10)
); -->������ ������մϴ�

--�ý��۰������� ����
grant create table
to user01;
--�׷��� �ٽ� ���� ����


--�ý��۰������� ����
grant create table --���Ѻο�
to user01;

revoke create table --����ȸ��
from user01;

create user user01 identified by 1234; -->���� �ϰ������ 

drop user user01 CASCADE; -->���� �ϰ������ 

alter user user01 identifide by tiger;-->��й�ȣ �����ϰ������


--user01 ����
insert into test
values('aaa'); --> ���̺����̽� 'USERS'�� ���� ������ �����ϴ�.

--�ý��۰������� ����
alter user user01
quota 2m on USERS;
-->�ٽ� ���� ���� 


-- �ý��� ����(create ....)
-- ��ü ����  (select, ....)

--user01 ����
select * from emp;-->������

--scott ����
--grant ��ü���� ���� 
--on ��ü��
--to ������

grant select
on emp
to user01;
-->�������ش�

--user01 ����
select * from scott.emp;

--�پ����� ȸ�� scott����
revoke select
on emp
from user01;

----- p412
--��
--�ý��۰�������
create user user02 identified by 1234;

grant connect,resource
to user02;

--user02 ����
create table test(
   id varchar2(10)
);

insert into test
values('aaa');

--�ý��۰��� ����
create user nbac identified by 1234;

grant DBA,connect,resource
to nbac;

-- system == nbac

--nbac����
create user user03 identified by 1234;

-- ����� ���Ƿ�
-- ������ ���������� ����
-- create role �Ѹ� 
-- grant ���� to �Ѹ�

--�ý��۰���,nbac ����
create role mrole;

grant create session,create table,create view -- �ý��� ����
to mrole;

create user user04 identified by 1234;

grant mrole
to user04;

--user04����
create table test(
   id varchar2(10)
);   

insert into test
values ('aaa'); -->����� '���̺����̽� 'USERS'�� ���� ������ �����ϴ�' 

--�ý��۰��� ����
alter user user04
quota 2m on users; -->���Ѻο�

--user4�� �ٽý���
insert into test
values ('aaa'); 

select * from test;

--�ý��۰�������
--������ ���ѿ��� �� ����
create role mrole2;

--��ü������ �ش� ����� �������� ����
--scott ����
grant select 
on emp
to user04;

-- �� ������ ������ ���������� ���� ,�ý��۰��� ����
grant mrole2
to user04; -->user04�� select�Ҽ��ִ� ������ ����

--user04����
select * from scott.emp;

