/*
DDL(Data Definition Language): create, alter, drop, truncate
DML(Data Manipulation Language): insert, update, delete
*/

-- create table ... as select...
-- 테이블의 모양(컬럼 이름, 데이터 타입)과 데이터를 복사.
-- emp 테이블의 전체 데이터를 ex_emp3 테이블을 생성하면서 복사.
create table ex_emp3 
as select * from emp;

select *
from ex_emp3;

-- emp 테이블의 모양 (컬럼, 데이터 타입)과 똑같은 테이블 ex_emp4을 생성.
-- 데이터는 복사하지 않고.

create table ex_emp4
as select * from ex_emp3 where empno=-1;

select *
from ex_emp4;

-- truncate table: 테이블의 모든행을 삭제하는 DDL
select * from ex_emp3;
truncate table ex_emp3;

-- drop table: 테이블을 삭제하는 ddl
drop table ex_emp4;

-- DML
-- insert into table(col, ...) values (val,...);
--  1개 행을 삽입(insert) 
-- insert into table(col, ...) select ....;
--  select의 결과에 따라서 여러개의 행들을 삽입(insert)
select * from ex_emp3;

insert into ex_emp3
select * from emp where deptno = 10;

select * from bonus;
select * from emp;
--emp 테이블에서 comm이 null이 아닌 레코드를 bonus 테이블에 insert
insert into bonus
select ename,job,sal,comm 
from emp 
where comm is not null;

commit;

-- 테이블 데이터 업데이트
-- update 테이블이름 set 변수 = 값,....where 조건식
select * from emp;
-- 사번이 1004인 직원의 급여를 6000으로 변경
update emp set sal = 6000 where empno=1004;

commit; -- 현재 세션에서 지금까지의 트랜잭션을 DB에 영구 저장.

update emp set sal = 6000;

select * from emp;

rollback;


-- 1) 사번이 1004인 직원의 직무를 Manager로 업데이트, 입사 날짜 오늘 날짜,
-- 부서번호를 40으로 업데이트.
update emp set job = 'MANAGER' where empno = 1004;
select * from emp;
-- 2) Accouting 부서에서 일하는 직원들의 급여를 10% 인상.

select * from dept;

update emp set sal = sal*1.1 where deptno = (select deptno from dept where dname = 'ACCOUNTING');

-- 3) salgrade가 1인 직원들의 급여를 20% 인상.
select * from salgrade;

update emp 
set sal = sal*1.2 
where sal IN (
        select A.sal
        from emp A
        join salgrade S
        on A.sal between S.losal and S.hisal
        where S.grade = '1'
    );

select * from emp;

commit;

-- delete: 테이블에서 행을 삭제하는 DML
-- delete from 테이블 (where 조건식).
delete from emp;

rollback;

-- 사번이 1004인 직원 레코드 삭제

delete from emp
where empno = 1004;

commit;

-- 1987년에 입사한 직원들을 삭제;

select * from emp;

delete from emp
where to_char(hiredate, 'yyyy') = 1987;

select *
from emp;

rollback;