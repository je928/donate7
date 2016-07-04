package donate7.service;

import java.util.List;

import donate7.model.DoResult;
import donate7.model.Donate;

public interface DonateService {

	int mdoReqInsert(Donate donate);

	List<Donate> mlist(int no);

	Donate selectOne(int d_no);

	int mdoUpdate(Donate donate);

	void mdoDelete(int d_no);

	List<Donate> olist(Donate donate);

	int odoReqInsert(Donate donate);

	int odoUpdate(Donate donate);

	void odoDelete(int d_no);
	
	int count(Donate donate);

	List<Donate> adlist();

	int adUpdate(int d_no);
	
	int adDelete(int d_no);

	List<Donate> doList();

	int getTotal(Donate donate);

	int memTotal(Donate donate);

	List<Donate> memAll(Donate donate);

	int orTotal(Donate donate);

	List<Donate> orAll(Donate donate);
	
	int doTotal(DoResult doResult);

	List<DoResult> drList(int d_no);

	int insertDonate(DoResult doResult);

	int insertNum();

	int sumDonate(int d_no);
}
