package donate7.service;

import java.util.HashMap;
import java.util.List;

import donate7.model.Applicant;
import donate7.model.Recruit;
import donate7.model.Rqn;
import donate7.model.VolResult;

public interface VolService {

	int insertRc(Recruit rc);
	/*int volReqInsert(VolReq req);
	List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No);
	VolReq SelectByVt_No(int vt_No);
	int updateVolReq(VolReq volReq);
	List<VolReq> volReqList();
	List<VolReqSearch> searchList();*/
	Recruit selectRcByVt_no(int vt_no);
	int rcUpdate(Recruit rc);
	List<Recruit> selectRcList(Recruit rc);
	int selectRcTotal(Recruit rc);
	int insertRqn(Rqn rqn);
	List<Recruit> selectRqnList(Recruit rc);
	List<Applicant> selectApplicant(int vt_no);
	int selectRqn(Rqn rqn);
	int updateYn(HashMap<String, Object> hm);
	int selectAppCount(int vt_no);
	int updateSelYn(int vt_no);
	int deledteRqn(Rqn rqn);
	int insertVolResult(List<HashMap<String, Integer>> list);
	int selectNewVolNo();
	int resultChk(int vt_no);
	List<VolResult> selectVolResult(int vt_no);
	List<Recruit> selectRqnListfinish(Recruit rc);
}
