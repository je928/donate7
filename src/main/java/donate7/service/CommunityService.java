package donate7.service;

import java.util.List;

import donate7.model.Community;
import donate7.model.CommunityReply;

public interface CommunityService {

	List<Community> list(Community community);
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
	int updateReply(CommunityReply communityReply);
	int deleteReply(int crNo);
	CommunityReply replyOne(int cr_no);
	void updateWarnR(int re_sort_no);
	
}