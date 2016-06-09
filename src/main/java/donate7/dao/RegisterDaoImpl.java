package donate7.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Register;
@Repository
public class RegisterDaoImpl implements RegisterDao{
	@Autowired
	private SqlSessionTemplate st;
	public int insert(Register register) {
		int re_no = st.selectOne("register.selectNum");
		register.setRe_no(re_no);
		return st.insert("register.insert",register);
	}
	public List<Register> list(int startRow, int endRow, int m_no, String sort) {
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("m_no", m_no);
		hashMap.put("re_chk", sort);
		return st.selectList("register.list",hashMap);
	}
	public Register selectOne(int re_no) {
		return st.selectOne("register.selectOne",re_no);
	}
	public int updateChk(HashMap<Object, Object> hashMap) {
		return st.update("register.updateChk",hashMap);
	}
	public int getTotal(Register reg) {
		return st.selectOne("register.getTotal",reg);
	}
}