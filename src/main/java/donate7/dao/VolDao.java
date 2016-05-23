package donate7.dao;

import java.util.List;

import donate7.model.VolReq;

public interface VolDao {
	int volReqInsert(VolReq req);
	List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No);
	VolReq selectByVt_No(int vt_No);
}
