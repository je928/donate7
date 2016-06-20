package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.WarningDao;
import donate7.model.Warning;
@Service
public class WarningServiceImpl implements WarningService{
	@Autowired
	private WarningDao wd;
	public int insert(Warning warning) {
		return wd.insert(warning);
	}
	public int getTotal(Warning warning) {
		return wd.getTotal(warning);
	}
	public List<Warning> list(int startRow, int endRow, int m_no, String sort) {
		return wd.list(startRow,endRow,m_no,sort);
	}
}