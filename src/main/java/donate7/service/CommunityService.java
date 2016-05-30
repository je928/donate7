package donate7.service;

import java.util.List;
import donate7.model.Community;

public interface CommunityService {

	List<Community> list(int startRow, int endRow, String searchType, String searchTxt, Community community);
	int getTotal(String searchType, String searchTxt, Community community);
	void communityHit(int num);
	Community communitySelect(int num);

}
