package donate7.controller;

import java.net.URL;
import java.net.URLConnection;
import java.sql.Date;
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

import donate7.model.Dclass;
import donate7.model.Organ;
import donate7.model.Recruit;
import donate7.model.Rqn;
import donate7.model.SidoGugun;
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
	public String recruitForm(Recruit rc, HttpSession session, Model model) {
		int o_no = 0;
		if (session.getAttribute("no") != null) {
			o_no = Integer.parseInt(session.getAttribute("no").toString());
			String addr = ms.selectO_addrByO_no(o_no);
			List<Class> list = cs.selectClass();
			List<Subject> slist = cs.selectSubject();
			model.addAttribute("list", list);
			model.addAttribute("slist", slist);
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
	public String recruit(Recruit rc, Model model) {
		int result = vs.insertRc(rc);
		if(result > 0){
			return "redirect:myRecruit.do";
		}else{
			model.addAttribute("rc", rc);
			return "redirect:recruit.do";
		}		
	}
	
	@RequestMapping("myRecruit")
	public String myRecruit(Model model){
			model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
			model.addAttribute("mypgm", "../../vt/myRecruit.jsp");
			return "module/main";
	}
	
	@RequestMapping("myRecruitList")
	public String myRecruitList(String pageNum,Recruit rc, HttpSession session, Model model){
		String num = pageNum;
		if(num == null){
			num = "1";
		}
		int pnum = Integer.parseInt(num);
		int o_no = 0;
		if(session.getAttribute("no") != null){
			o_no = Integer.parseInt(session.getAttribute("no").toString());
			rc.setVt_o_no(o_no);
			int total = vs.selectRcTotal(rc);
			Paging paging = new Paging(pnum, total);
			rc.setStartrow(paging.getStartRow());
			rc.setEndrow(paging.getEndRow());
			List<Recruit> list = vs.selectRcList(rc);
			model.addAttribute("tot", total);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			model.addAttribute("rec", rc);
			return "vt/myRecruitList";
		}else{
			return "redirect:login.do";
		}
	}

	@RequestMapping("rcView")
	public String rcView(int pageNum, int vt_no,HttpSession session,Model model){
		int o_no = 0;
		if(session.getAttribute("no") != null){
			o_no = Integer.parseInt(session.getAttribute("no").toString());
		}
		Recruit rc = vs.selectRcByVt_no(vt_no);
		String addr = ms.selectO_addrByO_no(o_no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("rc", rc);
		model.addAttribute("addr", addr);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/rcView.jsp");
		return "module/main";
	}

	@RequestMapping(value="rcUpdate", method=RequestMethod.GET)
	public String rcUpdateForm(int pageNum,int vt_no, Model model){
		Recruit rc = vs.selectRcByVt_no(vt_no);
		List<Class> list = cs.selectClass();
		List<Subject> slist = cs.selectSubject();
		model.addAttribute("list", list);
		model.addAttribute("slist", slist);
		model.addAttribute("rc", rc);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/rcUpdateForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="rcUpdate", method=RequestMethod.POST)
	public String rcUpdate(int pageNum, Recruit rc, Model model){
		int result = vs.rcUpdate(rc);
		if(result > 0){
			return "redirect:rcView.do?vt_no="+ rc.getVt_no() + "&pageNum=" + pageNum;
		}else{
			return "redirect:rcUpdate.do?vt_no=" + rc.getVt_no() + "&pageNum=" + pageNum;
		}
		
	}
	
	@RequestMapping("volSearch")
	public String volSearch(Model model){
		List<SidoGugun> addr = cs.selectSido();
		List<Class> list = cs.selectClass();
		List<Subject> slist = cs.selectSubject();
		model.addAttribute("list", list);
		model.addAttribute("slist", slist);
		model.addAttribute("addr", addr);
		model.addAttribute("pgm", "../vt/vSearch/vol_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/volSearch.jsp");
		return "module/main";
	}
	
	@RequestMapping("volSearchList")
	public String volSearchList(String pageNum, Recruit rc, Model model){
		String num = pageNum;
		if(num == null){
			num = "1";
		}
		int pnum = Integer.parseInt(num);
		int total = vs.selectRcTotal(rc);
		Paging paging = new Paging(pnum, total);
		rc.setStartrow(paging.getStartRow());
		rc.setEndrow(paging.getEndRow());
		List<Recruit> result = vs.selectRcList(rc);
		model.addAttribute("paging", paging);
		model.addAttribute("result", result);
		return "vt/volSearchList";
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
*/
	
	@RequestMapping(value = "gugunList", method = RequestMethod.POST)
	public String gugunList(int sido_no, Model model) {
		List<SidoGugun> list = cs.selectGugunBySido_No(sido_no);
		model.addAttribute("list", list);
		return "vt/gugunList";
	}
/*
	@RequestMapping("reqDetail")
	public String reqDetail(int vt_No, Model model) {
		VolReq volReq = vs.SelectByVt_No(vt_No);
		model.addAttribute("volReq", volReq);
		return "vt/reqDetail";
	}*/
	
	@RequestMapping(value = "dclassList", method = RequestMethod.POST)
	public String dclassList(int class_no,int dclass_no, Model model) {
		List<Dclass> list = cs.selectDclassByClass_no(class_no);
		model.addAttribute("list", list);
		model.addAttribute("dclass_no", dclass_no);
		return "vt/dclassList";
	}

	@RequestMapping("centerList")
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
	}
	
	/*달력 테스트*/
	@RequestMapping("timeList")
	public String timeList(String pageNum, Recruit rc, HttpSession session, Model model){
		String num = pageNum;
		Recruit rec = rc;
		if(num == null){
			num = "1";
		}
		if(rc == null){
			rec = new Recruit();
		}
		int pnum = Integer.parseInt(num);
			int total = vs.selectRcTotal(rec);
			Paging paging = new Paging(pnum, total);
			rec.setStartrow(paging.getStartRow());
			rec.setEndrow(paging.getEndRow());
			List<Recruit> list = vs.selectRcList(rec);
			model.addAttribute("tot", total);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			model.addAttribute("rec", rec);
			model.addAttribute("pgm", "../vt/vSearch/vol_tamp.jsp");
			model.addAttribute("mypgm", "../../calendar/timeList.jsp");
			return "module/main";
	}

	@RequestMapping("View")
	public String View(int pageNum, int vt_no, HttpSession session, Model model) {
		Recruit rc = vs.selectRcByVt_no(vt_no);
		String addr = ms.selectO_addrByO_no(rc.getVt_o_no());
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("rc", rc);
		model.addAttribute("addr", addr);
		model.addAttribute("pgm", "../vt/vSearch/vol_tamp.jsp");
		model.addAttribute("mypgm", "../../calendar/View.jsp");
		return "module/main";
	}
	@RequestMapping("rqn")
	public String rqn(Rqn rqn, Model model) {
		int result = vs.insertRqn(rqn);
		if(result > 0){
			return "redirect:View.do?vt_no="+rqn.getVt_m_no();
		}else{
			model.addAttribute("rqn", rqn);
			return "redirect:recruit.do";
		}		
	}
}