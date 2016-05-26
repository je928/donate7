CREATE OR REPLACE VIEW SEARCH_VOLREQ_V
AS
SELECT R.*,regexp_substr(O.O_ADDR, '[^ ]+', 1, 2)||' '||regexp_substr(O.O_ADDR, '[^ ]+', 1, 3) addr,
nvl(V.reqcount,0) reqcount FROM VT_REQUEST R, ORGAN O, 
(SELECT VT_REQ_NO,COUNT(*) reqcount FROM VT_VOLREQ GROUP BY VT_REQ_NO) V 
WHERE R.VT_NO = V.VT_REQ_NO(+) AND R.VT_REG_O_NO = O.O_NO;