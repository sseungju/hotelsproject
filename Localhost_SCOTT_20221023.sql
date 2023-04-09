-- SCOTT 1019(수) --
-- 초기화 커리문

-- 1. 평점항목 (ph)

/* 평점항목(ph) */
DROP TABLE ph 
	CASCADE CONSTRAINTS;

/* 평점항목(ph) */
CREATE TABLE ph (
	ph_id VARCHAR2(20) NOT NULL, /* ph_id(항목 ID) */
	ph_name NVARCHAR2(30) NOT NULL /* ph_name(항목 제목) */
);

ALTER TABLE ph
	ADD
		CONSTRAINT PK_ph
		PRIMARY KEY (
			ph_id
		);

-- 2. 지원 (support)

/* 지원(support) */
DROP TABLE support 
	CASCADE CONSTRAINTS;

/* 지원(support) */
CREATE TABLE support (
	sp_id VARCHAR2(20) NOT NULL, /* sp_id(지원ID) */
	sp_menu NVARCHAR2(30) NOT NULL, /* sp_menu(메뉴) */
	sp_first NVARCHAR2(50) NOT NULL, /* sp_first(대분류) */
	sp_sec NVARCHAR2(50) NOT NULL, /* sp_sec(중분류) */
	sp_name NVARCHAR2(50) NOT NULL, /* sp_name(제목) */
	sp_con NVARCHAR2(2000) NOT NULL /* sp_con(내용) */
);

ALTER TABLE support
	ADD
		CONSTRAINT PK_support
		PRIMARY KEY (
			sp_id
		);

-- 3. 회원 (member)

/* 회원(member) */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 회원(member) */
CREATE TABLE member (
	m_id VARCHAR2(20) NOT NULL, /* m_id(회원 ID) */
	m_email NVARCHAR2(50) NOT NULL, /* m_email(이메일) */
	m_name NVARCHAR2(50) NOT NULL, /* m_name(이름) */
	m_sur NVARCHAR2(20) NOT NULL, /* m_sur(성) */
	m_pw NVARCHAR2(20) NOT NULL, /* m_pw(비밀번호) */
	m_rw NUMBER(2) NOT NULL, /* m_rw(리워드) */
	m_phone CHAR(13) NOT NULL /* m_phone(전화번호) */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			m_id
		);

-- 4. 국가 (country)

/* 국가(country) */
DROP TABLE country 
	CASCADE CONSTRAINTS;

/* 국가(country) */
CREATE TABLE country (
	c_id VARCHAR2(20) NOT NULL, /* c_id(국가ID) */
	c_name NVARCHAR2(20) NOT NULL /* c_name(국가이름) */
);

ALTER TABLE country
	ADD
		CONSTRAINT PK_country
		PRIMARY KEY (
			c_id
		);




-- 5. 도시 (city)

/* 도시(city) */
DROP TABLE city 
	CASCADE CONSTRAINTS;

/* 도시(city) */
CREATE TABLE city (
	ct_id VARCHAR2(20) NOT NULL, /* ct_id(도시ID) */
	ct_name NVARCHAR2(20) NOT NULL, /* ct_name(도시이름) */
	ct_con NVARCHAR2(1000) NOT NULL, /* ct_con(도시소개) */
	ct_loc NVARCHAR2(200) NOT NULL, /* ct_loc(도시 위치) */
	c_id VARCHAR2(20) NOT NULL /* c_id(국가ID) */
);

ALTER TABLE city
	ADD
		CONSTRAINT PK_city
		PRIMARY KEY (
			ct_id
		);

ALTER TABLE city
	ADD
		CONSTRAINT FK_country_TO_city
		FOREIGN KEY (
			c_id
		)
		REFERENCES country (
			c_id
		);

-- 6. 도시 qna

/* ctqna(도시q&a) */
DROP TABLE ctqna 
	CASCADE CONSTRAINTS;

/* ctqna(도시q&a) */
CREATE TABLE ctqna (
	cq_id VARCHAR2(20) NOT NULL, /* cq_id(도시qnaID) */
	cq_q NVARCHAR2(500) NOT NULL, /* cq_q(질문) */
	cq_a NVARCHAR2(1000) NOT NULL, /* cq_a(답변) */
	ct_id VARCHAR2(20) NOT NULL /* ct_id(도시ID) */
);

ALTER TABLE ctqna
	ADD
		CONSTRAINT PK_ctqna
		PRIMARY KEY (
			cq_id
		);

ALTER TABLE ctqna
	ADD
		CONSTRAINT FK_city_TO_ctqna
		FOREIGN KEY (
			ct_id
		)
		REFERENCES city (
			ct_id
		);


-- 7. 지역 (area)

/* 지역(area) */
DROP TABLE area 
	CASCADE CONSTRAINTS;

/* 지역(area) */
CREATE TABLE area (
	a_id VARCHAR2(20) NOT NULL, /* a_id(지역ID) */
	a_name NVARCHAR2(20), /* a_name(지역 이름) */
	a_nav NVARCHAR2(500), /* a_nav(가는 방법) */
	a_con NVARCHAR2(1000), /* a_con(지역 소개) */
	a_loc NVARCHAR2(500), /* a_loc(지역 위치) */
	ct_id VARCHAR2(20) /* ct_id(도시ID) */
);

ALTER TABLE area
	ADD
		CONSTRAINT PK_area
		PRIMARY KEY (
			a_id
		);

ALTER TABLE area
	ADD
		CONSTRAINT FK_city_TO_area
		FOREIGN KEY (
			ct_id
		)
		REFERENCES city (
			ct_id
		);


-- 8. 지역근처장소 (neararea)

/* 지역 근처 장소(neararea) */
DROP TABLE neararea 
	CASCADE CONSTRAINTS;

/* 지역 근처 장소(neararea) */
CREATE TABLE neararea (
	na_id VARCHAR2(20) NOT NULL, /* na_id(지역 근처 가볼 곳 ID) */
	na_name NVARCHAR2(40) NOT NULL, /* na_name(지역 근처 가볼만한 장소) */
	a_id VARCHAR2(20) NOT NULL /* a_id(지역ID) */
);

ALTER TABLE neararea
	ADD
		CONSTRAINT PK_neararea
		PRIMARY KEY (
			na_id
		);

ALTER TABLE neararea
	ADD
		CONSTRAINT FK_area_TO_neararea
		FOREIGN KEY (
			a_id
		)
		REFERENCES area (
			a_id
		);


-- 9. 지역근처숙박 (sa)


/* 지역근처 숙박(sa) */
DROP TABLE sa 
	CASCADE CONSTRAINTS;

/* 지역근처 숙박(sa) */
CREATE TABLE sa (
	sa_id VARCHAR2(20) NOT NULL, /* sa_id(지역 근처 숙박 시설 ID) */
	sa_name NVARCHAR2(50) NOT NULL, /* sa_name(지역 근처 숙박 시설들) */
	a_id VARCHAR2(20) NOT NULL /* a_id(지역 ID) */
);

ALTER TABLE sa
	ADD
		CONSTRAINT PK_sa
		PRIMARY KEY (
			sa_id
		);

ALTER TABLE sa
	ADD
		CONSTRAINT FK_area_TO_sa
		FOREIGN KEY (
			a_id
		)
		REFERENCES area (
			a_id
		);



-- 10. 랜드마크 (landmark)

/* 랜드마크(landmark) */
DROP TABLE landmark 
	CASCADE CONSTRAINTS;

/* 랜드마크(landmark) */
CREATE TABLE landmark (
	lm_id VARCHAR2(20) NOT NULL, /* lm_id(랜드마크 ID) */
	lm_name NVARCHAR2(100) NOT NULL, /* lm_name(랜드마크이름) */
	lm_loc NVARCHAR2(100) NOT NULL, /* lm_loc(랜드마크주소) */
	lm_con NVARCHAR2(1000) NOT NULL, /* lm_con(랜드마크소개) */
	ct_id VARCHAR2(20) NOT NULL /* ct_id(도시ID) */
);

