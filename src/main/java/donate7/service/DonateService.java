package donate7.service;

import java.util.List;

import donate7.model.Donate;

public interface DonateService {

	int mdoReqInsert(Donate donate);

	List<Donate> list();

	Donate selectOne(int d_no);
}
