package donate7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class m_mypageController {
	
	@RequestMapping(value = "m_myinfo", method = RequestMethod.GET)
	public String m_myinfo(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_myinfo.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "secondForm", method = RequestMethod.GET)
	public String secondForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/secondForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "second", method = RequestMethod.POST)
	public String second(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/secondForm.jsp");
		return "module/main";
	}
	
/*	@RequestMapping("view")
	public String view(int num,String pageNum,Model model) {
		bs.updateReadCount(num); 
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}*/
	
}
