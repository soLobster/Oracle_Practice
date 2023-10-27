/*
SQL 


DQL Data Query Language - select 문장.
DML Data Manipulation Language - insert, update, delete 문장.
DDL Data Definition language - create alter drop truncate
TCL Transaction Control Language - commit, rollback
    - commit 데이터베이스의 변경 내용을 영구 저장.
    - rollback 직전의 commit 상태로 되돌아가기.

테이블 생성
create table 테이블명(컬럼 이름, 컬럼 데이터타입, [제약조건 기본값], ....);
데이터 타입에서 사용되는 키워드(예약어)는 데이터베이스 종류에 따라서 다르다.
오라클 데이터 타입: number, varchar2, date, timestamp, clob(character Large Object), blob(Binary Large Object)
*/

create table students(
 stuno NUMBER(6),
 stuname VARCHAR2(10),
 birthday DATE NOT NULL
 );
 
 select *
 from students;
 
 alter table students modify stuname varchar2(10 char);
/*
테이블에 행 추가
insert into 테이블이름(컬럼,....) values(값, ....);
테이블에 삽입하는 값의 개수가 컬럼의 개수와 같고, 순서가 컬럼순서와 같은 경우
insert into 테이블이름 values(값,....);
*/

 insert into students(stuno,stuname,birthday) values(1002, '손흥민', '2023-10-24');

 insert into students values(1001, '홍길동', '2023-10-23');
 insert into students values(1002, null, '2023-10-24');
 
 insert into students(stuno,birthday) values (1003,'2023-10-25');
 
 select *
 from students;
 
 commit;
 
 
 delete from students where stuno = 1002;
 
-- 테이블 삭제

 drop table students;
 
 create table ex_users (
 no number(4),
 userid varchar2(20 byte),
 password varchar2(100 byte),
 age number(3) default 0,
 created_date date default sysdate 
 );
 
 insert into ex_users(no,userid,password) values(1,'admin','0000');
 --> insert 할 때 기본값이 설정된 칼럼들은 insert 하는 값이 없으면
 -- 설정된 기본값이 자동으로 insert 됨.
 
 insert into ex_users(no, userid, age)
 values(2, 'guest' , 10);
 --> password 칼럼은 기본값이 설정되어 있지 않기 때문에 null.
 select *
 from ex_users;
 
 
 -- 테이블을 생성할 때 제약조건 만들기(constraint)
 -- 1) PK primary key (not null && unique)
 -- 2) NOT NULL
 -- 3) UNIQUE
 -- 4) CHECK
 -- 5) FK Foreign key
 
 create table ex1 (
  id number(2) primary key,
  name varchar2(10 char) not null,
  phone varchar2(13 char) unique,
  age number(3) check(age >= 0),
  memo varchar2(1000 char)
 );
 
 insert into ex1 
 values(1, '오쌤', '010-1234-5678', 16, 'hello');
 
 insert into ex1 (id, name) 
 values(1, '홍길동');
 --> PK 제약조건 위배. PK -> NOT NULL, UNIQUE
 
 insert into ex1 (name)
 values('홍길동');
 --> PK 제약조건 위배. PK는 NOT NULL
 
 insert into ex1 (id,phone)
 values(2,'010-0000-0000');
 -->Name 칼럼 NOT NULL 제약 조건 위배
 
 insert into ex1 (id, name, phone) values (2, '홍길동', '010-1234-5678');
 --> Unique 제약조건 위배 phone 칼럼은 unique
 
 insert into ex1 (id,name,age) values (2,'홍길동', -1);
 --> check 제약조건 위배 age 칼럼은 0보다 커야한다.
 
 select *
 from ex1;
 
 commit;
 
 -- 테이블을 생성할 때 제약조건 만들기: 제약조건 이름을 설정.
 create table ex2(
 id     number(4)
        constraint ex2_id_pk primary key,
 name   varchar2(10 char)
        constraint ex2_name_nn not null,
 phone  varchar2(13 char)
        constraint ex2_phone_uq unique,
 gender varchar2(1 char)
        constraint ex2_gender_chck check(gender in ('M','F'))
 );
 
 insert into ex2 values(1, '홍길동', '010-0000-0000', 'M');
 
 insert into ex2 (id,name) values (1, '홍길동');
 
 
 select *
 from ex2;
 
 commit;
 
 -- 테이블을 생성할 때 제약조건 만들기. 컬럼정의 따로, 제약조건 따로
 create table ex3(
     id     number(4),
     name   varchar2(10 char),
     phone  varchar2(13 char),
     gender varchar2(1 char),
    -- 제약조건 정의(제약조건 이름 & 내용)
     CONSTRAINT ex3_id_pk primary key (id),
     CONSTRAINT ex3_name_nn check (name is not null), -- not null 제약조건 주의
     CONSTRAINT ex3_phone_uq unique (phone),
     CONSTRAINT ex3_gender_chck check(gender in ('M','F'))
 );
 
 select *
 from ex3;
 
 desc ex3;
 
 -- foreign key(외래키): 다른 테이블의 고유키를 참조하는 제약 조건.
 -- 데이터를 insert 할 때 다른 테이블의 PK에 없는 값이 INSERT 되지 않도록 하기 위해서 존재.
 -- 테이블을 생성할 때 FK를 설정하려면, PK가 있는 다른 테이블이 먼저 생성되어 있어야함.
 
 create table ex_dept (
    deptno number(2)
           constraint ex_dept_deptno_pk primary key,
    dname  varchar2(100 char) not null
    );
    
 create table ex_emp1 (
    empno number(4)
          constraint ex_emp1_empno_pk primary key,
    ename varchar2(100 char) not null,
    deptno number(2)
          constraint ex_emp1_deptno_fk references ex_dept (deptno)
          );
 
 insert into ex_dept values(10, '아이티윌');
 insert into ex_emp1 values(1000, '오쌤',10); -- fk 존재
 insert into ex_emp1 values(1001, '홍길동', 20); -- fk 위배
 
 select *
 from ex_emp1;
 
 commit;
 
 create table ex_emp2 (
 -- 컬럼 선언(이름 & 데이터 타입)
    empno number(4),
    ename varchar2(100 char) not null,
    deptno number(2),    
 -- 제약조건 선언
    constraint ex_emp2_empno_pk primary key (empno),
    constraint ex_emp2_deptno_fk foreign key (deptno) references ex_dept (deptno)
    );
 
 select *
 from ex_emp2;
 
 desc ex_emp2;
 
 desc students; --describe
 desc DEPT;
 desc EMP;
 desc salgrade;