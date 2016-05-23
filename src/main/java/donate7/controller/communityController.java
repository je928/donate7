package donate7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class communityController {
	
	@RequestMapping(value = "community", method = RequestMethod.GET)
	public String community(Model model) {
		model.addAttribute("pgm", "../community/list.jsp");
		return "module/main";
	}

}
