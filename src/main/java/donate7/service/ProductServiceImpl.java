package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.ProductDao;
import donate7.model.Product;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao pd;

	public int insert(Product product) {
		return pd.insert(product);
		
	}

	public Product selectOne(int pr_no) {
		
		return pd.selectOne(pr_no);
	}

	public List<Product> mlist() {
		
		return pd.mlist();
	}

	public List<Product> olist() {
	
		return pd.olist();
	}

	public List<Product> prlist() {
	
		return pd.prlist();
	}

}
