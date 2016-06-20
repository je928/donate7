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
	int o_emailChk(String o_email);
	int o_onameChk(String o_oname, Organ organ);
	Member selectMember(int m_no);
	Member selectMember_tel(int m_no);
	int updateMember(Member member);
	Member m_deletePwdChk(int m_no);
	int deleteMember(int m_no);
	Organ selectOrgan(int o_no);
	Organ selectOrgan_addr_tel(int o_no);
	int updateOrgan(Organ organ);
	Organ o_deletePwdChk(int o_no);
	int deleteOrgan(int o_no);
	int memberTotal();
	List<Member> memberAll(int startRow, int endRow, Member member);
	int organTotal();
	List<Organ> organAll(int startRow, int endRow, Organ organ);
	List<Organ> selectAll();
	String selectO_addrByO_no(int o_no);
	Organ selectByO_no(int o_no);
	List<Member> selectVolMember(int vt_no);
}
