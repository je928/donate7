package donate7.service;

import java.util.List;

import donate7.model.Second;

public interface SecondService {
	Second selectOne(int sh_no);
	int insert(Second second);
	List<Second> mlist();
	List<Second> olist();
	List<Second> adlist();
}
