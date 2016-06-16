package donate7.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Gift_Buy;
@Repository
public class Gift_BuyDaoImpl implements Gift_BuyDao{
	@Autowired
	private SqlSessionTemplate st;
	public int getGift(Gift_Buy gb) {
		int gb_no = st.selectOne("gift_buy.selectNum");
		gb.setGb_no(gb_no);
		return st.insert("gift_buy.insert",gb);
	}
	public List<Gift_Buy> ownList(int startRow, int endRow, int m_no) {
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("m_no", m_no);
		return st.selectList("gift_buy.ownList",hashMap);
	}
	public Gift_Buy selectOne(int gb_no) {
		return st.selectOne("gift_buy.selectOne",gb_no);
	}
	public int getTotal() {
		return st.selectOne("gift_buy.getTotal");
	}

}
