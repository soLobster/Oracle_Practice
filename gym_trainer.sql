/*
GYM_TRAINER
*/

create table GYM_TRAINER (
     t_id number(3), --sequence
     t_name varchar2(10 char) not null,
     t_phone varchar2(13 char) not null,
     t_gender varchar2(2 char) not null,
     t_email varchar2(100 char) not null,
     t_salary number(8),
     t_birthday date,
     t_hiredate date,
     t_address varchar2(300 char),
     constraint gym_trainer_pk primary key(t_id)
 );
 
 commit;
 
drop table GYM_TRAINER;
 
delete from GYM_TRAINER;

delete from PT;

insert into GYM_TRAINER
values (1, '김헬스', '01011111234', '남', 'kimhealth@itwill.com', '3500000', '1988/05/30', '2017/04/01','근육시 근육동 헬스1차 아파트 102동 807호');

insert into GYM_TRAINER
values (2, '이헬스', '01022221234', '남', 'leehealth@itwill.com', '2700000', '1995/11/03', '2021/03/06','근육시 근육동 헬스2차 아파트 203동 212호');

insert into GYM_TRAINER
values (3, '박헬스', '01033331234', '남', 'parkhealth@itwill.com', '2600000', '1997/06/30', '2022/05/07','근육시 근육동 헬스1차 아파트 107동 902호');

insert into GYM_TRAINER
values (4, '최헬스', '01044441234', '여', 'choihealth@itwill.com', '2800000', '1994/02/10', '2020/07/12','근육시 근육동 헬스2차 아파트 207동 912호');

insert into GYM_TRAINER
values (5, '김요가', '01011114321', '여', 'kimyoga@itwill.com', '3700000', '1990/10/11', '2018/10/07','근육시 요가동 요가1차 아파트 101동 1101호');

insert into GYM_TRAINER
values (6, '이요가', '01022224321', '여', 'leeyoga@itwill.com', '3000000', '1991/01/15', '2019/04/12','근육시 요가동 요가1차 아파트 103동 901호');

insert into GYM_TRAINER
values (7, '박요가', '01033334321', '남', 'parkyoga@itwill.com', '3100000', '1988/3/09', '2018/11/10','근육시 요가동 요가2차 아파트 201동 501호');

insert into GYM_TRAINER
values (8, '최요가', '01044444321', '여', 'choiyoga@itwill.com', '2800000', '1997/08/20', '2020/05/20','근육시 요가동 요가1차 아파트 101동 504호');


commit;


/*
pt 테이블 생성.
*/


create table PT(
 pt_code number(5),
 t_id number(3),
 pt_price number(10),
 pt_time number(3),
 pt_category varchar2(300 char),
 constraint PT_pk primary key(pt_code),
 constraint PT_fk foreign key (t_id) references GYM_TRAINER (t_id)
 );
 
 commit;
 
insert into PT
 values (1, 1, 400000, 10, '헬스 입문자 1대1 PT 10회');
 
insert into PT
 values (2, 2, 200000, 5, '헬스 입문자 1대1 PT 5회');
 
insert into PT
 values (3, 3, 100000, 3, '헬스 입문자 1대1 PT 3회');
 
 insert into PT
 values (4, 5, 600000, 12, '요가 1대1 수업 12회');
 
 insert into PT
 values (5, 6, 360000, 8, '요가 1대1 수업 8회');
 
 insert into PT
 values(6, 4, 200000, 10, '헬스 입문자 단체 PT 10회');
 
 insert into PT
 values(7, 7, 300000, 10, '요가 단체 수업 10회');
 
 insert into PT
 values(8, 8, 200000, 5, '요가 단체 수업 5회');

 
 commit;   
 
ALTER TABLE PT
ADD CONSTRAINT PT_fk FOREIGN KEY (pt_code) REFERENCES GYM_MEMBER (pt_code);

 
 select pt_category
 from pt
 order by pt_code;
 
 select g.t_id, g.t_name, p.pt_price, p.pt_code, p.pt_time, p.pt_category
 from gym_trainer g
 join pt p
 on g.t_id = p.t_id;