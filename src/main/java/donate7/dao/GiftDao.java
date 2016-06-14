package donate7.dao;

import java.util.List;

import donate7.model.Gift;

public interface GiftDao {
	int insert(Gift gift);

	List<Gift> list(int startRow, int endRow);

	Gift selectOne(int g_no);

	int delete(int g_no);

	int getTotal();
}
