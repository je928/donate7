package donate7.dao;

import java.util.List;

import donate7.model.Recruit;

public interface VolDao {

	int insertRc(Recruit rc);
	/*int volReqInsert(VolReq req);
	List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No);
	VolReq selectByVt_No(int vt_No);
	int updateVolReq(VolReq volReq);
	List<VolReq> volReqList();
	List<VolReqSearch> searchList();*/
	Recruit selectRcByVt_no(int vt_no);
	int rcUpdate(Recruit rc);
	List<Recruit> selectRcList(Recruit rc);
	int selectRcTotal(int vt_o_no);
}
