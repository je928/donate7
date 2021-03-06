package donate7.service;

import java.util.List;

import donate7.model.Gift_Buy;

public interface Gift_BuyService {
	int getGift(Gift_Buy gb);

	List<Gift_Buy> ownList(int startRow, int endRow, int m_no);

	Gift_Buy selectOne(int gb_no);

	int getTotal(int m_no);
}
