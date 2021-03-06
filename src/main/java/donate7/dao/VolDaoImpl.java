package donate7.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Applicant;
import donate7.model.Recruit;
import donate7.model.Rqn;
import donate7.model.VolResult;

@Repository
public class VolDaoImpl implements VolDao {
	@Autowired
	private SqlSessionTemplate session;
	/*
	 * @Override public int volReqInsert(VolReq req) { System.out.println(req);
	 * return session.insert("volReq.reqInsert",req); }
	 * 
	 * @Override public List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No) {
	 * return session.selectList("volReq.reqListByO_no",vt_Reg_O_No); }
	 * 
	 * @Override public VolReq selectByVt_No(int vt_No) { return
	 * session.selectOne("volReq.selectByVt_No",vt_No); }
	 * 
	 * @Override public int updateVolReq(VolReq volReq) { return
	 * session.update("volReq.updateVolReq",volReq); }
	 * 
	 * @Override public List<VolReq> volReqList() { return
	 * session.selectList("volReq.selectListVolReq"); }
	 * 
	 * @Override public List<VolReqSearch> searchList() { return
	 * session.selectList("volReqSearch.searchVolReq"); }
	 */

	@Override
	public int insertRc(Recruit rc) {
		System.out.println("rc : " + rc);
		return session.insert("recruit.insertRc", rc);
	}

	@Override
	public Recruit selectRcByVt_no(int vt_no) {
		return session.selectOne("recruit.selectRcByVt_no", vt_no);
	}

	@Override
	public int rcUpdate(Recruit rc) {
		return session.update("recruit.rcUpdate", rc);
	}

	@Override
	public List<Recruit> selectRcList(Recruit rc) {
		System.out.println(rc);
		List<Recruit> list = session.selectList("recruit.selectRcList", rc);
		System.out.println("size : " + list.size());
		return list;
	}

	@Override
	public int selectRcTotal(Recruit rc) {
		System.out.println(rc);
		int result = session.selectOne("recruit.selectRcTotal", rc);
		System.out.println("result : " + result);
		return result;
	}

	@Override
	public int insertRqn(Rqn rqn) {
		int result = session.insert("rqn.insertRqn", rqn);
		return result;
	}
	
	public int selectRqnTotal(Recruit rc) {
		int total = session.selectOne("recruit.selectRqnTotal", rc);
		return total;
	}

	@Override
	public List<Recruit> selectRqnList(Recruit rc) {
		List<Recruit> list = session.selectList("recruit.selectRqnList", rc);
		return list;
	}
	
	@Override
	public int selectRqn(Rqn rqn) {
		int result = session.selectOne("rqn.selectRqn", rqn);
		System.out.println("result22  =" + result);
		return result;
	}
	
	public List<Applicant> selectApplicant(int vt_no) {
		return session.selectList("applicant.selectApplicant", vt_no);
	}


	@Override
	public int updateYn(HashMap<String, Object> hm) {
		return session.update("applicant.updateYn", hm);
	}

	@Override
	public int selectAppCount(int vt_no) {
		return session.selectOne("applicant.selectAppCount", vt_no);
	}

	@Override
	public int updateSelYn(int vt_no) {
		return session.update("applicant.updateSelYn", vt_no);
	}
	public int deleteRqn(Rqn rqn) {
		int result = session.delete("rqn.deleteRqn", rqn);
		System.out.println("result33 = "+ result);
		return result;
	}

	@Override
	public int insertVolResult(List<HashMap<String, Integer>> list) {
		return session.insert("volResult.insertVolResult",list);
	}

	@Override
	public int selectNewVolNo() {
		return session.selectOne("volResult.selectNewVolNo");
	}

	@Override
	public int resultChk(int vt_no) {
		int result = session.selectOne("volResult.resultChk", vt_no);
		System.out.println("chk : " + result);
		return result;
	}

	@Override
	public List<VolResult> selectVolResult(int vt_no) {
		return session.selectList("volResult.selectVolResult",vt_no);
	}

	@Override
	public int Vt_TimeTotal(int vt_no) {
		int total = session.selectOne("volResult.Vt_TimeTotal", vt_no);
		return total;
	}

	@Override
	public List<Recruit> mainList(Recruit rc) {
		List<Recruit> list = session.selectList("recruit.mainList", rc);
		return list;
	}

}
