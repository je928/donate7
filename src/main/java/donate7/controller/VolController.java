package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.SidoGugun;
import donate7.model.VolReq;
import donate7.model.VolReqSearch;
import donate7.service.SidoService;
import donate7.service.VolService;
/*import net.sf.json.JSONArray;*/

@Controller
public class VolController {
	@Autowired
	private VolService vs;
	@Autowired
	private SidoService ss;
	
	@RequestMapping(value="reqResist",method=RequestMethod.GET)
	public String reqResistForm(VolReq volReq, Model model){
		model.addAttribute("pgm", "../vt/req.jsp");
		model.addAttribute("volReq", volReq);
		return "module/main";
	}
	
	@RequestMapping(value="reqResist",method=RequestMethod.POST)
	public String reqResist(VolReq volReq, Model model){
		int result = vs.volReqInsert(volReq);
		List<VolReq> list = vs.volListByVt_Reg_O_No(volReq.getVt_Reg_O_No());
		if(result > 0){
			model.addAttribute("list", list);
			model.addAttribute("pgm", "../vt/manageVol.jsp");
		}else{
			model.addAttribute("pgm", "../vt/req.jsp");
			model.addAttribute("volReq", volReq);
		}
		return "module/main";
	}
	
	@RequestMapping("manageVol")
	public String manageVol(HttpSession session, Model model){
		
		List<VolReq> list = vs.volListByVt_Reg_O_No(Integer.parseInt(session.getAttribute("no").toString()));
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/manageVol.jsp");
		return "module/main";
	}
	
	@RequestMapping("volReqView")
	public String volReqView(int vt_No,Model model){
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		model.addAttribute("pgm", "../vt/volReqView.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="reqUpdate", method=RequestMethod.GET)
	public String reqUpdateForm(int vt_No,Model model){
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		model.addAttribute("pgm", "../vt/reqUpdate.jsp");
		return "module/main";
	}
	@RequestMapping(value="reqUpdate", method=RequestMethod.POST)
	public String reqUpdate(VolReq volReq,Model model){
		int result = vs.updateVolReq(volReq);
		if(result > 0){
			return "redirect:volReqView.do?vt_No="+volReq.getVt_No();
		}else{
			model.addAttribute("volReq", volReq);
			model.addAttribute("pgm", "../vt/reqUpdate.jsp");
			return "module/main";
		}
		
	}

	@RequestMapping("reqSearch")
	public String reqList(Model model){
		List<SidoGugun> sList = ss.selectSido();
		List<VolReqSearch> list = vs.searchList();
		model.addAttribute("sList", sList);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/reqList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="gugunList", method=RequestMethod.POST)
	public String gugunList(int sido_no, Model model){
		List<SidoGugun> list = ss.selectGugunBySido_No(sido_no);
		model.addAttribute("list", list);
		return "vt/gugunList";
	}
	
	@RequestMapping("reqDetail")
	public String reqDetail(int vt_No, Model model){
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		return "vt/reqDetail";
	}
	
}
