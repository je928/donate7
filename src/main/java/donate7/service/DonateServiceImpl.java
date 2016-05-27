package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.DonateDao;
import donate7.model.Donate;
@Service
public class DonateServiceImpl implements DonateService {
	@Autowired
	private DonateDao dd;
	
	public int mdoReqInsert(Donate donate) {
		return dd.mdoReqInsert(donate);
	}
	public List<Donate> list() {
		return dd.list();
	}
	public Donate selectOne(int d_no) {
		return dd.selectOne(d_no);
	}
	public int mdoUpdate(Donate donate) {
		return dd.mdoUpdate(donate);
	}

}
