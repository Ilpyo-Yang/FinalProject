------------------- FINAL 2조 GROUPWARE:OPISTACHiO SQL --------------------------

--------------------------------------------------------------------------------
--- 1. 사원, 로그인, 결재 (양일표)
--------------------------------------------------------------------------------


-- 1-1. 권한 테이블
create table tbl_power
(power_no       Number not null             -- 권한번호
,power_detail   varchar2(10)   not null     -- 권한상세
,constraint PK_tbl_power_no  primary key(power_no)
);
-- Table TBL_POWER이(가) 생성되었습니다.


-- 1-2. 직급 테이블 
create table tbl_rank
(rank_no      Number not null               -- 직급번호
,rank_detail   varchar2(10)   not null      -- 직급상세
,constraint PK_tbl_rank_no  primary key(rank_no)
);
-- Table TBL_RANK이(가) 생성되었습니다.


-- 1-3. 부서 테이블
create table tbl_dept
(dept_no      Number not null             -- 부서번호
,dept_detail   varchar2(10)   not null     -- 부서상세
,constraint PK_tbl_dept_no  primary key(dept_no)
);
-- Table TBL_DEPT이(가) 생성되었습니다.


-- 1-4. 사원 테이블
create table tbl_mbr
(mbr_seq            Number         not null  -- 사원번호
,fk_power_no        Number         not null  -- 권한번호
,fk_rank_no         Number         not null  -- 직급번호
,fk_dept_no         Number         not null  -- 부서번호
,mbr_id             varchar2(10)   not null  -- 회원아이디
,mbr_pwd            varchar2(10)   not null  -- 비밀번호 (SHA-256 암호화 대상)
,mbr_name           varchar2(10)   not null  -- 회원명
,mbr_email          varchar2(20)   not null  -- 이메일 
,mbr_com_number     varchar2(20)             -- 회사연락처 
,mbr_phone_number   varchar2(20)             -- 연락처 
,mbr_gender         varchar2(1)              -- 성별   남자:0  / 여자:1
,mbr_birthday       date                     -- 생년월일
,mbr_registerday    date default sysdate     -- 입사일자 
,mbr_retireday      date default sysdate     -- 퇴사일자 
,mbr_pwd_changeday  date                     -- 비밀번호 변경일자
,mbr_status         varchar2(1) default 1 not null  -- 사원퇴사유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,mbr_photo          varchar2(50)             -- 사원이미지파일명 
,mbr_sign           varchar2(50)             -- 서명이미지파일명 
,constraint PK_tbl_mbr_seq      primary key(mbr_seq)
,constraint UQ_tbl_mbr_id    unique(mbr_id)
,constraint CK_tbl_mbr_gender check(mbr_gender in('0','1') )
,constraint CK_tbl_mbr_status check(mbr_status in('0','1') )
,constraint FK_tbl_mbr_power foreign key(fk_power_no) references tbl_power(power_no)  
,constraint FK_tbl_mbr_rank foreign key(fk_rank_no)   references tbl_rank(rank_no)  
,constraint FK_tbl_mbr_dept foreign key(fk_dept_no)   references tbl_dept(dept_no)  
);
-- Table TBL_MBR이(가) 생성되었습니다.

--  사원번호 시퀀스
create sequence seq_mbr
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_MBR이(가) 생성되었습니다.

select *
from tbl_loginhistory;

-- 1-5. 로그인기록 테이블
create table tbl_loginhistory
(fk_mbr_seq  Number not null 
,login_day   date default sysdate
,login_ip    varchar2(20) not null
,constraint FK_tbl_loginhistory foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)  
);
-- Table TBL_LOGINHISTORY이(가) 생성되었습니다.

