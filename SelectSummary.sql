-- HEAD
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
where deptno=20 or deptno=30 and sal>2000; --deptno in(20,30) --집합연산자 사용안했을??

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;      --집합연산자 사용했을??
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
--          create 구문을 사용해서 객체생성할??(자동)
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
where deptno=20 or deptno=30 and sal>2000; --deptno in(20,30) --집합연산자 사용안했을??

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;      --집합연산자 사용했을??
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
 -- unique  --> 중복 허용x
 -- primary key(기본키)
 -- foreign key(외래키/참조키)
 -- 1.부모와 자식의 관계를 가지는 자식쪽 테이블에 컬럼에 설정한다.
 -- 2.부모쪽 테이블의 컬럼은 반드시 primary key 또는 unique해야 한다.
 -- 3.null데이터를 허용합니다.
 -- check
 -- default
 
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

-- 제약 조건 설정방식
-- 컬럼 레벨의 설정(not null 을 컬럼 레벨에서만 가능)
-- 테이블 레벨의 설정(not null 을 적용할수 없다)

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

-- 복합키(기본키를 두개의 컬럼을 사용하는 경우)
-- 테이블 레벨 방식으로만 적용 가능
-- 1. 테이블안에서 정의하는 방식
-- 2. Alter 명령어 사용방식

