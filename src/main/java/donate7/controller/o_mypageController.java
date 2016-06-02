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

}
