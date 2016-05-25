package donate7.service;

import java.util.List;

import donate7.model.Second;

public interface SecondService {

	List<Second> list();
	Second selectOne(int sh_no);
	int insert(Second second);
}
