<<<<<<< HEAD
--DQL(질의어) 데이터 조회 
--select 컬럼명
--from 테이블명

desc emp;

--전체 데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

--부분컬럼 데이터
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
-- +,-,*,/ 나머지 연산자는 없다
--컬럼을 대상으로 연산한다.
-- null 값은 연산불가하다.
--컬럼에 별칭을 사용할수 있다.
select ename as 사원명,sal,sal * 12+ nvl(comm,0)as 연봉,comm
from emp;

--데이터정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬기준이 되는 값) asc(오름차순)/desc(내림차순)

select *
from emp
order by hiredate;  --오름차순정렬,오름차순은 생략가능하다

-- 숫자(1 ~10),날짜(과거날짜 ~ 최근날짜), 문자(사전순서)

--조건검색
--select 컬럼명
--from 테이블명
--where 조건식(컬럼명 = 값); <,>, != / <>,<=,>=, and, or

SELECT *
FROM EMP
where sal >= 3000; --급여가 3000 이상인 사원

SELECT *
FROM EMP
where deptno = 30;

-- adn 두가지 이상의 조건이 모두 참인경우
SELECT *
FROM EMP
where deptno = 30 and job ='SALESMAN'and empno =7499;
--문자를 조건절에 사용할때
--문자값은 대소문자 구분을 확실하게해야함
--문자값은''써야함

SELECT *
FROM EMP
where ename = 'FORD'; --소문자 ford는 없다.

--날짜를 조건절에 사용할때
--날짜도''써야함
--날짜도 크기가 있다.
-- 80/12/20 ->  1980 12 20 시간 분 초 요일
SELECT *
FROM EMP
where hiredate < '1982/01/01';

-- or 두개이상의 조건중에 하나이상 참인 경우 실행
SELECT *
FROM EMP
where deptno = 10 or sal >= 2000;

--not 논리부정 연산자
SELECT *
FROM EMP
where sal != 3000;

SELECT *
FROM EMP
where not sal = 3000;

-- and , or
--범위 조건을 표현 할때 사용
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

--like 연산자 
--값의 일부만 가지고 데이터를 조회한다.
--와일드 카드를 사용한다(%, _)
--% 모든 문자를 대체한다.
--_한문자를 대체한다.
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

-- null 연산자
-- is null / in not null

SELECT *
FROM EMP
where comm is null; -- null은 비교불가

SELECT *
FROM EMP
where comm is not null;

----------------------------------------
--집합연산자
--두개의 seclect 구문을 사용한다.
--컬럼의 갯수가 동일해야 한다.
--컬럼의 타입이 동일해야 한다.
--컬럼의 이름은 상관 없다.
--합집합(UNION),교집합(INTERSECT),차집합(MINUS)

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION -- 합집함
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION ALL-- 합집함
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10; --중복되어지면 하나만 나타난다. ALL 쓰면 값 다나탐

SELECT EMPNO,ENAME,SAL,DEPTNO --부적합한 식별자 -->컬럼 확인
FROM EMP
MINUS --차집합
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
INTERSECT --교집합
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

-- where
-- 비교연산자, 논리연산자, like, is null/is not null, 집합연산자
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
where deptno=20 or deptno=30 and sal>2000; --deptno in(20,30) --집합연산자 사용안했을떄

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;      --집합연산자 사용했을떄
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
   
   --오라클함수 P127
   --함수
   --문자함수 :upper,lower,substr,instr,replace,rpad,lpad,concat
   --숫자함수
   --날짜함수
   
   --UPPER 괄호 안 문자 데이터를 모두 대문자로변환
   select 'Welcome',upper('Welcome')
   from dual;
   --LOWER 괄호 안 문자 데이터를모두 소문사로변환
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
   --문자열 데이터 안에서 특정 문자 위치를 찾는 INSTR함수
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
   
 ==========숫자============
 select 
          round(1234.5678),
          round(1234.5678,0),
          round(1234.5678,1), --소수점 첫째자리까지표현, 둘째자리에서 반올림 
          round(1234.5678,2),
          round(1234.5678,-1), --음수는 정수를 반올림 ->1230
          round(1234.5678,-2)  --> 1200
 from dual;
 
 select 
          trunc(1234.5678),
          trunc(1234.5678,0),
          trunc(1234.5678,1), --해당자리까지만살리고 나머지버린다 -> 1234.5  
          trunc(1234.5678,2),
          trunc(1234.5678,-1), --> 1230
          trunc(1234.5678,-2)  
 from dual;
 
 select 
          ceil(3.14),  --자신보다 큰 가장 가까운 정수   -->4
          floor(3.14), --자신보다 작은 가장 가까운 정수 -->3
          ceil(-3.14), --> -3
          floor(-3.14) --> -4
 from dual;
 
 select mod(5,2),mod(10,4)
 from dual;
 
 select *
 from emp
