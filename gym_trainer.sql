/*
GYM_TRAINER
*/

create table GYM_TRAINER (
     t_id number(3),
     t_name varchar2(10 char) not null,
     t_phone varchar2(13 char) not null,
     t_gender varchar2(2 char) not null,
     t_email varchar2(100 char) not null,
     salary number(8),
     t_birthday date,
     t_hiredate date,
     t_address varchar2(100 char),
     constraint gym_trainer_pk primary key(t_id)
 );
 
 commit;