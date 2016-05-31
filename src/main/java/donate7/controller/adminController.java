package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Donate;
import donate7.model.Product;
import donate7.model.Second;
import donate7.service.DonateService;
import donate7.service.ProductService;
import donate7.service.SecondService;

@Controller
public class adminController {
	
	@Autowired
	private SecondService ss;
	@Autowired
	private ProductService ps;
	@Autowired
	private DonateService ds;
	
	@RequestMapping(value="giftUpload", method=RequestMethod.GET)
	public String upload(Model model){
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../gift/giftUpload.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="adsecondView", method=RequestMethod.GET)
	public String msecondView(int sh_no, Model model){
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adsecondView.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "adsecondList", method = RequestMethod.GET)
	public String adsecondList(Model model) {
		List<Second> list = ss.adlist();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adsecondList.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_prList", method=RequestMethod.GET)
	public String adprList(Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		Product product = new Product();
		product.setPr_mno(no);
		int count=ps.count(product);
		List<Product> list = ps.prlist();
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_prList.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_prView", method=RequestMethod.GET)
	public String ad_prView(int pr_no, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_prView.jsp");
		return "module/main";
	}
	@RequestMapping(value="adList", method=RequestMethod.GET)
	public String adList(Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		Donate donate = new Donate();
		donate.setD_member(no);
		int count=ds.count(donate);
		List<Donate> list = ds.adlist();
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/adList.jsp");
		return "module/main";
	}
	@RequestMapping(value="adView", method=RequestMethod.GET)
	public String adView(int d_no, Model model){
		Donate donate = ds.selectOne(d_no);
		model.addAttribute("donate", donate);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/adView.jsp");
		return "module/main";
	}
	
}
