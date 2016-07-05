package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Donate;
import donate7.model.Member;
import donate7.model.Organ;
import donate7.model.Product;
import donate7.model.Recruit;
import donate7.service.DonateService;
import donate7.service.MemberService;
import donate7.service.ProductPagingBean;
import donate7.service.ProductService;
import donate7.service.VolService;

@Controller
public class moduleController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private DonateService ds;
	
	@Autowired
	private VolService vs;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model, String pgm) {
		model.addAttribute("pgm", pgm);
		return "module/main";
	}
	
	@RequestMapping(value = "home")
	public String home(Model model, String pgm) {
		Donate donate = new Donate();
		donate.setCtg("all");
		donate.setStartRow(1);
		donate.setEndRow(5);
		List<Donate> list1 = ds.doList(donate);
		System.out.println("list1 = "+list1);
		
		Recruit recruit = new Recruit();
		recruit.setStartrow(1);
		recruit.setEndrow(5);
		List<Recruit> list2 = vs.selectRcList(recruit);
		
		Product product = new Product();
		product.setStartRow(1);
		product.setEndRow(5);
		List<Product> list3 = ps.golist(product, "all");
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
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
