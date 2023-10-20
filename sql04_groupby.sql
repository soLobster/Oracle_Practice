/*
오라클 함수 (function)
1. 단일 행 함수.
    행(row) 하나씩 함수의 아규먼트로 전달되고, 행 마다 하나씩 결과가 리턴되는 함수.
    ex) to_date, to_lower, lower, upper....
2. 다중 행 함수.
    여러개의 행이 함수의 아규먼트로 전달되고, 하나의 결과가 리턴되는 함수.
    ex) 통계 관련 함수 : count, sum, avg, max, min, variance(분산), stddev(표준편차).
*/

select ename, lower(ename) as 소문자이름, job, lower(job) as 소문자직업
from emp
order by ename;

-- to char() 함수: 다른 타입의 값을 문자열로 변환. 날짜 -> 문자열
select hiredate, to_char(hiredate, 'YYYY/MM/DD HH:MI:SS') as 고용날짜
from emp;

-- nvl(변수, 값) : 변수가 null이면 값을 리턴, null이 아니면 값 1을 리턴하고 , null이면 값2를 리턴.
-- nvl2(변수, 값1, 값2) : 변수가 null이면 값1을 리턴, null이면 값2를 리턴.

select *
from emp;

select comm, nvl(comm, 0), nvl2(comm, comm, -1) 
from emp;

-- 다중 행 함수 예: 
-- count(컬럼): null이 아닌 행의 개수를 리턴.
select count(empno), count(mgr), count(comm)
from emp;

-- 테이블의 행의 개수.
select count(*)
from emp;

select sum(sal), avg(sal), max(sal), min(sal), variance(sal), stddev(sal)
from emp;

-- 단일행 함수와 다중행 함수는 함께 select 할 수 없다.
select sal, sum(sal)
from emp;

select *
from emp;

-- 그룹별 쿼리:
-- ex) 부서별 급여 평균, 부서별 인원수
/*
select 컬럼, 함수 호출
from 테이블
where 조건식
group by 그룹별로 묶어줄 변수(컬럼)
having 조건식
order by
*/

-- 부서별 급여 평균
select deptno as 부서번호, job as 직책, round(avg(sal),2) as 평균급여
from emp
group by deptno ,job
having avg(sal) > 2000
order by deptno;

select *
from emp;

-- 부서별 급여 평균, 표준편차를 부서번호 오름차순으로 출력

select deptno, round(avg(sal),2) as 평균급여 , round(stddev(sal),2) as 표준편차
from emp
group by deptno
order by deptno;

-- 직무별 직무, 직원수, 급여 최댓값, 최솟값, 평균을 직무 오름차순으로 출력
select job as 직무, count(job) as 직원수, max(sal) as 급여최댓값, min(sal) as 급여최솟값, round(avg(sal) , 2) as 평균급여
from emp
group by job
order by job;

-- 부서별, 직무별 부서번호, 직무, 직원수, 급여 평균을 검색
-- 1) 부서번호 정렬, 2) 직무 정렬
select deptno as 부서번호, job as 직무 , count(job) as 사원수, avg(sal) as 급여평균
from emp
group by deptno, job
order by deptno, job;

select *
from emp;

-- 입사연도별 사원수를 검색 to_char (날짜, 포맷)
select to_char(hiredate, 'yyyy') as 입사연도 ,count(*) as 사원수
from emp
group by to_char(hiredate, 'yyyy')
order by 입사연도;

-- select에서 만든 별명은 order by에서만 사용가능
-- 이유 실행 순서

-- where 절은 테이블에서 조건에 맞는 행들을 선택할 때.
-- having 절은 그룹별 쿼리에서 조건에 맞는 그룹을 선택할 때.

select *
from emp;

select deptno, round(avg(sal),1)
from emp
group by deptno
having avg(sal) >= 2000
order by deptno;

-- mgr 컬럼이 null이 아닌 직원들 중에서 부서별 급여 평균을 검색.
-- 정렬 순서 : 부서번호 오름차순
select deptno as 부서, round(avg(sal),2) as "부서별 급여 평균"
from emp
where mgr is not null
group by deptno
order by deptno;

--직무별 사원수를 검색, PRESIDENT는 검색제외
--직무별 사원수가 3명 이상인 직무만 검색
--정렬순서: 직무의 오름차순
select job as 직무 , count(job) as 사원수
from emp
where job != 'PRESIDENT'
group by job
having count(job) > 3
order by 직무;

-- 입사연도, 부서번호, 입사연도별 부서별 사원수 검색
-- 1980년은 검색에서 제외
-- 연도별 부서별 사원수가 2명 이상인 경우만 선택.
-- 연도별, 부서별 오름차순
select to_char(hiredate,'yyyy') as 연도별 , count(*) as 직원수, deptno as 부서번호
from emp
where to_char(hiredate,'yyyy') != '1980'
group by to_char(hiredate,'yyyy'), job, deptno
having count(to_char(hiredate,'yyyy')) >= 2
order by 연도별, 부서번호
