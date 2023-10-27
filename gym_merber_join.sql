/*
회원 가입 테이블
*/

create table GYM_MEMBER (
     id number(5),
     name varchar2(10 char) not null,
     phone varchar2(13 char) not null,
     gender varchar2(2 char) not null,
     birthday date,
     address varchar2(100 char),
     join_time timestamp default systimestamp,
     modified_time timestamp default systimestamp,
     constraint gym_member_pk primary key(id)
 );
 
 commit;
 
commit;