package donate7.dao;

import java.util.List;

import donate7.model.Second;

public interface SecondDao {
	Second selectOne(int sh_no);
	int insert(Second second);

	List<Second> mlist(Second second);


	List<Second> olist(Second second);


	List<Second> adlist(Second second);
	int secondUpdate(Second second); 
	int count(Second second);
	void delete(int sh_no);
	int spUpdate(int sh_no);
	void spCancel(int sh_no);
	void srCancel(int sh_no);
	int srUpdate(int sh_no);
	int getTotal(Second second);
	
	int memTotal(Second second);
	List<Second> admlist(Second second);
	int arrTotal(Second second);
	
	int orTotal(Second second);
	List<Second> adolist(Second second);
	int oarrTotal(Second second);
	List<Second> admAlist(Second second);
	List<Second> adoAlist(Second second);
}
