package donate7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class adminController {
	
	@RequestMapping(value="giftUpload", method=RequestMethod.GET)
	public String upload(Model model){
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../gift/giftUpload.jsp");
		return "module/main";
	}
		
}