ALTER TABLE landmark
	ADD
		CONSTRAINT PK_landmark
		PRIMARY KEY (
			lm_id
		);

ALTER TABLE landmark
	ADD
		CONSTRAINT FK_city_TO_landmark
		FOREIGN KEY (
			ct_id
		)
		REFERENCES city (
			ct_id
		);


-- 11. 랜드마크근처장소 (nearlm)

/* 랜드마크 근처 장소(nearlm) */
DROP TABLE nearlm 
	CASCADE CONSTRAINTS;

/* 랜드마크 근처 장소(nearlm) */
CREATE TABLE nearlm (
	nlm_id VARCHAR2(20) NOT NULL, /* nlm_id(랜드 근처 가볼 곳 ID) */
	nlm_name NVARCHAR2(50), /* nlm_name(랜드 근처 가볼 만한 장소) */
	lm_id VARCHAR2(20) /* lm_id(랜드마크 ID) */
);

ALTER TABLE nearlm
	ADD
		CONSTRAINT PK_nearlm
		PRIMARY KEY (
			nlm_id
		);

ALTER TABLE nearlm
	ADD
		CONSTRAINT FK_landmark_TO_nearlm
		FOREIGN KEY (
			lm_id
		)
		REFERENCES landmark (
			lm_id
		);

-- 12. 랜드마크근처숙박 (slm)

/* 랜드마크 근처 숙박(slm) */
DROP TABLE slm 
	CASCADE CONSTRAINTS;

/* 랜드마크 근처 숙박(slm) */
CREATE TABLE slm (
	slm_id VARCHAR2(20) NOT NULL, /* slm_id(랜드 근처 숙박 시설 ID) */
	slm_name NVARCHAR2(100) NOT NULL, /* slm_name(랜드 근처 숙박 시설들) */
	lm_id VARCHAR2(20) NOT NULL /* lm_id(랜드마크 ID) */
);

ALTER TABLE slm
	ADD
		CONSTRAINT PK_slm
		PRIMARY KEY (
			slm_id
		);

ALTER TABLE slm
	ADD
		CONSTRAINT FK_landmark_TO_slm
		FOREIGN KEY (
			lm_id
		)
		REFERENCES landmark (
			lm_id
		);


-- 13. 업주 (owner)
/* 업주(owner) */
DROP TABLE owner 
	CASCADE CONSTRAINTS;

/* 업주(owner) */
CREATE TABLE owner (
	o_id VARCHAR2(20) NOT NULL, /* o_id(업주 ID) */
	o_pw NVARCHAR2(20) NOT NULL, /* o_pw(비밀번호) */
	o_phone CHAR(13) NOT NULL, /* o_phone(전화번호) */
	o_name NVARCHAR2(20) NOT NULL, /* o_name(이름) */
	o_sur NVARCHAR2(20) NOT NULL, /* o_sur(성) */
	o_email NVARCHAR2(50) NOT NULL /* o_email(이메일 주소) */
);

ALTER TABLE owner
	ADD
		CONSTRAINT PK_owner
		PRIMARY KEY (
			o_id
		);

-- 14. 등록 (adds)

/* 등록(adds) */
DROP TABLE adds 
	CASCADE CONSTRAINTS;

/* 등록(adds) */
CREATE TABLE adds (
	ad_id VARCHAR2(20) NOT NULL, /* ad_id(등록 ID) */
	ad_cnt NUMBER(3) NOT NULL, /* ad_cnt(객실 수) */
	ad_type NVARCHAR2(20) NOT NULL, /* ad_type(유형) */
	ad_money NVARCHAR2(20) NOT NULL, /* ad_money(통화단위) */
	ac_chain NVARCHAR2(20) NOT NULL, /* ad_chain(체인) */
	ad_kname NVARCHAR2(50) NOT NULL, /* ad_kname(시설 이름 한글) */
	ad_ename NVARCHAR2(50) NOT NULL, /* ad_ename(시설 이름 영문) */
	ad_loc NVARCHAR2(100) NOT NULL, /* ad_loc(주소) */
	ad_date DATE NOT NULL, /* ad_date(등록 날짜) */
	o_id VARCHAR2(20) NOT NULL /* o_id(업주 ID) */
);

ALTER TABLE adds
	ADD
		CONSTRAINT PK_adds
		PRIMARY KEY (
			ad_id
		);

ALTER TABLE adds
	ADD
		CONSTRAINT FK_owner_TO_adds
		FOREIGN KEY (
			o_id
		)
		REFERENCES owner (
			o_id
		);

-- 15. 숙박시설유형 (stype)

/* 숙박시설유형(stype) */
DROP TABLE stype 
	CASCADE CONSTRAINTS;

/* 숙박시설유형(stype) */
CREATE TABLE stype (
	st_id VARCHAR2(20) NOT NULL, /* st_id(숙박시설 유형 ID) */
	st_type NVARCHAR2(20) NOT NULL /* st_type(숙박시설 유형) */
);

ALTER TABLE stype
	ADD
		CONSTRAINT PK_stype
		PRIMARY KEY (
			st_id
		);


-- 16. 숙박 (sukbak)


/* 숙박시설(sukbak) */
DROP TABLE sukbak 
	CASCADE CONSTRAINTS;

/* 숙박시설(sukbak) */
CREATE TABLE sukbak (
	s_id VARCHAR2(20) NOT NULL, /* s_id(숙박 시설 ID) */
	s_kname NVARCHAR2(400) NOT NULL, /* s_kname(숙박 시설 이름 (한글)) */
	s_ename VARCHAR2(40) NOT NULL, /* s_ename(숙박 시설 이름 (영문)) */
	s_grade NUMBER(1) NOT NULL, /* s_grade(숙박 시설 등급) */
	s_loc NVARCHAR2(100) NOT NULL, /* s_loc(주소) */
	s_cash NUMBER(1) NOT NULL, /* s_cash(현장 결제 가능 여부) */
	s_image VARCHAR2(100) NOT NULL, /* s_image(이미지 파일 경로) */
	s_reviewcnt NUMBER(20) NOT NULL, /* s_reviewcnt(후기 수) */
	s_con NVARCHAR2(100) NOT NULL, /* s_con(숙박 시설 설명) */
	s_total NUMBER(38) NOT NULL, /* s_total(숙박시설 전체 평점 합) */
	a_id VARCHAR2(20) NOT NULL, /* a_id(지역ID) */
	ct_id VARCHAR2(20) NOT NULL, /* ct_id(도시ID) */
	st_id VARCHAR2(20) NOT NULL, /* st_id(숙박시설 유형 ID) */
	s_sex NUMBER(30) NOT NULL, /* s_sex(성소수자환영점수) */
	s_bs NUMBER(30) NOT NULL, /* s_bs(출장여행점수) */
	s_fam NUMBER(30) NOT NULL, /* s_fam(가족여행점수) */
	ad_id VARCHAR2(20), /* ad_id(등록 ID) */
	s_cnt NUMBER(10) /* s_cnt(객실수) */
);

ALTER TABLE sukbak
	ADD
		CONSTRAINT PK_sukbak
		PRIMARY KEY (
			s_id
		);

ALTER TABLE sukbak
	ADD
		CONSTRAINT FK_area_TO_sukbak
		FOREIGN KEY (
			a_id
		)
		REFERENCES area (
			a_id
		);

ALTER TABLE sukbak
	ADD
		CONSTRAINT FK_city_TO_sukbak
		FOREIGN KEY (
			ct_id
		)
		REFERENCES city (
			ct_id
		);

