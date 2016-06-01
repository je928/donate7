package donate7.service;

import java.util.List;

import donate7.model.Product;

public interface ProductService {

	int insert(Product product);

	Product selectOne(int pr_no);

	List<Product> mlist(int no);
	
	List<Product> olist(int no);

	List<Product> prlist();

	int prUpdate(Product product);

	void prdelete(int pr_no);
	
	int count(Product product);

	int apUpdate(int pr_no);

	void apCancel(int pr_no);

	



}
