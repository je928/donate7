package donate7.service;

import java.util.List;

import donate7.model.Recruit;
import donate7.model.Rqn;

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
	int selectRqn(Rqn rqn);
}
