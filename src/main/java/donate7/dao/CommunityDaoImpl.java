package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Community;
import donate7.model.CommunityReply;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<Community> list(Community community) {
		return session.selectList("community.communityList", community);
	}	

	public int getTotal(Community community) {
		int total = 0;
		try {
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
		int result2 = 0;
		try {
			result = session.update("community.communityReplyDelete", number);
			if(result > 0) {
				result2 = session.update("community.communityDelete", number);
			}else {
				result2 = session.update("community.communityDelete", number);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result2;
	}

	public void updateWarn(int re_sort_no) {
		session.update("community.updateWarn",re_sort_no);		
	}

	public List<CommunityReply> selectReply(int brd_no) {
		return session.selectList("reply.selectReply", brd_no);
	}
	
	public int replyNo() {
		return session.selectOne("reply.replyNo");
	}

	public int insertReply(CommunityReply communityReply) {
		int result = 0;
		try {
			result = session.insert("reply.insertReply", communityReply);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int replyCount(int brd_no) {
		int total = 0;
		try {
			total = session.selectOne("reply.replyCount", brd_no);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}
	
	public int updateReply(CommunityReply communityReply) {
		int result = 0;
		try {
			result = session.update("reply.updateReply", communityReply);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int deleteReply(int crNo) {
		int result = 0;
		try {
			result = session.update("reply.deleteReply", crNo);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public CommunityReply replyOne(int cr_no) {
		return session.selectOne("reply.replyOne", cr_no);
	}

	public void updateWarnR(int re_sort_no) {
		session.update("reply.updateWarn",re_sort_no);
	}

}
