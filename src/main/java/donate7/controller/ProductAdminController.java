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
public class ProductAdminController {
	@Autowired
	private ProductService ps;
	
	@RequestMapping(value="ad_prList", method=RequestMethod.GET)
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
	}
	
	@RequestMapping(value="ad_prSlist", method=RequestMethod.GET)
	public String adprSlist(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.prSTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> pSlist = ps.prSlist(product);
		
		model.addAttribute("pSlist", pSlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_prSlist.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_prAlist", method=RequestMethod.GET)
	public String adprAList(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.prATotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> pAlist = ps.prAlist(product);
		
		model.addAttribute("pAlist", pAlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_prAlist.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_memSlist", method=RequestMethod.GET)
	public String admemSlist(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.memSTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> mSlist = ps.memSlist(product);
		
		model.addAttribute("mSlist", mSlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_memSlist.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_memAlist", method=RequestMethod.GET)
	public String admemAList(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.memATotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> mAlist = ps.memAlist(product);
		
		model.addAttribute("mAlist", mAlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_memAlist.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_orSlist", method=RequestMethod.GET)
	public String adorSlist(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.orSTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> oSlist = ps.orSlist(product);
		
		model.addAttribute("oSlist", oSlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_orSlist.jsp");
		return "module/main";
	}
	@RequestMapping(value="ad_orAlist", method=RequestMethod.GET)
	public String adorAList(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.orATotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> oAlist = ps.orAlist(product);
		
		model.addAttribute("oAlist", oAlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_orAlist.jsp");
		return "module/main";
	}
	
	/*
	
	@RequestMapping("ad_mlist")
	public String admlist(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
				product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.memTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> mlist = ps.memAll(product);
		model.addAttribute("mlist", mlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_mlist.jsp");
		return "module/main";
	
	}
	
	@RequestMapping("ad_olist")
	public String adoList(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.orTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> olist = ps.orAll(product);
		model.addAttribute("olist", olist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_olist.jsp");
		return "module/main";
	}
	*/
	
	@RequestMapping(value="ad_prView", method=RequestMethod.GET)
	public String ad_prView(int pr_no, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product/admin/ad_prView.jsp");
		return "module/main";
	}

}
