package donate7.dao;

import java.util.List;

import donate7.model.Donate;


public interface DonateDao {

	int mdoReqInsert(Donate donate);

	List<Donate> list();

	Donate selectOne(int d_no);

	int mdoUpdate(Donate donate);

}
