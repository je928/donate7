package donate7.service;

import java.util.List;

import donate7.model.Warning;

public interface WarningService {
	int insert(Warning warning);

	List<Warning> list(int startRow, int endRow, int m_no, String sort);

	int getTotal(Warning warn);

	Warning selectOne(int wa_no);
	
	int getSum(Warning warn);
}
