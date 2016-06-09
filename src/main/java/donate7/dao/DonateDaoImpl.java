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
	public List<Donate> mlist(int no) {
		return session.selectList("donate.mdoList",no);
	}
	public Donate selectOne(int d_no) {
		return session.selectOne("donate.selectOne",d_no);
	}
	public int mdoUpdate(Donate donate) {
		return session.update("donate.mdoUpdate",donate);
	}
	public void mdoDelete(int d_no) {
		session.selectOne("donate.mdoDelete", d_no);
		
	}
	public List<Donate> olist(Donate donate) {
		return session.selectList("donate.odoList",donate);
	}
	public int odoReqInsert(Donate donate) {
		int d_no = session.selectOne("donate.selectNum");
		donate.setD_no(d_no);
		return session.insert("donate.odoReqInsert",donate);
	}
	public int odoUpdate(Donate donate) {
		return session.update("donate.odoUpdate",donate);
	}
	public void odoDelete(int d_no) {
		session.selectOne("donate.odoDelete",d_no);
	}
	public int count(Donate donate) {
		return session.selectOne("donate.count",donate);
	}
	public List<Donate> adlist() {
		return session.selectList("donate.adList");
	}
	public int adUpdate(int d_no) {
		return session.update("donate.adUpdate",d_no);
	}
	public int adDelete(int d_no) {
		return session.update("donate.adDelete",d_no);
	}
	public List<Donate> doList() {
		return session.selectList("donate.doList");
	}
	public int getTotal(Donate donate) {
		return session.selectOne("donate.getTotal",donate);
	}
	public int memTotal(Donate donate) {
		return session.selectOne("donate.memTotal",donate);
	}
	public List<Donate> memAll(Donate donate) {
		return session.selectList("donate.memAll",donate);
	}
	public int orTotal(Donate donate) {
		return session.selectOne("donate.orTotal",donate);
	}
	public List<Donate> orAll(Donate donate) {
		return session.selectList("donate.orAll",donate);
	}
}
