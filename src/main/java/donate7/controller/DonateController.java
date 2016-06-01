package donate7.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.service.DonateService;

@Controller
public class DonateController {
	@Autowired
	private DonateService ds;
	
	@RequestMapping("adUpdate")
	public String adUpdate(int d_no, Model model) {
		ds.adUpdate(d_no);
		return "redirect:adView.do?d_no="+d_no;
	}
	@RequestMapping("adDelete")
	public String adDelete(int d_no, Model model) {
		ds.adDelete(d_no);
		return "redirect:adView.do?d_no="+d_no;
	}
	@RequestMapping(value = "doList", method = RequestMethod.GET)
	public String doList(Model model,HttpSession session) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/doList.jsp");
		return "module/main";
	}
}
