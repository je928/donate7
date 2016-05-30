package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Dclass;
import donate7.model.SidoGugun;
import donate7.model.Subject;

@Repository
public class CommDaoImpl implements CommDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<SidoGugun> selectSido() {
		return session.selectList("sido.selectSidoList");
	}
	@Override
	public List<SidoGugun> selectGugunBySido_No(int sido_no) {
		return session.selectList("sido.selectGugunListBySido_No",sido_no);
	}
	@Override
	public List<Class> selectClass() {
		return session.selectList("class.selectClass");
	}
	@Override
	public List<Dclass> selectDclassByClass_no(int class_no) {
		return session.selectList("dclass.selectDclass",class_no);
	}
	@Override
	public List<Subject> selectSubject() {
		return session.selectList("subject.selectSubject");
	}
}