--<<<<<<< HEAD
 where mod(empno,2) = 1;
 
 --날짜 함수
 select sysdata- 1 어제, sysdate, sysdate + 1 내일
 from dual;
 
 select sysdate - hiredate as 근무일수 -- 차이가 일수 반환
 from emp;
 
 select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
 from dual;
 
 select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as 입사일자
 from emp;
 --- 근속년수
 
 select trunc((sysdate - hiredate) / 365) 근속년수
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
        
--자료형변환 함수
--to_char()
--to_number()
--to_date()

--날짜를 문자로
select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

--숫자를 문자
select to_char(123456,'L999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;
--0쓰면 빈자리에 0으로채워짐

--문자를 숫자로

select '20000' -10000  --자동형변환
from dual;

select '20000' -'10000'
from dual;

select '20000' -'5000'
from dual;

select '20,000' -'5,000' --to_number()형변환을 해야한다.
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--문자를 날짜로
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

-- null데이터 처리
--nvl(null,바꾸고싶은데이터)
--nvl은 null데이터의 타입과 같은 타입을 변경해야한다.
--nvl(숫자,숫자) , nvl(문자,문자)
select ename 사원명,sal,sal *12 + nvl(comm,0) as 연봉,comm
from emp;

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr  --실제 데이터는 변하지않는다.
from emp
where mgr is null;    

select comm, nvl2(comm,'O','X') --타입종류는 상관없다
from emp;

--조건문 표현하는 함수
--decode() -> switch
--case     -> if

select ename,job,deptno,
         decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타') as 부서명 
from emp;
--decode은 단순 비교밖에할수없다.

--범위를 조건식으로 설정 할수 있다.
case 
         when 조건식 then 실행문
         when 조건식 then 실행문
         when 조건식 then 실행문
         else 실행문
end as 별칭         
         
select ename,job,deptno,
        case 
         when deptno = 10 then 'AAA'
         when deptno = 20 then 'BBB'
         when deptno = 30 then 'CCC'
         else '기타'
         end as 부서명      
from emp;

select ename,job,sal,
          case 
                when sal between 3000 and 5000 then '임원'
                when sal >= 2000 and sal < 3000 then '관리자'
                when sal >= 500 and sal < 2000 then '사원'
                else '기타'
           end as 직무
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

===============================7강
--sum(),avg(),count(),max(),min()
--일반컬럼과 같이 사용 불가
--크기 비교가 가능한 모두 타입에 사용가능

select sum(sal) --sum함수는 조회된 행에 지정한 열 값을 모두 더한값으로 반환
from emp;

select avg(sal) --avg함수는 지정한 데이터의 평균값 반환
from emp;

select count(*),count(comm) --count함수는 지정한 데이터의 개수 반환
from emp;

select max(sal),min(sal) --max 지정한 데이터 중 최댓값 반환
from emp;                --min 지정한 데이터 중 최솟값 반환    

select ename,max(sal)
from emp;

select min(hiredate), max(hiredate)
from emp
where deptno = 20;

--select 컬럼명
--from 테이블명
--where 조건식(그룹함수 사용불가/group by ,having 보다 먼저실행)
--group by 기준컬럼명
--order by 컬럼명 정렬방식 ==> 맨 마지막에 작성
--having 조건식(그룹함수 사용한다)  -->group by를 먼저실행해야함
----------group by 절----------
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;

select avg(sal)
from emp
group by deptno;  
-------group order 절 ------
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
-------------------------having 절
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; --group by의해서 조회 결과에 조건을 준다
                         --조건식을 작성할때 그룹함수를 사용한다.
                         
                        
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
--조인(Join)
-- 2개 이상의 테이블에서 데이터를 조회
-- from절에 두개이상의 테이블을 작성한다
-- where에 조인 조건을 작성한다.
-- cross join (where절 없이 조인)- 거의안씀
-- equi join (where절 사용 등가연산자 :=)
-- non equi join (where 범위 연산자 : and ,or )
-- self join(where 하나의 테이블을 사용한다)
-- out join (where 에 누락 되는 데이터를 같이 조회하기위해 :(+))

select ename,job,e.deptno,dname,loc -->양쪽에 똑같은 컬럼이 사용될때는 소속을 밝혀줘야한다
from emp e,dept d -->테이블에 별칭을 부여한다음에는 원래 이름을 사용할수없다.
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade,losal,hisal
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal<= s.hisal; -위에 문장과 같은값 

--사번, 이름, 급여, 부서번호, 부서명, 급여등급
--emp               dept          salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal ;

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m --셀프조인 경우 반드시 별칭 부여
where e.mgr =m.empno;

select ename,deptno
from emp
where deptno =20;

-- scott 같은 부서에 근무하는 사원
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

--외부조인
--등가시 누락되는 데이터를 같이 조회하기위해서 사용

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m 
where e.mgr =m.empno(+); --데이터가 없는 테이블쪽에 (+)를 붙인다.

select ename, sal, d.deptno, dname
from emp e,dept d
where e.deptno(+) = d.deptno;

-- ANSI-JOIN(표준조인 방식)
--cross join
--natural join
--inner join(equi, non equi, self join)
--outer join((+)) -- [left, right, full] outer join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;


select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) --양쪽 테이블의 컬럼명이 동일한 경우 사용 가능
where ename ='SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --데이터가 있는 쪽을 지정한다
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
on e.deptno = d.deptno --using(deptno) 별칭 사용시 적용이 제한된다.
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
--서브쿼리 
-- select 구문을 중첩해서 사용하는것(where)

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