select M.mbr_id, L.login_day, L.logout_day
from
(
select I.fk_mbr_seq, I.login_day as login_day, o.logout_day as logout_day
from
(
select distinct fk_mbr_seq, TO_CHAR(login_day, 'YYYYMMDD') as login_day
from tbl_loginhistory
) I
join
(
select distinct fk_mbr_seq, TO_CHAR(logout_day, 'YYYYMMDD') as logout_day
from tbl_logouthistory
) O
on I.fk_mbr_seq = O.fk_mbr_seq 
where I.login_day= O.logout_day
) L
join
(
select mbr_seq, mbr_id
from tbl_mbr
) M
on L.fk_mbr_seq = M.mbr_seq
where L.login_day='20210601'
order by L.login_day asc;

-- 1-6. 로그아웃기록 테이블 
create table tbl_logouthistory
(fk_mbr_seq  Number not null 
,logout_day   date default sysdate
,constraint FK_tbl_logouthistory foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)  
);
-- Table TBL_LOGOUTHISTORY이(가) 생성되었습니다.

select *
from tbl_addrlist;

select *
from tbl_formboard

-- 1-7. 결재서식 테이블
create table tbl_apform
(apform_no      Number         not null     -- 결재서식번호
,apform_name    varchar2(10)   not null     -- 결재서식이름
,constraint PK_tbl_apform_no  primary key(apform_no)
);
-- Table TBL_APFORM이(가) 생성되었습니다.


-- 1-8. 결재 테이블
create table tbl_approval
(ap_seq             Number         not null  -- 결재번호
,fk_apform_no       Number         not null  -- 서식번호
,fk_mbr_seq         Number         not null  -- 작성사원번호
,ap_progress        varchar2(1)    not null  -- 진행상태    0:진행중 / 1: 완료 / 2: 반려
,ap_title           varchar2(20)   not null  -- 문서제목
,ap_contents        varchar2(200)   not null  -- 결재요청내용
,ap_approver    varchar2(20)                 -- 결재라인 담당자들
,ap_manage_approver  varchar2(10)   not null  -- 현재 결재담당자
,ap_referrer        varchar2(20)             -- 참조자 
,ap_rejecter        varchar2(20)             -- 반려자 
,ap_reject          varchar2(50)             -- 반려사유   
,ap_start_day       date default sysdate     -- 기안일자
,ap_end_day         date                     -- 완료(반려)일자 
,constraint PK_tbl_ap_seq    primary key(ap_seq)
,constraint CK_tbl_ap_progress check(ap_progress in('0','1','2') )
,constraint FK_tbl_ap_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)  
,constraint FK_tbl_ap_form_no foreign key(fk_apform_no)   references tbl_apform(apform_no)  
);
-- Table TBL_APPROVAL이(가) 생성되었습니다.


-- 결재번호 시퀀스
create sequence seq_approval
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_APPROVAL이(가) 생성되었습니다.


-- 1-9. 결재첨부파일 테이블
create table tbl_ap_attached
(fk_ap_seq      Number             -- 결재서식번호
,ap_filename    varchar2(20)       -- 결재서식이름
,ap_detail_filename    varchar2(20)       -- 결재서식이름
,ap_filesize    varchar2(20)       -- 결재서식이름
,constraint FK_tbl_ap_seq foreign key(fk_ap_seq)   references tbl_approval(ap_seq)  
);
-- Table TBL_AP_ATTACHED이(가) 생성되었습니다.


-- 1-10. 회사정보 테이블
create table tbl_company
(com_name   varchar2(50)
,com_address  varchar2(100)
,registraion_num  varchar2(50)
,business_type varchar2(50)
,com_ph varchar2(20)
,com_email  varchar2(30)
);
-- Table TBL_COMPANY이(가) 생성되었습니다.

insert into tbl_company(com_name, com_address, registraion_num, business_type, com_ph, com_email)
values ('(주)오피스타치오','서울 마포구 서교동 447-5 풍성빌딩 2,3,4층','111-22-33333','IT 서비스 / 시스템 소프트웨어 개발','02-111-2222','opistachio@opistachio.com');


-- >>>>>>> 확인용 <<<<<<<

select *
from tbl_power;

select *
from tbl_rank;

select *
from tbl_dept;

select *
from tbl_mbr;

select *
from tbl_loginhistory;

