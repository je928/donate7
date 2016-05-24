package donate7.service;

import donate7.model.Member;
import donate7.model.Organ;

public interface MemberService {

	int insertMember(Member member);
	int insertOrgan(Organ organ);
	String loginChk(String m_email, String m_passwd);
	int m_emailChk(String m_email);

}
