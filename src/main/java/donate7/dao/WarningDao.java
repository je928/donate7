package donate7.dao;

import java.util.List;

import donate7.model.Warning;

public interface WarningDao {
	int insert(Warning warning);

	List<Warning> list(int startRow, int endRow, int m_no, String sort);

	int getTotal(Warning warning);

	Warning selectOne(int wa_no);
}