select *
from tbl_logouthistory;

select *
from tbl_approval;

select *
from tbl_apform;

select *
from tbl_ap_attached;

select *
from tbl_company;




--------------------------------------------------------------------------------
--- 2. 학력, 급여, 연차 (안혜진)
--------------------------------------------------------------------------------


-- 2-1. 학력정보
create table tbl_edu
(edu_seq     number     not null   -- 학력번호
,mbr_seq     number     not null   -- 사원번호
,eduLevel    number                -- 학력정보(박사6/석사5/학사4/전문대학원3/고등학교2/중학교1/초등학교0)
,school      VARCHAR(200)           -- 학교명
,major       VARCHAR(200)           -- 전공명
,constraint PK_tbl_edu_seq primary key(edu_seq)
,constraint FK_tbl_edu_fk_mbr_seq foreign key(mbr_seq) references tbl_mbr(mbr_seq)
);


-- 2-2. 학력번호 시퀀스
create sequence edu_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 2-3. 연차
create table tbl_break
(mbr_seq     number     not null   -- 사원번호
,getBreak    number     not null   -- 부여받은 연차
,remainBreak number     not null   -- 남은 연차
,constraint FK_tbl_break_fk_mbr_seq foreign key(mbr_seq) references tbl_mbr(mbr_seq)
);

-- 2-4. 급여
create table tbl_payment
(mbr_seq     number     not null   -- 사원번호
,payMonth    number     not null   -- 월
,basePay     number     not null   -- 기본급
,spePay      number                -- 상여금
,breakPay    number                -- 연차수당
,mealPay     number                -- 식대
,timePay     number                -- 시간외 근무 수당
,totalPay    number     not null   -- 총급여
,constraint FK_tbl_payment_fk_mbr_seq foreign key(mbr_seq) references tbl_mbr(mbr_seq)
);

-- 2-5. 급여 상세정보
create table tbl_payDetail
(mbr_seq     number     not null   -- 사원번호
,idNo        varchar2(200)     not null   -- 주민등록번호
,bank        varchar2(200)     not null   -- 은행명
,accountNo   varchar2(200)     not null   -- 계좌번호
,constraint FK_tbl_payDetail_fk_mbr_seq foreign key(mbr_seq) references tbl_mbr(mbr_seq)
);

-- 2-6. 자격증
create table tbl_certi
(certi_seq	   number           not null   -- 자격증번호
,mbr_seq           number           not null   -- 사원번호
,certification     varchar2(50)     not null   -- 자격증명
,certiLevel        varchar2(50)                -- 점수/급수
,certiDate         date             not null   -- 취득일자
,constraint PK_tbl_certi_seq primary key(certi_seq)
,constraint FK_tbl_certi_fk_mbr_seq foreign key(mbr_seq) references tbl_mbr(mbr_seq)
);


-- 2-7. 자격증번호 시퀀스
create sequence certi_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- >>>>>>> 확인용 <<<<<<<

select *
from tbl_edu;

select *
from tbl_eduDetail;

select *
from tbl_break;

select *
from tbl_payment;

select *
from tbl_certi;


--------------------------------------------------------------------------------
--- 4. 게시판(전체공지, 부서공지, 공통서식), 주소록 (조연재)
--------------------------------------------------------------------------------


-- 4-1. 게시판구분 테이블
create table tbl_boardlist
(boardno         NUMBER          not null --1 전체공지 2 부서공지 3 공동서식
,boardname       VARCHAR2(20)    not null
,constraint PK_boarno primary key(boardno)
);
-- Table TBL_BOARDLIST이(가) 생성되었습니다.

insert into tbl_boardlist(boardno,boardname)
values(1, '전체공지사항');
insert into tbl_boardlist(boardno,boardname)
values(2, '부서공지사항');
insert into tbl_boardlist(boardno,boardname)
values(3, '공통서식');
commit;

