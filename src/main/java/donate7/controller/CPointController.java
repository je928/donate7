package donate7.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CPointController {
	@RequestMapping("cpointList")
	public String cpointList(HttpSession session,Model model){
		int m_no = (Integer) session.getAttribute("no");
		
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_cpList.jsp");		
		return "module/main";
	}
}
