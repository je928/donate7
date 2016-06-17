package donate7.dao;

import java.util.List;

import donate7.model.Product;
import donate7.model.Product_buy;

public interface Product_buyDao {
	
	List<Product_buy> list(int startRow, int endRow, int pb_mono, Product_buy pb);
	
	String Nick(int no);

	Product selectOne(int pr_no);

	int insert(Product_buy pb);

	List<Product_buy> listAll(int startRow, int endRow, Product_buy pb);

	Product_buy select(int pb_no);

	int update(int pr_no, int qty);

	int mtotal(int pb_no);

	int atotal();
}
