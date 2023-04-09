-- SCOTT 1019(��) --
-- �ʱ�ȭ Ŀ����

-- 1. �����׸� (ph)

/* �����׸�(ph) */
DROP TABLE ph 
	CASCADE CONSTRAINTS;

/* �����׸�(ph) */
CREATE TABLE ph (
	ph_id VARCHAR2(20) NOT NULL, /* ph_id(�׸� ID) */
	ph_name NVARCHAR2(30) NOT NULL /* ph_name(�׸� ����) */
);

ALTER TABLE ph
	ADD
		CONSTRAINT PK_ph
		PRIMARY KEY (
			ph_id
		);

-- 2. ���� (support)

/* ����(support) */
DROP TABLE support 
	CASCADE CONSTRAINTS;

/* ����(support) */
CREATE TABLE support (
	sp_id VARCHAR2(20) NOT NULL, /* sp_id(����ID) */
	sp_menu NVARCHAR2(30) NOT NULL, /* sp_menu(�޴�) */
	sp_first NVARCHAR2(50) NOT NULL, /* sp_first(��з�) */
	sp_sec NVARCHAR2(50) NOT NULL, /* sp_sec(�ߺз�) */
	sp_name NVARCHAR2(50) NOT NULL, /* sp_name(����) */
	sp_con NVARCHAR2(2000) NOT NULL /* sp_con(����) */
);

ALTER TABLE support
	ADD
		CONSTRAINT PK_support
		PRIMARY KEY (
			sp_id
		);

-- 3. ȸ�� (member)

/* ȸ��(member) */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* ȸ��(member) */
CREATE TABLE member (
	m_id VARCHAR2(20) NOT NULL, /* m_id(ȸ�� ID) */
	m_email NVARCHAR2(50) NOT NULL, /* m_email(�̸���) */
	m_name NVARCHAR2(50) NOT NULL, /* m_name(�̸�) */
	m_sur NVARCHAR2(20) NOT NULL, /* m_sur(��) */
	m_pw NVARCHAR2(20) NOT NULL, /* m_pw(��й�ȣ) */
	m_rw NUMBER(2) NOT NULL, /* m_rw(������) */
	m_phone CHAR(13) NOT NULL /* m_phone(��ȭ��ȣ) */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			m_id
		);

-- 4. ���� (country)

/* ����(country) */
DROP TABLE country 
	CASCADE CONSTRAINTS;

/* ����(country) */
CREATE TABLE country (
	c_id VARCHAR2(20) NOT NULL, /* c_id(����ID) */
	c_name NVARCHAR2(20) NOT NULL /* c_name(�����̸�) */
);

ALTER TABLE country
	ADD
		CONSTRAINT PK_country
		PRIMARY KEY (
			c_id
		);




-- 5. ���� (city)

/* ����(city) */
DROP TABLE city 
	CASCADE CONSTRAINTS;

