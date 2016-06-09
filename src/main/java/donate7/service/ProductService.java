package donate7.service;

import java.util.List;

import donate7.model.Product;

public interface ProductService {

	int insert(Product product);

	Product selectOne(int pr_no);

	List<Product> mlist(Product product);
	
	List<Product> olist(Product product);

	List<Product> prlist(Product product);

	int prUpdate(Product product);

	void prdelete(int pr_no);
	
	int count(Product product);

	int apUpdate(int pr_no);

	void apCancel(int pr_no);

	List<Product> aplist();

	int getTotal(Product product);

	List<Product> memAll(Product product);

	List<Product> orAll(Product product);

	int memTotal(Product product);

	int orTotal(Product product);

	



}
