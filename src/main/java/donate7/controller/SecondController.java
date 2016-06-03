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
	public String msecondList(Model model, HttpSession session) {
		int no = (Integer)session.getAttribute("no");
		List<Second> list = ss.mlist(no);
		Second second = new Second();
		second.setSh_mno(no);
		int count = ss.count(no);
		model.addAttribute("count", count);
		model.addAttribute("list", list);
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
			List<Second> list = ss.mlist(no);
			model.addAttribute("list", list);
			model.addAttribute("fileName", uploadName);
			model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
			model.addAttribute("mypgm", "../../second/msecond/msecondList.jsp");
			return "module/main";
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
		List<Second> list = ss.mlist(no);
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
	public String osecondList(Model model, HttpSession session) {
		int no = (Integer)session.getAttribute("no");
		List<Second> list = ss.olist(no);
		Second second = new Second();
		second.setSh_mno(no);
		int count = ss.count(no);
		model.addAttribute("count", count);
		model.addAttribute("list", list);
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
			List<Second> list = ss.olist(no);
			model.addAttribute("list", list);
			model.addAttribute("fileName", uploadName);
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../second/osecond/osecondList.jsp");
			return "module/main";
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
		List<Second> list = ss.mlist(no);
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
	public String adsecondList(HttpSession session,Model model) {
		int no = 0;
		if(session.getAttribute("no") != null){
			no = Integer.parseInt(session.getAttribute("no").toString());
		}
		List<Second> list = ss.adlist();
		int total = ss.count(no);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../second/adsecond/adsecondList.jsp");
		return "module/main";
	}
/*	@RequestMapping("myRecruit")
	public String myRecruit(String pageNum, Recruit rc, HttpSession session, Model model){
		String num = pageNum;
		Recruit rec = rc;
		if(num == null){
			num = "1";
		}
		if(rc == null){
			rec = new Recruit();
		}
		int pnum = Integer.parseInt(num);
		int o_no = 0;
		if(session.getAttribute("no") != null){
			o_no = Integer.parseInt(session.getAttribute("no").toString());
			rec.setVt_o_no(o_no);
			int total = vs.selectRcTotal(rec);
			Paging paging = new Paging(10, 10, pnum, total);
			rec.setStartrow(paging.getStartRow());
			rec.setEndrow(paging.getEndRow());
			List<Recruit> list = vs.selectRcList(rec);
			model.addAttribute("tot", total);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			model.addAttribute("rec", rec);
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../vt/myRecruit.jsp");
			return "module/main";
		}else{
			return "redirect:login.do";
		}*/
	}
	