-- 4-2. 전체공지 테이블(게시판번호 1)
create table tbl_comnotice
( cnotice_seq      number         not null          -- 공지사항순번
, fk_boardno       number         not null          -- 게시판번호   
, fk_mbr_seq       number         not null          -- 작성자
, ctitle           varchar2(200)  not null          -- 제목
, cwritedate       date           default sysdate   -- 등록일자
, chit             number         default 0         -- 조회수
, ccontent         varchar2(4000) not null          -- 내용
, constraint PK_tbl_comnotice_cnotice_seq primary key(cnotice_seq)
, constraint FK_tbl_comnotice_fk_boardno foreign key(fk_boardno) references tbl_boardlist(boardno)
, constraint FK_tbl_comnotice_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
);
-- Table TBL_COMNOTICE이(가) 생성되었습니다.

-- 전체공지 시퀀스
create sequence cnotice_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 4-3. 부서공지 테이블(게시판번호 2)
create table tbl_deptnotice
( dnotice_seq      number         not null          -- 공지사항순번
, fk_boardno       number         not null          -- 게시판번호   
, fk_mbr_id        varchar2(10)   not null          -- 작성자
, fk_dept_detail   varchar2(10)   not null          -- 부서 0영업 1인사 2홍보 3IT 4회계 
, dtitle           varchar2(200)  not null          -- 제목
, dwritedate       date           default sysdate   -- 등록일자
, dhit             number         default 0         -- 조회수
, dcontent         varchar2(4000) not null          -- 내용
, constraint PK_tbl_deptnotice_dnotice_seq primary key(dnotice_seq)
, constraint FK_tbl_deptnotice_fk_boardno foreign key(fk_boardno) references tbl_boardlist(boardno)
, constraint FK_tbl_deptnotice_fk_mbr_id foreign key(fk_mbr_id) references tbl_mbr(mbr_id)
);
-- Table TBL_DEPTNOTICE이(가) 생성되었습니다.

-- 부서공지 시퀀스
create sequence dnotice_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 4-4. 공통서식 테이블(게시판번호 3)
create table tbl_formboard
( form_seq         number         not null          -- 공지사항순번
, fk_boardno       number         not null          -- 게시판번호   
, fk_mbr_seq       number         not null          -- 작성자
, ftitle           varchar2(200)  not null          -- 제목
, fwritedate       date           default sysdate   -- 등록일자
, fhit             number         default 0         -- 조회수
, fcontent         varchar2(4000) not null          -- 내용
, fileName         varchar2(200)                     -- WAS(톰캣)에 저장될 파일명(2020120809271535243254235235234.png)                                       
, orgFilename      varchar2(200)                     -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
, fileSize         number                            -- 파일크기 
, constraint PK_tbl_formboard_form_seq primary key(form_seq)
, constraint FK_tbl_formboard_fk_boardno foreign key(fk_boardno) references tbl_boardlist(boardno)
, constraint FK_tbl_formboard_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
);
-- Table TBL_FORMBOARD이(가) 생성되었습니다.

-- 공통서식 시퀀스
create sequence form_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 4-5. 주소록 테이블
create table tbl_address
( addr_seq          number          not null    -- 주소록 번호
, fk_addrgroup_seq  number                      -- 그룹 번호
, fk_mbr_seq        number                      -- 사원 번호
, mbr_name          varchar2(10)    not null    -- 사원 이름    
, mbr_phone_number  varchar2(20)    not null    -- 사원 전화번호
, mbr_email         varchar2(20)    not null    -- 사원 이메일
, mbr_birthday      date                        -- 생년월일
, dept_name         varchar2(10)                -- 부서이름
, position_name     varchar2(10)                -- 직책
, postcode          varchar2(5)                 -- 우편번호
, address           varchar2(200)               -- 주소      
, detailaddress     varchar2(200)               -- 상세주소
, addrmemo          varchar2(2000)              -- 메모
, constraint PK_tbl_address_addr_seq  primary key(addr_seq)
, constraint FK_tbl_address_fk_group_seq foreign key(fk_addrgroup_seq) references tbl_addrlist(addrgroup_seq)
, constraint FK_tbl_address_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
);

