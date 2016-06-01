package donate7.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import donate7.model.Dclass;
import donate7.model.Recruit;
import donate7.model.Subject;
import donate7.service.CommService;
import donate7.service.MemberService;
import donate7.service.VolService;
import donate7.util.Paging;
/*import net.sf.json.JSONArray;*/

@Controller
public class VolController {
	@Autowired
	private VolService vs;
	@Autowired
	private CommService cs;
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "recruit", method = RequestMethod.GET)
	public String reqResistForm(Recruit rc, HttpSession session, Model model) {
		int o_no = 0;
		if (session.getAttribute("no") != null) {
			o_no = Integer.parseInt(session.getAttribute("no").toString());
			String addr = ms.selectO_addrByO_no(o_no);
			List<Class> list = cs.selectClass(); 
			List<Subject> slist = cs.selectSubject();
			List<Dclass> dlist = cs.selectDclassByClass_no(1);
			model.addAttribute("list", list);
			model.addAttribute("slist", slist);
			model.addAttribute("dlist", dlist);
			model.addAttribute("addr", addr);
			model.addAttribute("rc", rc);
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../vt/recruitForm.jsp");
			return "module/main";
		}else{
			return "redirect:login.do";
		}
	}
	
	@RequestMapping(value = "recruit", method = RequestMethod.POST)
	public String reqResist(Recruit rc, Model model) {
		int result = vs.insertRc(rc);
		
		if(result > 0){
			return "redirect:myRecruit.do";
		}else{
			model.addAttribute("rc", rc);
			return "redirect:recruit.do";
		}		
	}
	
	@RequestMapping("myRecruit")
	public String myRecruit(int pageNum, HttpSession session, Model model){
		int o_no = 0;
		if(session.getAttribute("no") != null){
			o_no = Integer.parseInt(session.getAttribute("no").toString());
			
			
			int total = vs.selectRcTotalByVt_o_no(o_no);
			if(pageNum == 0){
				pageNum = 1;
			}
			Paging paging = new Paging(10, 10, pageNum, total);
			Recruit rc = new Recruit();
			rc.setStartrow(paging.getStartRow());
			rc.setEndrow(paging.getEndRow());
			rc.setVt_o_no(o_no);
			List<Recruit> list = vs.selectRcListByO_no(rc);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../vt/myRecruit.jsp");
			return "module/main";
		}else{
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("rcView")
	public String rcView(int vt_no,HttpSession session,Model model){
		int o_no = 0;
		if(session.getAttribute("no") != null){
			o_no = Integer.parseInt(session.getAttribute("no").toString());
		}
		Recruit rc = vs.selectRcByVt_no(vt_no);
		String addr = ms.selectO_addrByO_no(o_no);
		model.addAttribute("rc", rc);
		model.addAttribute("addr", addr);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/rcView.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="rcUpdate", method=RequestMethod.GET)
	public String rcUpdateForm(int vt_no, Model model){
		Recruit rc = vs.selectRcByVt_no(vt_no);
		List<Class> list = cs.selectClass(); 
		List<Subject> slist = cs.selectSubject();
		List<Dclass> dlist = cs.selectDclassByClass_no(1);
		model.addAttribute("list", list);
		model.addAttribute("slist", slist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("rc", rc);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/rcUpdateForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="rcUpdate", method=RequestMethod.POST)
	public String rcUpdate(Recruit rc, Model model){
		int result = vs.rcUpdate(rc);
		if(result > 0){
			return "redirect:rcView.do?vt_no="+ rc.getVt_no();
		}else{
			return "redirect:rcUpdate.do?vt_no=" + rc.getVt_no();
		}
		
	}
	
/*
	@RequestMapping("manageVol")
	public String manageVol(HttpSession session, Model model) {

		List<VolReq> list = vs.volListByVt_Reg_O_No(Integer.parseInt(session.getAttribute("no").toString()));
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/manageVol.jsp");
		return "module/main";
	}

	@RequestMapping("volReqView")
	public String volReqView(int vt_No, Model model) {
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		model.addAttribute("pgm", "../vt/volReqView.jsp");
		return "module/main";
	}

	@RequestMapping(value = "reqUpdate", method = RequestMethod.GET)
	public String reqUpdateForm(int vt_No, Model model) {
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		model.addAttribute("pgm", "../vt/reqUpdate.jsp");
		return "module/main";
	}

	@RequestMapping(value = "reqUpdate", method = RequestMethod.POST)
	public String reqUpdate(VolReq volReq, Model model) {
		int result = vs.updateVolReq(volReq);
		if (result > 0) {
			return "redirect:volReqView.do?vt_No=" + volReq.getVt_No();
		} else {
			model.addAttribute("volReq", volReq);
			model.addAttribute("pgm", "../vt/reqUpdate.jsp");
			return "module/main";
		}

	}

	@RequestMapping("reqSearch")
	public String reqList(Model model) {
		List<SidoGugun> sList = ss.selectSido();
		List<VolReqSearch> list = vs.searchList();
		model.addAttribute("sList", sList);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/reqList.jsp");
		return "module/main";
	}

	@RequestMapping(value = "gugunList", method = RequestMethod.POST)
	public String gugunList(int sido_no, Model model) {
		List<SidoGugun> list = ss.selectGugunBySido_No(sido_no);
		model.addAttribute("list", list);
		return "vt/gugunList";
	}

	@RequestMapping("reqDetail")
	public String reqDetail(int vt_No, Model model) {
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		return "vt/reqDetail";
	}*/
	
	@RequestMapping(value = "dclassList", method = RequestMethod.POST)
	public String dclassList(int class_no, Model model) {
		List<Dclass> list = cs.selectDclassByClass_no(class_no);
		model.addAttribute("list", list);
		return "vt/dclassList";
	}

	/*@RequestMapping("centerList")
	public String centerList(Model model) {
		List<Organ> list = ms.selectAll();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/centerList.jsp");
		return "module/main";
	}

	@RequestMapping("centerView")
	public String centerView(int o_no, Model model) {
		Organ organ = ms.selectByO_no(o_no);
		model.addAttribute("organ", organ);
		model.addAttribute("pgm", "../vt/centerView.jsp");
		return "module/main";
	}

	@RequestMapping("map")
	public String map(int o_no, Model model) {

		String addr = ms.selectO_addrByO_no(o_no);
		addr = addr.replace(" ", "%20");
		try {
			URL url = new URL("https://apis.daum.net/local/geo/addr2coord?apikey=4433ad220df9e47a4bec346b73b442e4&q="
					+ addr + "&output=xml");
			URLConnection conn = url.openConnection();

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(conn.getInputStream());

			NodeList nList = doc.getElementsByTagName("item");
			for (int i = 0; i < nList.getLength(); i++) {
				for (Node node = nList.item(i).getFirstChild(); node != null; node = node.getNextSibling()) {
					if (node.getNodeName().equals("lat")) {
						model.addAttribute("lat", node.getTextContent());
					}
					if (node.getNodeName().equals("lng")) {
						model.addAttribute("lng", node.getTextContent());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vt/map";
	}*/
	
	/*달력 테스트*/
	@RequestMapping("namnam")
	public String namnam(Model model) {
		model.addAttribute("pgm", "../calendar/namnam.jsp");
		return "module/main";
	}
}
