package donate7.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.Cpoint_InfoDao;
import donate7.model.Cpoint_info;

@Service
public class Cpoint_InfoServiceImpl implements Cpoint_InfoService {
	@Autowired
	private Cpoint_InfoDao cid;
	public int sumPoint(int m_no) {
		return cid.sumPoint(m_no);
	}
	public int buyGift(Cpoint_info ci) {
		return cid.buyGift(ci);
	}

}
