package donate7.service;

import java.util.List;

import donate7.model.Warning;

public interface WarningService {
	int insert(Warning warning);

	List<Warning> list(int startRow, int endRow, int m_no);

	int getTotal(int m_no);
}
