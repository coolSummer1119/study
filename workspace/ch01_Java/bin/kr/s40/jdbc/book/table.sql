CREATE TABLE member(
me_id VARCHAR2(10) PRIMARY KEY,--회원 ID
me_passwd VARCHAR2(10) NOT NULL,--비밀번호
me_name VARCHAR2(30) NOT NULL,--회원명
me_phone VARCHAR2(13) NOT NULL,--전화번호
me_regdate DATE DEFAULT SYSDATE NOT NULL--가입일
);

CREATE TABLE sbook(
bk_num NUMBER PRIMARY KEY,--도서 번호
bk_name VARCHAR2(90) NOT NULL,--도서명
bk_category VARCHAR2(30) NOT NULL,--분류
bk_regdate DATE DEFAULT SYSDATE NOT NULL--등록날짜
);

CREATE SEQUENCE sbook_seq;

--도서대출 정보
CREATE TABLE reservation(
re_num NUMBER PRIMARY KEY,
re_status NUMBER(1) NOT NULL,--0.반납(미대출),1.대출중
bk_num NUMBER NOT NULL REFERENCES sbook (bk_num),--도서번호
me_id VARCHAR2(10) NOT NULL REFERENCES member(me_id),--회원
re_regdate DATE DEFAULT SYSDATE NOT NULL,--대출 날짜
re_modifydate DATE --반납 잘짜
);

CREATE SEQUENCE reservation_seq;

CREATE TABLE waiting(
re_num NUMBER NOT NULL REFERENCES reservation(re_num),-- 대출 번호
bk_num NUMBER NOT NULL REFERENCES sbook (bk_num),--책 번호
me_id VARCHAR2(10) NOT NULL REFERENCES member(me_id),--예약자 명
w_people NUMBER(1) NOT NULL,--대기 인원
w_regdate DATE DEFAULT SYSDATE NOT NULL--예약 날짜
);

DROP TABLE waiting;

CREATE SEQUENCE waiting_seq;