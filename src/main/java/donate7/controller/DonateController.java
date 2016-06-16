package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.DoResult;
import donate7.model.Donate;
import donate7.service.Cpoint_InfoService;
import donate7.service.DonateService;
import donate7.util.Paging;

@Controller
public class DonateController {
	@Autowired
	private DonateService ds;
	@Autowired
	private Cpoint_InfoService cs;
	
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
	@RequestMapping(value="doView", method=RequestMethod.GET)
	public String doView(int d_no,Model model) {
		Donate donate = ds.selectOne(d_no);
		String start = donate.getD_start_date();
		String res1 = start.substring(0,10);
		String end = donate.getD_end_date();
		String res2 = end.substring(0,10);
		donate.setD_start_date(res1);
		donate.setD_end_date(res2);
		model.addAttribute("donate",donate);
		model.addAttribute("pgm", "../donate/doView.jsp");
		return "module/main";
	}
	
	
	//기부하기
	@RequestMapping(value="doResult", method=RequestMethod.GET)
	public String doResult(int d_no, HttpSession session, Model model) {
		int no=(Integer)session.getAttribute("no");
		int sumCash = cs.sumCash(no);
		model.addAttribute("cash", sumCash);
		model.addAttribute("d_no",d_no);
		model.addAttribute("pgm", "../donate/doResult.jsp");
		return "module/main";
	}

}
