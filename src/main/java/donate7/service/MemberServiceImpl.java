package donate7.service;

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

	public String loginChk(String m_email, String m_passwd) {
		return md.loginChk(m_email, m_passwd);
	}

	public int insertOrgan(Organ organ) {
		return md.insertOrgan(organ);
	}
	
}