-- 첨부파일번호 시퀀스
create sequence addr_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 4-6. 주소록 개인그룹 테이블
create table tbl_addrlist
( addrgroup_seq     number          not null
, fk_mbr_seq    number          not null -- 사원번호
, groupname     varchar2(20)    not null
, groupdetail   varchar2(200) 
, constraint PK_addrgroup_seq  primary key(addrgroup_seq)
, constraint FK_tbl_addrlist_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
);
-- Table TBL_ADDRLIST이(가) 생성되었습니다.

create sequence addrgroup_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


commit;

select *
from tbl_mbr;

update tbl_mbr
set fk_power_no=1
where mbr_id='admin';

-- >>>>>>> 확인용 <<<<<<<

select *
from tbl_boardlist;

select *
from tbl_comnotice;

select *
from tbl_deptnotice;

select *
from tbl_formboard;

select *
from tbl_addrlist;

select *
from tbl_address;

drop table tbl_boardlist purge;
drop table tbl_comnotice purge;
drop table tbl_deptnotice purge;
drop table tbl_formboard purge;
drop table tbl_addrlist purge;
drop table tbl_address purge;

--------------------------------------------------------------------------------
--- 5. 전유정
--------------------------------------------------------------------------------


-- 5-1. 업무 분류 테이블
create table tbl_worktype
(wtno       number          not null
,wtname      varchar2(20)    not null
,constraint PK_tbl_worktype primary key(wtno)
);

insert into tbl_worktype(wtno, wtname) values (1, '업무요청');
insert into tbl_worktype(wtno, wtname) values (2, '업무보고');


-- [추가 06/02] 5-1-2. 업무에 따른 역할 구분 테이블 -- 
create table tbl_workrole
(wrno       number          not null
,wrname      varchar2(20)    not null
,constraint PK_tbl_workrole primary key(wrno)
);

insert into tbl_workrole(wrno, wrname) values (1, '요청자');
insert into tbl_workrole(wrno, wrname) values (2, '수신자');
insert into tbl_workrole(wrno, wrname) values (3, '참조자');



-- 5-2. 업무 상태 테이블
-- drop table tbl_workstatus;
create table tbl_workstatus
(statno         number          not null
,statcontent    varchar2(20)    not null
,wtno           number          not null
,constraint PK_tbl_workstatus primary key(statno)
);

insert into tbl_workstatus(statno, statcontent, wtno) values(0, '지연', 1);
insert into tbl_workstatus(statno, statcontent, wtno) values(1, '미완료', 1);
insert into tbl_workstatus(statno, statcontent, wtno) values(2, '완료', 1);
insert into tbl_workstatus(statno, statcontent, wtno) values(3, '미확인', 2);
insert into tbl_workstatus(statno, statcontent, wtno) values(4, '승인완료', 2);
insert into tbl_workstatus(statno, statcontent, wtno) values(5, '반려', 2);
-- 업무 요청 : 지연, 미완료, 완료
-- 업무 보고 : 미확인, 승인완료, 반려


-- [변경 06/02] 5-3. 업무 관리 테이블  
-- drop table tbl_workmanage;
create table tbl_workmanage
(wmno               number  not null        -- 업무관리고유번호
,fk_wtno            number not null         -- 업무분류번호
,requester          varchar2(100) not null         -- 요청자
,receivers          varchar2(100) not null         -- 수신자들
,referrers          varchar2(100)                  -- 참조자들
,subject            varchar2(500)   not null    -- 제목
,contents           varchar2(4000)  not null    -- 내용
,registerday        date  DEFAULT sysdate not null  -- 등록일자
,deadline           date                            -- 마감일자
,checkstatus        number(1) default 0 not null    -- 확인여부 (0 or 1)
,important          number(1) default 0 not null    -- 중요여부 (0 or 1)
,fk_statno          number                          -- 업무상태번호
,constraint PK_tbl_workmanage primary key(wmno)
,constraint FK_tbl_workmanage_fk_wtno foreign key(fk_wtno) references tbl_worktype(wtno)
,constraint FK_tbl_workmanage_fk_statno foreign key(fk_statno) references tbl_workstatus(statno)
,constraint CK_tbl_workmanage_cs check(checkstatus in (0,1))
,constraint CK_tbl_workmanage_imp check(important in (0,1))
);
/*  [로그 06/02] 변경 내용 
    fk_requester_seq -> requester   // 발신 사원번호 입력에서 사원이름으로 저장
    fk_receiver_seq -> receivers    // 수신 사원번호 입력에서 여러 사원이름으로 저장 가능 ex) "홍길동,엄정화"
    referrers   // 참조자들을 이름으로 저장 ex) "홍길동,엄정화"
    
    해당 업무에 관련된 사원 정보를 따로 저장하는 "업무관련 멤버 테이블"에서 사원 번호로 관리
*/

