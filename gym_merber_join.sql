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
 
ALTER TABLE GYM_MEMBER
ADD CONSTRAINT PK_pt_code 
PRIMARY KEY (pt_code);

 
 
 UPDATE GYM_MEMBER
SET pt_code = 1
WHERE pt_code IS NULL;

UPDATE GYM_MEMBER
SET pt_code = NULL;


 
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
 

select * from PT where PT_CODE = '4';
 