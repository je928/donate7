create or replace FUNCTION NEW_VT_NO
RETURN NUMBER
IS
  V_RESULT NUMBER;
BEGIN
  SELECT 
    NVL(MAX(VT_NO),0)+1
  INTO
    V_RESULT
  FROM VT_RECRUIT;
  
  RETURN V_RESULT;
END;
--봉사 요청 신규 번호 함수

create or replace FUNCTION NEW_VT_RQN_NO
RETURN NUMBER
IS
  V_RESULT NUMBER;
BEGIN
  SELECT 
    NVL(MAX(VT_RQN_NO),0)+1
  INTO
    V_RESULT
  FROM VT_RQN;
  
  RETURN V_RESULT;
END;
--VT_RQN 신규 번호 함수

create or replace FUNCTION NEW_VT_VOL_NO
RETURN NUMBER
IS
  V_RESULT NUMBER;
BEGIN
  SELECT 
    NVL(MAX(VT_VOL_NO),0)+1
  INTO
    V_RESULT
  FROM VT_VOL;
  
  RETURN V_RESULT;
END;
--VT_VOL 신규 번호 함수