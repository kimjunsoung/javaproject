select * from memo;

drop table memo;

create table memo (
idx number not null primary key,
writer varchar2(50) not null,
memo varchar2(300) not null,
post_date date default sysdate
);

insert into memo(idx, writer, memo) values (1, 'kim', '첫번째 메모');
insert into memo(idx, writer, memo) values (2, 'park', '두번째 메모');

commit;

select nvl(max(idx)+1, 1) from memo;

insert into memo(idx, writer, memo) 
values ((select nvl(max(idx)+1, 1) from memo), 'lee', '메모');

select idx,writer,memo, 
to_char(post_date, 'yyyy-mm-dd hh24:mi:ss') post_date 
from memo 
order by idx desc;


--이름으로 찾기
select idx,writer,memo, 
to_char(post_date, 'yyyy-mm-dd hh24:mi:ss') post_date 
from memo 
where writer like '%길동%'
order by idx desc;

--내용으로 찾기
select idx,writer,memo, 
to_char(post_date, 'yyyy-mm-dd hh24:mi:ss') post_date 
from memo 
where memo like '%안녕%'
order by idx desc;

--이름과 내용으로 찾기
select idx,writer,memo, 
to_char(post_date, 'yyyy-mm-dd hh24:mi:ss') post_date 
from memo 
where writer like '%철수%' or  memo like '%안녕%'
order by idx desc;