create table member(
   name varchar2(10),   --뒤에 제약조건사용불가 테이블레벨방식으로 써야함
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

--not null은 변경의 개념(null -> not null)
alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;

select * from emp10;

alter table emp10
drop constraint emp10_empno_pk;-- 제약조건명(constraint) 또는 제약조건(primary key)

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
disable primary key cascade; -->cascade사용하면 부모삭제가능

alter table dept11
drop primary key cascade;

select * from dept11;

--테이블레벨방식에대한 
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
--뷰 :보기위한목적
--1.보안
--2.범위(변경 불가)

--객체 :table, index, view
-- create or replace view 뷰테이블명(a[lias])
-- as 
-- 서브쿼리(select)
-- with check option
-- with read only

create table dept_copy
as
select * from dept;

create table emp_copy -- 복사되는 테이블은 제약조건이 안 넘어온다
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

--이건 system계정에서 실행-------------------------------
grant create view --view 테이블을 생성할수 있는 권한부여
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
create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno,ename,sal,deptno
from emp_copy;

select * from emp_view;

select *
from emp_view
where 부서번호 =20;
--where deptno =20; ->원래 컬럼명은 사용불가

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

--부서별 최소급여와 최대급여
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
--모든 객체의 이름은 중복될수 업다.

create or replace view sal_view --or replace 가있어서 중복으로 생성가능
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
where deptno = 30 with check option; -- 조건절의 컬럼을 수정하지 못하게 한다.

update view_chk30
set deptno = 10; -- 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다

--with read only
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only; 
-- 모든 컬럼에 대한 C U D가 불가능(조회만 가능)

update view_read30
set deptno = 10; 
--읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.(insert, update, delete)

-- 뷰의 활용
-- TOP -N 조회하기
-- Rownum (의사컬럼)
select * from emp;

--입사일이 가장 빠른 5명의 사원을 조회
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
where rownum between 2 and 5; -- rownum을 조건절에 직접 사용시 반드시 1을 포함하는 조건식을 만들어야 한다.

create or replace view view_hiredate_rm --rownum은 일회용으로 쓰여지기때문에 고정값으로 사용하기위해서는 생성해야함
as
select rownum rm,empno,ename,hiredate
from view_hiredate;

select rm,empno,ename,hiredate 
from view_hiredate_rm
where rm >=2 and rm <=5; -- =rm between 2 and 5;

--인라인뷰
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

--입사일이 가장 빠른 5명을 조회하세요
select rownum,empno,ename,hiredate
from (
       select empno,ename,hiredate
       from emp
       order by hiredate asc
      )
where rownum <=5;

-- 시퀀스
-- 자동으로 번호를 증가시키는 기능수행
-- create, drop
-- nextval,currval

--create sequence 시퀀스명
--start with  시작값 -> 1
--increment by  증가치 => 1
--maxvalue    최대값 => 10의 1027
--minvalue    최소값 => 10의 -1027

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
values ('pid' || idx_product_id.nextval,'치즈',2000);

select * from product;

drop sequence idx_product_id;

--p396
-- 사용자 관리(객체)
-- 관리자 계정에서 가능(system)
-- create, drop
-- create user 계정명 identified by 패스워드
-- alter user 계정명 identified by 패스워드
-- drop user 계정명 cascade

--시스템계정으로연결
create user user01 identified by 1234; 
--> user USER01 lacks CREATE SESSION privilege; logon denied 오류뜸
grant CREATE SESSION
to user01;

-- DCL(제어어)
-- grant(권한부여), revoke(권한회수)
-- grant 시스템권한 to 계정명
-- revoke 시스템권한 from 계정명

--user01계정으로 연결
create table test
(
  id varchar2(10)
); -->권한이 불충분합니다

--시스템계정으로 연결
grant create table
to user01;
--그러고 다시 위에 실행


--시스템계정으로 연결
grant create table --권한부여
to user01;

revoke create table --권한회수
from user01;

create user user01 identified by 1234; -->생성 하고싶을때 

drop user user01 CASCADE; -->삭제 하고싶을때 

alter user user01 identifide by tiger;-->비밀번호 변경하고싶을때


--user01 연결
insert into test
values('aaa'); --> 테이블스페이스 'USERS'에 대한 권한이 없습니다.

--시스템계정으로 연결
alter user user01
quota 2m on USERS;
-->다시 위에 실행 


-- 시스템 권한(create ....) 관리자가 부여
-- 객체 권한  (select, ....) 소유주가 부여

--user01 연결
select * from emp;-->오류뜸

--scott 연결
--grant 객체권한 종류 
--on 객체명
--to 계정명

grant select
on emp
to user01;
-->권한을준다

--user01 연결
select * from scott.emp;

--다쓰고나면 회수 scott연결
revoke select
on emp
from user01;

----- p412
--롤
--시스템계정접속
create user user02 identified by 1234;

grant connect,resource
to user02;

--user02 접속
create table test(
   id varchar2(10)
);

insert into test
values('aaa');

--시스템계정 접속
create user nbac identified by 1234;

grant DBA,connect,resource
to nbac;

-- system == nbac

--nbac접속
create user user03 identified by 1234;

-- 사용자 정의롤
-- 관리자 계정에서만 가능
-- create role 롤명 
-- grant 권한 to 롤명

--시스템계정,nbac 접속
create role mrole;

grant create session,create table,create view -- 시스템 권한
to mrole;

create user user04 identified by 1234;

grant mrole
to user04;

--user04접속
create table test(
   id varchar2(10)
);   

insert into test
values ('aaa'); -->실행시 '테이블스페이스 'USERS'에 대한 권한이 없습니다' 

--시스템계정 접속
alter user user04
quota 2m on users; -->권한부여

--user4로 다시실행
insert into test
values ('aaa'); 

select * from test;

--시스템계정접속
--관리자 권한에서 롤 생성
create role mrole2;

--객체권한은 해당 사용자 계정에서 가능
--scott 접속
grant select 
on emp
to user04;

-- 롤 권한은 관리자 계정에서만 가능 ,시스템계정 접속
grant mrole2
to user04; -->user04는 select할수있는 권한을 얻음

--user04접속
select * from scott.emp;

--시스템계정 접속
create user user05 identified by 1234;

grant connect,resource
to user05;

--user05접속
select * from user_role_privs;  

select * from scott.emp; -->오류

--시스템계정 접속
create role mrole3;

--scott계정 접속
grant select
on emp
to mrole3;

--시스템계정 접속
grant mrole3
to user05;

--user05접속

select * from user_role_privs;  

set role all; -- ?

select * from scott.emp;

--시스템계정접속
revoke mrole3
from user05;
--------- 10 26 p419

-- PL/SQL(확장되어진 SQL언어) ->동작하고 출력까지 직접해야한다
-- 변수, 조건문, 반복문

--declare
--    변수 정의
--begin
--    SQL구문 작성
--    출력구문 작석
--exception
--    예외처리 구문  --쿼리문의 수행결과를 반드시 출력함수를 통해서 확인해야 한다.
--end;
/ -->빠지면 안됨

set serveroutput on;

begin
   dbms_output.put_line('Hello World'); --출력함수
end;
/

declare
   -- vempno number(4); -- 변수의 선언
   -- vename varchar2(10); -- 
    
    vempno number(4) := 7777; -- 상수의 정의
    vename varchar2(10)not null := 'SCOTT'; --null 값을 변수의 값으로 사용할수 없다.
begin
    vempno := 7777; -- 변수의 초기화
    vename := 'SCOTT';
    
   dbms_output.put_line('사원 /이름');
   dbms_output.put_line(vempno ||''||vename);
end;
/

declare
    -- 스칼라 방식
     --  vempno number(4);
       
    -- 레퍼런스 방식
       vempno emp.empno%type := 7777; --> 기존 테이블의 컬럼의 타입을 참조한다.
begin
    --vempno := 7777;
    dbms_output.put_line(vempno);
end;
/

declare
    
    -- 레퍼런스 방식  -테이블에서 값을 가져오기때문에 대부분 레퍼런스 방식을 사용
       vempno emp.empno%type; 
       vename emp.ename%type; 

begin
    select empno,ename 
    into vempno,vename  -->필수
    from emp;
    --where empno = 7788; --> where절은 필수  -->생략하면 '실제 인출은 요구된 것보다 많은 수의 행을 추출합니다' 오류뜸
    
    dbms_output.put_line('사번 / 이름');
    dbms_output.put_line(vempno||''||vename);
exception
  when TOO_MANY_ROWS then dbms_output.put_line('행의수가 여러개 입니다.');       
                   --> TOO_MANY_ROWS -where절 생략했을때 예외값으로 사용
  when OTHERS then dbms_output.put_line('모든 예외에 대한 처리');                 
end;
/

--table타입
declare
   -- 테이블 type(사용자 정의 변수의 타입을 정의)
   -- 배열의 형식
   -- vename varchr(10)
   TYPE ename_table_type IS TABLE OF emp.ename%type -->소문자로 쓴곳은 배열의 형식
   INDEX BY BINARY_INTEGER;
   
   TYPE job_table_type IS TABLE OF emp.job%type
   INDEX BY BINARY_INTEGER;

   TYPE mgr_table_type IS TABLE OF emp.mgr%type
   INDEX BY BINARY_INTEGER;

   TYPE sal_table_type IS TABLE OF emp.sal%type
   INDEX BY BINARY_INTEGER;
    
   TYPE empno_table_type IS TABLE OF emp.empno%type
   INDEX BY BINARY_INTEGER;
   
   enameArr ename_table_type; --> 배열형식의 변수 선언
   jobArr job_table_type; --> 배열형식의 변수선언
   mgrArr mgr_table_type;
   salArr sal_table_type;
   empnoArr empno_table_type;
   
   i BINARY_INTEGER := 0;
begin
  for k in (select ename,job,mgr,hiredate,sal,empno,deptno from emp) loop
          i := i +1;
          enameArr(i) := k.ename;
          jobArr(i) := k.job;
          mgrArr(i) := k.mgr;
          salArr(i) := k.sal;
          empnoArr(i) := k.empno;
  end loop;
    
  for j in 1..i loop
           dbms_output.put_line(enameArr(j)||' / '||jobArr(j)||' / '||mgrArr(j)||' / '||salArr(j)||' / '||empnoArr(j));
     end loop;      
end;
/ 
--insert 
declare
   -- 레코드 type(여러개의 변수를 묶어서 사용한다) --> 사용자 정의 변수 타입
   -- 클래스랑 유사하다.
    
   TYPE emp_record_type IS RECORD(
         v_empno emp.empno%type,
         v_ename emp.ename%type,
         v_job emp.job%type,
         v_deptno emp.deptno%type
   );  
   
   emp_record emp_record_type; -->레코드 타입의 변수 선언
   
begin
    select empno,ename,job,deptno
    into emp_record
    from emp
    where empno =7788;
    
    dbms_output.put_line(emp_record.v_empno||''|| emp_record.v_ename||''||emp_record.v_job||''|| emp_record.v_deptno);
  
end;
/ 

create table dept_record
as
select * from dept;

declare
   TYPE rec_dept IS RECORD(
       v_deptno dept_record.deptno%type,
       v_dname dept_record.dname%type,
       v_loc dept_record.loc%type
   );
   
   dept_rec rec_dept;
begin
   dept_rec.v_deptno := 50;
   dept_rec.v_dname := 'DEV';
   dept_rec.v_loc := 'BUSAN';

    insert into dept_record
    values dept_rec;
end;
/
select * from dept_record;

--update
declare
   TYPE rec_dept IS RECORD(
       v_deptno dept_record.deptno%type not null := 99,
       v_dname dept_record.dname%type,
       v_loc dept_record.loc%type
   );
     
    dept_rec rec_dept;
   
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname  := 'INSA';
    dept_rec.v_loc := 'SEOUL';

    update dept_record
    set dname = dept_rec.v_dname, loc = dept_rec.v_loc
    where deptno = dept_rec.v_deptno;
end;
/

--삭제
declare
   v_deptno dept_record.deptno%type :=50;
begin
   delete from dept_record
   where deptno = v_deptno;
end;
/

---조건문

declare
   vempno number(4);
   vename varchar2(10);
   vdeptno varchar2(10);
   vdname varchar2(10) := null;
begin
   select empno,ename,deptno
   into vempno,vename,vdeptno
   from emp
   where empno = 7788;
   
   if(vdeptno = 10)then 
          vdname := 'AAA';
   end if;
   
   if(vdeptno = 20)then  
          vdname := 'BBB';
   end if;
   
   if(vdeptno = 30)then  
          vdname := 'CCC';
   end if;
   
   if(vdeptno = 40)then  
          vdname := 'DDD';
   end if;
   
   dbms_output.put_line('부서명 :'||vdname);
end;
/

declare
  -- %ROWTYPE : 테이블의 모든 컬럼의 이름과 타입을 참조하겠다
  -- 컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다


  vemp emp%rowtype;
begin
   select *
   into vemp
   from emp
   where empno = 7788;
   
   dbms_output.put_line('사원번호:'||vemp.empno);
   dbms_output.put_line('사원명:'||vemp.ename);
   dbms_output.put_line('부서번호:'||vemp.deptno);
   
end;
/

--스칼라 방식
--레퍼런스 방식
 --  1.emp.empno%type
 --   2.emp%rowtype

--사용자 정의 변수 타입
 --   1. 테이블 type 
 --         - TYPE xxxx

declare
   vemp emp%rowtype;
   annsal number(7,2);
   
begin
   dbms_output.put_line(' 사번 / 이름 / 연봉');
   dbms_output.put_line(' ----------------');
   
   select *
   into vemp
   from emp
   where empno = 7788;
   
   --해당 사원의 연봉을 출력하세요. 단 커미션이 null인경우 0으로 계산되게 하세요.
   
   if( vemp.comm is null) then
         vemp.comm := 0;
   end if;      
         
   annsal := vemp.sal * 12 + vemp.comm;
   
   dbms_output.put_line(vemp.empno||''||vemp.ename||''||annsal);

end;
/

declare

   vemp emp%rowtype;
   annsal number(7,2);
   
begin
   dbms_output.put_line(' 사번 / 이름 / 연봉');
   dbms_output.put_line(' ----------------');
   
   select *
   into vemp
   from emp
   where empno = 7788;
   
  if(vemp.comm is null) then
         annsal := vemp.sal * 12;
   else
         annsal := vemp.sal * 12 + vemp.comm;   
   end if;
   
   dbms_output.put_line(vemp.empno||''||vemp.ename||''||annsal);

end;
/

declare
   vemp emp%rowtype;
   vdname varchar2(10);
begin
   select *
   into vemp
   from emp
   where empno = 7788;
   
   if(vemp.deptno =10) then
          vdname :='AAA';
   elsif (vemp.deptno =20) then
          vdname :='BBB';
   elsif (vemp.deptno =30) then
          vdname :='CCC';   
   elsif (vemp.deptno =40) then
          vdname :='DDD';
   end if;
   
   dbms_output.put_line(vdname);
   end;
   /

--조건문
-- if then end if;
-- if then else end if;
-- if then elsif then end if;

-- 반복문
-- loop end loop;
-- for in loop end loop;
-- while loop end loop;

--loop
 --  실행문 ( 무한 반복문 )
 --  무한 반복문의 제어
 --  1. EXIT WHEN 조건식
 --  2. IF THEN END IF;
   
--end loop;

declare
    n number := 1;
begin
   loop
        dbms_output.put_line(n);
        n := n + 1;
        exit when n> 10; --반복문 멈추기 위한 조건
   end loop;
end;
/


    
begin
   -- in 구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
   for n in 1..10 loop    --in 시작값..끝값 1씩증가 1~ 10(10회 반복)
       dbms_output.put_line(n);
   end loop;
end;
/

begin
   -- in 구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
   for n in reverse  1..10 loop    --in 시작값..끝값 1씩감소 10~ 1(10회 반복)
       dbms_output.put_line(n);
   end loop;
end;
/
--for문
declare 
   vdept dept%rowtype;
begin
   for n in 1..4 loop
       select *
       into vdept
       from dept
       where deptno = 10 * n;
     dbms_output.put_line(vdept.deptno||''||vdept.dname||''||vdept.loc);
   end loop;
end;
/

--while문

declare 
    n number := 1;
begin 
    while(n <= 10) loop
          dbms_output.put_line(n);
          n := n +1;
    end loop;
end;
/
declare
     vdept dept%rowtype;
     n number :=1;
begin
    while(n<=4) loop
        select *
       into vdept
       from dept
       where deptno = 10 * n;
     dbms_output.put_line(vdept.deptno||''||vdept.dname||''||vdept.loc);
          n := n +1;
    end loop;
end;
/

-----------10 27 481p
set serveroutput on;

--저장 프로시저
-- 1. 생성(create)
-- 2. 실행(execute or exec)
create or replace procedure 프로시저명(매개변수)

is or as
    변수 정의
begin
    SQL
    출력구문
    조건문 , 반복문
end;
/

drop table emp01;

create table emp01
as
select * 
from emp;

create or replace procedure emp01_print
is
    vempno number(10);
    vename varchar(10);
begin
    vempno := 1111;
    vename := 'Hong';
    
    dbms_output.put_line(vempno || '' || vename);
end;
/ 
-->프로시저생성

execute emp01_print; 
-->실행
 
create or replace procedure emp01_del
is
begin
   delete from emp01;
end;
/

exec emp01_del;
select * from emp01;

create or replace procedure del_ename(vename emp01.ename%type)
is
   
begin
   delete from emp01
   where ename = vename;
end;
/

exec del_ename('SCOTT'); 
--> SCOTT사원삭제

select * from emp01
where ename = 'SCOTT';   
--> 삭제 됐는지 확인 

exec del_ename('SMITH');  
--> SMITH사원삭제

select * from emp01
where ename = 'SMITH';
--> 삭제 됐는지확인


-- 저장프로시져의 매개변수 유형
-- in , out ,in out
-- in : 값을 전달받는 용도
-- out : 프로시저 내부의 실행 결과를 실행을 요청한 쪽으로 값을 전달
-- in out : in + out

create or replace procedure sel_empno
(
    vempno in emp.empno%type,
    vename out emp.ename%type,
    vsal out emp.sal%type,
    vjob out emp.job%type
)  
--->사번을 통해 특정 사원조회
is

begin
    select ename,sal,job
    into vename,vsal,vjob
    from emp
    where empno = vempno; 
end;
/
--바인드변수
variable var_ename varchar2(15);
variable var_sal number;
variable var_job varchar2(9);


exec sel_empno(7499,:var_ename,:var_sal,:var_job);
-->in타입은 결과를 받아주고, out 타입은 바인드변수 ?
-->바인드변수사용할때는 앞에 : 사용

print var_ename;
print var_sal;
print var_job;
-->바인드변수 출력

-- 문제
-- 사원 정보를 저장하는 저장 프로시저 만드세요
-- 사번, 이름, 직책, 매니저 ,부서
-- 사원 정보는 매개변수 사용해서 받아온다.

create table emp02
as
select empno,ename,job,mgr,deptno
from emp
where 1 != 1;

create or replace procedure insert_sawon
(   
    vempno in emp02.empno%type,
    vename in emp02.ename%type,
    vjob in emp02.job%type,
    vmgr in emp02.mgr%type,
    vdeptno in emp02.deptno%type
 )
is
 
begin
    insert into emp02
    values(vempno,vename,vjob,vmgr,vdeptno);
end;
/

exec insert_sawon(1111,'hong','sales',2222,10);

select * from emp02;

-- 저장 함수
-- 저장함수와 저장 프로시저의 차이점 : return값 유무
-- 1. 생성(create)
-- 2. 실행(execute)

create or replace function 함수명(매개변수)
   RETURN 값의 타입 -- 세미콜론 생략
is
   변수정의
begin
   
   SQL구문
   출력함수
   조건문 , 반복문
   
   RETURN 리턴값; --세미콜론 사용
end;
/

create or replace function cal_bonus(vempno emp.empno%type)
   return number
is 
    vsal number(7,2);
begin
    select sal
    into vsal
    from emp
    where empno = vempno;
    
    return vsal * 200;
end;
/

variable var_res number;

execute :var_res := cal_bonus(7788);
--->exec뒤에 변수를 선언해야한다.

print :var_res;
---> 출력 600000

drop procedure insert_sawon;

dorp function cal_bonus;

--커서 p460

declare

begin
    select *
    into 변수
    from emp;
    --where 조건식
end;
/

declare
    --커서 : select 구문이 실행하는 결과를 가리킨다.
    CURSOR 커서명 IS sql 구문(select); --> 커서선언
begin
   OPEN 커서명;
   LOOP
       FETCH 커서명 INTO 변수명 -->테이블로부터 가져와서 변수에 저장하는 역할
       exit when 커서명%NOTFOUND
   END LOOP;
   CLOSE 커서명;  -->커서 
end;
/

declare
    CURSOR c1 IS select * from emp; 
    vemp emp%rowtype;
begin
   OPEN c1;
   LOOP
       FETCH c1 INTO vemp;  -->테이블로부터 가져와서 변수에 저장하는 역할
       exit when c1%NOTFOUND;
       dbms_output.put_line(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.mgr||' '||vemp.sal||' '||vemp.comm||' '||vemp.deptno||' '||vemp.hiredate);
   END LOOP;
   CLOSE c1;  -->커서 
end;
/
--결과
--7369 SMITH CLERK 7902 800  20 80/12/17
--7499 ALLEN SALESMAN 7698 1600 300 30 81/02/20
--7521 WARD SALESMAN 7698 1250 500 30 81/02/22
--7566 JONES MANAGER 7839 2975  20 81/04/02
--7654 MARTIN SALESMAN 7698 1250 1400 30 81/09/28
--7698 BLAKE MANAGER 7839 2850  30 81/05/01
--7782 CLARK MANAGER 7839 2450  10 81/06/09
--7788 SCOTT ANALYST 7566 3000  20 87/04/19
--7839 KING PRESIDENT  5000  10 81/11/17
--7844 TURNER SALESMAN 7698 1500 0 30 81/09/08
--7876 ADAMS CLERK 7788 1100  20 87/05/23
--7900 JAMES CLERK 7698 950  30 81/12/03
--7902 FORD ANALYST 7566 3000  20 81/12/03
--7934 MILLER CLERK 7782 1300  10 82/01/23

---for문
declare
    CURSOR c1 IS select * from dept; 
    vdept dept%rowtype;
begin
    for vdept in c1 loop
         exit when c1%notfound;
         dbms_output.put_line(vdept.deptno||' '||vdept.dname||' '||vdept.loc);
    end loop;
end;
/

--결과
--10 ACCOUNTING NEW YORK
--20 RESEARCH DALLAS
--30 SALES CHICAGO
--40 OPERATIONS BOSTON



--아이디,이름,이름의 성,부서이름

--hr계정접속
-- employees, departments
-- 조인방식
select employee_id, first_name, last_name, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 100;
-->실행
--108	Nancy	Greenberg	Finance
--109	Daniel	Faviet	Finance
--110	John	Chen	Finance
--111	Ismael	Sciarra	Finance
--112	Jose Manuel	Urman	Finance
--113	Luis	Popp	Finance

select count(*) from employees; 

select * from employees
where department_id is null;

--서브쿼리방식
select employee_id, first_name, last_name, department_id, 
    (
           select department_name
           from departments d
           where e.department_id = d.department_id
     ) as dep_name      
from employees e
where department_id = 100;
--위와 결과는 동일하다
 
select employee_id, first_name, last_name,get_dep_name(department_id)
from employees e
where e.department_id = 100;
 --조인방식 서브쿼리방식과 결과값이 동일
 
-- 프로시저(함수)

create or replace function get_dep_name(dept_id number)
    return varchar2
is
  sDepName varchar2(30);
begin
   select department_name
   into sDepName
   from departments
   where department_id =dept_id;
   
   return sDepName;
end;
/

variable var_depname varchar2(30);

exec :var_depname := get_dep_name(90);

print :var_depname;
-->출력 Executive


select employee_id, first_name, last_name,get_dep_name(department_id)
from employees e
where e.department_id = 100;
 
select sum(sal), max(sal)
from emp;
 
 --문제
 -- employees, jobs
 --사원아이디, 이름, 성, job_title
 
 -- 조인 방식
 -- 서브 쿼리
 -- get_job_title()
 
 
 
 
 
 
 
 
 
 
 
 