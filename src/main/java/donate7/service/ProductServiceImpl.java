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

	public List<Product> mlist(Product product) {
		
		return pd.mlist(product);
	}

	public List<Product> olist(Product product) {
	
		return pd.olist(product);
	}

	public List<Product> prlist(Product product) {
	
		return pd.prlist(product);
	}

	public int prUpdate(Product product) {
	
		return pd.prUpdate(product);
	}

	public void prdelete(int pr_no) {
		pd.prdelete(pr_no);
		
	}

	public int count(Product product) {
		
		return pd.count(product);
	}

	public int apUpdate(int pr_no) {
		return pd.apUpdate(pr_no);
		
	}

	public void apCancel(int pr_no) {
		pd.apCancel(pr_no);
	}

	public List<Product> aplist() {
		
		return pd.aplist();
	}

	
	public int getTotal(Product product) {
		
		return pd.getTotal(product);
	}

}