ALTER TABLE sukbak
	ADD
		CONSTRAINT FK_stype_TO_sukbak
		FOREIGN KEY (
			st_id
		)
		REFERENCES stype (
			st_id
		);

ALTER TABLE sukbak
	ADD
		CONSTRAINT FK_adds_TO_sukbak
		FOREIGN KEY (
			ad_id
		)
		REFERENCES adds (
			ad_id
		);


-- 17. 숙박편의유형 (sinfotype)

/* 숙박시설 내 편의 시설 유형(sinfotype) */
DROP TABLE sinfotype 
	CASCADE CONSTRAINTS;

/* 숙박시설 내 편의 시설 유형(sinfotype) */
CREATE TABLE sinfotype (
	sit_id VARCHAR2(20) NOT NULL, /* sit_id(숙박 편의 유형 ID) */
	sit_type NVARCHAR2(20) NOT NULL /* sit_type(숙박 편의 유형) */
);

ALTER TABLE sinfotype
	ADD
		CONSTRAINT PK_sinfotype
		PRIMARY KEY (
			sit_id
		);

-- 18. 숙박편의내용 (sinfocon)

/* 숙박 시설 내 편의 시설 내용(sinfocon) */
DROP TABLE sinfocon 
	CASCADE CONSTRAINTS;

/* 숙박 시설 내 편의 시설 내용(sinfocon) */
CREATE TABLE sinfocon (
	sic_id VARCHAR2(20) NOT NULL, /* sic_id(숙박 편의 내용 ID) */
	sic_con NVARCHAR2(1000) NOT NULL, /* sic_con(숙박 편의 내용) */
	sit_id VARCHAR2(20) NOT NULL /* sit_id(숙박 편의 유형 ID) */
);

ALTER TABLE sinfocon
	ADD
		CONSTRAINT PK_sinfocon
		PRIMARY KEY (
			sic_id
		);

ALTER TABLE sinfocon
	ADD
		CONSTRAINT FK_sinfotype_TO_sinfocon
		FOREIGN KEY (
			sit_id
		)
		REFERENCES sinfotype (
			sit_id
		);

-- 19. 숙박편의 (sinfo)

/* 숙박시설 내 편의 시설 저장 정보(sinfo) */
DROP TABLE sinfo 
	CASCADE CONSTRAINTS;

/* 숙박시설 내 편의 시설 저장 정보(sinfo) */
CREATE TABLE sinfo (
	si_id VARCHAR2(20) NOT NULL, /* si_id(숙박 편의 저장 정보 ID) */
	sit_id VARCHAR2(20) NOT NULL, /* sit_id(숙박 편의 유형 ID) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(숙박 시설 ID) */
	sic_id VARCHAR2(20) NOT NULL /* sic_id(숙박 편의 내용 ID) */
);

ALTER TABLE sinfo
	ADD
		CONSTRAINT PK_sinfo
		PRIMARY KEY (
			si_id
		);

ALTER TABLE sinfo
	ADD
		CONSTRAINT FK_sukbak_TO_sinfo
		FOREIGN KEY (
			s_id
		)
		REFERENCES sukbak (
			s_id
		);

ALTER TABLE sinfo
	ADD
		CONSTRAINT FK_sinfocon_TO_sinfo
		FOREIGN KEY (
			sic_id
		)
		REFERENCES sinfocon (
			sic_id
		);

ALTER TABLE sinfo
	ADD
		CONSTRAINT FK_sinfotype_TO_sinfo
		FOREIGN KEY (
			sit_id
		)
		REFERENCES sinfotype (
			sit_id
		);

-- 20. 요금정책유형 (yinfotype)

/* 요금 및 정책 유형(yinfotype) */
DROP TABLE yinfotype 
	CASCADE CONSTRAINTS;

/* 요금 및 정책 유형(yinfotype) */
CREATE TABLE yinfotype (
	yit_id VARCHAR(20) NOT NULL, /* yit_id(요금 정책 유형ID) */
	yit_type NVARCHAR2(50) NOT NULL /* yit_type(요금 정책 유형) */
);

ALTER TABLE yinfotype
	ADD
		CONSTRAINT PK_yinfotype
		PRIMARY KEY (
			yit_id
		);


-- 21. 요금정책내용 (yinfocon)

/* 요금 및 정책 내용(yinfocon) */
DROP TABLE yinfocon 
	CASCADE CONSTRAINTS;

/* 요금 및 정책 내용(yinfocon) */
CREATE TABLE yinfocon (
	yic_id VARCHAR2(20) NOT NULL, /* yic_id(요금 정책 내용 ID) */
	yic_con NVARCHAR2(1000) NOT NULL, /* yic_con(요금 정책 내용) */
	yit_id VARCHAR(20) NOT NULL /* yit_id(요금 정책 유형ID) */
);

ALTER TABLE yinfocon
	ADD
		CONSTRAINT PK_yinfocon
		PRIMARY KEY (
			yic_id
		);

ALTER TABLE yinfocon
	ADD
		CONSTRAINT FK_yinfotype_TO_yinfocon
		FOREIGN KEY (
			yit_id
		)
		REFERENCES yinfotype (
			yit_id
		);


-- 22. 요금정책 (yinfo)

/* 요금 및 정책 저장정보(yinfo) */
DROP TABLE yinfo 
	CASCADE CONSTRAINTS;

/* 요금 및 정책 저장정보(yinfo) */
CREATE TABLE yinfo (
	yi_id VARCHAR2(20) NOT NULL, /* yi_id(요금 정책 저장 ID) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(숙박 시설 ID) */
	yic_id VARCHAR2(20) NOT NULL, /* yic_id(요금 정책 내용 ID) */
	yit_id VARCHAR(20) NOT NULL /* yit_id(요금 정책 유형ID) */
);

ALTER TABLE yinfo
	ADD
		CONSTRAINT PK_yinfo
		PRIMARY KEY (
			yi_id
		);

ALTER TABLE yinfo
	ADD
		CONSTRAINT FK_sukbak_TO_yinfo
		FOREIGN KEY (
			s_id
		)
		REFERENCES sukbak (
			s_id
		);

ALTER TABLE yinfo
	ADD
		CONSTRAINT FK_yinfocon_TO_yinfo
		FOREIGN KEY (
			yic_id
		)
		REFERENCES yinfocon (
			yic_id
		);

ALTER TABLE yinfo
	ADD
		CONSTRAINT FK_yinfotype_TO_yinfo
		FOREIGN KEY (
			yit_id
		)
		REFERENCES yinfotype (
			yit_id
		);



-- 23. 식사 (meal)

/* 식사 포함 여부(meal) */
DROP TABLE meal 
	CASCADE CONSTRAINTS;

/* 식사 포함 여부(meal) */
CREATE TABLE meal (
	meal_id VARCHAR2(20) NOT NULL, /* s_id(숙박 시설 ID) */
	meal_b NUMBER(1) NOT NULL, /* meal_b(아침) */
	meal_l NUMBER(1) NOT NULL, /* meal_l(점심) */
	meal_d NUMBER(1) NOT NULL /* meal_d(저녁) */
);

ALTER TABLE meal
	ADD
		CONSTRAINT PK_meal
		PRIMARY KEY (
			meal_id
		);

ALTER TABLE meal
	ADD
		CONSTRAINT FK_sukbak_TO_meal
		FOREIGN KEY (
			meal_id
		)
		REFERENCES sukbak (
			s_id
		);


-- 24. Q&A (qna)


/* Q&A(qna) */
DROP TABLE qna 
	CASCADE CONSTRAINTS;

