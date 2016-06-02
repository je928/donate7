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
	public List<Donate> mlist(int no) {
		return dd.mlist(no);
	}
	public Donate selectOne(int d_no) {
		return dd.selectOne(d_no);
	}
	public int mdoUpdate(Donate donate) {
		return dd.mdoUpdate(donate);
	}
	public void mdoDelete(int d_no) {
		dd.mdoDelete(d_no);
	}
	public List<Donate> olist(int no) {
		return dd.olist(no);
	}
	public int odoReqInsert(Donate donate) {
		return dd.odoReqInsert(donate);
	}
	public int odoUpdate(Donate donate) {
		return dd.odoUpdate(donate);
	}
	public void odoDelete(int d_no) {
		dd.odoDelete(d_no);
	}
	public int count(Donate donate) {
		return dd.count(donate);
	}
	public List<Donate> adlist() {
		return dd.adlist();
	}
	public int adUpdate(int d_no) {
		return dd.adUpdate(d_no);
	}
	public int adDelete(int d_no) {
		return dd.adDelete(d_no);
	}
	public List<Donate> doList() {
		return dd.doList();
	}

}
