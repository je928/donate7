package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Product;
import donate7.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService ps;
	
	@RequestMapping("apUpdate")
	public String apUpdate(int pr_no, Model model){
		ps.apUpdate(pr_no);
		return "redirect:ad_prView.do?pr_no="+pr_no;
	}
	@RequestMapping("apCancel")
	public String apCancel(int pr_no, Model model){
		ps.apCancel(pr_no);
		return "redirect:ad_prView.do?pr_no="+pr_no;
	}
	 
	@RequestMapping(value="goods", method=RequestMethod.GET)
	public String goods(Model model){
		List<Product> list = ps.aplist();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../product/goods.jsp");
		return "module/main";
	}
	@RequestMapping(value="go_view", method=RequestMethod.GET)
	public String goview(int pr_no, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../product/go_view.jsp");
		return "module/main";
	}
}