--메인쿼리
select dname
from dept
where deptno =(--서브쿼리
               select deptno
               from emp
               where ename = 'SCOTT'
               );
            
-- DALLAS               
--이름, 부서번호
select ename, deptno
from emp
where deptno = (
                  select deptno 
                  from dept
                  where loc = 'DALLAS'
               );
               
               
-- 자신의 직속상관이KING인 사원의 이름과 급여를 조회하세요
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
--다중행 서브쿼리
--in 결과중에 하나만 만족하면 된다.
-- > any : 결과중에 가장 작은값 보다 크면된다
-- > all : 결과중에 가장 큰 값 보다 크면 된다.
select *
from emp
where sal >= any( --가장 작은값보다 크면 o   ->  < 가장큰값보다 작은값
            select max(sal)
            from emp
            group by deptno
            );
            
select ename,sal
from emp
where sal > all(select sal --가장 큰값보다 크면된다
                from emp
                where deptno = 30);

select *
from emp
where (deptno,sal) in (
                             select deptno,max(sal)
                             from emp
                             group by deptno 
                       ); 
                       
----------------------10/21 p 266 scott연결
-- DML(데이터조작어) : insert, update, delete
-- insert : 테이블에 데이터 삽입
-- insert into 테이블명 (컬럼명1,컬럼명2,......)
-- values(값1,값2,....)
-- 컬럼과 값의 타입과 갯수가 일치해야 한다.
-- 작성 순서대로 1 : 1 매칭된다.


--DML 조작어
create table dept_temp
as
select * from  dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --컬럼 생략
values (70,'HTML','SEOUL');

insert into dept_temp  --컬럼 생략, 명시적 NULL데이터삽입
values (80,NULL,'SEOUL');

