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
select dname || ' 는 ' || loc || ' 에 있습니다 '  as "부서는 도시에 있습니다" 
from dept;
