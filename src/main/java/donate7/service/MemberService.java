package donate7.service;

import java.util.List;

import donate7.model.Member;
import donate7.model.Organ;

public interface MemberService {

	int insertMember(Member member);
	int insertOrgan(Organ organ);
	String loginChk(String m_email, String m_passwd);
	int m_emailChk(String m_email);
	int m_nickChk(String m_nick, Member member);
	String selectO_addrByO_no(int o_no);
	List<Organ> selectAll();
	Organ selectByO_no(int o_no);
}
