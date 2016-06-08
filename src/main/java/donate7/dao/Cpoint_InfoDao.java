package donate7.dao;

import java.util.List;

import donate7.model.Cpoint_info;

public interface Cpoint_InfoDao {
	int sumPoint(int m_no);

	int insert(Cpoint_info ci);

	int getTotal(Cpoint_info ci);

	List<Cpoint_info> list(int startRow, int endRow, int m_no,String sort);

	int sumCash(int m_no);
}
