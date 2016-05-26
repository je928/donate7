package donate7.dao;

import java.util.List;

import donate7.model.Product;

public interface ProductDao {

	int insert(Product product);

	Product selectOne(int pr_no);


	List<Product> mlist();


	List<Product> olist();


	List<Product> prlist();

}
