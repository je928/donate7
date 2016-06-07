package donate7.service;

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
}