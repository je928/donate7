package donate7.dao;

import java.util.List;

import donate7.model.Donate;


public interface DonateDao {

	int mdoReqInsert(Donate donate);

	List<Donate> list();

}