insert into dept_temp (deptno,dname) -- 묵시적 null 데이터 삽입
values (60,'JSP'); 

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'심청이','MANAGER',9999,SYSDATE,4000,NULL,30);

-- UPDATE : 컬럼의 데이터를 변경(수정)
-- UPDATE 테이블명
-- SET 컬럼명 = 값,컬럼명 = 값, .....
-- where 조건식
-- 조건절을 사용하지 않으면 해당 컬럼이 모두 변경된다.

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

-- delete(데이터 삭제)
-- delete from 테이블명
-- where 조건식
-- 조건절을 사용하지 않으면 모든 데이터가 삭제된다.

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2;

drop table emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';

-- TCL(데이터의 영구저장 또는 취소)
-- 트랜젝션
-- commit, rollback, save point
-- commit : 데이터 영구 저장(테이블이 데이터 반영)
--          create 구문을 사용해서 객체생성할떄(자동)
-- rollback : 데이터 변경 취소(테이블이 데이터 미반영)원상복구
--             천재지변,전기,전쟁(자동)
create table dept01
as
select * 
from dept;

delete from dept01;

commit; -- commit 이후는 rollback불가 //rollback은 commit한 지점까지

select * 
from dept01;

-- 트랜젝션 적용 유무
drop table dept01;

truncate table dept01;-- drop table dept01 과 같은문장 but rollback불가,삭제동시에 commit일어남

rollback;

-- DDL(데이터 정의어) : table(모든객체)를 생성,삭제,변경하는 명령어
-- create(생성), alter(변경) ,drop(삭제)

create table 테이블명( --table(객체)
     컬럼명1 타입,     -- column(속성)
     컬럼명2 타입,     
     컬럼명3 타입  
);   


--DDL


create table emp_ddl(
--    사번,이름,직책,관리자,입사일,급여,성과급,부서번호
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
values (9999,'이순신','MANNAGER',1111,SYSDATE,1000,NULL,10);

create table dept_ddl --테이블의 복사
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
where 1 != 1;   --테이블의 구조만 복사한다.

-- 테이블 변경(컬럼의 정보 수정)
-- 새로운 컬럼추가, 컬럼의 이름변경, 자료형의 변경, 컬럼을 삭제
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

--테이블삭제 DROP
--drop table 테이블명

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
-- 데이터사전
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;

--index(검색속도를 향상하기위해 사용 객체)
--select 구문의 검속을 향상 시킨다
--전체 레코드의 3% ~5% 정도 일때
--index객체를 컬럼에 생성해서 사용한다

create index 인덱스명
on 테이블명(컬럼명);

create table emp01
as
select * from emp;

insert into emp01
select *
from emp01;

insert into emp01(empno,ename)
values(1111,'bts');

--index 객체 생성전(0.030 ~ 0.040)
select empno,ename
from emp01
where ename = 'bts';

create index idx_emp01_ename
on emp01(ename);
-- index 객체 생성후(0초)
select empno,ename
from emp01
where ename ='bts';

drop index idx_emp01_ename; --삭제

select *
from emp01;

drop table emp01;

-- 테이블 삭제후 원복
 show recyclebin; -- 지워진 테이블 보기
 
 flashback table EMP_HW  --복구
 to before drop;

 purge recyclebin; --휴지통 비우기
 
 -----------p360
 
 -- 제약조건(무결성) : 잘못된 값이 데이터로 사용되는것을 못하게 하는 것
 -- not null
 -- unique  --> 중복은 허용함 
 -- primary key
 -- foreign key
 -- check
 
 -- emp,dept
 
 
 
 insert into emp
 values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);
 
 drop table emp02;
 
 create table emp02(
          empno number(4) primary key, -- (not null + unique) =primary key  
          ename varchar2(10) not null, -->not null로 제약조건을 검
          job varchar2(9),
          deptno number(2)
 );
 --기본키 사번번호로 구별함
insert into emp02
values (1111,'홍길동','MANAGER',30);
 
insert into emp02
values (2222,'홍길동','MANAGER',30); 
 
insert into emp02
values (null,'김유신','SALESMAN',20);  
 
