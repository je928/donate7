package donate7.dao;

import java.util.List;

import donate7.model.Member;
import donate7.model.Organ;

public interface MemberDao {

	int insertMember(Member member);
	int insertOrgan(Organ organ);
	String loginChk(String m_email, String m_passwd);
	int m_emailChk(String m_email);
	int m_nickChk(String m_nick, Member member);
	int o_emailChk(String o_email);
	int o_onameChk(String o_oname, Organ organ);
	String selectO_addrByO_no(int o_no);
	List<Organ> selectAll();
	Organ selectByO_no(int o_no);
	
}
