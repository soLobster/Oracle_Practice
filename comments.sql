create table comments (
    id number(10), 
    postid number(10) not null,
    writer varchar2(30 byte) not null,
    comment_text varchar2(1000 char) not null,
    created_time timestamp default systimestamp,
    modified_time timestamp default systimestamp,
    constraint comments_pk primary key (id),
    constraint comments_fk FOREIGN key (postid) REFERENCES posts(id)
);