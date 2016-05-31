package donate7.service;

import java.util.List;

import donate7.model.Recruit;

public interface VolService {

	int insertRc(Recruit rc);
	/*int volReqInsert(VolReq req);
	List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No);
	VolReq SelectByVt_No(int vt_No);
	int updateVolReq(VolReq volReq);
	List<VolReq> volReqList();
	List<VolReqSearch> searchList();*/
	List<Recruit> selectRcListByO_no(int o_no);
	Recruit selectRcByVt_no(int vt_no);
	int rcUpdate(Recruit rc);
	
}
