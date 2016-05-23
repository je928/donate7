package donate7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class moduleController {
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model, String pgm) {
		model.addAttribute("pgm", pgm);
		return "module/main";
	}
	
	@RequestMapping(value = "m_tamp", method = RequestMethod.GET)
	public String m_tamp(Model model, String mypgm) {
		model.addAttribute("mypgm", mypgm);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "o_tamp", method = RequestMethod.GET)
	public String o_tamp(Model model, String mypgm) {
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
