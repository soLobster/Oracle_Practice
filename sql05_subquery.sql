/*
서브 쿼리 (Sub-Query)
sql 문장의 일부로 다른 SQL 문장이 포함되는 것.

*/

-- 급여 평균보다 더 많은 급여를 받는 직원들?
select *
from emp;

select ename, sal
from emp
where sal > (
                select sal
                from emp
                where ename = 'JONES' ) and ename != 'SCOTT';
                
select * 
from emp
where sal >= (
        select avg(sal)
        from emp
        );
        
select ename, sal ,  round (sal - ( select avg(sal) from emp), 1) as "DIFF" 
from emp
where round (sal - ( select avg(sal) from emp), 1) > 0 and ename != 'SCOTT' 
order by DIFF desc;

-- ALLEN 보다 적은 급여를 받는 직원들의 사번, 이름, 급여를 검색.
select ename, sal, job
from emp
where ename = 'ALLEN';

select empno, ename, sal 
from emp
where sal < (
                select sal
                from emp
                where ename = 'ALLEN' )
                order by sal desc;
                
-- ALLEN과 같은 직무를 갖는 직원들의 사번, 이름, 부서번호, 직무, 급여 검색
select empno, ename, deptno, sal, job
from emp
where job = ( select job
              from emp
              where ename ='ALLEN');
-- SALESMAN의 급여 최댓값보다 더 많은 급여를 받는 직원들의 이름, 급여 직무 검색
select ename, sal, job
from emp
where sal > (select max(sal)
             from emp
             where job = 'SALESMAN')
             order by sal desc;
             
             
select ename, sal, job
from emp
where job = 'SALESMAN';

-- WARD의 연봉보다 더 많은 연봉을 받는 직원들의 이름, 급여, 수당, 연봉을 검색
-- 연봉 = sal * 12 + comm
select ename as 이름, sal as 급여, nvl(comm,0) as 수당, (sal*12+nvl(comm,0)) as 연봉 ,job
from emp
where (sal*12+nvl(comm,0)) > (select (sal*12+nvl(comm,0)) 
                             from emp
                             where ename = 'WARD')
order by 연봉 desc;

select ename as 이름, sal as 급여, nvl(comm,0) as 수당, (sal*12+nvl(comm,0)) as 연봉
from emp
where ename = 'WARD';

-- SCOTT과 같은 급여를  받는 직원들의 이름과 급여를 검색.
select ename, sal
from emp
where sal = (
                select sal
                from emp
                where ename = 'SCOTT' );
-- 위 결과에서 SCOTT은 제외하고 검색.
select ename, sal
from emp
where sal = (
                select sal
                from emp
                where ename = 'SCOTT' ) and ename != 'SCOTT';
-- ALLEN보다 늦게 입사한 직원들의 이름, 입사날짜를 최근입사일부터 출력.
select ename, hiredate
from emp
where hiredate > (select hiredate
                    from emp
                    where ename = 'ALLEN')
order by hiredate desc;
-- 매니저가 KING인 직원들의 사번, 이름, 매니저 사번을 검색.
select empno, ename, mgr
from emp
where mgr = (select empno 
             from emp
             where ename = 'KING');
-- ACCOUNTING 부서에 일하는 직원들의 이름, 급여, 부서번호를 검색.
select ename, sal, deptno
from emp
where deptno = (select deptno
                from dept
                where dname = 'ACCOUNTING');
-- CHICAGO에서 근무하는 직원들의 이름, 급여, 부서 번호를 검색.
select ename, sal, deptno
from emp
where deptno = (select deptno
                from dept
                where loc = 'CHICAGO');

-- 단일행 서브쿼리: 서브쿼리의 결과 행이 1개 이하인 경우.
-- 단일행 서브쿼리는 단순 비교 (=, !=, >, >=, <, <=)를 할 수 있음.
-- 다중행 서브쿼리: 서브쿼리의 결과 행이 2개 이상인 경우.
-- 다중행 서브쿼리는 단순 비교를 할 수 없음.
-- 다중행 서브쿼리에서는 in, any, all과 같은 키워드를 함께 사용.


-- 각 부서에서 급여를 가장 많이 받는 직원의 레코드.(모든 컬럼) 검색.
select *
from emp
where (deptno, sal) in ( select deptno, max(sal)
                         from emp
                         group by deptno);

select *
from emp
where (deptno, sal) in ( select deptno, min(sal)
                         from emp
                         group by deptno);

-- 다중행 서브쿼리에서 any vs all;
-- 1) any: 여러개 중에서 적어도 하나.  or
-- 2) all: 여러개 모두 (전부)        and
select *
from emp
where sal < all (
                select sal 
                from emp 
                where deptno = 10
                );
                
                
select *
from emp
where sal < any (
                select sal 
                from emp 
                where deptno = 10
                );