-- 업무관리고유번호 시퀀스
create sequence seq_workmanage_wmno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- [변경 06/02] 5-4. 업무관련 멤버 테이블
-- drop table tbl_wmrefer;
create table tbl_workmanage_mbr
(fk_wmno            number  not null        -- 업무관리고유번호
,fk_wrno            number  not null        -- 해당 업무에 관련된 역할
,fk_mbr_seq         number not null         -- 해당 업무에 관련된 사원번호
,constraint PK_tbl_wmmbr primary key(fk_wmno, fk_wrno, fk_mbr_seq)
,constraint FK_tbl_wmmbr_fk_wmno foreign key(fk_wmno) references tbl_workmanage(wmno)
,constraint FK_tbl_wmmbr_fk_wrno foreign key(fk_wrno) references tbl_workrole(wrno)
,constraint FK_tbl_wmmbr_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
);
/*  [로그 06/02] 변경 내용 
    테이블 명: 업무 관리참조자 테이블 -> 업무관련 멤버 테이블
    기능: 업무 번호와 역할에 따라 사원번호를 저장
    ex) 
    1  1  1  // "1번 업무번호"에 "요청자(1)"에 해당하는 "사원 번호 1"
    1  2  3  // "1번 업무번호"에 "수신자(2)"에 해당하는 "사원 번호 3"
    1  2  4  // "1번 업무번호"에 "수신자(2)"에 해당하는 "사원 번호 4"
*/


-- 5-5. 업무 관리 첨부 파일 테이블
-- drop table tbl_wmaddfile;
create table tbl_wmaddfile 
(fileno      number not null    -- 첨부파일고유번호
,fk_wmno     number not null    -- 업무관리고유번호
,filename    varchar2(200) not null -- 첨부파일명
,constraint PK_tbl_wmaddfile primary key(fileno)
,constraint FK_tbl_wmaddfile_fk_wmno foreign key(fk_wmno) references tbl_workmanage(wmno)
);

-- 업무관리 첨부파일고유번호
create sequence seq_wmaddfile_fileno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 5-6. 할일 테이블
-- drop table tbl_todolist;
create table tbl_todolist
(tdno               number  not null        -- 할일리스트 고유번호
,fk_mbr_seq         number not null         -- 사원번호
,subject            varchar2(500)   not null    -- 제목
,contents           varchar2(4000)  not null    -- 내용
,registerday        date  DEFAULT sysdate not null  -- 등록일자
,deadline           date                            -- 마감일자
,important          number(1) default 0 not null    -- 중요여부 (0 or 1)
,fk_statno          number                          -- 업무상태번호
,constraint PK_tbl_todolist primary key(tdno)
,constraint FK_tbl_todolist_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
,constraint FK_tbl_todolist_fk_statno foreign key(fk_statno) references tbl_workstatus(statno)
,constraint CK_tbl_todolist_important check(important in (0,1))
);

