package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.Gift_BuyDao;
import donate7.model.Gift_Buy;
@Service
public class Gift_BuyServiceImpl implements Gift_BuyService{
	@Autowired
	private Gift_BuyDao gd;
	public int getGift(Gift_Buy gb) {
		return gd.getGift(gb);
	}
	public List<Gift_Buy> ownList(int m_no) {
		return gd.ownList(m_no);
	}

}
