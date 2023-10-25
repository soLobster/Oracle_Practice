/*
JDBC(Java Database Connectivity)
    자바 프로그램에서 데이터베이스에 접속해서 sql 문장들을 실행하고,
    결과를 받는 방법.
    
테이블 생성:
    - 이름: BLOGS
    - 컬럼:
        - 1) id: 블로그 포스트의 번호. number(6) .PK insert 할때마다 자동으로 증가.(sequence).
        - 2) title: 블로그 포스트의 제목. varchar2(100 char). is not null.
        - 3) content: 블로그 포스트의 내용. varchar2(4000 char) is not null.
        - 4) author: 블로그 포스트 작성자 (아이디) varchar2(40 char) is not null
        - 5) created_time: 블로그 포스트 최초 작성 시간. timestamp. 기본값 (현재 시간).
        - 6) modified_time: 블로그 포스트 최종 수정 시간. timestamp. 기본값 (현재 시간).
*/

create table BLOGS (
     id number(6) ,
     title varchar2(100 char) not null,
     content varchar2(4000 char) not null,
     author varchar2(40 char) not null,
     created_time timestamp default systimestamp,
     modified_time timestamp default systimestamp,
     constraint blogs_pk primary key(id)
 );
 
 
/*
Oracle 접속 -> scott -> 테이블 -> BLOGS -> 우클릭 -> 편집.
-> ID 칼럼이 선택된 상태에서 [ID 열] 탭 클릭
-> 유형을 열 시퀀스로 선택한다.
*/


insert into blogs (title, content, author)
values ('테스트', '새 블로그 작성 테스트를 합니다', 'guest');

insert into blogs (title, content, author)
values ('테스트1', '블로그 방문 감사합니다', 'admin');

select *
from blogs;

commit;