insert into emp02
values (2222,'옥동자','SALESMAN',10);  
--무결성 제약 조건(SCOTT.SYS_C0011064)에 위배됩니다
--무결성 제약 조건(SCOTT.EMP02_EMPNO_PK)에 위배됩니다
delete from emp02;

 create table emp02(
          empno number(4) constraint emp02_empno_pk primary key, --제약조건을 우리가확인할수있게 변경하는법
          ename varchar2(10) constraint emp02_ename_nn not null, --constraint 제약조건명     
          job varchar2(9),
          deptno number(2)
 );

select *
from emp02;
=======
--DQL(질의어) 데이터 조회 
--select 컬럼명
--from 테이블명

desc emp;

--전체 데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

--부분컬럼 데이터
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
-- +,-,*,/ 나머지 연산자는 없다
--컬럼을 대상으로 연산한다.
-- null 값은 연산불가하다.
--컬럼에 별칭을 사용할수 있다.
select ename as 사원명,sal,sal * 12+ nvl(comm,0)as 연봉,comm
from emp;

--데이터정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬기준이 되는 값) asc(오름차순)/desc(내림차순)

select *
from emp
order by hiredate;  --오름차순정렬,오름차순은 생략가능하다

-- 숫자(1 ~10),날짜(과거날짜 ~ 최근날짜), 문자(사전순서)

--조건검색
--select 컬럼명
--from 테이블명
--where 조건식(컬럼명 = 값); <,>, != / <>,<=,>=, and, or

SELECT *
FROM EMP
where sal >= 3000; --급여가 3000 이상인 사원

SELECT *
FROM EMP
where deptno = 30;

-- adn 두가지 이상의 조건이 모두 참인경우
SELECT *
FROM EMP
where deptno = 30 and job ='SALESMAN'and empno =7499;
--문자를 조건절에 사용할때
--문자값은 대소문자 구분을 확실하게해야함
--문자값은''써야함

SELECT *
FROM EMP
where ename = 'FORD'; --소문자 ford는 없다.

--날짜를 조건절에 사용할때
--날짜도''써야함
--날짜도 크기가 있다.
-- 80/12/20 ->  1980 12 20 시간 분 초 요일
SELECT *
FROM EMP
where hiredate < '1982/01/01';

-- or 두개이상의 조건중에 하나이상 참인 경우 실행
SELECT *
FROM EMP
where deptno = 10 or sal >= 2000;

--not 논리부정 연산자
SELECT *
FROM EMP
where sal != 3000;

SELECT *
FROM EMP
where not sal = 3000;

-- and , or
--범위 조건을 표현 할때 사용
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

--like 연산자 
--값의 일부만 가지고 데이터를 조회한다.
--와일드 카드를 사용한다(%, _)
--% 모든 문자를 대체한다.
--_한문자를 대체한다.
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

-- null 연산자
-- is null / in not null

SELECT *
FROM EMP
where comm is null; -- null은 비교불가

SELECT *
FROM EMP
where comm is not null;

----------------------------------------
--집합연산자
--두개의 seclect 구문을 사용한다.
--컬럼의 갯수가 동일해야 한다.
--컬럼의 타입이 동일해야 한다.
--컬럼의 이름은 상관 없다.
--합집합(UNION),교집합(INTERSECT),차집합(MINUS)

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION -- 합집함
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10
UNION ALL-- 합집함
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10; --중복되어지면 하나만 나타난다. ALL 쓰면 값 다나탐

SELECT EMPNO,ENAME,SAL,DEPTNO --부적합한 식별자 -->컬럼 확인
FROM EMP
MINUS --차집합
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
INTERSECT --교집합
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
where deptno = 10;

