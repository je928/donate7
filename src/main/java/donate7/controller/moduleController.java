package donate7.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Member;
import donate7.model.Organ;
import donate7.service.MemberService;

@Controller
public class moduleController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model, String pgm) {
		model.addAttribute("pgm", pgm);
		return "module/main";
	}
	
	@RequestMapping(value = "m_tamp", method = RequestMethod.GET)
	public String m_tamp(Model model, String mypgm, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Member member = ms.selectMember(m_no);
		model.addAttribute(member);
		model.addAttribute("mypgm", mypgm);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "o_tamp", method = RequestMethod.GET)
	public String o_tamp(Model model, String mypgm, HttpSession session) {
		int o_no = (Integer)session.getAttribute("no");
		Organ organ = ms.selectOrgan(o_no);
		model.addAttribute(organ);
		model.addAttribute("mypgm", mypgm);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "a_tamp", method = RequestMethod.GET)
	public String a_tamp(Model model, String mypgm) {
		model.addAttribute("mypgm", mypgm);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		return "module/main";
	}
	
}
