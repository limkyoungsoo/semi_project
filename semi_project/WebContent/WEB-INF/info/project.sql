-- 테이블 삭제 먼저 하기
drop table msgMember;
drop table store;
drop table menu;
drop table menuReview;
drop table msgMemberMenu;
drop sequence menuNo_seq;
drop sequence reNo_seq;

select * from store;
select * from menu;
select * from msgMemberMenu;

delete store where openHour like '2017%'

insert into msgMemberMenu(menuno,mid) values(val1,val2)
select * from msgMemberMenu where menuno=13

delete store where storetel like '%031%'
delete store where storetel like '%031%'

-- 회원 관리 테이블
create table msgMember(
 mId varchar2(100) primary key,
 mPass varchar2(100) not null,
 mNick varchar2(100) not null,
 mGrant varchar2(100) default '준회원'
);

insert into msgMember(mId,mPass,mNick) values('admin','1234','어드민')


-- 음식점 테이블
create table store(
 storeName varchar2(100) primary key,
 storeLoc varchar2(100) not null,
 storeTel varchar2(100) not null,
 storePic varchar2(100) not null,
 openHour varchar2(100) not null,
 storePla varchar2(100) not null
);

update store set 
storeLoc=val1,storeTel=val1,storePic=val1,openHour=val1,storePla=val1 
from store where storeName='조선허불백'


insert into store(storeName,storeLoc,storeTel,storePic,openHour) values(val1,val2)


SELECT S.* FROM(
SELECT row_number() over(order by storeName asc) rnum,
storeName,storePic,storeLoc,storeTel,openHour
from store) S 

select * from msgmember

update store set storeName=?,storeLoc=?, storePic=?,openHour=?  where storeTel=?
update store set storeName='고메부인',storeLoc='경기 성남시 분당구 대왕판교로 670 유스페이스2 2층 224호', 
storePic='go1.jpg',openHour='매일 11:31~00:00 연중무휴'  where storeTel='031-628-6979'



select * from store

ALTER TABLE store modify storePla varchar2(100) not null;

ALTER TABLE [TABLE_NAME] MODIFY ( [COLUMN_NAME] [DATA_TYPE] [NULL|NOT NULL] );

ALTER TABLE store DROP COLUMN storePla ;
--ALTER TABLE dept ADD ( address varchar2(100) default '' );
alter table store add (storePla varchar2(100));
-- 메뉴 테이블
create table menu(
 menuNo number primary key,
 storeName varchar2(100) not null,
 menuName varchar2(100) not null,
 menuPrice number not null,
 menuPic varchar2(200) not null,
 constraint fk_storeName foreign key(storeName) references store(storeName) on delete cascade
);

-- 메뉴 번호 시퀀스
create sequence menuNo_seq start with 91;


SELECT S.* FROM(
SELECT row_number() over(order by storeName asc) rnum,
storeName,storePic,storeLoc,storeTel,openHour
from store) S


-- 메뉴 리뷰 테이블
create table menuReview(
 reNo number primary key,
 menuNo number not null,
 mId varchar2(100) not null,
 review clob not null,
 grade number not null,
 time_posted date not null
);
select count(*) from(select * from menureview) where menuNo;

-- 리뷰등록번호 시퀀스
create sequence reNo_seq;

-- 찜한 메뉴 테이블
create table msgMemberMenu(
 menuNo number not null,
 mId varchar2(100) not null,
 constraint fk_menuNo_2 foreign key(menuNo) references menu(menuNo) on delete cascade,
 constraint fk_mId_2 foreign key(mId) references msgMember(mId),
 constraint pk_menuNo_mId primary key(menuNo,mId)
);

insert into msgMember(mId,mPass,mNick)values('java',1234,'코스타');
insert into msgMember(mId,mPass,mNick)values('admin',1234,'관리자');
insert into msgMember(mId,mPass,mNick)values('java2',1234,'코스타');
insert into msgMember(mId,mPass,mNick)values('java3',1234,'코스타');
insert into msgMember(mId,mPass,mNick)values('java4',1234,'코스타');

delete msgMember where mId='java'
select * from msgMember;

insert into store(storeName,storeLoc,storeTel,storePic,openHour)
values('소바니','유스페이스1동',03112345678,'/storeImg/so1.jpg','월요일~금요일 10시~8시');
-- 위에 입력한 데이터 storeTel의 번호가 너무 길어서 '숫자 오버플로우' 라는 에러가 뜸
-- 그래서 번호를 수정하려고 업데이트 하려고함. -강정호-

