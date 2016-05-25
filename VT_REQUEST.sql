DROP TABLE VT_REQUEST;

CREATE TABLE VT_REQUEST(
  VT_NO			    NUMBER PRIMARY KEY,
  VT_NAME			VARCHAR2(70) NOT NULL,
  VT_REG_O_NO		NUMBER NOT NULL,
  VT_REG_DATE		DATE NOT NULL,
  VT_SUBJECT		VARCHAR2(50) NOT NULL,
  VT_TOTAL			NUMBER NOT NULL,
  VT_FIELD			CHAR(1) NOT NULL,
  VT_CYCLE			CHAR(1) NOT NULL,
  VT_START_DATE		VARCHAR2(8) NOT NULL,
  VT_END_DATE		VARCHAR2(8) NOT NULL,
  VT_DESC			VARCHAR2(4000) NOT NULL,
  VT_MGR			VARCHAR2(20) NOT NULL,
  VT_MGR_TEL		VARCHAR2(20) NOT NULL,
  VT_MGR_EMAIL		VARCHAR2(30),
  VT_AGE		  	VARCHAR2(20),
  VT_GENDER			VARCHAR2(20),
  VT_QUALIFY		VARCHAR2(200),
  VT_PRIOR_EDU		VARCHAR2(200),
  VT_RECRUIT_YN		CHAR(1) DEFAULT 'N'
);

SELECT * FROM VT_REQUEST;