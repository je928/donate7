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
import donate7.model.Gift;
import donate7.model.Gift_Buy;
import donate7.model.Second;
import donate7.service.DonateService;
import donate7.service.GiftService;
import donate7.service.Gift_BuyService;
import donate7.service.SecondService;

@Controller
public class m_mypageController {
	@Autowired
	private Gift_BuyService gbs;
	@Autowired
	private GiftService gs;
	@Autowired
	private DonateService ds;
	@Autowired
	private SecondService ss;
	
	@RequestMapping(value = "m_myinfo", method = RequestMethod.GET)
	public String m_myinfo(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_myinfo.jsp");
		return "module/main";
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
		int m_no = (Integer)session.getAttribute("no");
		List<Second> list = ss.list();
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
				HttpServletRequest request,Model model,Second second) throws IllegalStateException, IOException{
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(request.getRealPath("/")+uploadName));
			second.setSh_image(uploadName);
			ss.insert(second);
			model.addAttribute("msg", "파일이름 : "+fileName);
			List<Second> list = ss.list();
			model.addAttribute("list", list);
			model.addAttribute("fileName", uploadName);
			model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
			model.addAttribute("mypgm", "../../second/msecond/msecondList.jsp");
			return "module/main";
		}
	
	@RequestMapping(value = "m_prList", method = RequestMethod.GET)
	public String mproList(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/m_prList.jsp");
		return "module/main";
	}
	@RequestMapping(value = "m_prWrite", method = RequestMethod.GET)
	public String m_prWriteForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/m_prWrite.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_prWrite", method = RequestMethod.POST)
	public String m_prWrite(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/m_prWrite.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "ownGift", method = RequestMethod.GET)
	public String ownGift(Model model,HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		List<Gift_Buy> list = gbs.ownList(m_no);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/ownGift.jsp");
		model.addAttribute("list", list);
		model.addAttribute("gs", gs);
		return "module/main";
	}
	
	@RequestMapping(value = "ownGiftDetail", method = RequestMethod.GET)
	public String ownGiftDetail(int gb_no,Model model,HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Gift_Buy gb = gbs.selectOne(gb_no);
		Gift gift = gs.selectOne(gb.getG_no());
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/ownGiftDetail.jsp");
		model.addAttribute("gb", gb);
		model.addAttribute("gift", gift);
		return "module/main";
	}
	@RequestMapping(value = "mdoList", method = RequestMethod.GET)
	public String mdoList(Model model) {
		List<Donate> list = ds.list();
		model.addAttribute("list", list);
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
			HttpServletRequest request) throws IllegalStateException, IOException {
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(request.getRealPath("/")+uploadName));
		donate.setD_img(uploadName);
		int result = ds.mdoReqInsert(donate);
		model.addAttribute("msg", "사진 업로드 : "+fileName);
		List<Donate> list = ds.list();
		model.addAttribute("list", list);
		model.addAttribute("fileName", uploadName);
		if(result > 0){
			return "redirect:mdoList.do";
		}else{
			model.addAttribute("donate", donate);
			return "redirect:mdoReq.do";
		}

	}
}
