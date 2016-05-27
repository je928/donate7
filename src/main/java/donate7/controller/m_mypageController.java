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
import donate7.model.Product;
import donate7.model.Second;
import donate7.service.DonateService;
import donate7.service.GiftService;
import donate7.service.Gift_BuyService;
import donate7.service.ProductService;
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
	@Autowired
	private ProductService ps;
	
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
		int no = (Integer)session.getAttribute("no");
		List<Second> list = ss.mlist(no);
		Second second = new Second();
		second.setSh_mno(no);
		int count = ss.count(second);
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
	@RequestMapping(value = "m_prList", method = RequestMethod.GET)
	public String mproList(Model model, HttpSession session) {
		int no=(Integer)session.getAttribute("no");
		List<Product> list = ps.mlist(no);
		model.addAttribute("list", list);
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
			HttpServletRequest request,Model model,Product product,HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(request.getRealPath("/")+uploadName));
		product.setPr_img(uploadName);
		product.setPr_mno(no);
		ps.insert(product);
		model.addAttribute("msg", "파일이름 : "+fileName);
		List<Product> list = ps.prlist();
		model.addAttribute("list", list);
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
		model.addAttribute("mypgm", "../../product/m_prView.jsp");
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
			HttpServletRequest request,Model model,Product product,HttpSession session) throws IllegalStateException, IOException{
		int no=(Integer)session.getAttribute("no");
		
		if(mf.getOriginalFilename().equals("")){
			Product pr = ps.selectOne(product.getPr_no());
			product.setPr_img(pr.getPr_img());
		}else{
			String fileName = mf.getOriginalFilename();
			String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
			mf.transferTo(new File(request.getRealPath("/")+uploadName));
			product.setPr_img(uploadName);
		}
		product.setPr_mno(no);
		ps.prUpdate(product);
		List<Product> list = ps.mlist(no);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/member/m_prView.jsp");
		return "module/main";
	}
	@RequestMapping("m_prDelete")
	public String delete(int pr_no, Model model){
		ps.prdelete(pr_no);
		return "redirect:m_prList.do?pr_no="+pr_no;
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
		model.addAttribute("donate",donate);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/mdoReqUp.jsp");
		return "module/main";
	}
	@RequestMapping(value="mdoReqUp", method=RequestMethod.POST)
	public String mdoReqUp(Donate donate,@RequestParam("img") MultipartFile mf, Model model) {
		donate.setD_img("test.jpg");
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
}
