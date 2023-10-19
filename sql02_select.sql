-- alt + f10 : sql 워크시트 만들기 

-- select 컬럼 이름,...from 테이블 이름; 가장 기본적인 sql 문법.

select *
from emp;

-- emp = 직원 테이블
-- dept = 부서 테이블

-- 직원 테이블에서 사번, 직원 이름을 검색
select empno, ename
from emp;

-- 부서 테이블에서 모든 컬럼을 검색
select *
from dept;

select deptno, dname, loc
from dept;

-- 컬럼 이름에 별명 출력 결과에서만 다르게 보임 (as) 공백에는 무조건 ""로 묶어야한다. 앵간하면 그냥 한글자도 묶자.
select deptno as "사원 번호", dname as 이름, loc as 지역
from dept;

-- 별명을 줄때는 반드시 큰 따옴표 ("")
-- 별명 이외에는 무조건 작은 따옴표 ('')

select deptno as "부서 번호", dname as "부서 이름", loc as 지역
from dept
where loc = 'DALLAS';

-- 연결 연산자.(||) 2개 이상의 컬럼을 합쳐서 하나의 컬럼을 출력.
-- 부서번호-부서이름 형식의 문자열을 "부서 정보"라는 컬럼으로 출력.
select deptno || ' - ' || dname as "부서 정보" 
from dept;

-- 부서 테이블을 검색해서 dept '...부서는 ...도시에 있습니다...'라는 형식으로 결과를 출력
select dname || ' 는 ' || loc || '에 있습니다. '  as "부서는 도시에 있습니다" 
from dept;

-- order by  [asc 오름차순(기본값: 생략 가능) / desc 내림차순] 

-- 부서 테이블의 모든 컬럼을 검색. 부서 번호 내림 차순 정렬
select deptno, dname, loc
from dept
order by deptno desc;

--부서 테이블의 모든 컬럼을 검색. 부서 이름 오름 차순으로 출력
select *
from dept
order by dname;

-- 직원 테이블에서 직원의 사번, 이름 ,급여를 검색 사번 오름차순으로 출력
select empno, ename, sal
from emp
order by empno;

-- 급여 내림차순.
select empno, ename, sal
from emp
order by sal desc;

-- 직원 테이블에서 부서 번호를 검색. 사번을 검색. 이름 검색 
-- 정렬 조건 1) 부서번호 오름차순 2) 같은 부서 안에서 사번 오름 차순
select deptno, empno, ename
from emp
order by deptno, empno;

-- 직원 테이블에서 부서 번호, 이름, 급여를 검색.
-- 정렬 순서 1) 부서번호 오름차순, 2) 급여 내림차순
select deptno, ename, sal
from emp
order by deptno, sal desc;

select deptno, ename, sal
from emp
where deptno = 20
order by sal;

-- 중복되지 않는 결과만 출력하기. distinct.
-- 업무 이름을 오름차순 정력 출력
select distinct job
from emp
order by job;

-- 중복되지 않는 부서번호, 직무 출력
-- distinct 두개를 하나로 묶어서 구분이 되면 된다.
select distinct deptno, job 
from emp
order by deptno;

