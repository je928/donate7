package donate7.dao;

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

}
