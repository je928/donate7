package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Product;
@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SqlSessionTemplate st;
	
	public int insert(Product product) {
		int pr_no= st.selectOne("product.selectNum");
		product.setPr_no(pr_no);
		return st.insert("product.prinsert",product);
		
	}

	public List<Product> list() {
		
		return st.selectList("product.prlist");
	}

	public Product selectOne(int pr_no) {
	
		return st.selectOne("product.selectOne",pr_no);
	}

	public List<Product> mlist() {
	
		return st.selectList("product.mlist");
	}

	public List<Product> olist() {
		
		return st.selectList("product.olist");
	}

	public List<Product> prlist() {
		
		return st.selectList("product.prlist");
	}

	

}
