package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Recruit;

@Repository
public class VolDaoImpl implements VolDao{
	@Autowired
	private SqlSessionTemplate session;
	/*@Override
	public int volReqInsert(VolReq req) {
		System.out.println(req);
		return session.insert("volReq.reqInsert",req);
	}
	
	@Override
	public List<VolReq> volListByVt_Reg_O_No(int vt_Reg_O_No) {
		return session.selectList("volReq.reqListByO_no",vt_Reg_O_No);
	}
	@Override
	public VolReq selectByVt_No(int vt_No) {
		return session.selectOne("volReq.selectByVt_No",vt_No);
	}
	@Override
	public int updateVolReq(VolReq volReq) {
		return session.update("volReq.updateVolReq",volReq);
	}

	@Override
	public List<VolReq> volReqList() {
		return session.selectList("volReq.selectListVolReq");
	}

	@Override
	public List<VolReqSearch> searchList() {
		return session.selectList("volReqSearch.searchVolReq");
	}*/

	@Override
	public int insertRc(Recruit rc) {
		System.out.println("rc : " + rc);
		return session.insert("recruit.insertRc",rc);
	}


	@Override
	public Recruit selectRcByVt_no(int vt_no) {
		return session.selectOne("recruit.selectRcByVt_no",vt_no);
	}

	@Override
	public int rcUpdate(Recruit rc) {
		return session.update("recruit.rcUpdate",rc);
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
		int result = session.selectOne("recruit.selectRcTotal",rc);
		System.out.println("result : " + result);
		return result;
	}

}
