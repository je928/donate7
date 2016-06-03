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

	public List<Second> mlist(int no) {
		return sd.mlist(no);
	}

	public List<Second> olist(int no) {
		return sd.olist(no);
	}

	public List<Second> adlist() {
		return sd.adlist();
	}
	public int msecondUpdate(Second second) {
		return sd.secondUpdate(second);
	}

	public int count(int no) {
		return sd.count(no);
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


}
