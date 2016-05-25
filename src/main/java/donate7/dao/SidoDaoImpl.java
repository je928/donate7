package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.SidoGugun;
@Repository
public class SidoDaoImpl implements SidoDao {
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

}
