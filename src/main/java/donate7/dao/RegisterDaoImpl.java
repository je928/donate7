package donate7.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Register;
@Repository
public class RegisterDaoImpl implements RegisterDao{
	@Autowired
	private SqlSessionTemplate st;
	public int insert(Register register) {
		int re_no = st.insert("register.selectNum");
		register.setRe_no(re_no);
		return st.insert("register.insert",register);
	}

}
