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
		System.out.println("result : " + result);
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
				if(db_Nick == null) {
					result = -1;
				}else if(db_Nick.equals(selectNick)) {
					result = 0;
				}else if(db_Nick != null){
					result = 1;
				}
			}else {
				if(db_Nick != null) {
					result = 1;
				}else {
					result = -1;
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public int o_emailChk(String o_email) {
		int result = 0;
		try {
			result = session.selectOne("organ.o_emailChk", o_email);
			System.out.println(result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int o_onameChk(String o_oname, Organ organ) {
		int result = 0;
		String selectOname = "";
		String db_Oname = "";
		try {
			selectOname = session.selectOne("organ.selectOname", organ.getO_no());
			db_Oname = session.selectOne("organ.onameChk", organ);
			if(selectOname != null) {
				if(db_Oname == null) {
					result = -1;
				}else if(db_Oname.equals(selectOname)) {
					result = 0;
				}else if(db_Oname != null){
					result = 1;
				}
			}else {
				if(db_Oname != null) {
					result = 1;
				}else {
					result = -1;
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public Member selectMember(int m_no) {
		return session.selectOne("member.selectMember", m_no);
	}
	
	public Member selectMember_tel(int m_no) {
		return session.selectOne("member.selectMember_tel", m_no);
	}

	public int updateMember(Member member) {
		int result = 0;
		try {
			result = session.update("member.updateMember", member);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public Member m_deletePwdChk(int m_no) {
		Member member = new Member();
		try {
			String passwd = session.selectOne("member.deletePwdChk", m_no);
			member.setM_passwd(passwd);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return member;
	}

	public int deleteMember(int m_no) {
		int result = 0;
		try {
			result = session.update("member.deleteMember", m_no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public Organ selectOrgan(int o_no) {
		return session.selectOne("organ.selectOrgan", o_no);
	}
	
	public Organ selectOrgan_addr_tel(int o_no) {
		return session.selectOne("organ.selectOrgan_addr_tel", o_no);
	}
	
	public int updateOrgan(Organ organ) {
		int result = 0;
		try {
			String ok = session.selectOne("organ.selectOk", organ);
			if(ok.equals("y")) {
				result = session.update("organ.updateOrgan", organ);
			}else if(ok.equals("n") || ok.equals("x")) {
				result = session.update("organ.XupdateOrgan", organ);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public Organ o_deletePwdChk(int o_no) {
		Organ organ = new Organ();
		try {
			String passwd = session.selectOne("organ.deletePwdChk", o_no);
			organ.setO_passwd(passwd);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return organ;
	}

	public int deleteOrgan(int o_no) {
		int result = 0;
		try {
			result = session.update("organ.deleteOrgan", o_no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public int memberTotal() {
		int total = 0;
		try {
			total = session.selectOne("member.memberTotal");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public List<Member> memberAll(int startRow, int endRow, Member member) {
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		return session.selectList("member.memberAll", member);
	}
	
	public int organTotal() {
		int total = 0;
		try {
			total = session.selectOne("organ.organTotal");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public List<Organ> organAll(int startRow, int endRow, Organ organ) {
		organ.setStartRow(startRow);
		organ.setEndRow(endRow);
		return session.selectList("organ.organAll", organ);
	}
	
	public List<Organ> selectAll() {
		return session.selectList("organ.selectAll");
	}

	public String selectO_addrByO_no(int o_no) {
		return session.selectOne("organ.selectO_addrByO_no",o_no);
	}
	
	public Organ selectByO_no(int o_no) {
		return session.selectOne("organ.selectOrgan",o_no);
	}


	@Override
	public List<Member> selectVolMember(int vt_no) {
		return session.selectList("member.selectVolMember",vt_no);
	}
	
	public int ok_y_update(int no) {
		int result = 0;
		try {
			result = session.update("organ.ok_y_update", no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int ok_n_update(int no) {
		int result = 0;
		try {
			result = session.update("organ.ok_n_update", no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

}
