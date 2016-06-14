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
import donate7.util.Paging;

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
		model.addAttribute("pgm", "../product/goods.jsp");
		return "module/main";
	}
	
	@RequestMapping("goodList")
	public String goodList(Product pd,String pageNum,Model model){
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.apTotal(pd);
		Paging pg = new Paging(nowPage, total);
		pd.setStartRow(pg.getStartRow());
		pd.setEndRow(pg.getEndRow());
		
		List<Product> list = ps.aplist(pd);
		model.addAttribute("list", list);
		model.addAttribute("pr_item",pd.getPr_item());
		model.addAttribute("pg", pg);
		return "product/goodList";
	}
	
	
	/*@RequestMapping(value="ad_prList", method=RequestMethod.GET)
	public String adprList(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.getTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> prlist = ps.prlist(product);
		
		model.addAttribute("prlist", prlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_prList.jsp");
		return "module/main";
	}*/
	@RequestMapping(value="go_view", method=RequestMethod.GET)
	public String goview(int pr_no, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../product/go_view.jsp");
		return "module/main";
	}
}