-- where
-- 비교연산자, 논리연산자, like, is null/is not null, 집합연산자
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
where deptno=20 or deptno=30 and sal>2000; --deptno in(20,30) --집합연산자 사용안했을떄

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;      --집합연산자 사용했을떄
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
   
   --오라클함수 P127
   --함수
   --문자함수 :upper,lower,substr,instr,replace,rpad,lpad,concat
   --숫자함수
   --날짜함수
   
   --UPPER 괄호 안 문자 데이터를 모두 대문자로변환
   select 'Welcome',upper('Welcome')
   from dual;
   --LOWER 괄호 안 문자 데이터를모두 소문사로변환
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
   --문자열 데이터 안에서 특정 문자 위치를 찾는 INSTR함수
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
   
 ==========숫자============
 select 
          round(1234.5678),
          round(1234.5678,0),
          round(1234.5678,1), --소수점 첫째자리까지표현, 둘째자리에서 반올림 
          round(1234.5678,2),
          round(1234.5678,-1), --음수는 정수를 반올림 ->1230
          round(1234.5678,-2)  --> 1200
 from dual;
 
 select 
          trunc(1234.5678),
          trunc(1234.5678,0),
          trunc(1234.5678,1), --해당자리까지만살리고 나머지버린다 -> 1234.5  
          trunc(1234.5678,2),
          trunc(1234.5678,-1), --> 1230
          trunc(1234.5678,-2)  
 from dual;
 
 select 
          ceil(3.14),  --자신보다 큰 가장 가까운 정수   -->4
          floor(3.14), --자신보다 작은 가장 가까운 정수 -->3
          ceil(-3.14), --> -3
          floor(-3.14) --> -4
 from dual;
 
 select mod(5,2),mod(10,4)
 from dual;
 
 select *
 from emp
--<<<<<<< HEAD
 where mod(empno,2) = 1;
 
 --날짜 함수
 select sysdata- 1 어제, sysdate, sysdate + 1 내일
 from dual;
 
 select sysdate - hiredate as 근무일수 -- 차이가 일수 반환
 from emp;
 
 select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
 from dual;
 
 select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as 입사일자
 from emp;
 --- 근속년수
 
 select trunc((sysdate - hiredate) / 365) 근속년수
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
        
--자료형변환 함수
--to_char()
--to_number()
--to_date()

--날짜를 문자로
select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

