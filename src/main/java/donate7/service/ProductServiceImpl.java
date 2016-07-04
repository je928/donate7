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

	public List<Product> prlist(Product product, String yn) {
	
		return pd.prlist(product, yn);
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

	public List<Product> aplist(Product pd) {
		return this.pd.aplist(pd);
	}

	
	public int getTotal(Product product) {
		
		return pd.getTotal(product);
	}

/*	public int prSTotal(Product product) {
	
		return pd.prSTotal(product);
	}

	public List<Product> prSlist(Product product) {
		
		return pd.prSlist(product);
	}

	public int prATotal(Product product) {
		
		return pd.prATotal(product);
	}

	public List<Product> prAlist(Product product) {
		
		return pd.prAlist(product);
	}*/

	/*public int memSTotal(Product product) {
		
		return pd.memSTotal(product);
	}

	public List<Product> memSlist(Product product) {
		
		return pd.memSlist(product);
	}

	
	public int memATotal(Product product) {
		
		return pd.memATotal(product);
	}

	
	public List<Product> memAlist(Product product) {
		
		return pd.memAlist(product);
	}

	public int orSTotal(Product product) {
	
		return pd.orSTotal(product);
	}

	
	public List<Product> orSlist(Product product) {
		
		return pd.orSlist(product);
	}

	
	public int orATotal(Product product) {
	
		return pd.orATotal(product);
	}


	public List<Product> orAlist(Product product) {
		
		return pd.orAlist(product);
	}
*/
	public int apTotal(Product product) {
		return pd.apTotal(product);
	}

	public int goTotal(Product pr) {
		
		return pd.goTotal(pr);
	}

	public List<Product> golist(Product product, String fdp) {
	
		return pd.golist(product, fdp);
	}


	public int memTotal(Product product) {
		
		return pd.memTotal(product);
	}

	public List<Product> memAll(Product product, String mymn) {
		return pd.memAll(product,mymn);
	}

	@Override
	public int orTotal(Product product) {
		return  pd.orTotal(product);
	}

	public List<Product> orAll(Product product, String oyon) {
		
		return pd.orAll(product,oyon);
	}

}
