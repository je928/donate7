package donate7.dao;

import java.util.List;

import donate7.model.Second;

public interface SecondDao {
	List<Second> list();
	Second selectOne(int sh_no);
	int insert(Second second);
}
