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

	public List<Second> mlist() {
		return sd.mlist();
	}

	public List<Second> olist() {
		return sd.olist();
	}

	public List<Second> adlist() {
		return sd.adlist();
	}

}