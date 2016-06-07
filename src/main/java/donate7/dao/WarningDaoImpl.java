package donate7.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Warning;
@Repository
public class WarningDaoImpl implements WarningDao{
	@Autowired
	private SqlSessionTemplate st;
	public int insert(Warning warning) {
		return st.insert("warning.insert",warning);
	}
}