/* Q&A(qna) */
CREATE TABLE qna (
	q_id VARCHAR2(20) NOT NULL, /* q_id(질문 ID) */
	q_q NVARCHAR2(100) NOT NULL, /* q_q(질문) */
	q_a NVARCHAR2(1000) NOT NULL, /* q_a(답변) */
	s_id VARCHAR2(20) NOT NULL /* s_id(숙박 시설 ID) */
);

ALTER TABLE qna
	ADD
		CONSTRAINT PK_qna
		PRIMARY KEY (
			q_id
		);

ALTER TABLE qna
	ADD
		CONSTRAINT FK_sukbak_TO_qna
		FOREIGN KEY (
			s_id
		)
		REFERENCES sukbak (
			s_id
		);


-- 25. 객실 (room)

/* 객실(room) */
DROP TABLE room 
    CASCADE CONSTRAINTS;

/* 객실(room) */
CREATE TABLE room (
    r_id VARCHAR2(20) NOT NULL, /* r_id(객실 ID) */
    r_name VARCHAR2(50) NOT NULL, /*  r_name(방 이름) */
    r_cost NUMBER(10) NOT NULL, /*  r_cost(방 가격) */
    r_pro NUMBER(6,2) NOT NULL, /*  r_pro(프로모션 여부) */
    r_ppl NUMBER(2) NOT NULL, /* r_ppl(인원수 제한) */
    r_size NUMBER(2) NOT NULL, /* r_size(객실 크기) */
    r_num NUMBER(4) NOT NULL, /* r_num(호수) */
    s_id VARCHAR2(20) NOT NULL /* s_id(숙박 시설 ID) */
);

ALTER TABLE room
    ADD
        CONSTRAINT PK_room
        PRIMARY KEY (
            r_id
        );

ALTER TABLE room
    ADD
        CONSTRAINT FK_sukbak_TO_room
        FOREIGN KEY (
            s_id
        )
        REFERENCES sukbak (
            s_id
        );

-- 26. 침대 (bed)

/* 침대(bed) */
DROP TABLE bed 
	CASCADE CONSTRAINTS;

/* 침대(bed) */
CREATE TABLE bed (
	bed_id VARCHAR2(20) NOT NULL, /* bed_id(객실 침대 ID) */
	bed_size VARCHAR2(10) NOT NULL, /* bed_size(침대 사이즈) */
	bed_cnt NUMBER(2) NOT NULL, /* bed_cnt(침대 개수) */
	r_id VARCHAR2(20) NOT NULL /* r_id(객실 ID) */
);

ALTER TABLE bed
	ADD
		CONSTRAINT PK_bed
		PRIMARY KEY (
			bed_id
		);

ALTER TABLE bed
	ADD
		CONSTRAINT FK_room_TO_bed
		FOREIGN KEY (
			r_id
		)
		REFERENCES room (
			r_id
		);

-- 27. 객실편의유형 (rinfotype)

/* 객실 내 편의 시설 유형(rinfotype) */
DROP TABLE rinfotype 
	CASCADE CONSTRAINTS;

/* 객실 내 편의 시설 유형(rinfotype) */
CREATE TABLE rinfotype (
	rit_id VARCHAR2(20) NOT NULL, /* rit_id(객실 편의 유형 ID) */
	rit_type NVARCHAR2(50) NOT NULL /* rit_type(객실 편의 유형내용) */
);

ALTER TABLE rinfotype
	ADD
		CONSTRAINT PK_rinfotype
		PRIMARY KEY (
			rit_id
		);

SELECT * FROM rinfocon;

-- 28. 객실편의내용 (rinfocon)

/* 객실 내 편의시설 내용(rinfocon) */
DROP TABLE rinfocon 
	CASCADE CONSTRAINTS;

/* 객실 내 편의시설 내용(rinfocon) */
CREATE TABLE rinfocon (
	ric_id VARCHAR2(20) NOT NULL, /* ric_id(객실 편의내용 ID) */
	rit_id VARCHAR2(20) NOT NULL, /* rit_id(객실 편의 유형 ID) */
	ric_con NVARCHAR2(1000) NOT NULL /* ric_con(객실 편의 내용) */
);

ALTER TABLE rinfocon
	ADD
		CONSTRAINT PK_rinfocon
		PRIMARY KEY (
			ric_id
		);

ALTER TABLE rinfocon
	ADD
		CONSTRAINT FK_rinfotype_TO_rinfocon
		FOREIGN KEY (
			rit_id
		)
		REFERENCES rinfotype (
			rit_id
		);

-- 29. 객실편의 (rinfo)

/* 객실 내 편의 시설 저장 정보(rinfo) */
DROP TABLE rinfo 
	CASCADE CONSTRAINTS;

/* 객실 내 편의 시설 저장 정보(rinfo) */
CREATE TABLE rinfo (
	ri_id VARCHAR2(20) NOT NULL, /* ri_id(객실 편의 저장정보 ID) */
	rit_id VARCHAR2(20), /* rit_id(객실 편의 유형 ID) */
	r_id VARCHAR2(20) NOT NULL, /* r_id(객실 ID) */
	ric_id VARCHAR2(20) /* ric_id(객실 편의내용 ID) */
);

ALTER TABLE rinfo
	ADD
		CONSTRAINT PK_rinfo
		PRIMARY KEY (
			ri_id
		);

ALTER TABLE rinfo
	ADD
		CONSTRAINT FK_room_TO_rinfo
		FOREIGN KEY (
			r_id
		)
		REFERENCES room (
			r_id
		);

ALTER TABLE rinfo
	ADD
		CONSTRAINT FK_rinfocon_TO_rinfo
		FOREIGN KEY (
			ric_id
		)
		REFERENCES rinfocon (
			ric_id
		);

ALTER TABLE rinfo
	ADD
		CONSTRAINT FK_rinfotype_TO_rinfo
		FOREIGN KEY (
			rit_id
		)
		REFERENCES rinfotype (
			rit_id
		);


-- 30. 결제상태 (pstate)

/* 결제상태(pstate) */
DROP TABLE pstate 
	CASCADE CONSTRAINTS;

/* 결제상태(pstate) */
CREATE TABLE pstate (
	ps_id VARCHAR2(20) NOT NULL, /* ps_id(결제상태ID) */
	ps NVARCHAR2(20) NOT NULL /* ps(결제상태) */
);

ALTER TABLE pstate
	ADD
		CONSTRAINT PK_pstate
		PRIMARY KEY (
			ps_id
		);

-- 31. 결제수단 (paytype)

/* 결제 수단(paytype) */
DROP TABLE paytype 
	CASCADE CONSTRAINTS;

/* 결제 수단(paytype) */
CREATE TABLE paytype (
	pt_id VARCHAR2(20) NOT NULL, /* pt_id(결제 수단 ID) */
	pt_type NVARCHAR2(20) NOT NULL /* pt_type(결제 수단) */
);

ALTER TABLE paytype
	ADD
		CONSTRAINT PK_paytype
		PRIMARY KEY (
			pt_id
		);


-- 34. 예약상태(bstate)

/* 예약상태(bstate) */
CREATE TABLE bstate (
	bs_id VARCHAR2(20) NOT NULL, /* bs_id(예약상태ID) */
	bs NVARCHAR2(20) NOT NULL /* bs(예약상태) */
);

ALTER TABLE bstate
	ADD
		CONSTRAINT PK_bstate
		PRIMARY KEY (
			bs_id
		);


-- 35. 예약 (book)


/* 예약(book) */
DROP TABLE book 
	CASCADE CONSTRAINTS;

/* 예약(book) */
CREATE TABLE book (
	b_id VARCHAR2(20) NOT NULL, /* b_id(예약ID) */
	b_cost NUMBER(10) NOT NULL, /* b_cost(총금액) */
	b_date DATE NOT NULL, /* b_date(예약 일자) */
	b_con NVARCHAR2(100) NOT NULL, /* b_con(특별 요청 사항) */
	m_id VARCHAR2(20) NOT NULL, /* m_id(회원 ID) */
	bs_id VARCHAR2(20) NOT NULL /* bs_id(예약상태ID) */
);

