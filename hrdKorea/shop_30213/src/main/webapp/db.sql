CREATE TABLE tbl_member (
	pk_member VARCHAR2(5) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	grade VARCHAR2(255),
	PRIMARY KEY(pk_member)
);

INSERT INTO tbl_member VALUES ('M0001', '홍길동', '의적');
INSERT INTO tbl_member VALUES ('M0002', '심청', '효녀');
INSERT INTO tbl_member VALUES ('M0003', '세종', '대왕');
INSERT INTO tbl_member VALUES ('M0004', '이순신', '장군');
INSERT INTO tbl_member VALUES ('M0005', '장영실', '과학자');

CREATE TABLE tbl_schedule (
	pk_schedule NUMBER(5) NOT NULL,
	do_date DATE NOT NULL,
	do_memo VARCHAR2(100) NOT NULL,
	fk_member VARCHAR2(5) NOT NULL,
	PRIMARY KEY(pk_schedule),
	FOREIGN KEY (fk_member) REFERENCES tbl_member (pk_member)
);

INSERT INTO tbl_schedule VALUES ('1', '20250101', '탐관오리 찾기', 'M0001');
INSERT INTO tbl_schedule VALUES ('2', '20250201', '아버지 돌보기', 'M0002');
INSERT INTO tbl_schedule VALUES ('3', '20250301', '한글 창제', 'M0003');
INSERT INTO tbl_schedule VALUES ('4', '20250401', '거북선으로 국사 수호', 'M0004');

SELECT * FROM tbl_member;
SELECT * FROM tbl_schedule;

DROP TABLE tbl_member cascade constraint;
DROP TABLE tbl_schedule;


select * from user_tab_columns where table_name ='TBL_SCHEDULE';

SELECT COLUMN_NAME, COMMENTS 
FROM USER_COL_COMMENTS 
WHERE TABLE_NAME = 'TBL_SCHEDULE';

SELECT 
    CONSTRAINT_NAME, CONSTRAINT_TYPE 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'TBL_SCHEDULE';