-- 할일리스트 고유번호 시퀀스
create sequence seq_todolist_tdno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 5-7. 할일 첨부 파일 테이블
-- drop table tbl_tdaddfile;
create table tbl_tdaddfile
(fileno      number not null     -- 첨부파일고유번호
,fk_tdno     number not null     -- 할일리스트 고유번호
,filename    varchar2(200) not null -- 첨부파일명
,constraint PK_tbl_tdaddfile primary key(fk_tdno)
,constraint FK_tbl_tdaddfile_fk_tdno foreign key(fk_tdno) references tbl_todolist(tdno)
);

-- 할일리스트 첨부파일고유번호
create sequence seq_tdaddfile_fileno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-------------------------------------------------------------------
-- 참고 및 확인 -- 
select *
from user_tables
order by table_name desc;

select *
from user_sequences
order by sequence_name desc;

desc tbl_worktype;
desc tbl_workstatus;
desc tbl_workmanage;
desc tbl_wmrefer;
desc tbl_wmaddfile;
desc tbl_todolist;
desc tbl_tdaddfile;

/* 생성한 시퀀스
SEQ_WORKMANAGE_WMNO
SEQ_WMADDFILE_FILENO
SEQ_TODOLIST_TDNO
SEQ_TDADDFILE_FILENO
*/


--------------------------------------------------------------------------------
--- 6. 일정, 회의실관리 (김지우)
--------------------------------------------------------------------------------

-- 6-1. 일정 테이블
create table tbl_schedule
(scdno number not null  -- 일정번호
,fk_mbr_seq number not null -- 사원번호
,scdsubject varchar2(50) not null   -- 일정제목
,scdstartdate date not null -- 일정시작일
,scdenddate date not null -- 일정종료일
,place varchar2(50) -- 장소   
,attendance varchar2(100) -- 참석자
,constraint PK_tbl_schedule_scdno primary key(scdno)
,constraint FK_tbl_scddiv_fk_scdno2 foreign key(fk_scdno2) references tbl_scddiv(scdno2)
,constraint FK_tbl_mbr_fk_mbr_seq foreign key(fk_mbr_seq) references tbl_mbr(mbr_seq)
,constraint CK_tbl_schedule_timelimit check(scdstartdate < scdenddate)
);
-- Table TBL_SCHEDULE이(가) 생성되었습니다.

-- 일정 시퀀스
create sequence schedule_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SCHEDULE_SEQ이(가) 생성되었습니다.


-- 6-2. 일정구분 테이블
create table tbl_scddiv
(scdno2 number not null -- 일정구분번호 0: 회사전체일정 1: 부서일정 2: 개인일정
,scdname varchar2(50) not null -- 일정구분명
,constraint PK_tbl_scddiv_scdno2 primary key(scdno2)
,constraint CK_tbl_scddiv_scdno2 check(scdno2 in(0,1,2))
);
-- Table SCDDIV이(가) 생성되었습니다.
 
 
-- 6-3. 회의실이용기록 테이블
create table tbl_mtrhistory
(usemtrno number not null
,fk_mtrno number not null -- 회의실번호
,fk_scdno number  -- 일정번호
,booker varchar(30) -- 예약자 아이디
,mtrsubject varchar(50) -- 회의명(이용목적)
,starttime date not null -- 시작시간
,endtime date not null -- 종료시간
,regDate date default sysdate not null -- 예약일자
,constraint PK_tbl_mtrhistory primary key(usemtrno)
,constraint FK_tbl_mtr_fk_mtrno foreign key(fk_mtrno) references tbl_mtr(mtrno)
,constraint FK_tbl_schedule_fk_scdno foreign key(fk_scdno) references tbl_schedule(scdno) on delete cascade
,constraint CK_tbl_mtrhistory_timelimit check(starttime < endtime)
);
-- Table TBL_MTRHISTORY이(가) 생성되었습니다.

-- 회의실이용기록 시퀀스
create sequence mtrhistory_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 6-4. 회의실 테이블
create table tbl_mtr
(mtrno number not null -- 회의실번호
,mtrname varchar2(30) not null -- 회의실명
,constraint PK_tbl_mtr_mtrno primary key(mtrno)
);
-- Table TBL_MTR이(가) 생성되었습니다.


