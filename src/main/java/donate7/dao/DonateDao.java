package donate7.dao;

import java.util.List;

import donate7.model.Donate;


public interface DonateDao {

	int mdoReqInsert(Donate donate);

	List<Donate> mlist(int no);

	Donate selectOne(int d_no);

	int mdoUpdate(Donate donate);

	void mdoDelete(int d_no);

	List<Donate> olist(int no);

	int odoReqInsert(Donate donate);

	int odoUpdate(Donate donate);

	void odoDelete(int d_no);

	int count(Donate donate);

	List<Donate> adlist();

	int adUpdate(int d_no);

	int adDelete(int d_no);

	List<Donate> doList();

}
