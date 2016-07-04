package donate7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Product;
import donate7.service.ProductPagingBean;
import donate7.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService ps;

	
	@RequestMapping("apUpdate")
	public String apUpdate(int pr_no, Model model, String chk){
		ps.apUpdate(pr_no);
		model.addAttribute("chk", chk);
		return "redirect:ad_prView.do?pr_no="+pr_no;
	}
	@RequestMapping("apCancel")
	public String apCancel(int pr_no, Model model, String chk){
		ps.apCancel(pr_no);
		model.addAttribute("chk", chk);
		return "redirect:ad_prView.do?pr_no="+pr_no;
	}
	 
/*	@RequestMapping(value="goods", method=RequestMethod.GET)
	public String goods(Model model){
		model.addAttribute("pgm", "../product/goods.jsp");
		return "module/main";
	}
	*/
	/*@RequestMapping("goodList")
	public String goodList(Product product,String pageNum,Model model){
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.apTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		
		List<Product> list = ps.aplist(product);
		model.addAttribute("list", list);
		model.addAttribute("pr_item",product.getPr_item());
		model.addAttribute("pg", pg);
		return "product/goodList";
	}*/
	
	
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
	public String goview(int pr_no, String pageNum, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../product/go_view.jsp");
		return "module/main";
	}
	
	@RequestMapping("goods")
	public String a_deliveryForm(Model model, Product product, String pageNum, String fdp) {
		final int rowPerPage = 15;
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		if(fdp==null|| fdp.equals("")){
			fdp="all";
		}
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		Product pr = new Product();	
		pr.setFdp(fdp);
		int total = ps.goTotal(pr);
		
		product.setStartRow(startRow);
		product.setEndRow(endRow);
		ProductPagingBean pg = new ProductPagingBean(nowPage, total);
		List<Product> golist = ps.golist(product, fdp);
		
		model.addAttribute("golist", golist);
		model.addAttribute("pg", pg);
		model.addAttribute("fdp", fdp);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../product/goods.jsp");
		
		return "module/main";
	}

}