/* ����(city) */
CREATE TABLE city (
	ct_id VARCHAR2(20) NOT NULL, /* ct_id(����ID) */
	ct_name NVARCHAR2(20) NOT NULL, /* ct_name(�����̸�) */
	ct_con NVARCHAR2(1000) NOT NULL, /* ct_con(���üҰ�) */
	ct_loc NVARCHAR2(200) NOT NULL, /* ct_loc(���� ��ġ) */
	c_id VARCHAR2(20) NOT NULL /* c_id(����ID) */
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

-- 6. ���� qna

/* ctqna(����q&a) */
DROP TABLE ctqna 
	CASCADE CONSTRAINTS;

/* ctqna(����q&a) */
CREATE TABLE ctqna (
	cq_id VARCHAR2(20) NOT NULL, /* cq_id(����qnaID) */
	cq_q NVARCHAR2(500) NOT NULL, /* cq_q(����) */
	cq_a NVARCHAR2(1000) NOT NULL, /* cq_a(�亯) */
	ct_id VARCHAR2(20) NOT NULL /* ct_id(����ID) */
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


-- 7. ���� (area)

/* ����(area) */
DROP TABLE area 
	CASCADE CONSTRAINTS;

/* ����(area) */
CREATE TABLE area (
	a_id VARCHAR2(20) NOT NULL, /* a_id(����ID) */
	a_name NVARCHAR2(20), /* a_name(���� �̸�) */
	a_nav NVARCHAR2(500), /* a_nav(���� ���) */
	a_con NVARCHAR2(1000), /* a_con(���� �Ұ�) */
	a_loc NVARCHAR2(500), /* a_loc(���� ��ġ) */
	ct_id VARCHAR2(20) /* ct_id(����ID) */
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


-- 8. ������ó��� (neararea)

/* ���� ��ó ���(neararea) */
DROP TABLE neararea 
	CASCADE CONSTRAINTS;

/* ���� ��ó ���(neararea) */
CREATE TABLE neararea (
	na_id VARCHAR2(20) NOT NULL, /* na_id(���� ��ó ���� �� ID) */
	na_name NVARCHAR2(40) NOT NULL, /* na_name(���� ��ó �������� ���) */
	a_id VARCHAR2(20) NOT NULL /* a_id(����ID) */
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


-- 9. ������ó���� (sa)


/* ������ó ����(sa) */
DROP TABLE sa 
	CASCADE CONSTRAINTS;

/* ������ó ����(sa) */
CREATE TABLE sa (
	sa_id VARCHAR2(20) NOT NULL, /* sa_id(���� ��ó ���� �ü� ID) */
	sa_name NVARCHAR2(50) NOT NULL, /* sa_name(���� ��ó ���� �ü���) */
	a_id VARCHAR2(20) NOT NULL /* a_id(���� ID) */
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



-- 10. ���帶ũ (landmark)

/* ���帶ũ(landmark) */
DROP TABLE landmark 
	CASCADE CONSTRAINTS;

/* ���帶ũ(landmark) */
CREATE TABLE landmark (
	lm_id VARCHAR2(20) NOT NULL, /* lm_id(���帶ũ ID) */
	lm_name NVARCHAR2(100) NOT NULL, /* lm_name(���帶ũ�̸�) */
	lm_loc NVARCHAR2(100) NOT NULL, /* lm_loc(���帶ũ�ּ�) */
	lm_con NVARCHAR2(1000) NOT NULL, /* lm_con(���帶ũ�Ұ�) */
	ct_id VARCHAR2(20) NOT NULL /* ct_id(����ID) */
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


-- 11. ���帶ũ��ó��� (nearlm)

/* ���帶ũ ��ó ���(nearlm) */
DROP TABLE nearlm 
	CASCADE CONSTRAINTS;

/* ���帶ũ ��ó ���(nearlm) */
CREATE TABLE nearlm (
	nlm_id VARCHAR2(20) NOT NULL, /* nlm_id(���� ��ó ���� �� ID) */
	nlm_name NVARCHAR2(50), /* nlm_name(���� ��ó ���� ���� ���) */
	lm_id VARCHAR2(20) /* lm_id(���帶ũ ID) */
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

-- 12. ���帶ũ��ó���� (slm)

/* ���帶ũ ��ó ����(slm) */
DROP TABLE slm 
	CASCADE CONSTRAINTS;

/* ���帶ũ ��ó ����(slm) */
CREATE TABLE slm (
	slm_id VARCHAR2(20) NOT NULL, /* slm_id(���� ��ó ���� �ü� ID) */
	slm_name NVARCHAR2(100) NOT NULL, /* slm_name(���� ��ó ���� �ü���) */
	lm_id VARCHAR2(20) NOT NULL /* lm_id(���帶ũ ID) */
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


-- 13. ���� (owner)
/* ����(owner) */
DROP TABLE owner 
	CASCADE CONSTRAINTS;

/* ����(owner) */
CREATE TABLE owner (
	o_id VARCHAR2(20) NOT NULL, /* o_id(���� ID) */
	o_pw NVARCHAR2(20) NOT NULL, /* o_pw(��й�ȣ) */
	o_phone CHAR(13) NOT NULL, /* o_phone(��ȭ��ȣ) */
	o_name NVARCHAR2(20) NOT NULL, /* o_name(�̸�) */
	o_sur NVARCHAR2(20) NOT NULL, /* o_sur(��) */
	o_email NVARCHAR2(50) NOT NULL /* o_email(�̸��� �ּ�) */
);

ALTER TABLE owner
	ADD
		CONSTRAINT PK_owner
		PRIMARY KEY (
			o_id
		);

-- 14. ��� (adds)

/* ���(adds) */
DROP TABLE adds 
	CASCADE CONSTRAINTS;

/* ���(adds) */
CREATE TABLE adds (
	ad_id VARCHAR2(20) NOT NULL, /* ad_id(��� ID) */
	ad_cnt NUMBER(3) NOT NULL, /* ad_cnt(���� ��) */
	ad_type NVARCHAR2(20) NOT NULL, /* ad_type(����) */
	ad_money NVARCHAR2(20) NOT NULL, /* ad_money(��ȭ����) */
	ac_chain NVARCHAR2(20) NOT NULL, /* ad_chain(ü��) */
	ad_kname NVARCHAR2(50) NOT NULL, /* ad_kname(�ü� �̸� �ѱ�) */
	ad_ename NVARCHAR2(50) NOT NULL, /* ad_ename(�ü� �̸� ����) */
	ad_loc NVARCHAR2(100) NOT NULL, /* ad_loc(�ּ�) */
	ad_date DATE NOT NULL, /* ad_date(��� ��¥) */
	o_id VARCHAR2(20) NOT NULL /* o_id(���� ID) */
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

-- 15. ���ڽü����� (stype)

/* ���ڽü�����(stype) */
DROP TABLE stype 
	CASCADE CONSTRAINTS;

/* ���ڽü�����(stype) */
CREATE TABLE stype (
	st_id VARCHAR2(20) NOT NULL, /* st_id(���ڽü� ���� ID) */
	st_type NVARCHAR2(20) NOT NULL /* st_type(���ڽü� ����) */
);

ALTER TABLE stype
	ADD
		CONSTRAINT PK_stype
		PRIMARY KEY (
			st_id
		);


-- 16. ���� (sukbak)


/* ���ڽü�(sukbak) */
DROP TABLE sukbak 
	CASCADE CONSTRAINTS;

/* ���ڽü�(sukbak) */
CREATE TABLE sukbak (
	s_id VARCHAR2(20) NOT NULL, /* s_id(���� �ü� ID) */
	s_kname NVARCHAR2(400) NOT NULL, /* s_kname(���� �ü� �̸� (�ѱ�)) */
	s_ename VARCHAR2(40) NOT NULL, /* s_ename(���� �ü� �̸� (����)) */
	s_grade NUMBER(1) NOT NULL, /* s_grade(���� �ü� ���) */
	s_loc NVARCHAR2(100) NOT NULL, /* s_loc(�ּ�) */
	s_cash NUMBER(1) NOT NULL, /* s_cash(���� ���� ���� ����) */
	s_image VARCHAR2(100) NOT NULL, /* s_image(�̹��� ���� ���) */
	s_reviewcnt NUMBER(20) NOT NULL, /* s_reviewcnt(�ı� ��) */
	s_con NVARCHAR2(100) NOT NULL, /* s_con(���� �ü� ����) */
	s_total NUMBER(38) NOT NULL, /* s_total(���ڽü� ��ü ���� ��) */
	a_id VARCHAR2(20) NOT NULL, /* a_id(����ID) */
	ct_id VARCHAR2(20) NOT NULL, /* ct_id(����ID) */
	st_id VARCHAR2(20) NOT NULL, /* st_id(���ڽü� ���� ID) */
	s_sex NUMBER(30) NOT NULL, /* s_sex(���Ҽ���ȯ������) */
	s_bs NUMBER(30) NOT NULL, /* s_bs(���忩������) */
	s_fam NUMBER(30) NOT NULL, /* s_fam(������������) */
	ad_id VARCHAR2(20), /* ad_id(��� ID) */
	s_cnt NUMBER(10) /* s_cnt(���Ǽ�) */
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


-- 17. ������������ (sinfotype)

/* ���ڽü� �� ���� �ü� ����(sinfotype) */
DROP TABLE sinfotype 
	CASCADE CONSTRAINTS;

/* ���ڽü� �� ���� �ü� ����(sinfotype) */
CREATE TABLE sinfotype (
	sit_id VARCHAR2(20) NOT NULL, /* sit_id(���� ���� ���� ID) */
	sit_type NVARCHAR2(20) NOT NULL /* sit_type(���� ���� ����) */
);

ALTER TABLE sinfotype
	ADD
		CONSTRAINT PK_sinfotype
		PRIMARY KEY (
			sit_id
		);

-- 18. �������ǳ��� (sinfocon)

/* ���� �ü� �� ���� �ü� ����(sinfocon) */
DROP TABLE sinfocon 
	CASCADE CONSTRAINTS;

/* ���� �ü� �� ���� �ü� ����(sinfocon) */
CREATE TABLE sinfocon (
	sic_id VARCHAR2(20) NOT NULL, /* sic_id(���� ���� ���� ID) */
	sic_con NVARCHAR2(1000) NOT NULL, /* sic_con(���� ���� ����) */
	sit_id VARCHAR2(20) NOT NULL /* sit_id(���� ���� ���� ID) */
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

-- 19. �������� (sinfo)

/* ���ڽü� �� ���� �ü� ���� ����(sinfo) */
DROP TABLE sinfo 
	CASCADE CONSTRAINTS;

/* ���ڽü� �� ���� �ü� ���� ����(sinfo) */
CREATE TABLE sinfo (
	si_id VARCHAR2(20) NOT NULL, /* si_id(���� ���� ���� ���� ID) */
	sit_id VARCHAR2(20) NOT NULL, /* sit_id(���� ���� ���� ID) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(���� �ü� ID) */
	sic_id VARCHAR2(20) NOT NULL /* sic_id(���� ���� ���� ID) */
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

-- 20. �����å���� (yinfotype)

/* ��� �� ��å ����(yinfotype) */
DROP TABLE yinfotype 
	CASCADE CONSTRAINTS;

/* ��� �� ��å ����(yinfotype) */
CREATE TABLE yinfotype (
	yit_id VARCHAR(20) NOT NULL, /* yit_id(��� ��å ����ID) */
	yit_type NVARCHAR2(50) NOT NULL /* yit_type(��� ��å ����) */
);

ALTER TABLE yinfotype
	ADD
		CONSTRAINT PK_yinfotype
		PRIMARY KEY (
			yit_id
		);


-- 21. �����å���� (yinfocon)

/* ��� �� ��å ����(yinfocon) */
DROP TABLE yinfocon 
	CASCADE CONSTRAINTS;

/* ��� �� ��å ����(yinfocon) */
CREATE TABLE yinfocon (
	yic_id VARCHAR2(20) NOT NULL, /* yic_id(��� ��å ���� ID) */
	yic_con NVARCHAR2(1000) NOT NULL, /* yic_con(��� ��å ����) */
	yit_id VARCHAR(20) NOT NULL /* yit_id(��� ��å ����ID) */
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


-- 22. �����å (yinfo)

/* ��� �� ��å ��������(yinfo) */
DROP TABLE yinfo 
	CASCADE CONSTRAINTS;

/* ��� �� ��å ��������(yinfo) */
CREATE TABLE yinfo (
	yi_id VARCHAR2(20) NOT NULL, /* yi_id(��� ��å ���� ID) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(���� �ü� ID) */
	yic_id VARCHAR2(20) NOT NULL, /* yic_id(��� ��å ���� ID) */
	yit_id VARCHAR(20) NOT NULL /* yit_id(��� ��å ����ID) */
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



-- 23. �Ļ� (meal)

/* �Ļ� ���� ����(meal) */
DROP TABLE meal 
	CASCADE CONSTRAINTS;

/* �Ļ� ���� ����(meal) */
CREATE TABLE meal (
	meal_id VARCHAR2(20) NOT NULL, /* s_id(���� �ü� ID) */
	meal_b NUMBER(1) NOT NULL, /* meal_b(��ħ) */
	meal_l NUMBER(1) NOT NULL, /* meal_l(����) */
	meal_d NUMBER(1) NOT NULL /* meal_d(����) */
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
	q_id VARCHAR2(20) NOT NULL, /* q_id(���� ID) */
	q_q NVARCHAR2(100) NOT NULL, /* q_q(����) */
	q_a NVARCHAR2(1000) NOT NULL, /* q_a(�亯) */
	s_id VARCHAR2(20) NOT NULL /* s_id(���� �ü� ID) */
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


-- 25. ���� (room)

/* ����(room) */
DROP TABLE room 
    CASCADE CONSTRAINTS;

/* ����(room) */
CREATE TABLE room (
    r_id VARCHAR2(20) NOT NULL, /* r_id(���� ID) */
    r_name VARCHAR2(50) NOT NULL, /*  r_name(�� �̸�) */
    r_cost NUMBER(10) NOT NULL, /*  r_cost(�� ����) */
    r_pro NUMBER(6,2) NOT NULL, /*  r_pro(���θ�� ����) */
    r_ppl NUMBER(2) NOT NULL, /* r_ppl(�ο��� ����) */
    r_size NUMBER(2) NOT NULL, /* r_size(���� ũ��) */
    r_num NUMBER(4) NOT NULL, /* r_num(ȣ��) */
    s_id VARCHAR2(20) NOT NULL /* s_id(���� �ü� ID) */
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

-- 26. ħ�� (bed)

/* ħ��(bed) */
DROP TABLE bed 
	CASCADE CONSTRAINTS;

/* ħ��(bed) */
CREATE TABLE bed (
	bed_id VARCHAR2(20) NOT NULL, /* bed_id(���� ħ�� ID) */
	bed_size VARCHAR2(10) NOT NULL, /* bed_size(ħ�� ������) */
	bed_cnt NUMBER(2) NOT NULL, /* bed_cnt(ħ�� ����) */
	r_id VARCHAR2(20) NOT NULL /* r_id(���� ID) */
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

-- 27. ������������ (rinfotype)

/* ���� �� ���� �ü� ����(rinfotype) */
DROP TABLE rinfotype 
	CASCADE CONSTRAINTS;

/* ���� �� ���� �ü� ����(rinfotype) */
CREATE TABLE rinfotype (
	rit_id VARCHAR2(20) NOT NULL, /* rit_id(���� ���� ���� ID) */
	rit_type NVARCHAR2(50) NOT NULL /* rit_type(���� ���� ��������) */
);

ALTER TABLE rinfotype
	ADD
		CONSTRAINT PK_rinfotype
		PRIMARY KEY (
			rit_id
		);

SELECT * FROM rinfocon;

-- 28. �������ǳ��� (rinfocon)

/* ���� �� ���ǽü� ����(rinfocon) */
DROP TABLE rinfocon 
	CASCADE CONSTRAINTS;

/* ���� �� ���ǽü� ����(rinfocon) */
CREATE TABLE rinfocon (
	ric_id VARCHAR2(20) NOT NULL, /* ric_id(���� ���ǳ��� ID) */
	rit_id VARCHAR2(20) NOT NULL, /* rit_id(���� ���� ���� ID) */
	ric_con NVARCHAR2(1000) NOT NULL /* ric_con(���� ���� ����) */
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

-- 29. �������� (rinfo)

/* ���� �� ���� �ü� ���� ����(rinfo) */
DROP TABLE rinfo 
	CASCADE CONSTRAINTS;

/* ���� �� ���� �ü� ���� ����(rinfo) */
CREATE TABLE rinfo (
	ri_id VARCHAR2(20) NOT NULL, /* ri_id(���� ���� �������� ID) */
	rit_id VARCHAR2(20), /* rit_id(���� ���� ���� ID) */
	r_id VARCHAR2(20) NOT NULL, /* r_id(���� ID) */
	ric_id VARCHAR2(20) /* ric_id(���� ���ǳ��� ID) */
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


-- 30. �������� (pstate)

/* ��������(pstate) */
DROP TABLE pstate 
	CASCADE CONSTRAINTS;

/* ��������(pstate) */
CREATE TABLE pstate (
	ps_id VARCHAR2(20) NOT NULL, /* ps_id(��������ID) */
	ps NVARCHAR2(20) NOT NULL /* ps(��������) */
);

ALTER TABLE pstate
	ADD
		CONSTRAINT PK_pstate
		PRIMARY KEY (
			ps_id
		);

-- 31. �������� (paytype)

/* ���� ����(paytype) */
DROP TABLE paytype 
	CASCADE CONSTRAINTS;

/* ���� ����(paytype) */
CREATE TABLE paytype (
	pt_id VARCHAR2(20) NOT NULL, /* pt_id(���� ���� ID) */
	pt_type NVARCHAR2(20) NOT NULL /* pt_type(���� ����) */
);

ALTER TABLE paytype
	ADD
		CONSTRAINT PK_paytype
		PRIMARY KEY (
			pt_id
		);


-- 34. �������(bstate)

/* �������(bstate) */
CREATE TABLE bstate (
	bs_id VARCHAR2(20) NOT NULL, /* bs_id(�������ID) */
	bs NVARCHAR2(20) NOT NULL /* bs(�������) */
);

ALTER TABLE bstate
	ADD
		CONSTRAINT PK_bstate
		PRIMARY KEY (
			bs_id
		);


-- 35. ���� (book)


/* ����(book) */
DROP TABLE book 
	CASCADE CONSTRAINTS;

/* ����(book) */
CREATE TABLE book (
	b_id VARCHAR2(20) NOT NULL, /* b_id(����ID) */
	b_cost NUMBER(10) NOT NULL, /* b_cost(�ѱݾ�) */
	b_date DATE NOT NULL, /* b_date(���� ����) */
	b_con NVARCHAR2(100) NOT NULL, /* b_con(Ư�� ��û ����) */
	m_id VARCHAR2(20) NOT NULL, /* m_id(ȸ�� ID) */
	bs_id VARCHAR2(20) NOT NULL /* bs_id(�������ID) */
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

-- 36. �����(bookmore)

/* �����(bookmore) */
DROP TABLE bookmore 
	CASCADE CONSTRAINTS;

/* �����(bookmore) */
CREATE TABLE bookmore (
	bm_id VARCHAR2(20) NOT NULL, /* bm_id(�����ID) */
	bm_cost NUMBER(10) NOT NULL, /* bm_cost(�ݾ�) */
	bm_ppl NUMBER(10) NOT NULL, /* bm_ppl(�ο�) */
	bm_in DATE NOT NULL, /* bm_in(üũ�γ�¥) */
	bm_out DATE NOT NULL, /* bm_out(üũ�ƿ���¥) */
	r_id VARCHAR2(20) NOT NULL, /* r_id(���� ID) */
	b_id VARCHAR2(20) NOT NULL /* b_id(����ID) */
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


-- 32. ���� (pay)

/* ����(pay) */
DROP TABLE pay 
	CASCADE CONSTRAINTS;

/* ����(pay) */
CREATE TABLE pay (
	p_id VARCHAR2(20) NOT NULL, /* p_id(���� ID) */
	p_cost NUMBER(10) NOT NULL, /* p_cost(���� �ݾ�) */
	p_date DATE NOT NULL, /* p_date(���� ����) */
	p_bank NVARCHAR2(20) NOT NULL, /* p_bank(�Ա�����) */
	p_name NVARCHAR2(20) NOT NULL, /* p_name(�Ա��ڸ�) */
	pt_id VARCHAR2(20) NOT NULL, /* pt_id(���� ���� ID) */
	ps_id VARCHAR2(20), /* ps_id(��������ID) */
	b_id VARCHAR2(20) /* b_id(����ID) */
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
        
-- 33. ȯ�� (refund)

/* ȯ��(refund) */
DROP TABLE refund 
	CASCADE CONSTRAINTS;

/* ȯ��(refund) */
CREATE TABLE refund (
	rf_id VARCHAR2(20) NOT NULL, /* rf_id(ȯ��  ID) */
	rf_date DATE NOT NULL, /* rf_date(ȯ�� ����) */
	p_id VARCHAR2(20) /* p_id(���� ID) */
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

-- 37. �˻��α� (log)

/* �˻� �α�(log) */
DROP TABLE log 
	CASCADE CONSTRAINTS;

/* �˻� �α�(log) */
CREATE TABLE log (
	l_id VARCHAR2(20) NOT NULL, /* l_id(�˻���� ID) */
	m_id VARCHAR2(20) NOT NULL, /* m_id(ȸ�� ID) */
	s_id VARCHAR2(20) NOT NULL /* s_id(���� �ü� ID) */
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

-- 38. �ı� (review)

/* �ı�(review) */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* �ı�(review) */
CREATE TABLE review (
	re_id VARCHAR2(20) NOT NULL, /* re_id(�ı� ID) */
	re_con NVARCHAR2(100) NOT NULL, /* re_con(����) */
	re_name NVARCHAR2(40) NOT NULL, /* re_name */
	re_date DATE DEFAULT SYSDATE NOT NULL, /* re_date(�Է� ��¥) */
	re_sex NUMBER(20) NOT NULL, /* re_sex�������� ȯ�� */
	re_bs NUMBER(20) NOT NULL, /* re_bs(���忩�࿡ ����) */
	re_family NUMBER(20) NOT NULL, /* re_fam(���� ���࿡ ����) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(���� �ü� ID) */
	m_id VARCHAR2(20) NOT NULL /* m_id(ȸ�� ID) */
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


-- 39. ���� (rate)

/* ����(rate) */
DROP TABLE rate 
	CASCADE CONSTRAINTS;

/* ����(rate) */
CREATE TABLE rate (
	rate_id VARCHAR2(20) NOT NULL, /* rate_id(���� ID) */
	r1 NVARCHAR2(30) NOT NULL, /* r1(�׸�1) */
	r2 NVARCHAR2(30) NOT NULL, /* r2(�׸�2) */
	r3 NVARCHAR2(30) NOT NULL, /* r3(�׸�3) */
	r4 NVARCHAR2(30) NOT NULL, /* r4(�׸�4) */
	r5 NVARCHAR2(30) NOT NULL, /* r5(�׸�5) */
	s_id VARCHAR2(20) NOT NULL, /* s_id(���� �ü� ID) */
	m_id VARCHAR2(20) NOT NULL /* m_id(ȸ�� ID) */
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





-- ���**
SELECT * FROM adds;

-- ����**
SELECT * FROM owner;

-- ȸ��**
SELECT * FROM member;

-- ����
SELECT * FROM book;

-- �����
SELECT * FROM bookmore;

-- �������
SELECT * FROM bstate;

-- ����
SELECT * FROM pay;

-- ��������
SELECT * FROM paytype;

-- ��������
SELECT * FROM pstate;

-- ȯ��
SELECT * FROM refund;



-- ���� ���ν���
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
DBMS_OUTPUT.PUT_LINE( '��� ������ ���̵� �Դϴ�.' );
INSERT INTO owner VALUES (vid, vpw, vphone, vname, vsur, vemail);
ELSE
DBMS_OUTPUT.PUT_LINE( '�̹� ��� ���� ���̵� �Դϴ�.' );
END IF;
-- EXCEPTION
END;

EXEC owner_signup( 'abcd1234', 'password', '010-1111-2222', '����', '��', 'abcd1234@gmail.com' );
SELECT * FROM owner;

-- ��� ���ν���
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


EXEC add_adds(10, 'ȣ��', '�޷�', 'ü��X', 'ENA ����Ʈ ȣ�� ���빮' , 'ENA Suite Hotel Namdaemun', '�߱� �������11�� 36, ����Ư����, ����Ư����, 04513', '2022-10-24', 'A6');
SELECT * FROM adds;

DELETE FROM adds WHERE ad_id = 'I6';


-- ������ ���� ���ھ��� �Է�
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


EXEC add_sukbak('I7', 3, 1, '/src/image.png', '�Ƹ��ٿ� ����� ���� ȣ��', 'A56', 'C28'); 
SELECT * FROM sukbak;

-- ���ڽü� ��� Ȯ��
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

-- ȸ������
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
DBMS_OUTPUT.PUT_LINE( '��� ������ ���̵� �Դϴ�.' );
INSERT INTO member VALUES (vid, vemail, vname, vsur, vpw, vrw, vphone);
ELSE
DBMS_OUTPUT.PUT_LINE( '�̹� ��� ���� ���̵� �Դϴ�.' );
END IF;
-- EXCEPTION
END;

EXEC member_signup( 'qwert1234', 'aaa@naver.com', '����', '��', 'ppww', 0, '010-1111-1111');
-- ��밡���� ���̵� �Դϴ�.

-- �α���
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

IF vidCheck = 1 THEN -- ID �����Ѵ�. 
  SELECT m_pw INTO vpwtemp 
  FROM member 
  WHERE m_id = vid; 

  IF vpwtemp = vpw THEN 
    DBMS_OUTPUT.PUT_LINE('�α��� ����'); 
  ELSE 
    DBMS_OUTPUT.PUT_LINE('�α��� ����'); 
  END IF; 
ELSE 
  DBMS_OUTPUT.PUT_LINE('�α��� ����'); 
END IF; 
-- EXCEPTION 
END;

EXEC mem_signin('qwert1234', 'ppww'); --�α��� ����
EXEC mem_signin('qwert1234777', 'ppww7'); -- �α��� ����
EXEC mem_signin('qwert1234', 'ppww7'); --�α��� ����

--��������̺� INSERT, DELETE �� �������̺� ���� �ݾ�+- �ݿ� Ʈ����

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

-- �������̺� ���ν���
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

EXEC book_suk('���������� ���ھ��', 'M1');
EXEC book_suk('���� �Ⱦ� ��Ź�帱�Կ�', 'M2');
EXEC book_suk('��Ʋ �������� ���Ϸ� �����ּ���', 'M3');
EXEC book_suk('������ �������ּ���', 'M4');

SELECT * FROM book;

-- �����
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

-- ���� ���ν���
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

IF vrw_check = 0 THEN -- ������ ��� ����
  IF vpt_id = 'C1' THEN-- ī��
    vps_id := 'BS1'; -- �����Ϸ�
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);
    UPDATE member SET m_rw = m_rw+1 WHERE m_id = vm_id;
    UPDATE book SET bs_id = 'DDS2'; -- ���� ���̺� ����Ϸ�� ����

  ELSIF vpt_id = 'C2' THEN -- �������Ա�
    vps_id := 'BS2'; -- �����̿Ϸ�
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);

  ELSE -- C3 �������
    vps_id := 'BS1'; -- �����Ϸ�
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);
    UPDATE member SET m_rw = m_rw+1 WHERE m_id = vm_id;
    UPDATE book SET bs_id = 'DDS2'; -- ���� ���̺� ����Ϸ�� ����
  END IF;
ELSE -- ������ ���
  SELECT m_id INTO vm_id -- ȸ�����̵� ���ؿ���
  FROM book
  WHERE b_id = vb_id;

  SELECT m_rw INTO vm_rw -- ȸ�������� ���ؿ���
  FROM member
  WHERE m_id = vm_id;

  IF vm_rw >= 10 THEN -- �����尡 10�� �̻��̶��
    vps_id := 'BS1'; -- �����Ϸ�
    vp_cost := vp_cost - 50000;
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, vpt_id, vps_id, vb_id);
    
    vp_cost := 50000;
    vnum := seq_pay.nextval;
    vp_id := 'B' || TO_CHAR(vnum);
    INSERT INTO pay VALUES(vp_id, vp_cost, SYSDATE, vp_bank, vp_name, 'C4', vps_id, vb_id);
    
    UPDATE member SET m_rw = m_rw-10 WHERE m_id = vm_id;
    UPDATE book SET bs_id = 'DDS2'; -- ���� ���̺� ����Ϸ�� ����
  ELSE
    DBMS_OUTPUT.PUT_LINE('������ �� ����');
  END IF;
END IF;
END;

-- ī��
EXEC pay_pay( '0', '0', 'C1', 'DD6', 0 );
-- �������Ա�
EXEC pay_pay( '��������', '������', 'C2', 'DD7', 0);
-- ������
EXEC pay_pay( '0', '0', 'C1', 'DD8', 1);
-- �������
EXEC pay_pay( '0', '0', 'C3', 'DD9', 0);

SELECT * FROM bookmore;
SELECT * FROM book;
SELECT * FROM pay;
SELECT * FROM member2;

-- ������ȸ
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

-- ȯ��
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


IF TO_DATE(vbm_in, 'YYYY-MM-DD') - TO_DATE(SYSDATE, 'YYYY-MM-DD') >= 3 THEN -- 3�� �Ѱ� ���� ���
  vnum := seq_rf.nextval;
  vrf_id := 'F' || TO_CHAR(vnum);
  
  SELECT b_id INTO vb_id
  FROM bookmore
  WHERE bm_id = vbm_id;
  
  SELECT p_id INTO vp_id
  FROM pay
  WHERE b_id = vb_id and ps_id = 'BS1'; --�����Ϸ���¸� ��������, �ϳ��ۿ� �����ϱ�

  SELECT m_id INTO vm_id
  FROM book
  WHERE b_id = vb_id;
  
  INSERT INTO refund VALUES (vrf_id, SYSDATE, vp_id);
  UPDATE pay SET ps_id = 'BS3' WHERE p_id = vp_id;  -- �������
  UPDATE book SET bs_id = 'DDS3' WHERE b_id = vb_id;  -- �������
  UPDATE member SET m_rw = m_rw-1 WHERE m_id = vm_id; -- ������ -1
ELSE
  DBMS_OUTPUT.PUT_LINE('ȯ�� �Ұ�');
END IF;
END;

EXEC pay_refund('DDW28');
SELECT * FROM refund;


-- ��������Ұ�
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
  -- üũ�� üũ�ƿ� ��¥ ����
  UPDATE bookmore SET bm_in = vdate_in WHERE bm_id = vbm_id;
  UPDATE bookmore SET bm_out = vdate_out WHERE bm_id = vbm_id;
  
  -- ���� ���̺� �ѱݾ� ����
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
  DBMS_OUTPUT.PUT_LINE('���� ���� �Ұ�');
END IF;
END;

EXEC book_edit('DDW23', '20221222', '20221230');  -- ��������Ұ��� ���;���
EXEC book_edit('DDW24', '20241222', '20241230');  -- ��������Ǿ����

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


-- ���� ���ν���
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

EXEC room_add('��', 50000, 0, 1, 50, 601, 'H10');
SELECT * FROM room;


select * from pstate;
select * from bstate;
select * from member2;



