package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.VolDao;
import donate7.model.Recruit;
@Service
public class VolServiceImpl implements VolService {
	@Autowired
	VolDao vd;

	@Override
	public int insertRc(Recruit rc) {
		return vd.insertRc(rc);
	}

	@Override
	public List<Recruit> selectRcListByO_no(int o_no) {
		return vd.selectRcListByO_no(o_no);
	}
	
	/*@Override
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

	@Override
	public int updateVolReq(VolReq volReq) {
		return vd.updateVolReq(volReq);
	}

	@Override
	public List<VolReq> volReqList() {
		return vd.volReqList();
	}

	@Override
	public List<VolReqSearch> searchList() {
		return vd.searchList();
	}*/

}
