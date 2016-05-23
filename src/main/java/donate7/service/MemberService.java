package donate7.service;

import donate7.model.Member;
import donate7.model.Organ;

public interface MemberService {

	int insertMember(Member member);
	String loginChk(String m_email, String m_passwd);
	int insertOrgan(Organ organ);

}
