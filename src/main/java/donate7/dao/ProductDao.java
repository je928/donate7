package donate7.dao;

import java.util.List;

import donate7.model.Product;

public interface ProductDao {

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

	/*List<Product> memAll(Product product);

	List<Product> arAll(Product product);

	int memTotal(Product product);

	int arTotal(Product product);*/

	int prSTotal(Product product);

	List<Product> prSlist(Product product);

	int prATotal(Product product);

	List<Product> prAlist(Product product);

	int memSTotal(Product product);

	List<Product> memSlist(Product product);

	int memATotal(Product product);

	List<Product> memAlist(Product product);

	int orSTotal(Product product);

	List<Product> orSlist(Product product);

	int orATotal(Product product);

	List<Product> orAlist(Product product);



}
