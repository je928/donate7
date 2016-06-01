package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.CommunityDao;
import donate7.model.Community;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao cd;
	
	public List<Community> list(int startRow, int endRow, String searchType, String searchTxt, Community community) {
		return cd.list(startRow, endRow, searchType, searchTxt, community);
	}

	public int getTotal(String searchType, String searchTxt, Community community) {
		return cd.getTotal(searchType, searchTxt, community);
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

}
