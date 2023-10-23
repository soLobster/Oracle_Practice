/*
join 2개 이상의 테이블에서 데이터를 검색하는 것.
문법:
1) ANSI 표준 문법.
    select 컬럼,...
    from 테이블1 join 종류 테이블2
    on join 조건;
2) 오라클 문법
    select 컬럼,....
    from 테이블1, 테이블2 ....
    where join 조건;
    
Join 종류
1) inner join
2) outer join
    - left outer join
    - right outer join
    - full outer join
*/
-- inner join과 outer join의 차이점을 보기위해서...
insert into emp(empno, ename, sal, deptno)
values (1004, '오쌤', 3500, 50);

select *
from emp;

commit;

select A.empno, A.ename, B.deptno, B.dname, B.loc
from EMP A
join DEPT B
on A.deptno = B.deptno;

select A.empno, A.ename, B.deptno, B.dname
from EMP A, DEPT B
where A.DEPTNO = B.DEPTNO(+);

select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+);

-- right outer join, outer 생략 가능
select e.empno, e.ename, d.deptno, d.dname
from emp e
right
join dept d
on e.deptno = d.deptno;

select e.empno, e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

-- full outer join
select e.empno, e.ename, e.deptno, d.deptno, d.dname 
from emp e
full
join dept d
on e.deptno = d.deptno;

-- Oracle에서는 full outer join 문법을 제공하지 않음.
-- left outer join 결과와 right outer join 결과를 합집합(union)할 수 있음.
select e.empno, e.ename, e.deptno, d.deptno, d.dname -- left outer join
from emp e, dept d
where e.deptno = d.deptno(+)
union -- 합집합
select e.empno, e.ename, e.deptno, d.deptno, d.dname -- right outer join
from emp e, dept d
where e.deptno(+) = d.deptno;

-- equi-join : join의 조건식이 = 연산자를 사용해서 만들어지는 경우
-- non-equi join: join의 조건식이 부등호를 사용해서 만들어진 경우.
-- 사번, 이름, 급여, 급여등급을 검색
select e.empno, e.ename, e.sal, s.grade
from emp e
join salgrade s
on e.sal between s.losal and s.hisal;

--on e.sal >= s.losal and e.sal < s.hisal;

select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- self join 같은 테이블에서 join을 하는 것.
-- 사번, 이름, 매니저 사번, 매니저 이름을 검색.
select e1.mgr as "매니저 사번", e2.ename as "매니저 이름" , e1.empno as 사번, e1.ename as 이름
from emp e1
join emp e2 
on e1.mgr = e2.empno;

select e1.mgr as "매니저 사번", e2.ename as "매니저 이름" , e1.empno as 사번, e1.ename as 이름
from emp e1
left
join emp e2 
on e1.mgr = e2.empno;

select e1.mgr as "매니저 사번", e2.ename as "매니저 이름" , e1.empno as 사번, e1.ename as 이름
from emp e1, emp e2
where e1.mgr = e2.empno;

-- ex1. 직원 이름, 직원 근무 도시를 검색. 근무 도시 오름차순 정렬.
select e.ename, d.loc
from emp e
join dept d
on e.deptno = d.deptno
order by d.loc;
-- ex2. 직원 이름, 매니저 이름, 급여, 급여 등급을 검색.
--   정렬순서: (1)매니저, (2)급여 등급
select e1.ename as "직원이름", e2.ename as "매니저 이름" , e1.sal as "급여", s.grade as "급여등급"
from emp e1
join emp e2
on e1.mgr = e2.empno
join salgrade s
on e1.sal between s.losal and s.hisal
order by s.grade;

select *
from emp;

-- ex3. 직원 이름, 부서 이름, 급여, 급여 등급을 검색.
--   정렬 순서: (1)부서 이름, (2)급여 등급
select e.ename, d.dname, e.sal, s.grade
from emp e
join dept d
on e.deptno = d.deptno
join salgrade s
on e.sal between s.losal and s.hisal
order by d.dname, s.grade;
-- ex4. 부서 이름, 부서 위치, 부서의 직원수를 검색. 부서 번호 오름 차순.
select  d.deptno as "부서번호", d.dname as "부서 이름", d.loc as "부서 위치", count(*) as "부서 직원수" 
from emp e
join dept d
on e.deptno = d.deptno
group by d.dname, d.loc, d.deptno
order by d.deptno;
-- ex5. 부서 번호, 부서 이름, 부서 직원수, 부서의 급여 최솟값, 
-- 부서의 급여 최댓값 검색. 부서 번호 오름 차순.
select e.deptno, d.dname as "부서 이름", count(*) as "부서 직원수", min(e.sal) as "부서의 급여 최솟값", max(e.sal) as "부서의 급여 최댓값"
from emp e
join dept d 
on e.deptno = d.deptno
group by e.deptno, d.dname
order by e.deptno;

select *
from emp;

-- ex6. 부서 번호, 부서 이름, 사번, 이름, 매니저 사번, 매니저 이름, 
-- 급여, 급여 등급을 검색. 급여가 3000 이상인 직원들만 검색.
-- 정렬 순서: (1) 부서 번호, (2) 사번 오름차순.
select e1.deptno, d.dname, e1.empno as 사번, e1.ename as 이름, e1.mgr as "매니저 사번", e2.ename as "매니저 이름" , e1.sal, s.grade
from emp e1
join emp e2
on e1.mgr = e2.empno
join dept d
on e1.deptno = d.deptno
join salgrade s
on e1.sal between s.losal and s.hisal
where e1.sal >= '3000'
order by e1.deptno, e1.empno;