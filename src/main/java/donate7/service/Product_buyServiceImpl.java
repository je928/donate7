package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.Product_buyDao;
import donate7.model.Product;
import donate7.model.Product_buy;

@Service
public class Product_buyServiceImpl implements Product_buyService {
	@Autowired
	Product_buyDao pd;

	public List<Product_buy> list(int pb_no) {
		return pd.list(pb_no);
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

	public List<Product_buy> listAll() {
		return pd.listAll();
	}

	public Product_buy select(int pb_no) {
		return pd.select(pb_no);
	}
}
