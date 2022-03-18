-- hr/hr 계정으로 접속

drop table memo;
--한줄 메모장 테이블
create table memo (
idx number not null primary key,
writer varchar2(50) not null,
memo varchar2(300) not null,
post_date date default sysdate
);

--메모 추가
insert into memo(idx, writer, memo) values (1, 'kim', '첫번째 메모');
insert into memo(idx, writer, memo) values (2, 'park', '두번째 메모');

select * from memo;
commit;

--삭제
delete from memo;
