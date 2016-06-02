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

	public void communityHit(int brd_no) {
		session.update("community.communityHit", brd_no);
	}

	public Community communitySelect(int brd_no) {
		return session.selectOne("community.communitySelect", brd_no);
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

	public int communityUpdate(Community community) {
		int result = 0;
		try {
			result = session.update("community.communityUpdate", community);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public Community deletePwdChk(int number) {
		Community community = new Community();
		try {
			String passwd = session.selectOne("community.deletePwdChk", number);
			community.setPasswd(passwd);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return community;
	}

	public int communityDelete(int number) {
		int result = 0;
		try {
			result = session.update("community.communityDelete", number);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
}
