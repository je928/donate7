package donate7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Community;
import donate7.model.Member;
import donate7.model.Register;
import donate7.service.CommunityService;
import donate7.service.MemberService;
import donate7.service.RegisterService;

@Controller
public class RegisterController {
	@Autowired
	private CommunityService cs;
	@Autowired
	private MemberService ms;
	@Autowired
	private RegisterService rs;
	@RequestMapping(value="registerPop",method=RequestMethod.GET)
	public String registerPop(int brd_no,String chk,Model model){
		if(chk.equals("w")){
			Community comm = cs.communitySelect(brd_no);
			Member member = ms.selectMember(comm.getNo());
			String nick = member.getM_nick();
			model.addAttribute("nick",nick);
			model.addAttribute("re_sort_no",comm.getBrd_no());
			model.addAttribute("reported_no",comm.getNo());			
		}else{
			
		}		
		model.addAttribute("chk",chk);
		return "register/registerPop";
	}
	@RequestMapping(value="registerPro",method=RequestMethod.GET)
	public String registerPro(Model model){
		List<Register> list = rs.list();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_registerPro.jsp");
		return "module/main";
	}
	@RequestMapping(value="reg_pro",method=RequestMethod.GET)
	public String reg_pro(int re_no,Model model){
		Register reg = rs.selectOne(re_no);
		Member member = ms.selectMember(reg.getReported_no());
		String reported = member.getM_nick();
		member = ms.selectMember(reg.getReporter_no());
		String reporter = member.getM_nick();
		
		if(reg.getRe_sort().equals("w")){
			Community comm = cs.communitySelect(reg.getRe_no());
			model.addAttribute("content", comm.getBrd_content());
		}		
		model.addAttribute("reg", reg);
		model.addAttribute("reported", reported);
		model.addAttribute("reporter", reporter);
		return "register/reg_pro";
	}
	@RequestMapping(value="reg_proX",method=RequestMethod.GET)
	public String reg_proX(int re_no,Model model){
		int result = rs.updateCan(re_no);
		if(result>0){
			model.addAttribute("msg", "msg");
		}
		return "register/reg_pro";
	}
	@RequestMapping(value="reg_proY",method=RequestMethod.GET)
	public String reg_proY(int re_no,Model model){
		/*int result = rs.updateYes(re_no);
		if(result>0){
			
			model.addAttribute("msg", "msg");
		}*/
		return "register/reg_pro";
	}
	@RequestMapping(value="registerPop",method=RequestMethod.POST)
	public String registerPop(Register register,Model model){
		int result = rs.insert(register);
		if(result>0){
			
			model.addAttribute("msg", "msg");
		}
		return "register/registerPop";
	}
}