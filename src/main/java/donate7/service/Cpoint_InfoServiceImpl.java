package donate7.service;

import java.util.List;

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
	public int insert(Cpoint_info ci) {
		return cid.insert(ci);
	}
	public int getTotal(Cpoint_info ci) {
		return cid.getTotal(ci);
	}
	public List<Cpoint_info> list(int startRow, int endRow, int m_no) {
		return cid.list(startRow, endRow, m_no);
	}
	public int sumCash(int m_no) {
		return cid.sumCash(m_no);
	}

}
