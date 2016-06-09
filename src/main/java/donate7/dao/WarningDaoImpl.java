package donate7.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Warning;
@Repository
public class WarningDaoImpl implements WarningDao{
	@Autowired
	private SqlSessionTemplate st;
	public int insert(Warning warning) {
		int wa_no = st.selectOne("warning.selectNum");
		warning.setWa_no(wa_no);
		return st.insert("warning.insert",warning);
	}
	public int getTotal(Warning warning) {
		return st.selectOne("warning.getTotal",warning);
	}
	public List<Warning> list(int startRow, int endRow, int m_no, String sort) {
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("m_no", m_no);
		hashMap.put("wa_sort", sort);
		return st.selectList("warning.list",hashMap);
	}
}