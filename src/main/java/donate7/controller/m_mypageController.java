package donate7.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Member;
import donate7.model.Warning;
import donate7.service.Cpoint_InfoService;
import donate7.service.MemberService;
import donate7.service.WarningService;

@Controller
public class m_mypageController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private WarningService ws;
	
	@Autowired
	private Cpoint_InfoService cs;
	
	@RequestMapping(value = "m_myinfo", method = RequestMethod.GET)
	public String m_myinfo(Model model, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Member member = ms.selectMember(m_no);
		Warning dr_warn = new Warning();
		Warning br_warn = new Warning();
		dr_warn.setM_no(m_no);
		dr_warn.setWa_sort("d");
		br_warn.setM_no(m_no);
		br_warn.setWa_sort("b");
		int dr_total = ws.getTotal(dr_warn);
		int br_total = ws.getTotal(br_warn);
		int sumC = cs.sumCash(m_no);
		int sumP = cs.sumPoint(m_no);
		model.addAttribute(member);
		model.addAttribute("dr_total", dr_total);
		model.addAttribute("br_total", br_total);
		model.addAttribute("sumC", sumC);
		model.addAttribute("sumP", sumP);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_myinfo.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_updateForm", method = RequestMethod.GET)
	public String m_updateForm(Model model, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Member member = ms.selectMember_tel(m_no);
		model.addAttribute("member", member);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_updateForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="m_update")
	public String m_update(Member member, String m_tel1, String m_tel2, String m_tel3, Model model) {
		String m_tel = m_tel1 + "-" + m_tel2 + "-" + m_tel3;
		member.setM_tel(m_tel);
		int result = ms.updateMember(member);
		if(result > 0) {
			return "redirect:m_myinfo.do";
		}else {
			model.addAttribute("msg", "수정 실패");		
			model.addAttribute("member", member);
			return "forward:m_updateForm.do";
		}
	}
	
	@RequestMapping(value = "m_deleteForm", method = RequestMethod.GET)
	public String m_deleteForm(Model model, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Member member = ms.m_deletePwdChk(m_no);
		String dbPass = member.getM_passwd();
		model.addAttribute("dbPass", dbPass);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_deleteForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="m_delete")
	public String m_delete(Member member, Model model, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		int result = ms.deleteMember(m_no);
		if(result > 0) {
			session.invalidate();
			return "redirect:main.do";
		}else {
			model.addAttribute("msg", "탈퇴 실패");
			model.addAttribute("member", member);
			return "forward:m_deleteForm.do";
		}
	}

}
