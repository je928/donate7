package donate7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Member;
import donate7.model.Organ;
import donate7.service.MemberService;

@Controller
public class adminController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "a_moAll", method = RequestMethod.GET)
	public String a_moAll(Model model) {
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_moAll.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "a_memberAll")
	public String a_memberAll(Model model) {
		List<Member> memberAll = ms.memberAll();
		model.addAttribute("memberAll", memberAll);
		return "/member/admin_page/a_memberAll";
	}
	
	@RequestMapping(value = "a_organAll")
	public String a_organAll(Model model) {
		List<Organ> organAll = ms.selectAll();
		model.addAttribute("organAll", organAll);		
		return "/member/admin_page/a_organAll";
	}
	
	@RequestMapping(value="giftUpload", method=RequestMethod.GET)
	public String upload(Model model){
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../gift/giftUpload.jsp");
		return "module/main";
	}
		
}
