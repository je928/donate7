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

	public void communityHit(int num) {
		cd.communityHit(num);
	}

	public Community communitySelect(int num) {
		return cd.communitySelect(num);
	}

}
