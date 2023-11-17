create table posts (
    id number(10),
    title varchar2(100 char) not null,
    content varchar2(4000 char) not null,
    author varchar2(30 byte) not null,
    created_time timestamp default systimestamp,
    modified_time timestamp default systimestamp,
    CONSTRAINT posts_pk primary key (id)
);

insert into posts (title, content, author)
values ('test', 'Servlet/JSP Connetion Pool', 'admin');


commit;

select * from posts;