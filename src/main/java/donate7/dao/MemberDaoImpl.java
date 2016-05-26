package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import donate7.model.Member;
import donate7.model.Organ;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertMember(Member member) {
		int result = 0, m_number = 0, m_no = 0;
		try {
			m_no = session.selectOne("member.selectMno", member);
			if(m_no > 0) {
				member.setM_no(m_no);
				result = session.update("member.insertReMember", member);
			}else {
				m_number = session.selectOne("member.selectNum");
				member.setM_no(m_number);
				result = session.insert("member.insertMember", member);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int insertOrgan(Organ organ) {
		int result = 0, o_number = 0, o_no = 0;
		try {
			o_no = session.selectOne("organ.selectOno", organ);
			if(o_no < 0) {
				organ.setO_no(o_no);
				result = session.update("organ.insertReOrgan", organ);
			}else {
				o_number = session.selectOne("organ.selectNum");
				organ.setO_no(o_number);
				result = session.insert("organ.insertOrgan", organ);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public String loginChk(String email, String passwd) {
		String result = "";
		try {
			String dbpass = session.selectOne("member.loginChk", email);
			System.out.println("member dbpass : " + dbpass);
			if(dbpass == null) {
				result = "x";
			}
			else if(dbpass.equals(passwd)) {
				result = session.selectOne("member.selectMno2", email);
			}else {
				result = "passwdx";
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int m_emailChk(String m_email) {
		int result = 0;
		try {
			result = session.selectOne("member.m_emailChk", m_email);
			System.out.println(result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int m_nickChk(String m_nick, Member member) {
		int result = 0;
		String selectNick = "";
		String db_Nick = "";
		try {
			selectNick = session.selectOne("member.selectNick", member.getM_no());
			db_Nick = session.selectOne("member.nickChk", member);
			if(selectNick != null) {
				if(db_Nick.equals(selectNick)) {
					result = 0;
				}else {
					result = 1;
				}
			}else {
				if(db_Nick != null) {
					result = 2;
				}else {
					result = -1;
				}
			}
			System.out.println("result : " + result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public String selectO_addrByO_no(int o_no) {
		return session.selectOne("organ.selectO_addrByO_no",o_no);
	}

	@Override
	public List<Organ> selectAll() {
		return session.selectList("organ.selectAll");
	}
	
}
