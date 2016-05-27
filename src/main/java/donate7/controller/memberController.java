package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import donate7.model.Member;
import donate7.model.Organ;
import donate7.model.Product;
import donate7.service.MemberService;

@Controller
public class memberController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("pgm", "../member/login.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member member, Organ organ, String email, String passwd, Model model, HttpSession session) {
		String result = ms.loginChk(email, passwd);
		if(result == "passwdx") {
			model.addAttribute("msg2", "암호가 다릅니다.");
		}else if(result == "x") {
			model.addAttribute("msg1", "없는 이메일입니다.");
		}else {
			int result2 = Integer.parseInt(result);
			if(result2 > 0) {
				session.setAttribute("no", result2);
				System.out.println("m_no = " + result2);
				return "module/main";
			}else if(result2 < 0) {
				session.setAttribute("no", result2);
				System.out.println("o_no = " + result2);
				return "module/main";
			}
		}
		model.addAttribute("pgm", "../member/login.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Model model) {
		model.addAttribute("pgm", "../member/join.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_join", method = RequestMethod.GET)
	public String m_joinForm(Model model) {
		model.addAttribute("pgm", "../member/m_join.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_join", method = RequestMethod.POST)
	public String m_join(Member member, Model model, String m_tel1, String m_tel2, String m_tel3) {
		String m_tel = m_tel1 + "-" + m_tel2 + "-" + m_tel3;
		member.setM_tel(m_tel);
		int result = ms.insertMember(member);
		if(result > 0) {
			model.addAttribute("pgm", "../member/login.jsp");			
			return "module/main";
		}else {
			model.addAttribute("pgm", "../member/m_join.jsp");						
			return "module/main";
		}
	}
	
	@RequestMapping(value = "m_emailChk", method = RequestMethod.POST)
	public String m_emailChk(String m_email, Model model) {
		int result = ms.m_emailChk(m_email);
		String msg = "";
		if(result == 1) {
			msg = "이미 사용 중이거나 탈퇴한 이메일입니다.";
		}else if(result == 0) {
			msg = "사용 가능한 이메일입니다.";
		}
		model.addAttribute("msg", msg);
		System.out.println(msg);
		return "member/m_emailChk";
	}
	
	@RequestMapping(value = "m_nickChk", method = RequestMethod.POST)
	public String m_nickChk(String m_nick, String no, Member member, Model model) {
		member.setM_no(Integer.parseInt(no));
		member.setM_nick(m_nick);
		int result = ms.m_nickChk(m_nick, member);
		String msg = "";
		if(result > 0) {
			msg = "이미 사용 중인 닉네임입니다.";
		}else if(result == 0) {
			msg = "";
		}else {
			msg = "사용 가능한 닉네임입니다.";
		}
		model.addAttribute("msg", msg);
		System.out.println(msg);
		return "member/m_nickChk";
	}
	
	@RequestMapping(value = "o_join", method = RequestMethod.GET)
	public String o_joinForm(Model model) {
		model.addAttribute("pgm", "../member/o_join.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "o_join", method = RequestMethod.POST)
	public String o_join(Organ organ, Model model, String o_tel1, String o_tel2, String o_tel3, String post1, String post2, String o_addr1, String o_addr2) {
		String o_tel = o_tel1 + "-" + o_tel2 + "-" + o_tel3;
		String o_addr = "(" + post1 + "-" + post2 + ") " + o_addr1 + " " + o_addr2;
		organ.setO_tel(o_tel);
		organ.setO_addr(o_addr);
		int result = ms.insertOrgan(organ);
		if(result > 0) {
			model.addAttribute("pgm", "../member/login.jsp");			
			return "module/main";
		}else {
			model.addAttribute("pgm", "../member/o_join.jsp");						
			return "module/main";
		}
	}
	
	@RequestMapping(value = "o_emailChk", method = RequestMethod.POST)
	public String o_emailChk(String o_email, Model model) {
		int result = ms.o_emailChk(o_email);
		String msg = "";
		if(result == 1) {
			msg = "이미 사용 중이거나 탈퇴한 이메일입니다.";
		}else if(result == 0) {
			msg = "사용 가능한 이메일입니다.";
		}
		model.addAttribute("msg", msg);
		System.out.println(msg);
		return "member/o_emailChk";
	}
	
	@RequestMapping(value = "o_onameChk", method = RequestMethod.POST)
	public String o_onameChk(String o_oname, String no, Organ organ, Model model) {
		organ.setO_no(Integer.parseInt(no));
		organ.setO_oname(o_oname);
		int result = ms.o_onameChk(o_oname, organ);
		String msg = "";
		if(result > 0) {
			msg = "이미 사용 중인 기관명입니다.";
		}else if(result == 0) {
			msg = "";
		}else {
			msg = "사용 가능한 기관명입니다.";
		}
		model.addAttribute("msg", msg);
		System.out.println(msg);
		return "member/o_onameChk";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "module/main";
	}
	
	@RequestMapping(value = "a_memberAll", method = RequestMethod.GET)
	public String a_memberAll(Model model) {
		List<Member> memberAll = ms.memberAll();
		List<Organ> organAll = ms.selectAll();		
		model.addAttribute("memberAll", memberAll);
		model.addAttribute("organAll", organAll);		
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_memberAll.jsp");
		return "module/main";
	}
		
}