ALTER TABLE book
	ADD
		CONSTRAINT PK_book
		PRIMARY KEY (
			b_id
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_member_TO_book
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_bstate_TO_book
		FOREIGN KEY (
			bs_id
		)
		REFERENCES bstate (
			bs_id
		);

-- 36. 예약상세(bookmore)

/* 예약상세(bookmore) */
DROP TABLE bookmore 
	CASCADE CONSTRAINTS;

/* 예약상세(bookmore) */
CREATE TABLE bookmore (
	bm_id VARCHAR2(20) NOT NULL, /* bm_id(예약상세ID) */
	bm_cost NUMBER(10) NOT NULL, /* bm_cost(금액) */
	bm_ppl NUMBER(10) NOT NULL, /* bm_ppl(인원) */
	bm_in DATE NOT NULL, /* bm_in(체크인날짜) */
	bm_out DATE NOT NULL, /* bm_out(체크아웃날짜) */
	r_id VARCHAR2(20) NOT NULL, /* r_id(객실 ID) */
	b_id VARCHAR2(20) NOT NULL /* b_id(예약ID) */
);

ALTER TABLE bookmore
	ADD
		CONSTRAINT PK_bookmore
		PRIMARY KEY (
			bm_id
		);

ALTER TABLE bookmore
	ADD
		CONSTRAINT FK_room_TO_bookmore
		FOREIGN KEY (
			r_id
		)
		REFERENCES room (
			r_id
		);

ALTER TABLE bookmore
	ADD
		CONSTRAINT FK_book_TO_bookmore
		FOREIGN KEY (
			b_id
		)
		REFERENCES book (
			b_id
		);


-- 32. 결제 (pay)

/* 결제(pay) */
DROP TABLE pay 
	CASCADE CONSTRAINTS;

/* 결제(pay) */
CREATE TABLE pay (
	p_id VARCHAR2(20) NOT NULL, /* p_id(결제 ID) */
	p_cost NUMBER(10) NOT NULL, /* p_cost(결제 금액) */
	p_date DATE NOT NULL, /* p_date(결제 일자) */
	p_bank NVARCHAR2(20) NOT NULL, /* p_bank(입금은행) */
	p_name NVARCHAR2(20) NOT NULL, /* p_name(입금자명) */
	pt_id VARCHAR2(20) NOT NULL, /* pt_id(결제 수단 ID) */
	ps_id VARCHAR2(20), /* ps_id(결제상태ID) */
	b_id VARCHAR2(20) /* b_id(예약ID) */
);

ALTER TABLE pay
	ADD
		CONSTRAINT PK_pay
		PRIMARY KEY (
			p_id
		);

ALTER TABLE pay
	ADD
		CONSTRAINT FK_paytype_TO_pay
		FOREIGN KEY (
			pt_id
		)
		REFERENCES paytype (
			pt_id
		);

ALTER TABLE pay
	ADD
		CONSTRAINT FK_pstate_TO_pay
		FOREIGN KEY (
			ps_id
		)
		REFERENCES pstate (
			ps_id
		);

ALTER TABLE pay
	ADD
		CONSTRAINT FK_book_TO_pay
		FOREIGN KEY (
			b_id
		)
		REFERENCES book (
			b_id
		);
        
-- 33. 환불 (refund)

/* 환불(refund) */
DROP TABLE refund 
	CASCADE CONSTRAINTS;

/* 환불(refund) */
CREATE TABLE refund (
	rf_id VARCHAR2(20) NOT NULL, /* rf_id(환불  ID) */
	rf_date DATE NOT NULL, /* rf_date(환불 일자) */
	p_id VARCHAR2(20) /* p_id(결제 ID) */
);

ALTER TABLE refund
	ADD
		CONSTRAINT PK_refund
		PRIMARY KEY (
			rf_id
		);

ALTER TABLE refund
	ADD
		CONSTRAINT FK_pay_TO_refund
		FOREIGN KEY (
			p_id
		)
		REFERENCES pay (
			p_id
		);

-- 37. 검색로그 (log)

/* 검색 로그(log) */
DROP TABLE log 
	CASCADE CONSTRAINTS;

/* 검색 로그(log) */
CREATE TABLE log (
	l_id VARCHAR2(20) NOT NULL, /* l_id(검색기록 ID) */
	m_id VARCHAR2(20) NOT NULL, /* m_id(회원 ID) */
	s_id VARCHAR2(20) NOT NULL /* s_id(숙박 시설 ID) */
);

ALTER TABLE log
	ADD
		CONSTRAINT PK_log
		PRIMARY KEY (
			l_id
		);

ALTER TABLE log
	ADD
		CONSTRAINT FK_member_TO_log
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE log
	ADD
		CONSTRAINT FK_sukbak_TO_log
		FOREIGN KEY (
			s_id
		)
		REFERENCES sukbak (
			s_id
		);

-- 38. 후기 (review)

/* 후기(review) */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 후기(review) */
CREATE TABLE review (
	re_id VARCHAR2(20) NOT NULL, /* re_id(후기 ID) */
	re_con NVARCHAR2(100) NOT NULL, /* re_con(내용) */
	re_name NVARCHAR2(40) NOT NULL, /* re_name */
	re_date DATE DEFAULT SYSDATE NOT NULL, /* re_date(입력 날짜) */
	re_sex NUMBER(20) NOT NULL, /* re_sex성소주자 환영 */
	re_bs NUMBER(20) NOT NULL, /* re_bs(출장여행에 좋음) */
	re_family NUMBER(20) NOT NULL, /* re_fam(가족 여행에 좋음) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(숙박 시설 ID) */
	m_id VARCHAR2(20) NOT NULL /* m_id(회원 ID) */
);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			re_id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_sukbak_TO_review
		FOREIGN KEY (
			s_id
		)
		REFERENCES sukbak (
			s_id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);


-- 39. 평점 (rate)

/* 평점(rate) */
DROP TABLE rate 
	CASCADE CONSTRAINTS;

/* 평점(rate) */
CREATE TABLE rate (
	rate_id VARCHAR2(20) NOT NULL, /* rate_id(평점 ID) */
	r1 NVARCHAR2(30) NOT NULL, /* r1(항목1) */
	r2 NVARCHAR2(30) NOT NULL, /* r2(항목2) */
	r3 NVARCHAR2(30) NOT NULL, /* r3(항목3) */
	r4 NVARCHAR2(30) NOT NULL, /* r4(항목4) */
	r5 NVARCHAR2(30) NOT NULL, /* r5(항목5) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(숙박 시설 ID) */
	m_id VARCHAR2(20) NOT NULL /* m_id(회원 ID) */
);

ALTER TABLE rate
	ADD
		CONSTRAINT PK_rate
		PRIMARY KEY (
			rate_id
		);

ALTER TABLE rate
	ADD
		CONSTRAINT FK_sukbak_TO_rate
		FOREIGN KEY (
			s_id
		)
		REFERENCES sukbak (
			s_id
		);

ALTER TABLE rate
	ADD
		CONSTRAINT FK_member_TO_rate
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);
        
        
        SELECT * FROM SUKBAK;





-- 등록**
SELECT * FROM adds;

-- 업주**
SELECT * FROM owner;

-- 회원**
SELECT * FROM member;

-- 예약
SELECT * FROM book;

-- 예약상세
SELECT * FROM bookmore;

-- 예약상태
SELECT * FROM bstate;

-- 결제
SELECT * FROM pay;

