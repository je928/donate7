package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.Product_buyDao;
import donate7.model.Cpoint_info;
import donate7.model.Product;
import donate7.model.Product_buy;

@Service
public class Product_buyServiceImpl implements Product_buyService {
	@Autowired
	Product_buyDao pd;

	public List<Product_buy> list(int startRow, int endRow, int pb_mono, Product_buy pb) {
		return pd.list(startRow, endRow, pb_mono, pb);
	}
	
	public List<Product_buy> listAll(Product_buy pb, int pb_mono) {
		return pd.listAll(pb,pb_mono);
	}
	
	public String Nick(int no) {
		return pd.Nick(no);
	}

	public Product selectOne(int pr_no) {
		return pd.selectOne(pr_no);
	}

	public int insert(Product_buy pb) {
		return pd.insert(pb);
	}

	public Product_buy select(int pb_no) {
		return pd.select(pb_no);
	}

	public int update(int pr_no, int qty) {
		return pd.update(pr_no,qty);
	}

	public int mtotal(int pb_no) {
		return pd.mtotal(pb_no);
	}

	public int atotal(Product_buy pb) {
		return pd.atotal(pb);
	}

	public int yupdate(int pb_no) {
		return pd.yupdate(pb_no);
	}

	public int oupdate(int pb_no) {
		return pd.oupdate(pb_no);
	}




}
