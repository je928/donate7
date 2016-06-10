package donate7.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import donate7.model.Product;
import donate7.service.ProductService;
import donate7.util.Paging;


@Controller
public class ProductMypController {
	
	@Autowired
	private ProductService ps;
	//일반
	
	
	@RequestMapping(value = "m_prList", method = RequestMethod.GET)
	public String mproList(Product product, String pageNum, Model model, HttpSession session) {
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
	
		product.setPr_mno(no);

		int nowPage = Integer.parseInt(pageNum);
		int total = ps.count(product);
		
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> list = ps.mlist(product);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prList.jsp");
		return "module/main";
	}
	@RequestMapping(value ="m_prWrite", method = RequestMethod.GET)
	public String m_prWriteForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prWrite.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="m_prWrite", method=RequestMethod.POST)
	public String m_prWrite(@RequestParam("mimg") MultipartFile mf,
			HttpServletRequest request,Model model,Product product,String pageNum, HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
		product.setPr_img(uploadName);
		product.setPr_mno(no);
		ps.insert(product);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.count(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> list = ps.mlist(product);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("fileName", uploadName);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="m_prView", method=RequestMethod.GET)
	public String m_prView(int pr_no, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prView.jsp");
		return "module/main";
	}
	@RequestMapping(value ="m_prUpdate", method = RequestMethod.GET)
	public String mprupdateForm(int pr_no, Model model) {
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prUpdate.jsp");
		return "module/main";
	}
	@RequestMapping(value="m_prUpdate", method=RequestMethod.POST)
	public String mprupdate(@RequestParam("mimg") MultipartFile mf,
			HttpServletRequest request,Model model,Product product, String pageNum, HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		if(mf.getOriginalFilename().equals("")){
			Product pr = ps.selectOne(product.getPr_no());
			product.setPr_img(pr.getPr_img());
		}else{
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
			product.setPr_img(uploadName);
		}
		product.setPr_mno(no);
		ps.prUpdate(product);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.count(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> list = ps.mlist(product);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prView.jsp");
		return "module/main";
	}
	@RequestMapping("m_prDelete")
	public String mdelete(int pr_no, Model model){
		ps.prdelete(pr_no);
		return "redirect:m_prList.do?pr_no="+pr_no;
	}
	
	//기관
	@RequestMapping(value="o_prList", method=RequestMethod.GET)
	public String oprList(Product product, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
	
		product.setPr_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.count(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		
		List<Product> list = ps.olist(product);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm","../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prList.jsp");
		return "module/main";
	}
	@RequestMapping(value="o_prWrite", method=RequestMethod.GET)
	public String oprwriteForm(Model model){
		model.addAttribute("pgm","../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prWrite.jsp");
		return "module/main";
	}
	@RequestMapping(value="o_prWrite", method=RequestMethod.POST)
	public String oprwrite(@RequestParam("oimg") MultipartFile mf,
			HttpServletRequest request,Model model,Product product, String pageNum, HttpSession session) throws IllegalStateException, IOException{
	int no=(Integer)session.getAttribute("no");
	if(pageNum == null || pageNum.equals("")) {
		pageNum = "1";
	}
	String fileName = mf.getOriginalFilename();
	String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
	mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
	product.setPr_img(uploadName);
	product.setPr_mno(no);
	ps.insert(product);
	int nowPage = Integer.parseInt(pageNum);
	int total = ps.count(product);
	Paging pg = new Paging(nowPage, total);
	product.setStartRow(pg.getStartRow());
	product.setEndRow(pg.getEndRow());
	model.addAttribute("msg", "파일이름 : "+fileName);
	List<Product> list = ps.olist(product);
	
	model.addAttribute("list", list);
	model.addAttribute("total", total);
	model.addAttribute("pg", pg);
	model.addAttribute("fileName", uploadName);
	model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
	model.addAttribute("mypgm", "../../product/organ/o_prList.jsp");
	return "module/main";
	}
	@RequestMapping(value="o_prView", method=RequestMethod.GET)
	public String o_prView(int pr_no, Model model){
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prView.jsp");
		return "module/main";
	}
	@RequestMapping(value ="o_prUpdate", method = RequestMethod.GET)
	public String oprupdateForm(int pr_no, Model model) {
		Product product = ps.selectOne(pr_no);
		model.addAttribute("product", product);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prUpdate.jsp");
		return "module/main";
	}
	@RequestMapping(value="o_prUpdate", method=RequestMethod.POST)
	public String oprupdate(@RequestParam("oimg") MultipartFile mf,
			HttpServletRequest request,Model model,Product product, String pageNum, HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
	
		if(mf.getOriginalFilename().equals("")){
			Product pr = ps.selectOne(product.getPr_no());
			product.setPr_img(pr.getPr_img());
		}else{
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
			product.setPr_img(uploadName);
		}
		product.setPr_mno(no);
		ps.prUpdate(product);
		int nowPage = Integer.parseInt(pageNum);
		int total = ps.count(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());

		List<Product> list = ps.olist(product);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prView.jsp");
		return "module/main";
	}
	@RequestMapping("o_prDelete")
	public String odelete(int pr_no, Model model){
		ps.prdelete(pr_no);
		return "redirect:o_prList.do?pr_no="+pr_no;
	}
	/*
	@RequestMapping(value="prlist")
	public String prlist(Product product, String pageNum, Model model) {
		final int rowPerPage = 10;
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
	
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		
		product.setStartRow(startRow);
		product.setEndRow(endRow);
	
		ProductPagingBean ppg = new ProductPagingBean(nowPage, total);
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
	
		int nowPage = Integer.parseInt(pageNum);
		
		int total = ps.getTotal(product);
		Paging pg = new Paging(nowPage, total);
		product.setStartRow(pg.getStartRow());
		product.setEndRow(pg.getEndRow());
		List<Product> list = ps.prlist(product);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
	
		
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prList.jsp");
		return "module/main";
	}
	*/
	
	

	
	
	
}
