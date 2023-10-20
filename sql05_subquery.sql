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