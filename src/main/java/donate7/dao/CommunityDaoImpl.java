package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<Community> list(int startRow, int endRow, String searchType, String searchTxt, Community community) {
		community.setStartRow(startRow);
		community.setEndRow(endRow);
		community.setSearchType(searchType);
		community.setSearchTxt(searchTxt);
		return session.selectList("community.communityList", community);
	}	

	public int getTotal(String searchType, String searchTxt, Community community) {
		int total = 0;
		try {
			community.setSearchType(searchType);
			community.setSearchTxt(searchTxt);
			total = session.selectOne("community.communityTotal", community);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public void communityHit(int num) {
		session.update("communityHit", num);
	}

	public Community communitySelect(int num) {
		return session.selectOne("communitySelect", num);
	}
	
}
