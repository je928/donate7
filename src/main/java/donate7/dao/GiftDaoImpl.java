package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Gift;
@Repository
public class GiftDaoImpl implements GiftDao{
	@Autowired
	private SqlSessionTemplate st;
	public int insert(Gift gift) {
		int g_no = st.selectOne("gift.selectNum");
		gift.setG_no(g_no);
		return st.insert("gift.insertGift",gift);
	}
	public List<Gift> list() {
		return st.selectList("gift.list");
	}
	public Gift selectOne(int g_no) {
		return st.selectOne("gift.selectOne",g_no);
	}

}
