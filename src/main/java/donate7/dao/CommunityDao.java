package donate7.dao;

import java.util.List;
import donate7.model.Community;
import donate7.model.CommunityReply;

public interface CommunityDao {

	List<Community> list(int startRow, int endRow, String searchType, String searchTxt, Community community);
	int getTotal(String searchType, String searchTxt, Community community);
	void communityHit(int brd_no);
	Community communitySelect(int brd_no);
	int insertNo();
	int communityInsert(Community community);
	void updateRe_step(Community community);
	int communityUpdate(Community community);
	Community deletePwdChk(int number);
	int communityDelete(int number);
	void updateWarn(int re_sort_no);
	List<CommunityReply> selectReply(int brd_no);
	int replyNo();
	int insertReply(CommunityReply communityReply);
	int replyCount(int brd_no);
	int deleteReply(int crNo);
	
}