-- 결제수단
SELECT * FROM paytype;

-- 결제상태
SELECT * FROM pstate;

-- 환불
SELECT * FROM refund;



-- 업주 프로시저
CREATE OR REPLACE PROCEDURE owner_signup
(
vid owner.o_id%type,
vpw owner.o_pw%type,
vphone owner.o_phone%type,
vname owner.o_name%type,
vsur owner.o_sur%type,
vemail owner.o_email%type
)
IS
vownerCheck NUMBER(1);
BEGIN

SELECT COUNT(*) INTO vownerCheck
FROM owner
WHERE o_id = vid;

IF vownerCheck = 0 THEN 
DBMS_OUTPUT.PUT_LINE( '사용 가능한 아이디 입니다.' );
INSERT INTO owner VALUES (vid, vpw, vphone, vname, vsur, vemail);
ELSE
DBMS_OUTPUT.PUT_LINE( '이미 사용 중인 아이디 입니다.' );
END IF;
-- EXCEPTION
END;

EXEC owner_signup( 'abcd1234', 'password', '010-1111-2222', '정원', '곽', 'abcd1234@gmail.com' );
SELECT * FROM owner;

-- 등록 프로시저
CREATE SEQUENCE seq_adds
INCREMENT BY 1
START WITH 6
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE add_adds
(
vad_cnt adds.ad_cnt%type,
vad_type adds.ad_type%type,
vad_money adds.ad_money%type,
vac_chain adds.ac_chain%type,
vad_kname adds.ad_kname%type,
vad_ename adds.ad_ename%type,
vad_loc adds.ad_loc%type,
vad_date adds.ad_date%type,
vo_id adds.o_id%type
)
IS
vad_id adds.ad_id%type;
vnum NUMBER;
BEGIN
vnum := seq_adds.nextval;
vad_id := 'I' || TO_CHAR(vnum);

INSERT INTO adds 
VALUES(vad_id, vad_cnt, vad_type, vad_money, vac_chain, vad_kname, vad_ename, vad_loc, vad_date, vo_id);

END;


EXEC add_adds(10, '호텔', '달러', '체인X', 'ENA 스위트 호텔 남대문' , 'ENA Suite Hotel Namdaemun', '중구 세종대로11길 36, 서울특별시, 서울특별시, 04513', '2022-10-24', 'A6');
SELECT * FROM adds;

DELETE FROM adds WHERE ad_id = 'I6';


-- 관리자 승인 숙박업소 입력
CREATE SEQUENCE seq_sukbak
INCREMENT BY 1
START WITH 6
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE add_sukbak
(
vad_id adds.ad_id%type,
vs_grade sukbak.s_grade%type,
vs_cash sukbak.s_cash%type,
vs_image sukbak.s_image%type,
vs_con sukbak.s_con%type,
va_id sukbak.a_id%type,
vct_id sukbak.ct_id%type
)
IS
vad_cnt adds.ad_cnt%type;
vad_type adds.ad_type%type;
vad_money adds.ad_money%type;
vac_chain adds.ac_chain%type;
vad_kname adds.ad_kname%type;
vad_ename adds.ad_ename%type;
vad_loc adds.ad_loc%type;
vad_date adds.ad_date%type;
vo_id adds.o_id%type;
vst_id sukbak.st_id%type;
vs_id sukbak.s_id%type;
vnum NUMBER;

BEGIN
vnum := seq_sukbak.nextval;
vs_id := 'H' || TO_CHAR(vnum);

SELECT ad_cnt, ad_type, ad_money, ac_chain, ad_kname, ad_ename, ad_loc, ad_date, o_id INTO vad_cnt, vad_type, vad_money, vac_chain, vad_kname, vad_ename, vad_loc, vad_date, vo_id
FROM adds
WHERE ad_id = vad_id;

SELECT st_id INTO vst_id
FROM stype
WHERE st_type = vad_type;

INSERT INTO sukbak
VALUES (vs_id, vad_kname, vad_ename, vs_grade, vad_loc, vs_cash, vs_image, 0, vs_con, 0, va_id, vct_id, vst_id, 0,0,0, vad_id, vad_cnt);

END;


EXEC add_sukbak('I7', 3, 1, '/src/image.png', '아름다운 경관을 가진 호텔', 'A56', 'C28'); 
SELECT * FROM sukbak;

-- 숙박시설 등록 확인
CREATE OR REPLACE PROCEDURE select_sukbak
(
vs_id sukbak.s_id%type
)
IS
vs_kname sukbak.s_kname%type;
vs_ename sukbak.s_ename%type;
vs_grade sukbak.s_grade%type;
vs_loc sukbak.s_loc%type;
vs_cash sukbak.s_cash%type;
vs_image sukbak.s_image%type;
vs_reviewcnt sukbak.s_reviewcnt%type;
vs_con sukbak.s_con%type;
vs_total sukbak.s_total%type;
va_id sukbak.a_id%type;
vct_id sukbak.ct_id%type;
vs_sex sukbak.s_sex%type;
vs_bs sukbak.s_bs%type;
vs_fam sukbak.s_fam%type;
vad_id sukbak.ad_id%type;
vs_cnt sukbak.s_cnt%type;

vct_name city.ct_name%type;
va_name area.a_name%type;

BEGIN

SELECT s_kname, s_ename, s_grade, s_loc, s_cash, s_image, s_reviewcnt, s_con, 
s_total, s_sex, s_bs, s_fam, s_cnt 
INTO vs_kname, vs_ename, vs_grade, vs_loc, vs_cash, vs_image, vs_reviewcnt, vs_con, 
vs_total, vs_sex, vs_bs, vs_fam, vs_cnt
FROM sukbak
WHERE s_id = 'H1';--vs_id;

SELECT ct_id INTO vct_id --ct_name --INTO vct_name
FROM sukbak
WHERE s_id = vs_id;

SELECT ct_name INTO vct_name
FROM city
WHERE ct_id = vct_id;

SELECT a_id INTO va_id --ct_name --INTO vct_name
FROM sukbak
WHERE s_id = vs_id;


SELECT a_name INTO va_name
FROM area
WHERE a_id = va_id;

DBMS_OUTPUT.PUT_LINE( vs_kname || ', ' || vs_ename || ', ' || vs_grade || ', ' || vs_loc || ', ' || vs_cash || ', ' || vs_image || ', ' || vs_reviewcnt || ', ' || vs_con || ', ' || vs_total || ', ' || vs_sex || ', ' || vs_bs || ', ' || vs_fam || ', ' || vs_cnt || ', ' || vct_name || ', ' || va_name );

END;

EXEC select_sukbak('H1');

SELECT * FROM sukbak;

-- 회원가입
CREATE OR REPLACE PROCEDURE member_signup
(
vid member.m_id%type,
vemail member.m_email%type,
vname member.m_name%type,
vsur member.m_sur%type,
vpw member.m_pw%type,
vrw member.m_rw%type,
vphone member.m_phone%type
)
IS
vmemberCheck NUMBER(1);
BEGIN

SELECT COUNT(*) INTO vmemberCheck
FROM member
WHERE m_id = vid;

IF vmemberCheck = 0 THEN 
DBMS_OUTPUT.PUT_LINE( '사용 가능한 아이디 입니다.' );
INSERT INTO member VALUES (vid, vemail, vname, vsur, vpw, vrw, vphone);
ELSE
DBMS_OUTPUT.PUT_LINE( '이미 사용 중인 아이디 입니다.' );
END IF;
-- EXCEPTION
END;

EXEC member_signup( 'qwert1234', 'aaa@naver.com', '지원', '정', 'ppww', 0, '010-1111-1111');
-- 사용가능한 아이디 입니다.

