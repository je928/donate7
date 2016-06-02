package donate7.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Community;
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
		if(chk.equals("c")){
			Community comm = cs.communitySelect(brd_no);
			model.addAttribute("re_sort_no",comm.getBrd_no());
			model.addAttribute("reported_no",comm.getNo());			
		}else{
			
		}		
		model.addAttribute("chk",chk);
		return "register/registerPop";
	}
	@RequestMapping(value="registerPop",method=RequestMethod.POST)
	public String registerPop(Register register,Model model){
		int result = rs.insert(register);
		return "register/registerPop";
	}
}
