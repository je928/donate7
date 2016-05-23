package donate7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VolController {
	
	@RequestMapping(value="reqResist",method=RequestMethod.GET)
	public String reqResist(Model model){
		model.addAttribute("pgm", "../vt/req.jsp");
		return "module/main";
	}
}
