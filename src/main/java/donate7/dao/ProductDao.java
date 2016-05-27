package donate7.dao;

import java.util.List;

import donate7.model.Product;

public interface ProductDao {

	int insert(Product product);

	Product selectOne(int pr_no);


	List<Product> mlist(int no);


	List<Product> olist();


	List<Product> prlist();

	int prUpdate(Product product);

	void prdelete(int pr_no);


}
