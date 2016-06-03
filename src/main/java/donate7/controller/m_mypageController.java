package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Gift;
import donate7.model.Gift_Buy;
import donate7.model.Member;
import donate7.service.GiftService;
import donate7.service.Gift_BuyService;
import donate7.service.MemberService;

@Controller
public class m_mypageController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private Gift_BuyService gbs;
	@Autowired
	private GiftService gs;

	
	@RequestMapping(value = "m_myinfo", method = RequestMethod.GET)
	public String m_myinfo(Model model, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Member member = ms.selectMember(m_no);
		model.addAttribute(member);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_myinfo.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_updateForm", method = RequestMethod.GET)
	public String m_updateForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_updateForm.jsp");
		return "module/main";
	}
	
	
	@RequestMapping(value = "ownGift", method = RequestMethod.GET)
	public String ownGift(Model model, HttpSession session) {
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
		Gift_Buy gb = gbs.selectOne(gb_no);
		Gift gift = gs.selectOne(gb.getG_no());
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/ownGiftDetail.jsp");
		model.addAttribute("gb", gb);
		model.addAttribute("gift", gift);
		return "module/main";
	}

}
