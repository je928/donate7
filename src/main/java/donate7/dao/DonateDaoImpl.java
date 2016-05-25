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
	
	@Override
	public int mdoReqInsert(Donate donate) {
		return session.insert("donate.mdoReqInsert",donate);
	}
	@Override
	public List<Donate> list() {
		return session.selectList("donate.mdoList");
	}

}
