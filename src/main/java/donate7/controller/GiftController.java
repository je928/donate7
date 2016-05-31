package donate7.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import donate7.service.Cpoint_InfoService;
import donate7.service.GiftService;
import donate7.service.Gift_BuyService;
import donate7.model.Cpoint_info;
import donate7.model.Gift;
import donate7.model.Gift_Buy;

@Controller
public class GiftController {	
	@Autowired	
	private GiftService gs;
	@Autowired
	private Cpoint_InfoService cs;
	@Autowired
	private Gift_BuyService gbs;
	@RequestMapping(value="giftList", method=RequestMethod.GET)
	public String giftList(Model model){
		List<Gift> list = gs.list();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../gift/giftList.jsp");
		return "module/main";
	}
	@RequestMapping(value="giftDetail", method=RequestMethod.GET)
	public String giftDetail(int g_no,Model model,HttpSession session){
		Gift gift = gs.selectOne(g_no);
		int no = 0;
		if(session.getAttribute("no")!=null){
			no = (Integer) session.getAttribute("no");
		}
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
		List<Gift> list = gs.list();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../gift/giftList.jsp");
		return "module/main";
	}
	@RequestMapping(value="gift_buy", method=RequestMethod.GET)
	public String gift_buy(int g_no,Model model,HttpSession session){
		Gift gift = gs.selectOne(g_no);
		int m_no = (Integer) session.getAttribute("no");
		int sumPoint = cs.sumPoint(m_no);
		if(sumPoint<gift.getG_price()){
			model.addAttribute("gift", gift);
			model.addAttribute("pgm", "../gift/giftDetail.jsp");
			model.addAttribute("msg", "포인트가 부족합니다. 현재 포인트 : "+sumPoint);
			return "module/main";
		}else{	
			Cpoint_info ci = new Cpoint_info();
			ci.setM_no(m_no);
			ci.setCp_sort('p');
			ci.setCp_point(-gift.getG_price());
			ci.setCp_point_re("기프티콘 구매");
			int result = cs.buyGift(ci);
			if(result>0){
				Gift_Buy gb = new Gift_Buy();
				gb.setG_no(g_no);
				gb.setM_no(m_no);
				int result2 = gbs.getGift(gb);
				if(result2>0){
					model.addAttribute("pgm", "../gift/successGift.jsp");
					return "module/main";
				}else{
					model.addAttribute("gift", gift);
					model.addAttribute("pgm", "../gift/giftDetail.jsp");
					model.addAttribute("msg", "구매후 기프티콘 내역 인서트중 오류 발생 ");
					return "module/main";
				}
			}else{
				model.addAttribute("gift", gift);
				model.addAttribute("pgm", "../gift/giftDetail.jsp");
				model.addAttribute("msg", "구매중 오류 발생 ");
				return "module/main";
			}
		}
	}
	@RequestMapping(value="gift_delete", method=RequestMethod.GET)
	public String gift_delete(int g_no,Model model){
		int result = gs.delete(g_no);
		List<Gift> list = gs.list();
		if(result>0){
			model.addAttribute("list", list);
			model.addAttribute("pgm", "../gift/giftList.jsp");
		}else{
			model.addAttribute("pgm", "../gift/giftDetail.jsp");
			model.addAttribute("msg", "기프티콘 삭제 실패");
		}		
		return "module/main";
	}
}
