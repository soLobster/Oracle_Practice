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
     expire_date timestamp default systimestamp,
     -- todo modified_time을 expire_date로 바꾸고 join_time에서 특정 날짜를 더한 날이 셋 되어야 한다.
     constraint gym_member_pk primary key(id)
 );
 
 
 alter table GYM_MEMBER ADD t_id number(3);
 
 alter table GYM_MEMBER
 add constraint GYM_MEMBER_T_ID_FK
 foreign key (t_id) REFERENCES GYM_TRAINER (t_id);
 
 
 alter table GYM_MEMBER add membership_code number(3);
 
 alter table GYM_MEMBER
 add constraint GYM_MEMBER_FK
 foreign key (membership_code) REFERENCES MEMBERSHIP (membership_code);
 
 
 alter table GYM_MEMBER add pt_code number(5);
 
 alter table GYM_MEMBER
 add constraint GYM_MEMBER_PY_FK
 foreign key (pt_code) REFERENCES PT (pt_code);
 
commit;
 
commit;

drop table membership;

create table MEMBERSHIP(
    membership_code number(3) not null,
    membership_numofdays number(5) not null,
    membership_price number(9) not null,
    membership_category varchar2(300) not null,
    constraint membership_pk primary key(membership_code)
    );
    
commit;

INSERT INTO MEMBERSHIP 
VALUES (1, 30, 30000, '30일 이용권');

INSERT INTO MEMBERSHIP 
VALUES (2 , 30, 40000, '30일 이용권 + 개인 라커 + 회원복');

INSERT INTO MEMBERSHIP 
VALUES (3 , 60, 50000, '60일 이용권');

INSERT INTO MEMBERSHIP 
VALUES (4 , 60, 60000, '60일 이용권 + 개인 라커 + 회원복');

INSERT INTO MEMBERSHIP 
VALUES (5 , 90, 80000, '90일 이용권');

INSERT INTO MEMBERSHIP 
VALUES (6 , 90, 90000, '90일 이용권 + 개인 라커 + 회원복');

INSERT INTO MEMBERSHIP 
VALUES (7 , 120, 100000, '120일 이용권');

INSERT INTO MEMBERSHIP 
VALUES (8 , 120, 110000, '120일 이용권 + 개인 라커 + 회원복');

INSERT INTO MEMBERSHIP 
VALUES (9 , 180, 150000, '180일 이용권');

INSERT INTO MEMBERSHIP 
VALUES (10 , 180, 170000, '180일 이용권 + 개인 라커 + 회원복');

INSERT INTO MEMBERSHIP 
VALUES (11 , 365, 300000, '1년 이용권');

INSERT INTO MEMBERSHIP 
VALUES (12 , 365, 310000, '1년 이용권 + 개인 라커 + 회원복');

INSERT INTO MEMBERSHIP 
VALUES (13 , 7, 10000, '일주일 체험권');





delete from membership
where membershipcode = '1';



create table PT(
 pt_code number(5),
 t_id number(3),
 pt_price number(9),
 pt_time number(3),
 constraint PT_pk primary key(pt_code),
 constraint PT_fk foreign key (t_id) references GYM_TRAINER (t_id)
 );
 
 commit;
 alter table PT add PT_CATEGORY varchar2(100 char);
 
insert into PT
 values (1, 3, 400000, 10, '헬스 입문자 1대1 PT 10회');
 
 delete from pt
where pt_code = '1';
 
insert into PT
 values (2, 4, 200000, 5, '헬스 입문자 1대1 PT 5회');
 
insert into PT
 values (3, 5, 100000, 3, '헬스 입문자 1대1 PT 3회');
 
 insert into PT
 values (4, 7, 500000, 12, '필라테스 1대1 PT 12회');
 
 insert into PT
 values (5, 10, 360000, 8, '필라테스 1대1 PT 8회');
 
 insert into PT
 values(6, 6, 200000, 10, '헬스 입문자 단체 PT 10회');

 
 commit;   
 