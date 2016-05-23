package donate7.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.VolReq;
import donate7.service.VolService;

@Controller
public class VolController {
	@Autowired
	private VolService vs;
	
	@RequestMapping(value="reqResist",method=RequestMethod.GET)
	public String reqResistForm(VolReq volReq, Model model){
		model.addAttribute("pgm", "../vt/req.jsp");
		model.addAttribute("volReq", volReq);
		return "module/main";
	}
	
	@RequestMapping(value="reqResist",method=RequestMethod.POST)
	public String reqResist(VolReq volReq, Model model){
		model.addAttribute("pgm", "manageVol.do");
		return "module/main";
	}
	
	@RequestMapping("manageVol")
	public String manageVol(HttpSession session, Model model){
		model.addAttribute("pgm", "../vt/manageVol.jsp");
		return "module/main";
	}
}
