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
	public String m_updateForm(Model model, HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Member member = ms.selectMember_tel(m_no);
		model.addAttribute("member", member);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_updateForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="m_update")
	public String m_update(Member member, String m_tel1, String m_tel2, String m_tel3, Model model) {
		String m_tel = m_tel1 + "-" + m_tel2 + "-" + m_tel3;
		member.setM_tel(m_tel);
		int result = ms.updateMember(member);
		if(result > 0) {
			return "redirect:m_myinfo.do";
		}else {
			model.addAttribute("msg", "수정 실패");		
			model.addAttribute("member", member);
			return "forward:m_updateForm.do";
		}
	}
	
	@RequestMapping(value = "m_deleteForm", method = RequestMethod.GET)
	public String m_deleteForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_deleteForm.jsp");
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
