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
		session.update("community.communityHit", num);
	}

	public Community communitySelect(int no) {
		return session.selectOne("community.communitySelect", no);
	}

	public int insertNo() {
		return session.selectOne("community.insertNo");
	}

	public int communityInsert(Community community) {
		int result = 0;
		try {
			result = session.insert("community.communityInsert", community);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public void updateRe_step(Community community) {
		session.update("community.updateRe_step", community);
	}
	
}
