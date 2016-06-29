package donate7.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Cpoint_info;
import donate7.model.Product;
import donate7.model.Product_buy;

@Repository
public class Product_buyDaoImpl implements Product_buyDao {
	@Autowired
	private SqlSessionTemplate session;

	public List<Product_buy> list(int startRow, int endRow, int pb_mono , Product_buy pb) {
		pb.setStartRow(startRow);
		pb.setEndRow(endRow);
		pb.setPb_mono(pb_mono);
		return session.selectList("product_buy.list",pb);
	}

	public String Nick(int no) {
		String Nick = session.selectOne("product_buy.nick", no);
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
	@Override
	public List<Product_buy> listAll(int startRow, int endRow,Product_buy pb, int pb_mono) {
		pb.setStartRow(startRow);
		pb.setEndRow(endRow);
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pb.getStartRow());
		map.put("endRow", pb.getEndRow());
		map.put("pb_mono", pb_mono);
		return session.selectList("product_buy.listAll",map);
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
	
	public int mtotal(int pb_no) {
		return 	session.selectOne("product_buy.mtotal",pb_no);
	}

	public int atotal() {
		return session.selectOne("product_buy.atotal");
	}

	public String delivery(int pb_no) {
		String result=session.selectOne("product_buy.delivery",pb_no);
		return result;
	}

	public int yupdate(int pb_no) {
		return session.update("product_buy.yupdate",pb_no);
	}

	public int oupdate(int pb_no) {
		return session.update("product_buy.oupdate",pb_no);
	}


}
