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


import donate7.model.Second;
import donate7.service.SecondService;

import donate7.model.Product;
import donate7.service.ProductService;


@Controller
public class o_mypageController {
	@Autowired
	private SecondService ss;
	@Autowired
	private ProductService ps;

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
	public String osecondList(Model model) {
		List<Second> list = ss.list();
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
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../second/osecond/osecondList.jsp");
			return "module/main";
		}
	@RequestMapping(value = "o_prList", method = RequestMethod.GET)
	public String o_prList(Model model) {
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/o_prList.jsp");
	}
	public String second(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/osecondForm.jsp");
		return "module/main";
	}
	@RequestMapping(value="o_prList", method=RequestMethod.GET)
	public String oprList(Model model, HttpSession session){
		int no=(Integer)session.getAttribute("no");
		List<Product> list = ps.olist();
		model.addAttribute("list", list);
		model.addAttribute("pgm","../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prList.jsp");
>>>>>>> 05ea2aeea4d7cb91ac955481a468215d641dbc18
		return "module/main";
	}
	@RequestMapping(value="o_prWrite", method=RequestMethod.GET)
	public String oprwriteForm(Model model){
		model.addAttribute("pgm","../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../product/organ/o_prList.jsp");
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
	List<Product> list = ps.prlist();
	model.addAttribute("list", list);
	model.addAttribute("fileName", uploadName);
	model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
	model.addAttribute("mypgm", "../../product/organ/o_prList.jsp");
	return "module/main";
}
	@RequestMapping(value = "odoList", method = RequestMethod.GET)
	public String odoList(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../donate/odoList.jsp");
		return "module/main";
	}

}
