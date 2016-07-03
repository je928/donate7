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

import donate7.model.Donate;
import donate7.model.Product;
import donate7.service.DonateService;
import donate7.util.Paging;

@Controller
public class MyDonateController {
	@Autowired
	private DonateService ds;
	
	//일반회원
	@RequestMapping(value = "mdoList", method = RequestMethod.GET)
	public String mdoList(Donate donate,Model model,String pageNum,HttpSession session) {
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		donate.setD_member(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ds.getTotal(donate);
		Paging pg = new Paging(nowPage, total);
		donate.setStartRow(pg.getStartRow());
		donate.setEndRow(pg.getEndRow());
		List<Donate> list = ds.mlist(no);
/*		int count = ds.count(donate);
		model.addAttribute("count",count);*/
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("ds", ds);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/mdoList.jsp");
		return "module/main";
	}
	@RequestMapping(value = "mdoReq", method = RequestMethod.GET)
	public String mdoReqForm(Donate donate,Model model) {
		model.addAttribute("donate", donate);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/mdoReq.jsp");
		return "module/main";
	}
	@RequestMapping(value ="mdoReq", method = RequestMethod.POST)
	public String mdoReq(Donate donate, Model model, @RequestParam("img") MultipartFile mf,
			HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		int no = (Integer)session.getAttribute("no");
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
		donate.setD_img(uploadName);
		int result = ds.mdoReqInsert(donate);
		model.addAttribute("msg", "사진 업로드 : "+fileName);
		List<Donate> list = ds.mlist(no);
		model.addAttribute("list", list);
		model.addAttribute("fileName", uploadName);
		if(result > 0){
			return "redirect:mdoList.do";
		}else{
			model.addAttribute("donate", donate);
			return "redirect:mdoReq.do";
		}
	}
	@RequestMapping(value="mdoReqV", method=RequestMethod.GET)
	public String mdoReqV(int d_no,Model model) {
		Donate donate = ds.selectOne(d_no);
		String start = donate.getD_start_date();
		String res1 = start.substring(0,10);
		String end = donate.getD_end_date();
		String res2 = end.substring(0,10);
		donate.setD_start_date(res1);
		donate.setD_end_date(res2);
		model.addAttribute("donate",donate);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/mdoReqV.jsp");
		return "module/main";
	}
	@RequestMapping(value="mdoReqUp", method=RequestMethod.GET)
	public String mdoReqUpForm(int d_no, Model model){
		Donate donate = ds.selectOne(d_no);
		String start = donate.getD_start_date();
		String res1 = start.substring(0,10);
		String end = donate.getD_end_date();
		String res2 = end.substring(0,10);
		donate.setD_start_date(res1);
		donate.setD_end_date(res2);
		model.addAttribute("donate",donate);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/mdoReqUp.jsp");
		return "module/main";
	}
	@RequestMapping(value="mdoReqUp", method=RequestMethod.POST)
	public String mdoReqUp(Donate donate,@RequestParam("img") MultipartFile mf, Model model, 
			HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		int no = (Integer)session.getAttribute("no");
		if(mf.getOriginalFilename().equals("")) {
			Donate don = ds.selectOne(donate.getD_no());
			donate.setD_img(don.getD_img());
		} else {
				String fileName = mf.getOriginalFilename();
				String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
				mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
				donate.setD_img(uploadName);
		}
		int result = ds.mdoUpdate(donate);
		if(result >0) {
			return "redirect:mdoReqV.do?d_no="+donate.getD_no();	
		} else {
			model.addAttribute("donate",donate);
			model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
			model.addAttribute("mypgm", "../../donate/mdoReqUp.jsp");
			return "module/main";
		}
	}
	@RequestMapping("mdoReqD")
	public String mdoReqD(int d_no, Model model){
		ds.mdoDelete(d_no);
		return "redirect:mdoList.do?d_no="+d_no;
	}
	
	
	
	//기관회원
	@RequestMapping(value = "odoList", method = RequestMethod.GET)
	public String odoList(Donate donate,Model model,String pageNum,HttpSession session) {
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		donate.setD_member(no);
		
		int nowPage = Integer.parseInt(pageNum);
		int total = ds.getTotal(donate);
		Paging pg = new Paging(nowPage, total);
		donate.setStartRow(pg.getStartRow());
		donate.setEndRow(pg.getEndRow());

		List<Donate> list = ds.olist(donate);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/odoList.jsp");
		return "module/main";
	}
	@RequestMapping(value = "odoReq", method = RequestMethod.GET)
	public String odoReqForm(Donate donate,Model model) {
		model.addAttribute("donate", donate);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/odoReq.jsp");
		return "module/main";
	}
	@RequestMapping(value ="odoReq", method = RequestMethod.POST)
	public String odoReq(Donate donate, Model model, @RequestParam("img") MultipartFile mf,
			HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		int no = (Integer)session.getAttribute("no");
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
		donate.setD_img(uploadName);
		int result = ds.odoReqInsert(donate);
		model.addAttribute("msg", "사진 업로드 : "+fileName);
		List<Donate> list = ds.olist(donate);
		model.addAttribute("list", list);
		model.addAttribute("fileName", uploadName);
		if(result > 0){
			return "redirect:odoList.do";
		}else{
			model.addAttribute("donate", donate);
			return "redirect:odoReq.do";
		}
	}
	@RequestMapping(value="odoReqV", method=RequestMethod.GET)
	public String odoReqV(int d_no,Model model) {
		Donate donate = ds.selectOne(d_no);
		String start = donate.getD_start_date();
		String res1 = start.substring(0,10);
		String end = donate.getD_end_date();
		String res2 = end.substring(0,10);
		donate.setD_start_date(res1);
		donate.setD_end_date(res2);
		model.addAttribute("donate",donate);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/odoReqV.jsp");
		return "module/main";
	}
	@RequestMapping(value="odoReqUp", method=RequestMethod.GET)
	public String odoReqUpForm(int d_no, Model model){
		Donate donate = ds.selectOne(d_no);
		String start = donate.getD_start_date();
		String res1 = start.substring(0,10);
		String end = donate.getD_end_date();
		String res2 = end.substring(0,10);
		donate.setD_start_date(res1);
		donate.setD_end_date(res2);
		model.addAttribute("donate",donate);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/odoReqUp.jsp");
		return "module/main";
	}
	@RequestMapping(value="odoReqUp", method=RequestMethod.POST)
	public String odoReqUp(Donate donate,@RequestParam("img") MultipartFile mf, Model model, 
			HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		int no = (Integer)session.getAttribute("no");
		if(mf.getOriginalFilename().equals("")) {
			Donate don = ds.selectOne(donate.getD_no());
			donate.setD_img(don.getD_img());
		} else {
				String fileName = mf.getOriginalFilename();
				String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
				mf.transferTo(new File(session.getServletContext().getRealPath("/image/")+uploadName));
				donate.setD_img(uploadName);
		}
		int result = ds.odoUpdate(donate);
		if(result >0) {
			return "redirect:odoReqV.do?d_no="+donate.getD_no();	
		} else {
			model.addAttribute("donate",donate);
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../donate/odoReqUp.jsp");
			return "module/main";
		}
	}
	@RequestMapping("odoReqD")
	public String odoReqD(int d_no, Model model){
		ds.odoDelete(d_no);
		return "redirect:odoList.do?d_no="+d_no;
	}
	
	
	
	//관리자
	@RequestMapping(value="adList", method=RequestMethod.GET)
	public String adList(Donate donate,String pageNum,Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		donate.setD_member(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ds.getTotal(donate);
		Paging pg = new Paging(nowPage, total);
		donate.setStartRow(pg.getStartRow());
		donate.setEndRow(pg.getEndRow());
		List<Donate> list = ds.adlist();

		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/adList.jsp");
		return "module/main";
	}
	
	
	@RequestMapping("adMList")
	public String adMList(Donate donate, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		donate.setD_member(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ds.memTotal(donate);
		Paging pg = new Paging(nowPage, total);
		donate.setStartRow(pg.getStartRow());
		donate.setEndRow(pg.getEndRow());
		List<Donate> mlist = ds.memAll(donate);
		model.addAttribute("mlist", mlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/adMList.jsp");
		return "module/main";
	
	}
	
	@RequestMapping("adOList")
	public String adOList(Donate donate, String pageNum, Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		donate.setD_member(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ds.orTotal(donate);
		Paging pg = new Paging(nowPage, total);
		donate.setStartRow(pg.getStartRow());
		donate.setEndRow(pg.getEndRow());
		List<Donate> olist = ds.orAll(donate);
		model.addAttribute("olist", olist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/adOList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="adView", method=RequestMethod.GET)
	public String adView(int d_no, Model model){
		Donate donate = ds.selectOne(d_no);
		String start = donate.getD_start_date();
		String res1 = start.substring(0,10);
		String end = donate.getD_end_date();
		String res2 = end.substring(0,10);
		donate.setD_start_date(res1);
		donate.setD_end_date(res2);
		model.addAttribute("donate", donate);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/adView.jsp");
		return "module/main";
	}
}
