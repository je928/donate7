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
import donate7.model.Second;
import donate7.service.DonateService;
import donate7.service.ProductService;
import donate7.service.SecondService;

@Controller
public class o_mypageController {
	@Autowired
	private SecondService ss;
	@Autowired
	private ProductService ps;
	@Autowired
	private DonateService ds;

	@RequestMapping(value = "o_myinfo", method = RequestMethod.GET)
	public String o_myinfo(Model model) {
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../member/o_mypage/o_myinfo.jsp");
		return "module/main";
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
		int count = ss.count(second);
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
	public String msecondupdateForm(int sh_no, Model model) {
		Second second = ss.selectOne(sh_no);
		model.addAttribute("second", second);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondUpdate.jsp");
		return "module/main";
	}
	@RequestMapping(value="osecondUpdate", method=RequestMethod.POST)
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
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecond/osecondView.jsp");
		return "module/main";
	}
	@RequestMapping(value="o_prList", method=RequestMethod.GET)
	public String oprList(Model model, HttpSession session){
		
		int no=(Integer)session.getAttribute("no");
		Product product = new Product();
		product.setPr_mno(no);
		int count=ps.count(product);
		List<Product> list = ps.olist(no);
		model.addAttribute("count", count);
		model.addAttribute("list", list);
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
			HttpServletRequest request,Model model,Product product,HttpSession session) throws IllegalStateException, IOException{
	int no=(Integer)session.getAttribute("no");
	String fileName = mf.getOriginalFilename();
	String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
	mf.transferTo(new File(request.getRealPath("/")+uploadName));
	product.setPr_img(uploadName);
	product.setPr_mno(no);
	ps.insert(product);
	model.addAttribute("msg", "파일이름 : "+fileName);
	List<Product> list = ps.olist(no);
	model.addAttribute("list", list);
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
		List<Product> list = ps.olist(no);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prView.jsp");
		return "module/main";
	}
	@RequestMapping("o_prDelete")
	public String delete(int pr_no, Model model){
		ps.prdelete(pr_no);
		return "redirect:o_prList.do?pr_no="+pr_no;
	}
	@RequestMapping(value = "odoList", method = RequestMethod.GET)
	public String odoList(Model model, HttpSession session) {
		int no=(Integer)session.getAttribute("no");
		List<Donate> list = ds.olist(no);
		Donate donate = new Donate();
		donate.setD_member(no);
		int count = ds.count(donate);
		model.addAttribute("count",count);
		model.addAttribute("list", list);
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
		mf.transferTo(new File(request.getRealPath("/")+uploadName));
		donate.setD_img(uploadName);
		int result = ds.odoReqInsert(donate);
		model.addAttribute("msg", "사진 업로드 : "+fileName);
		List<Donate> list = ds.olist(no);
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
				mf.transferTo(new File(request.getRealPath("/")+uploadName));
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

}
