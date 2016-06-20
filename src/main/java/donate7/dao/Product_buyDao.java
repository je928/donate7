package donate7.dao;

import java.util.List;

import donate7.model.Product;
import donate7.model.Product_buy;

public interface Product_buyDao {
	List<Product_buy> list(int pb_no);

	String Nick(int no);

	Product selectOne(int pr_no);

	int insert(Product_buy pb);

	List<Product_buy> listAll();

	Product_buy select(int pb_no);
}