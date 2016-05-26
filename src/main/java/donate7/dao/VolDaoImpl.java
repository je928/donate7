package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.VolReq;
import donate7.model.VolReqSearch;

@Repository
public class VolDaoImpl implements VolDao{
	@Autowired
	private SqlSessionTemplate session;
	@Override
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
	}
}
