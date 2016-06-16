package donate7.dao;

import java.util.List;

import donate7.model.Gift_Buy;

public interface Gift_BuyDao {
	int getGift(Gift_Buy gb);

	List<Gift_Buy> ownList(int m_no, int endRow, int m_no2);

	Gift_Buy selectOne(int gb_no);

	int getTotal();
}
