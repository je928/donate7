package donate7.service;

import java.util.List;

import donate7.model.Donate;

public interface DonateService {

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
}