select * from menu;

select storePic from store
select distinct storeLoc from store;

update store set 
storeName='미쁜 선순대',storeLoc='경기도 성남시 분당구 삼평동 678 삼환하이펙스A동 1층', 
storePic='Mi1.jpg',openHour='평일 19:30~21:30 주말 09:30~20:00'  
where storeTel='031-698-3696'


insert into store(storeName,storeLoc,storeTel,storePic,openHour)
values('소바니','유스페이스1동',031,'/storeImg/so1.jpg','월요일~금요일 10시~8시');

update store set storePic='/storeImg/cho1.jpg';

insert into menu(menuNo,storeName,menuName,menuPrice,menuPic)
values(menuNo_seq.nextval,'쭈꾸미볶음집','쭈꾸미불볶음',6000,'/dish.jpg');
select * from menu;
delete menu where storeName='쭈꾸미볶음집';
insert into menuReview(reNo,menuNo,mId,review,grade,time_posted)
values(reNo_seq.nextval,1,'java','허불백정식',3,sysdate);
select * from menuReview;

insert into msgMemberMenu(menuNo, mId) values(1,'java');
select * from msgMemberMenu m, menu n where m.menuNo = n.menuNo;
commit

select s.storeLoc, s.storeTel, s.storePic, s.openHour,m.menuNo, m.menuName, m.menuPrice, m.menuPic 
from store s, menu m where s.storeName=m.storeName and m.storeName='쭈꾸미볶음집';
					

select * from msgMember					
select mid,mpass,mnick from msgMember		

insert into msgMember(mid,mpass,mnick) values('java','1234','자바')
insert into msgMember(mid,mpass,mnick, mgrant) values('admin','1234','임경수','정회원'); 

select mid from msgMember where mid='java'

insert into msgMember(mid,mpass,mnick) values(val1,val2,val3)


select * from menureview


select * from store s, menu m where s.storeName=m.storeName and storeName='하코야';
					

select round(avg(b.grade),1) as avg_grade
from (select m.menuNo, m.menuName, m.menuPrice, s.storeName 
from store s, menu m where s.storeName=m.storeName and 
m.storeName='조선허불백') a, menureview b 
where a.menuNo=b.menuNo					

					
select b.reNo b.menuNo, b.mid, b.review, b.grade, b.time_posted 
from (select m.menuNo, m.menuName, m.menuPrice, s.storeName 
from store s, menu m where s.storeName=m.storeName and 
m.storeName='조선허불백') a, menureview b 
where a.menuNo=b.menuNo					
					

					

SELECT storeName, storeLoc
FROM (SELECT *
        FROM store
        ORDER BY DBMS_RANDOM.RANDOM()
    )
WHERE ROWNUM <=1


select count(*) 
from(select menuNo from menu where storeName='조선허불백') m,
 menureview r where m.menuNo=r.menuNo
 
 
SELECT r.* FROM(
			SELECT row_number() over(order by reNo desc) rnum,
			reNo,menuNo,mId,review,grade,time_posted 
			from menureview) r 
			where rnum between 1 and 10
			
			select * from msgMemberMenu;
			
			delete msgMemberMenu where menuno like '%'
			
			

			
/*menu , msgmember 메뉴 관리자 페이지 때문에 수정할께요!!*/
ALTER TABLE menu
DROP CONSTRAINT fk_storeName;

alter table MENU
add  constraint fk_storeName foreign key(storeName) references store(storeName) on delete cascade;

ALTER TABLE msgMemberMenu
DROP CONSTRAINT fk_menuNo_2;

alter table msgMemberMenu
add  constraint fk_menuNo_2 foreign key(menuNo) references menu(menuNo) on delete cascade;

SELECT S.* FROM(
SELECT row_number() over(order by storeName asc) rnum,
storeName,storePic,storeLoc,storeTel,openHour,storePla 
from store) S 
					
select * from store

insert into store(storeName,storeLoc,storeTel,storePic,openHour,storePla) 
values(가게이름,경기도 성남시 분당구 삼평동 679-10 B106,031-696-7490,20170412105803msg.jpg,매일 10:05~21:00 일요일 휴무,)
add  constraint fk_menuNo_2 foreign key(menuNo) references menu(menuNo) on delete cascade;




SELECT S.* FROM(
	SELECT row_number() over(order by storeName asc) rnum,
			storeName,storePic,storeLoc,storeTel,openHour
	from store) S 
			where rnum between 1 and 5

			
			select * from store;






					
