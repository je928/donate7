package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.dao.SecondDao;
import donate7.model.Second;
@Repository
public class SecondServiceImpl implements SecondService{
	@Autowired
	private SecondDao sd;
	
	
	public Second selectOne(int sh_no) {

		return sd.selectOne(sh_no);
	}

	public int insert(Second second) {

		return sd.insert(second);
	}

	public List<Second> mlist(Second second) {
		return sd.mlist(second);
	}

	public List<Second> olist(Second second) {
		return sd.olist(second);
	}

	public List<Second> adlist(Second second) {
		return sd.adlist(second);
	}
	public int msecondUpdate(Second second) {
		return sd.secondUpdate(second);
	}

	public int count(Second second) {
		return sd.count(second);
	}

	public void msdelete(int sh_no) {
		sd.delete(sh_no);
		
	}

	public int spUpdate(int sh_no) {
		return sd.spUpdate(sh_no);
	}

	public void spCancel(int sh_no) {
		sd.spCancel(sh_no);
		
	}

	public int srUpdate(int sh_no) {
		return sd.srUpdate(sh_no);
	}

	public void srCancel(int sh_no) {
		sd.srCancel(sh_no);
	}

	public int getTotal(Second second) {
		return sd.getTotal(second);
	}


}
