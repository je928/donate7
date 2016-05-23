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

import donate7.service.GiftService;
import donate7.model.Gift;

@Controller
public class GiftController {
	
	@Autowired
	private GiftService gs;	 
	@RequestMapping(value="giftList", method=RequestMethod.GET)
	public String giftList(Model model){
		List<Gift> list = gs.list();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../gift/giftList.jsp");
		return "module/main";
	}
	@RequestMapping(value="gift_buy", method=RequestMethod.GET)
	public String gift_buy(Model model,HttpSession session,int g_no){
		model.addAttribute("pgm", "../gift/giftList.jsp");
		return "module/main";
	}
	@RequestMapping(value="giftDetail", method=RequestMethod.GET)
	public String giftDetail(int g_no,Model model,HttpSession session){
		Gift gift = gs.selectOne(g_no);
		int no = (Integer) session.getAttribute("no");
		model.addAttribute("gift", gift);
		model.addAttribute("pgm", "../gift/giftDetail.jsp");
		model.addAttribute("no", no);
		return "module/main";
	}
	@RequestMapping(value="giftUpload", method=RequestMethod.POST)
	public String upload(@RequestParam("img") MultipartFile mf,
			HttpServletRequest request,Model model,Gift gift) throws IllegalStateException, IOException{
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(request.getRealPath("/")+uploadName));
		gift.setG_img(uploadName);
		gs.insert(gift);
		model.addAttribute("msg", "?åå?ùº Î°úÎìú ?Ñ±Í≥? : "+fileName);
		List<Gift> list = gs.list();
		model.addAttribute("list", list);
		model.addAttribute("fileName", uploadName);
		model.addAttribute("pgm", "../gift/giftList.jsp");
		return "module/main";
	}
}
