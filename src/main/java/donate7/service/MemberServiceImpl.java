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
	
	public Member selectMember(int m_no) {
		return md.selectMember(m_no);
	}
	
	public Member selectMember_tel(int m_no) {
		return md.selectMember_tel(m_no);
	}

	public int updateMember(Member member) {
		return md.updateMember(member);
	}
	
	public Member m_deletePwdChk(int m_no) {
		return md.m_deletePwdChk(m_no);
	}

	public int deleteMember(int m_no) {
		return md.deleteMember(m_no);
	}
	
	public List<Organ> selectAll() {
		return md.selectAll();
	}
	
	public Organ selectOrgan(int o_no) {
		return md.selectOrgan(o_no);
	}

	public Organ selectOrgan_addr_tel(int o_no) {
		return md.selectOrgan_addr_tel(o_no);
	}
	
	public int updateOrgan(Organ organ) {
		return md.updateOrgan(organ);
	}
	
	public Organ o_deletePwdChk(int o_no) {
		return md.o_deletePwdChk(o_no);
	}

	public int deleteOrgan(int o_no) {
		return md.deleteOrgan(o_no);
	}
	
	public int memberTotal() {
		return md.memberTotal();
	}

	public List<Member> memberAll(int startRow, int endRow, Member member) {
		return md.memberAll(startRow, endRow, member);
	}
	
	public int organTotal() {
		return md.organTotal();
	}

	public List<Organ> organAll(int startRow, int endRow, Organ organ) {
		return md.organAll(startRow, endRow, organ);
	}
	
	public String selectO_addrByO_no(int o_no) {
		return md.selectO_addrByO_no(o_no);
	}
	
	public Organ selectByO_no(int o_no) {
		return md.selectByO_no(o_no);
	}

	public int ok_y_update(int no) {
		return md.ok_y_update(no);
	}

	public int ok_n_update(int no) {
		return md.ok_n_update(no);
	}

}
