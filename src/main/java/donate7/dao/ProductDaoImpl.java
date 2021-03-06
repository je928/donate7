package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Organ;
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

	public List<Product> prlist(Product product, String yn) {
		product.setYn(yn);
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

	public List<Product> aplist(Product pd) {
		List<Product> list = st.selectList("product.aplist", pd);
		return list;
	}


	public int getTotal(Product product) {
		int total = 0;
		try {
			total = st.selectOne("product.getTotal", product);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}
	
	
/*	public int prSTotal(Product product) {
		
		return st.selectOne("product.prSTotal",product);
	}*/


/*	public List<Product> prSlist(Product product) {
		
		return st.selectList("product.prSlist",product);
	}*/

	/*public int prATotal(Product product) {
		
		return st.selectOne("product.prATotal",product);
	}*/

/*	public List<Product> prAlist(Product product) {
		
		return st.selectList("product.prAlist",product);
	}*/
	
	/*public int memSTotal(Product product) {
		
		return st.selectOne("product.memSTotal", product);
	}

	
	public List<Product> memSlist(Product product) {
		
		return st.selectList("product.memSlist",product);
	}

	public int memATotal(Product product) {
	
		return st.selectOne("product.memATotal",product);
	}


	public List<Product> memAlist(Product product) {
		return st.selectList("product.memAlist",product);
	}


	public int orSTotal(Product product) {
		
		return st.selectOne("product.orSTotal",product);
	}


	public List<Product> orSlist(Product product) {
		
		return st.selectList("product.orSlist",product);
	}


	public int orATotal(Product product) {
		
		return st.selectOne("product.orATotal",product);
	}


	public List<Product> orAlist(Product product) {
		
		return st.selectList("product.orAlist",product);
	}

	*/
	public int apTotal(Product product) {
		int result = st.selectOne("product.apTotal",product);
		return result;
	}
	
	public int goTotal(Product pr) {
		int total = 0;
		try {
			total = st.selectOne("product.goTotal", pr);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public List<Product> golist(Product product, String fdp) {
		product.setFdp(fdp);
		return st.selectList("product.golist", product);
	}


	public int memTotal(Product product) {
		int total = 0;
		try {
			total = st.selectOne("product.memTotal", product);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public List<Product> memAll(Product product, String mymn) {
		product.setMymn(mymn);
		return st.selectList("product.memAll",product);
	}

	
	public int orTotal(Product product) {
		int total = 0;
		try {
			total = st.selectOne("product.orTotal", product);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public List<Product> orAll(Product product, String oyon) {
		product.setOyon(oyon);
		return st.selectList("product.orAll",product);
	}



}
