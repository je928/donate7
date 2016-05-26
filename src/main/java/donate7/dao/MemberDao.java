package donate7.dao;

import donate7.model.Member;
import donate7.model.Organ;

public interface MemberDao {

	int insertMember(Member member);
	int insertOrgan(Organ organ);
	String loginChk(String m_email, String m_passwd);
	int m_emailChk(String m_email);
	String selectO_addrByO_no(int o_no);
	int m_nickChk(String m_nick, Member member);

}
