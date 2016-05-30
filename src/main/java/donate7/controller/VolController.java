package donate7.controller;

import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import donate7.model.Organ;
import donate7.model.SidoGugun;
import donate7.model.VolReq;
import donate7.model.VolReqSearch;
import donate7.service.MemberService;
import donate7.service.SidoService;
import donate7.service.VolService;
/*import net.sf.json.JSONArray;*/

@Controller
public class VolController {
	@Autowired
	private VolService vs;
	@Autowired
	private SidoService ss;
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="recruitForm",method=RequestMethod.GET)
	public String reqResistForm(VolReq volReq, Model model){
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/recruitForm.jsp");
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
	
	@RequestMapping("centerList")
	public String centerList(Model model){
		List<Organ> list = ms.selectAll();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/centerList.jsp");
		return "module/main";
	}
	
	@RequestMapping("centerView")
	public String centerView(int o_no, Model model){
		Organ organ = ms.selectByO_no(o_no);
		model.addAttribute("organ",organ);
		model.addAttribute("pgm", "../vt/centerView.jsp");
		return "module/main"; 
	}
	
	@RequestMapping("map")
	public String map(int o_no, Model model){
		
		String addr = ms.selectO_addrByO_no(o_no);
		addr = addr.replace(" ", "%20");
		try {
			URL url = new URL("https://apis.daum.net/local/geo/addr2coord?apikey=4433ad220df9e47a4bec346b73b442e4&q=" + addr +"&output=xml");
			URLConnection conn = url.openConnection();
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(conn.getInputStream());
			
			NodeList nList = doc.getElementsByTagName("item");
			for(int i = 0 ; i < nList.getLength(); i++){
				for(Node node = nList.item(i).getFirstChild(); node != null; node = node.getNextSibling()){
					if(node.getNodeName().equals("lat")){
						model.addAttribute("lat", node.getTextContent());
					}
					if(node.getNodeName().equals("lng")){
						model.addAttribute("lng", node.getTextContent());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vt/map";
	}
}