-- 로그인
CREATE OR REPLACE PROCEDURE mem_signin 
( 
vid member.m_id%type , 
vpw member.m_pw%type 
) 
IS 
vidCheck NUMBER(1); 
vpwtemp member.m_pw%type;--NVARCHAR2(20); 

BEGIN 
SELECT COUNT(*) INTO vidCheck
FROM member 
WHERE m_id = vid; 

IF vidCheck = 1 THEN -- ID 존재한다. 
  SELECT m_pw INTO vpwtemp 
  FROM member 
  WHERE m_id = vid; 

  IF vpwtemp = vpw THEN 
    DBMS_OUTPUT.PUT_LINE('로그인 성공'); 
  ELSE 
    DBMS_OUTPUT.PUT_LINE('로그인 실패'); 
  END IF; 
ELSE 
  DBMS_OUTPUT.PUT_LINE('로그인 실패'); 
END IF; 
-- EXCEPTION 
END;

EXEC mem_signin('qwert1234', 'ppww'); --로그인 성공
EXEC mem_signin('qwert1234777', 'ppww7'); -- 로그인 실패
EXEC mem_signin('qwert1234', 'ppww7'); --로그인 실패

--예약상세테이블 INSERT, DELETE 시 예약테이블 총합 금액+- 반영 트리거

CREATE OR REPLACE TRIGGER book_pm
AFTER
  INSERT OR DELETE ON bookmore
  FOR EACH ROW
  BEGIN
     IF  INSERTING THEN
        UPDATE book SET b_cost = b_cost + :NEW.bm_cost WHERE b_id = :NEW.b_id;   
     ELSE    
        UPDATE book SET b_cost = b_cost - :OLD.bm_cost WHERE b_id = :NEW.b_id;
     END IF;
  END;

-- 예약테이블 프로시저
CREATE SEQUENCE seq_book
INCREMENT BY 1
START WITH 6
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE book_suk
(
vb_con  book.b_con%type,
vm_id  book.m_id%type
)
IS
vb_id   book.b_id%type;

vnum NUMBER;

BEGIN
vnum := seq_book.nextval;
vb_id := 'DD' || TO_CHAR(vnum);

INSERT INTO book VALUES(vb_id, '0', SYSDATE, vb_con, vm_id, 'DDS1'); 

END;

EXEC book_suk('깨끗했으면 좋겠어요', 'M1');
EXEC book_suk('공항 픽업 부탁드릴게요', 'M2');
EXEC book_suk('셔틀 운행일정 메일로 보내주세요', 'M3');
EXEC book_suk('집까지 데려다주세요', 'M4');

SELECT * FROM book;

-- 예약상세
CREATE SEQUENCE seq_bookmore
INCREMENT BY 1
START WITH 11
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE bookmore_suk
(
vbm_ppl  bookmore.bm_ppl%type,
vbm_in  bookmore.bm_in%type,
vbm_out  bookmore.bm_out%type,
vr_id  bookmore.r_id%type,
vb_id  book.b_id%type
)
IS
vbm_id bookmore.bm_id%type;
vbm_cost  bookmore.bm_cost%type;
vnum NUMBER;
vcost NUMBER;
vsukday NUMBER;

BEGIN
vnum := seq_bookmore.nextval;
vbm_id := 'DDW' || TO_CHAR(vnum);

SELECT r_cost INTO vcost
FROM room
WHERE r_id = vr_id;

vsukday := TO_DATE(vbm_out, 'YYYY-MM-DD') - TO_DATE(vbm_in, 'YYYY-MM-DD');
vbm_cost := vcost * vsukday;

INSERT INTO bookmore VALUES (vbm_id, vbm_cost, vbm_ppl, vbm_in, vbm_out, vr_id, vb_id);

UPDATE book
SET b_cost = b_cost + vbm_cost
WHERE b_id = vb_id;

END;

EXEC bookmore_suk(1,'20211212','20211225' ,'R1', 'DD6');
EXEC bookmore_suk(1,'20221228','20221230' ,'R1', 'DD6');
EXEC bookmore_suk(1,'20221212','20221225' ,'R2', 'DD7');
EXEC bookmore_suk(1,'20221228','20221230' ,'R2', 'DD7');
EXEC bookmore_suk(1,'20221212','20221225' ,'R3', 'DD8');
EXEC bookmore_suk(1,'20221228','20221230' ,'R3', 'DD8');
EXEC bookmore_suk(1,'20221212','20221225' ,'R4', 'DD9');
EXEC bookmore_suk(1,'20221228','20221230' ,'R5', 'DD9');

SELECT * FROM bookmore;

-- 결제 프로시저
CREATE SEQUENCE seq_pay
INCREMENT BY 1
START WITH 7
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE pay_pay
(
vp_bank pay.p_bank%type,
vp_name pay.p_name%type,
vpt_id pay.pt_id%type,
vb_id pay.b_id%type,
vrw_check NUMBER
)
IS
vp_id pay.p_id%type;
vp_cost pay.p_cost%type;
vm_rw member.m_rw%type;
vm_id member.m_id%type;
vnum NUMBER;
vps_id pay.ps_id%type;

BEGIN
vnum := seq_pay.nextval;
vp_id := 'B' || TO_CHAR(vnum);


SELECT b_cost INTO vp_cost
FROM book
WHERE b_id = vb_id;

IF vrw_check = 0 THEN -- 리워드 사용 안함
  IF vpt_id = 'C1' THEN-- 카드
    vps_id := 'BS1'; -- 결제완료
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);
    UPDATE member SET m_rw = m_rw+1 WHERE m_id = vm_id;
    UPDATE book SET bs_id = 'DDS2'; -- 예약 테이블 예약완료로 변경

  ELSIF vpt_id = 'C2' THEN -- 무통장입금
    vps_id := 'BS2'; -- 결제미완료
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);

  ELSE -- C3 현장결제
    vps_id := 'BS1'; -- 결제완료
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);
    UPDATE member SET m_rw = m_rw+1 WHERE m_id = vm_id;
    UPDATE book SET bs_id = 'DDS2'; -- 예약 테이블 예약완료로 변경
  END IF;
ELSE -- 리워드 사용
  SELECT m_id INTO vm_id -- 회원아이디 구해오기
  FROM book
  WHERE b_id = vb_id;

  SELECT m_rw INTO vm_rw -- 회원리워드 구해오기
  FROM member
  WHERE m_id = vm_id;

  IF vm_rw >= 10 THEN -- 리워드가 10개 이상이라면
    vps_id := 'BS1'; -- 결제완료
    vp_cost := vp_cost - 50000;
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);
    
    vp_cost := 50000;
    vnum := seq_pay.nextval;
    vp_id := 'B' || TO_CHAR(vnum);
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, 'C4', vps_id, vb_id);
    
    UPDATE member SET m_rw = m_rw-10 WHERE m_id = vm_id;
    UPDATE book SET bs_id = 'DDS2'; -- 예약 테이블 예약완료로 변경
  ELSE
    DBMS_OUTPUT.PUT_LINE('리워드 수 부족');
  END IF;
END IF;
END;

-- 카드
EXEC pay_pay( '0', '0', 'C1', 'DD6', 0 );
-- 무통장입금
EXEC pay_pay( '국민은행', '강지현', 'C2', 'DD7', 0);
-- 리워드
EXEC pay_pay( '0', '0', 'C1', 'DD8', 1);
-- 현장결제
EXEC pay_pay( '0', '0', 'C3', 'DD9', 0);

SELECT * FROM bookmore;
SELECT * FROM book;
SELECT * FROM pay;
SELECT * FROM member2;

-- 예약조회
CREATE OR REPLACE PROCEDURE select_book
(
vm_id member.m_id%type
)
IS
vb_id book.b_id%type;
vb_cost book.b_cost%type;
vb_date book.b_date%type;
vb_con book.b_con%type;
vbs_id book.bs_id%type;

