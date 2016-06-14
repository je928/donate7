package donate7.dao;

import java.util.HashMap;
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
	public List<Gift> list(int startRow, int endRow) {
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		return st.selectList("gift.list",hashMap);
	}
	public Gift selectOne(int g_no) {
		return st.selectOne("gift.selectOne",g_no);
	}
	public int delete(int g_no) {
		return st.update("gift.delete",g_no);
	}
	public int getTotal() {
		return st.selectOne("gift.getTotal");
	}

}
