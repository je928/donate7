package donate7.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Product;
import donate7.model.Product_buy;

@Repository
public class Product_buyDaoImpl implements Product_buyDao {
	@Autowired
	private SqlSessionTemplate session;

	public List<Product_buy> list(int pb_no) {
		List<Product_buy> list = session.selectList("product_buy.list", pb_no);
		System.out.println(list);
		return list;
	}

	public String Nick(int no) {
		System.out.println(no);
		String Nick = session.selectOne("product_buy.nick", no);
		System.out.println(Nick);
		return Nick;
	}

	public Product selectOne(int pr_no) {
		Product price = session.selectOne("product_buy.selectOne", pr_no);
		return price;
	}

	public int insert(Product_buy pb) {
		int pb_no = session.selectOne("product_buy.selectNum");
		pb.setPb_no(pb_no);
		int insert = session.insert("product_buy.insert", pb);
		int result = 0;
		if (insert == 1) {
			result = 1;
			return result;
		} else {
			result = -1;
			return result;
		}
	}

	public List<Product_buy> listAll() {
		return session.selectList("product_buy.listAll");
	}

	public Product_buy select(int pb_no) {
		return session.selectOne("product_buy.select", pb_no);
	}

	public int update(int pr_no,int qty) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("pr_no", pr_no);
		map.put("qty", qty);
		return session.update("product_buy.update",map);
			}
}