vbs bstate.bs%type;

vbm_cost bookmore.bm_cost%type;
vbm_ppl bookmore.bm_ppl%type;
vbm_in bookmore.bm_in%type;
vbm_out bookmore.bm_out%type;
vr_id bookmore.r_id%type;
vbm_id bookmore.bm_id%type;

CURSOR bookcur IS (
		SELECT book.b_id, book.b_cost, book.b_date, book.b_con, book.bs_id, bstate.bs, bookmore.bm_id, bookmore.bm_cost, bookmore.bm_ppl, bookmore.bm_in, bookmore.bm_out, bookmore.r_id
		FROM book JOIN bstate ON book.bs_id = bstate.bs_id
			   JOIN bookmore ON book.b_id = bookmore.b_id
		WHERE m_id = vm_id
		);

BEGIN
OPEN bookcur;
LOOP
FETCH bookcur INTO vb_id, vb_cost, vb_date, vb_con, vbs_id, vbs, vbm_id, vbm_cost, vbm_ppl, vbm_in, vbm_out, vr_id; --vb_id;
EXIT WHEN bookcur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(vm_id || ', ' || vb_id || ', ' || vb_cost || ', ' || vb_date || ', ' || vb_con || ', ' || vbs_id || ', ' || vbs || ', ' || vbm_id || ', ' || vbm_cost || ', ' || vbm_ppl || ', ' || vbm_in || ', ' || vbm_out || ', ' || vr_id);-- || ', ' || vb_id);
END LOOP;
CLOSE bookcur;
END;

EXEC select_book ('M1');

select * from book;

UPDATE member
SET m_rw = 15
WHERE m_id = 'M3';

-- 환불
CREATE SEQUENCE seq_rf
INCREMENT BY 1
START WITH 2
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE pay_refund
(
vbm_id bookmore.bm_id%type
)
IS
vp_id refund.p_id%type;
vrf_id refund.rf_id%type;
vp_date pay.p_date%type;
vb_id book.b_id%type;
vbm_in bookmore.bm_id%type;
vm_id member.m_id%type;
vnum NUMBER;

BEGIN
SELECT bm_in INTO vbm_in
FROM bookmore
WHERE bm_id = vbm_id;


IF TO_DATE(vbm_in, 'YYYY-MM-DD') - TO_DATE(SYSDATE, 'YYYY-MM-DD') >= 3 THEN -- 3일 넘게 남은 경우
  vnum := seq_rf.nextval;
  vrf_id := 'F' || TO_CHAR(vnum);
  
  SELECT b_id INTO vb_id
  FROM bookmore
  WHERE bm_id = vbm_id;
  
  SELECT p_id INTO vp_id
  FROM pay
  WHERE b_id = vb_id and ps_id = 'BS1'; --결제완료상태만 가져오기, 하나밖에 없으니까

  SELECT m_id INTO vm_id
  FROM book
  WHERE b_id = vb_id;
  
  INSERT INTO refund VALUES (vrf_id, SYSDATE, vp_id);
  UPDATE pay SET ps_id = 'BS3' WHERE p_id = vp_id;  -- 결제취소
  UPDATE book SET bs_id = 'DDS3' WHERE b_id = vb_id;  -- 예약취소
  UPDATE member SET m_rw = m_rw-1 WHERE m_id = vm_id; -- 리워드 -1
ELSE
  DBMS_OUTPUT.PUT_LINE('환불 불가');
END IF;
END;

EXEC pay_refund('DDW28');
SELECT * FROM refund;


-- 예약수정불가
CREATE OR REPLACE PROCEDURE book_edit
(
vbm_id bookmore.bm_id%type,
vdate_in DATE,
vdate_out DATE
)
IS
vb_id book.b_id%type;
vr_id bookmore.r_id%type;
vbm_cost bookmore.bm_cost%type;
vcost bookmore.bm_cost%type;

room_check NUMBER;
vsukday NUMBER;

BEGIN

SELECT r_id INTO vr_id
FROM bookmore
WHERE bm_id = vbm_id;


SELECT COUNT(*) INTO room_check
FROM (SELECT * FROM bookmore WHERE r_id = vr_id and bm_id != vbm_id and bm_in > SYSDATE)
WHERE (bm_in>=vdate_in and bm_in<=vdate_out) or (bm_out>=vdate_in and bm_out<=vdate_out);

IF room_check = 0 THEN
  -- 체크인 체크아웃 날짜 변경
  UPDATE bookmore SET bm_in = vdate_in WHERE bm_id = vbm_id;
  UPDATE bookmore SET bm_out = vdate_out WHERE bm_id = vbm_id;
  
  -- 예약 테이블 총금액 변경
  SELECT b_id INTO vb_id
  FROM bookmore
  WHERE bm_id = vbm_id;
  
  SELECT bm_cost INTO vbm_cost
  FROM bookmore
  WHERE bm_id = vbm_id;

  UPDATE book SET b_cost = b_cost - vbm_cost WHERE b_id = vb_id;

  SELECT r_id INTO vr_id
  FROM bookmore
  WHERE bm_id = vbm_id;

  SELECT r_cost INTO vcost
  FROM room
  WHERE r_id = vr_id;

  vsukday := TO_DATE(vdate_out, 'YYYY-MM-DD') - TO_DATE(vdate_in, 'YYYY-MM-DD');
  vbm_cost := vcost * vsukday;

  UPDATE bookmore
  SET bm_cost = vbm_cost
  WHERE bm_id = vbm_id;

  UPDATE book
  SET b_cost = b_cost + vbm_cost
  WHERE b_id = vb_id;

ELSE
  DBMS_OUTPUT.PUT_LINE('예약 수정 불가');
END IF;
END;

EXEC book_edit('DDW23', '20221222', '20221230');  -- 예약수정불가가 나와야함
EXEC book_edit('DDW24', '20241222', '20241230');  -- 예약수정되어야함

SELECT *
FROM (SELECT * FROM bookmore WHERE r_id = 'R2' and bm_id != 'DDW23' and bm_in > SYSDATE)
WHERE bm_in>'20221222' and bm_out<'20221230';


SELECT *
FROM (SELECT * FROM bookmore WHERE r_id = 'R2' and bm_id != 'DDW23' and bm_in > SYSDATE and bm_in<='20221222' and bm_out>='20221230')
WHERE bm_in>'20221222' or bm_out<'20221230';

SELECT * FROM bookmore WHERE r_id = 'R2';
SELECT * FROM bookmore;
SELECT * FROM book;
UPDATE bookmore
SET bm_in = '20221223'
WHERE bm_id = 'DDW23';

UPDATE bookmore
SET bm_out = '20221227'
WHERE bm_id = 'DDW23';


-- 객실 프로시저
CREATE SEQUENCE seq_room
INCREMENT BY 1
START WITH 6
NOCYCLE
NOCACHE;

CREATE OR REPLACE PROCEDURE room_add
(
vr_name room.r_name%type,
vr_cost room.r_cost%type,
vr_pro room.r_pro%type,
vr_ppl room.r_ppl%type,
vr_size room.r_size%type,
vr_num room.r_num%type,
vs_id room.s_id%type
)
IS
vr_id room.r_id%type;
vnum NUMBER;

BEGIN
vnum := seq_room.nextval;
vr_id := 'R' || TO_CHAR(vnum);

INSERT INTO room VALUES(vr_id, vr_name, vr_cost, vr_pro, vr_ppl, vr_size, vr_num, vs_id);

END;

SELECT * FROM sukbak;

EXEC room_add('룸', 50000, 0, 1, 50, 601, 'H10');
SELECT * FROM room;


select * from pstate;
select * from bstate;
select * from member2;



