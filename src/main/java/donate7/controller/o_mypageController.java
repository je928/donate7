package donate7.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Organ;
import donate7.service.MemberService;

@Controller
public class o_mypageController {
	
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "o_myinfo", method = RequestMethod.GET)
	public String o_myinfo(Model model, HttpSession session) {
		int o_no = (Integer)session.getAttribute("no");
		Organ organ = ms.selectOrgan(o_no);
		model.addAttribute(organ);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../member/o_mypage/o_myinfo.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "o_updateForm", method = RequestMethod.GET)
	public String o_updateForm(Model model, HttpSession session) {
		int o_no = (Integer)session.getAttribute("no");
		Organ organ = ms.selectOrgan_addr_tel(o_no);
		model.addAttribute("organ", organ);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../member/o_mypage/o_updateForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="o_update")
	public String o_update(Organ organ, String o_tel1, String o_tel2, String o_tel3, String post1, String post2, String addr1, String addr2, Model model) {
		String o_tel = o_tel1 + "-" + o_tel2 + "-" + o_tel3;
		String o_addr = "(" + post1 + "-" + post2 + ") " + addr1 + " " + addr2;
		organ.setO_tel(o_tel);
		organ.setO_addr(o_addr);
		int result = ms.updateOrgan(organ);
		if(result > 0) {
			return "redirect:o_myinfo.do";
		}else {
			model.addAttribute("msg", "수정 실패");		
			model.addAttribute("organ", organ);
			return "forward:o_updateForm.do";
		}
	}
	
	@RequestMapping(value = "o_deleteForm", method = RequestMethod.GET)
	public String o_deleteForm(Model model, HttpSession session) {
		int o_no = (Integer)session.getAttribute("no");
		Organ organ = ms.o_deletePwdChk(o_no);
		String dbPass = organ.getO_passwd();
		model.addAttribute("dbPass", dbPass);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../member/o_mypage/o_deleteForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="o_delete")
	public String o_delete(Organ organ, Model model, HttpSession session) {
		int o_no = (Integer)session.getAttribute("no");
		int result = ms.deleteOrgan(o_no);
		if(result > 0) {
			session.invalidate();
			return "redirect:main.do";
		}else {
			model.addAttribute("msg", "탈퇴 실패");
			model.addAttribute("organ", organ);
			return "forward:o_deleteForm.do";
		}
	}

}
