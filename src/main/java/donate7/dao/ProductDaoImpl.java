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

	public List<Product> mlist(Product product) {
	
		return st.selectList("product.mlist",product);
	}

	public List<Product> olist(Product product) {
		
		return st.selectList("product.olist",product);
	}

	public List<Product> prlist(Product product) {
		
		return st.selectList("product.prlist",product);
	}

	public int prUpdate(Product product) {
		int result=0;
		try{
			result= st.update("product.prUpdate",product);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return result;
	}

	public void prdelete(int pr_no) {
		st.selectOne("product.prDelete", pr_no);
		
	}

	public int count(Product product) {
		
		return st.selectOne("product.count", product);
	}

	public int apUpdate(int pr_no) {
		return st.update("product.apUpdate",pr_no);
		
	}

	public void apCancel(int pr_no) {
		st.update("product.apCancel",pr_no);
		
	}

	public List<Product> aplist() {
		
		return st.selectList("product.aplist");
	}


	public int getTotal(Product product) {
		return st.selectOne("product.getTotal",product);
	}
	
	public int memTotal(Product product) {
		
		return st.selectOne("product.memTotal", product);
	}

	public int arTotal(Product product) {
	
		return st.selectOne("product.orTotal",product);
	}

	public List<Product> memAll(Product product) {
		
		return st.selectList("product.memAll",product);
	}

	public List<Product> arAll(Product product) {
		
		return st.selectList("product.orAll",product);
	}

	

}
