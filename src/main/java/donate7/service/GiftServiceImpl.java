package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.GiftDao;
import donate7.model.Gift;
@Service
public class GiftServiceImpl implements GiftService{
	@Autowired
	private GiftDao gd;
	public int insert(Gift gift) {
		return gd.insert(gift);
	}
	public List<Gift> list() {
		return gd.list();
	}
	public Gift selectOne(int g_no) {
		return gd.selectOne(g_no);
	}

}
