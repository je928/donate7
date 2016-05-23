package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.VolDao;
import donate7.model.VolReq;
@Service
public class VolServiceImpl implements VolService {
	@Autowired
	VolDao vd;
	
	@Override
	public int volReqInsert(VolReq req) {
		return vd.volReqInsert(req);
	}

	@Override
	public List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No) {
		return vd.volListByVt_Reg_O_No(vt_Reg_O_No);
	}

	@Override
	public VolReq SelectByVt_No(int vt_No) {
		return vd.selectByVt_No(vt_No);
	}

}
