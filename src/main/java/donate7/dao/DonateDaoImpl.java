package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Donate;
@Repository
public class DonateDaoImpl implements DonateDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int mdoReqInsert(Donate donate) {
		int d_no = session.selectOne("donate.selectNum");
		donate.setD_no(d_no);
		return session.insert("donate.mdoReqInsert",donate);
	}
	public List<Donate> list() {
		return session.selectList("donate.mdoList");
	}
	public Donate selectOne(int d_no) {
		return session.selectOne("donate.selectOne",d_no);
	}
	public int mdoUpdate(Donate donate) {
		System.out.println(donate);
		return session.update("donate.mdoUpdate",donate);
	}
}
