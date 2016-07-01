package donate7.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.VolDao;
import donate7.model.Applicant;
import donate7.model.Recruit;
import donate7.model.Rqn;
import donate7.model.VolResult;
@Service
public class VolServiceImpl implements VolService {
	@Autowired
	VolDao vd;

	@Override
	public int insertRc(Recruit rc) {
		return vd.insertRc(rc);
	}

	@Override
	public Recruit selectRcByVt_no(int vt_no) {
		return vd.selectRcByVt_no(vt_no);
	}

	@Override
	public int rcUpdate(Recruit rc) {
		return vd.rcUpdate(rc);
	}

	@Override
	public List<Recruit> selectRcList(Recruit rc) {
		return vd.selectRcList(rc);
	}

	@Override
	public int selectRcTotal(Recruit rc) {
		return vd.selectRcTotal(rc);
	}

	@Override
	public int insertRqn(Rqn rqn) {
		return vd.insertRqn(rqn);
	}

	@Override
	public int selectRqnTotal(Recruit rc) {
		return vd.selectRqnTotal(rc);
	}
	
	@Override
	public List<Recruit> selectRqnList(Recruit rc) {
		return vd.selectRqnList(rc);
	}

	@Override
	public List<Applicant> selectApplicant(int vt_no) {
		return vd.selectApplicant(vt_no);
	}
	@Override
	public int selectRqn(Rqn rqn) {
		return vd.selectRqn(rqn);
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

	
	@Override
	public int selectAppCount(int vt_no) {
		return vd.selectAppCount(vt_no);
	}

	@Override
	public int updateSelYn(int vt_no) {
		return vd.updateSelYn(vt_no);
	}

	public int deledteRqn(Rqn rqn) {
		return vd.deleteRqn(rqn);
	}

	@Override
	public int updateYn(HashMap<String, Object> hm) {
		return vd.updateYn(hm);
	}

	@Override
	public int insertVolResult(List<HashMap<String, Integer>> list) {
		return vd.insertVolResult(list);
	}

	@Override
	public int selectNewVolNo() {
		return vd.selectNewVolNo();
	}

	@Override
	public int resultChk(int vt_no) {
		return vd.resultChk(vt_no);
		
	}

	@Override
	public List<VolResult> selectVolResult(int vt_no) {
		return vd.selectVolResult(vt_no);
	}

}
