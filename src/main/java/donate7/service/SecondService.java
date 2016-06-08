package donate7.service;

import java.util.List;

import donate7.model.Second;

public interface SecondService {
	Second selectOne(int sh_no);
	int insert(Second second);
	List<Second> mlist(Second second);
	List<Second> olist(Second second);
	List<Second> adlist(Second second);
	int msecondUpdate(Second second);
	int count(Second second);
	void msdelete(int sh_no);
	int spUpdate(int sh_no);
	void spCancel(int sh_no);
	int srUpdate(int sh_no);
	void srCancel(int sh_no);
	int getTotal(Second second);
	
}
