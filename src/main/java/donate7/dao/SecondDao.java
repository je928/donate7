package donate7.dao;

import java.util.List;

import donate7.model.Second;

public interface SecondDao {
	Second selectOne(int sh_no);
	int insert(Second second);

	List<Second> mlist(int no);


	List<Second> olist(int no);


	List<Second> adlist();
	int secondUpdate(Second second);
	int count(int no);
	void delete(int sh_no);
	int spUpdate(int sh_no);
	void spCancel(int sh_no);
	void srCancel(int sh_no);
	int srUpdate(int sh_no);
}
