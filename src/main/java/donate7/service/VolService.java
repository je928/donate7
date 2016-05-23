package donate7.service;

import java.util.List;

import donate7.model.VolReq;

public interface VolService {
	int volReqInsert(VolReq req);
	List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No);
	VolReq SelectByVt_No(int vt_No);
}
