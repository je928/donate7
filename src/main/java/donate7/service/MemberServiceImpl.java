package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.MemberDao;
import donate7.model.Member;
import donate7.model.Organ;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao md;
	
	public int insertMember(Member member) {
		return md.insertMember(member);
	}

	public int insertOrgan(Organ organ) {
		return md.insertOrgan(organ);
	}

	public String loginChk(String m_email, String m_passwd) {
		return md.loginChk(m_email, m_passwd);
	}

	public int m_emailChk(String m_email) {
		return md.m_emailChk(m_email);
	}

	public int m_nickChk(String m_nick, Member member) {
		return md.m_nickChk(m_nick, member);
	}
	
	public int o_emailChk(String o_email) {
		return md.o_emailChk(o_email);
	}
	
	public int o_onameChk(String o_oname, Organ organ) {
		return md.o_onameChk(o_oname, organ);
	}
	
	public List<Organ> selectAll() {
		return md.selectAll();
	}

	public List<Member> memberAll() {
		return md.memberAll();
	}
	
	public Member selectMember(int m_no) {
		return md.selectMember(m_no);
	}

	public Organ selectOrgan(int o_no) {
		return md.selectOrgan(o_no);
	}
	
	public String selectO_addrByO_no(int o_no) {
		return md.selectO_addrByO_no(o_no);
	}
	
	public Organ selectByO_no(int o_no) {
		return md.selectByO_no(o_no);
	}

	
}