--숫자를 문자
select to_char(123456,'L999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;
--0쓰면 빈자리에 0으로채워짐

--문자를 숫자로

select '20000' -10000  --자동형변환
from dual;

select '20000' -'10000'
from dual;

select '20000' -'5000'
from dual;

select '20,000' -'5,000' --to_number()형변환을 해야한다.
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--문자를 날짜로
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

-- null데이터 처리
--nvl(null,바꾸고싶은데이터)
--nvl은 null데이터의 타입과 같은 타입을 변경해야한다.
--nvl(숫자,숫자) , nvl(문자,문자)
select ename 사원명,sal,sal *12 + nvl(comm,0) as 연봉,comm
from emp;

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr  --실제 데이터는 변하지않는다.
from emp
where mgr is null;    

select comm, nvl2(comm,'O','X') --타입종류는 상관없다
from emp;

--조건문 표현하는 함수
--decode() -> switch
--case     -> if

select ename,job,deptno,
         decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타') as 부서명 
from emp;
--decode은 단순 비교밖에할수없다.

--범위를 조건식으로 설정 할수 있다.
case 
         when 조건식 then 실행문
         when 조건식 then 실행문
         when 조건식 then 실행문
         else 실행문
end as 별칭         
         
select ename,job,deptno,
        case 
         when deptno = 10 then 'AAA'
         when deptno = 20 then 'BBB'
         when deptno = 30 then 'CCC'
         else '기타'
         end as 부서명      
from emp;

select ename,job,sal,
          case 
                when sal between 3000 and 5000 then '임원'
                when sal >= 2000 and sal < 3000 then '관리자'
                when sal >= 500 and sal < 2000 then '사원'
                else '기타'
           end as 직무
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

===============================7강
--sum(),avg(),count(),max(),min()
--일반컬럼과 같이 사용 불가
--크기 비교가 가능한 모두 타입에 사용가능

select sum(sal) --sum함수는 조회된 행에 지정한 열 값을 모두 더한값으로 반환
from emp;

select avg(sal) --avg함수는 지정한 데이터의 평균값 반환
from emp;

select count(*),count(comm) --count함수는 지정한 데이터의 개수 반환
from emp;

select max(sal),min(sal) --max 지정한 데이터 중 최댓값 반환
from emp;                --min 지정한 데이터 중 최솟값 반환    

select ename,max(sal)
from emp;

select min(hiredate), max(hiredate)
from emp
where deptno = 20;

--select 컬럼명
--from 테이블명
--where 조건식(그룹함수 사용불가/group by ,having 보다 먼저실행)
--group by 기준컬럼명
--order by 컬럼명 정렬방식 ==> 맨 마지막에 작성
--having 조건식(그룹함수 사용한다)  -->group by를 먼저실행해야함
----------group by 절----------
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;

select avg(sal)
from emp
group by deptno;  
-------group order 절 ------
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
-------------------------having 절
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; --group by의해서 조회 결과에 조건을 준다
                         --조건식을 작성할때 그룹함수를 사용한다.
                         
                        
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
--조인(Join)
-- 2개 이상의 테이블에서 데이터를 조회
-- from절에 두개이상의 테이블을 작성한다
-- where에 조인 조건을 작성한다.
-- cross join (where절 없이 조인)- 거의안씀
-- equi join (where절 사용 등가연산자 :=)
-- non equi join (where 범위 연산자 : and ,or )
-- self join(where 하나의 테이블을 사용한다)
-- out join (where 에 누락 되는 데이터를 같이 조회하기위해 :(+))

select ename,job,e.deptno,dname,loc -->양쪽에 똑같은 컬럼이 사용될때는 소속을 밝혀줘야한다
from emp e,dept d -->테이블에 별칭을 부여한다음에는 원래 이름을 사용할수없다.
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade,losal,hisal
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal<= s.hisal; -위에 문장과 같은값 

--사번, 이름, 급여, 부서번호, 부서명, 급여등급
--emp               dept          salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal ;

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m --셀프조인 경우 반드시 별칭 부여
where e.mgr =m.empno;

select ename,deptno
from emp
where deptno =20;

-- scott 같은 부서에 근무하는 사원
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

--외부조인
--등가시 누락되는 데이터를 같이 조회하기위해서 사용

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m 
where e.mgr =m.empno(+); --데이터가 없는 테이블쪽에 (+)를 붙인다.

select ename, sal, d.deptno, dname
from emp e,dept d
where e.deptno(+) = d.deptno;

-- ANSI-JOIN(표준조인 방식)
--cross join
--natural join
--inner join(equi, non equi, self join)
--outer join((+)) -- [left, right, full] outer join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;


select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) --양쪽 테이블의 컬럼명이 동일한 경우 사용 가능
where ename ='SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --데이터가 있는 쪽을 지정한다
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
on e.deptno = d.deptno --using(deptno) 별칭 사용시 적용이 제한된다.
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
--서브쿼리 
-- select 구문을 중첩해서 사용하는것(where)

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

--메인쿼리
select dname
from dept
where deptno =(--서브쿼리
               select deptno
               from emp
               where ename = 'SCOTT'
               );
            
-- DALLAS               
--이름, 부서번호
select ename, deptno
from emp
where deptno = (
                  select deptno
                  from dept
                  where loc = 'DALLAS'
               );
               
               
-- 자신의 직속상관이KING인 사원의 이름과 급여를 조회하세요
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
--다중행 서브쿼리
--in 결과중에 하나만 만족하면 된다.
-- > any : 결과중에 가장 작은값 보다 크면된다
-- > all : 결과중에 가장 큰 값 보다 크면 된다.
select *
from emp
where sal >= any( --가장 작은값보다 크면 o   ->  < 가장큰값보다 작은값
            select max(sal)
            from emp
            group by deptno
            );
            
select ename,sal
from emp
where sal > all(select sal --가장 큰값보다 크면된다
                from emp
                where deptno = 30);

select *
from emp
where (deptno,sal) in (
                             select deptno,max(sal)
                             from emp
                             group by deptno 
                       );      
>>>>>>> 79b6038b092bffbfbe2ce19b3a1e89bd3bf21a78
