package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.CommunityDao;
import donate7.model.Community;
import donate7.model.CommunityReply;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao cd;
	
	public List<Community> list(Community community) {
		return cd.list(community);
	}

	public int getTotal(Community community) {
		return cd.getTotal(community);
	}	

	public void communityHit(int brd_no) {
		cd.communityHit(brd_no);
	}

	public Community communitySelect(int brd_no) {
		return cd.communitySelect(brd_no);
	}

	public int insertNo() {
		return cd.insertNo();
	}

	public int communityInsert(Community community) {
		return cd.communityInsert(community);
	}

	public void updateRe_step(Community community) {
		cd.updateRe_step(community);
	}

	public int communityUpdate(Community community) {
		return cd.communityUpdate(community);
	}

	public Community deletePwdChk(int number) {
		return cd.deletePwdChk(number);
	}

	public int communityDelete(int number) {
		return cd.communityDelete(number);
	}
	
	public void updateWarn(int re_sort_no) {
		cd.updateWarn(re_sort_no);		
	}

	public List<CommunityReply> selectReply(int brd_no) {
		return cd.selectReply(brd_no);
	}
	
	public int replyNo() {
		return cd.replyNo();
	}

	public int insertReply(CommunityReply communityReply) {
		return cd.insertReply(communityReply);
	}

	public int replyCount(int brd_no) {
		return cd.replyCount(brd_no);
	}

	public int updateReply(CommunityReply communityReply) {
		return cd.updateReply(communityReply);
	}

	
	public int deleteReply(int crNo) {
		return cd.deleteReply(crNo);
	}
	
	public CommunityReply replyOne(int cr_no) {
		return cd.replyOne(cr_no);
	}

	public void updateWarnR(int re_sort_no) {
		cd.updateWarnR(re_sort_no);
	}

}
