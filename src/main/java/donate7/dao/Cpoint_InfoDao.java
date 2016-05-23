package donate7.dao;

import donate7.model.Cpoint_info;

public interface Cpoint_InfoDao {
	int sumPoint(int m_no);

	int buyGift(Cpoint_info ci);
}
