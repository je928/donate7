package donate7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Donate;
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
	@RequestMapping(value="doList", method=RequestMethod.GET)
	public String doList(Model model){
		List<Donate> list = ds.doList();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../donate/doList.jsp");
		return "module/main";
	}
}
