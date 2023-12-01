create table users (
    id number(10),
    userid varchar2(30 byte) not null,
    password varchar2(50 byte) not null,
    email varchar2(100 byte) not null,
    points number(10) default 0,
    constraint users_pk primary key (id),
    constraint users_uq unique (userid)
);

commit;

select * from users;

delete from users where id = 5;


select * from USERS where USERID like 'admin' and PASSWORD like '1234';