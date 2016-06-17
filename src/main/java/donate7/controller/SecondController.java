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
import donate7.model.Recruit;
import donate7.model.Second;
import donate7.service.SecondService;
import donate7.util.Paging;
@Controller
public class SecondController {
	@Autowired
	SecondService ss;
	
	@RequestMapping("spUpdate")
	public String spUpdate(int sh_no, Model model){
		ss.spUpdate(sh_no);
		return "redirect:adsecondView.do?sh_no="+sh_no;
	}
	@RequestMapping("spCancel")
	public String spCancel(int sh_no, Model model){
		ss.spCancel(sh_no);
		return "redirect:adsecondView.do?sh_no="+sh_no;
	}
	@RequestMapping("srUpdate")
	public String srUpdate(int sh_no, Model model){
		ss.srUpdate(sh_no);
		return "redirect:adsecondView2.do?sh_no="+sh_no;
	}
	@RequestMapping("srCancel")
	public String srCancel(int sh_no, Model model){
		ss.srCancel(sh_no);
		return "redirect:adsecondView2.do?sh_no="+sh_no;
	}
	@RequestMapping(value="msecondView", method=RequestMethod.GET)
	public String msecondView(int sh_no, Model model){
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecond/msecondView.jsp");
		return "module/main";
	}
	@RequestMapping(value = "msecondList", method = RequestMethod.GET)
	public String msecondList(Second second, String pageNum, Model model, HttpSession session) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.getTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> list = ss.mlist(second);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecond/msecondList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "msecondForm", method = RequestMethod.GET)
	public String secondForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecond/msecondForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "msecond", method = RequestMethod.POST)
		public String second(@RequestParam("image") MultipartFile mf,
				HttpServletRequest request,Model model,Second second, HttpSession session) throws IllegalStateException, IOException{
			int no = (Integer)session.getAttribute("no");
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(request.getRealPath("/")+uploadName));
			second.setSh_image(uploadName);
			ss.insert(second);
			model.addAttribute("msg", "파일이름 : "+fileName);
			List<Second> list = ss.mlist(second);
			model.addAttribute("list", list);
			model.addAttribute("fileName", uploadName);
			return "redirect:msecondList.do";
		}
	@RequestMapping(value ="msecondUpdate", method = RequestMethod.GET)
	public String msecondupdateForm(int sh_no, Model model) {
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecond/msecondUpdate.jsp");
		return "module/main";
	}
	@RequestMapping(value="msecondUpdate", method=RequestMethod.POST)
	public String msecondupdate(@RequestParam("image") MultipartFile mf,
			HttpServletRequest request,Model model,Second second,HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		
		if(mf.getOriginalFilename().equals("")){
			Second sc = ss.selectOne(second.getSh_no());
			second.setSh_image(second.getSh_image());
		}else{
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(request.getRealPath("/")+uploadName));
			second.setSh_image(uploadName);
		}
		second.setSh_mno(no);
		ss.msecondUpdate(second);
		List<Second> list = ss.mlist(second);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecond/msecondView.jsp");
		return "module/main";
	}
	@RequestMapping("msecondDelete")
	public String msdelete(int sh_no, Model model){
		ss.msdelete(sh_no);
		return "redirect:msecondList.do?sh_no="+sh_no;
	}
	
	@RequestMapping(value="osecondView", method=RequestMethod.GET)
	public String osecondView(int sh_no, Model model){
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondView.jsp");
		return "module/main";
	}
	@RequestMapping(value = "osecondList", method = RequestMethod.GET)
	public String osecondList(Second second, String pageNum, Model model, HttpSession session) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.getTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> list = ss.olist(second);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "osecondForm", method = RequestMethod.GET)
	public String osecondForm(Model model) {
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "osecond", method = RequestMethod.POST)
		public String osecond(@RequestParam("image") MultipartFile mf,
				HttpServletRequest request,Model model,Second second, HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(request.getRealPath("/")+uploadName));
			second.setSh_image(uploadName);
			ss.insert(second);
			model.addAttribute("msg", "파일이름 : "+fileName);
			List<Second> list = ss.olist(second);
			model.addAttribute("list", list);
			model.addAttribute("fileName", uploadName);
			return "redirect:osecondList.do";
		}
	
	@RequestMapping(value = "second", method = RequestMethod.GET)
	public String second(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecondForm.jsp");
		return "module/main";
	}
	@RequestMapping(value ="osecondUpdate", method = RequestMethod.GET)
	public String osecondupdateForm(int sh_no, Model model) {
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondUpdate.jsp");
		return "module/main";
	}
	@RequestMapping(value="osecondUpdate", method=RequestMethod.POST)
	public String osecondupdate(@RequestParam("image") MultipartFile mf,
			HttpServletRequest request,Model model,Second second,HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		
		if(mf.getOriginalFilename().equals("")){
			Second sc = ss.selectOne(second.getSh_no());
			second.setSh_image(second.getSh_image());
		}else{
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(request.getRealPath("/")+uploadName));
			second.setSh_image(uploadName);
		}
		second.setSh_mno(no);
		ss.msecondUpdate(second);
		List<Second> list = ss.mlist(second);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondView.jsp");
		return "module/main";
	}
	@RequestMapping("osecondDelete")
	public String osdelete(int sh_no, Model model){
		ss.msdelete(sh_no);
		return "redirect:osecondList.do?sh_no="+sh_no;
	}
	
	@RequestMapping(value="adsecondView", method=RequestMethod.GET)
	public String adsecondView(int sh_no, Model model){
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adsecondView.jsp");
		return "module/main";
	}
	@RequestMapping(value="adsecondView2", method=RequestMethod.GET)
	public String adsecondView2(int sh_no, Model model){
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adsecondView2.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "adsecondList", method = RequestMethod.GET)
	public String adsecondList(Second second, String pageNum, HttpSession session,Model model) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum== null || pageNum.equals("")){
			pageNum="1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.memTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> memlist = ss.admlist(second);
		
		model.addAttribute("memlist", memlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adsecondList.jsp");
		return "module/main";
	}
	
	/*@RequestMapping(value = "admemList", method = RequestMethod.GET)
	public String admemList(Second second, String pageNum, HttpSession session,Model model) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum== null || pageNum.equals("")){
			pageNum="1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.memTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> memlist = ss.admlist(second);
		
		model.addAttribute("memlist", memlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/admemList.jsp");
		return "module/main";
	}*/
	@RequestMapping(value = "admemArrive", method = RequestMethod.GET)
	public String admemArrive(Second second, String pageNum, HttpSession session,Model model) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum== null || pageNum.equals("")){
			pageNum="1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.arrTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> memlist = ss.admAlist(second);
		
		model.addAttribute("memlist", memlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/admemArrive.jsp");
		return "module/main";
	}
	@RequestMapping(value = "adorList", method = RequestMethod.GET)
	public String adorList(Second second, String pageNum, HttpSession session,Model model) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum== null || pageNum.equals("")){
			pageNum="1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.orTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> orlist = ss.adolist(second);
		
		model.addAttribute("orlist", orlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adorList.jsp");
		return "module/main";
	}
	@RequestMapping(value = "adorArrive", method = RequestMethod.GET)
	public String adorArrive(Second second, String pageNum, HttpSession session,Model model) {
		int no = (Integer)session.getAttribute("no");
		if(pageNum== null || pageNum.equals("")){
			pageNum="1";
		}
		
		second.setSh_mno(no);
		int nowPage = Integer.parseInt(pageNum);
		int total = ss.oarrTotal(second);
		Paging pg = new Paging(nowPage, total);
		second.setStartRow(pg.getStartRow());
		second.setEndRow(pg.getEndRow());
		List<Second> orlist = ss.adoAlist(second);
		
		model.addAttribute("orlist", orlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adorArrive.jsp");
		return "module/main";
	}

}
	
