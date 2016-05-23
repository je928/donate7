package donate7.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.VolReq;

@Repository
public class VolDaoImpl implements VolDao{
	@Autowired
	private SqlSessionTemplate session;
	@Override
	public int volReqInsert(VolReq req) {
		System.out.println(req);
		return session.insert("volReq.reqInsert",req);
	}
}
