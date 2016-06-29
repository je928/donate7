package donate7.controller;

import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
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

import donate7.model.Applicant;
import donate7.model.Cpoint_info;
import donate7.model.Dclass;
import donate7.model.Member;
import donate7.model.Organ;
import donate7.model.Recruit;
import donate7.model.Rqn;
import donate7.model.SidoGugun;
import donate7.model.Subject;
import donate7.model.VolResult;
import donate7.model.Warning;
import donate7.service.CommService;
import donate7.service.Cpoint_InfoService;
import donate7.service.MemberService;
import donate7.service.VolService;
import donate7.service.WarningService;
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
	@Autowired
	private WarningService ws;
	@Autowired
	private Cpoint_InfoService cis;

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
		int chk = vs.resultChk(vt_no);
		model.addAttribute("chk", chk);
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
	@RequestMapping(value="volResult", method=RequestMethod.GET)
	public String volResult(int vt_no, Model model){
		model.addAttribute("vt_no", vt_no);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/volResult.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="volResult", method=RequestMethod.POST)
	public String volResultPro(int[] m_no,int[] volTime,int vt_no,Model model){
		List<HashMap<String, Integer>> list = new ArrayList<HashMap<String,Integer>>();
		int vt_vol_no = vs.selectNewVolNo();

		for(int i = 0 ; i < m_no.length; i++){
			HashMap<String, Integer> hm = new HashMap<String, Integer>();
			hm.put("vt_vol_no", vt_vol_no);
			hm.put("vt_m_no", m_no[i]);
			hm.put("vt_time", volTime[i]);
			hm.put("vt_no", vt_no);
			list.add(hm);
			vt_vol_no++;
		}
		List<Warning> wList = new ArrayList<Warning>();
		List<Cpoint_info> cList = new ArrayList<Cpoint_info>();
		for(HashMap<String, Integer> hm : list){
			int wNum = ws.selectNum();
			if(hm.get("vt_time") == 0){
				Warning w = new Warning();
				w.setWa_no(wNum++);
				w.setM_no(hm.get("vt_m_no"));
				w.setRe_no(hm.get("vt_no"));
				w.setWa_sort("d");
				w.setWa_cnt(1);
				w.setWa_re(w.getRe_no() + " 불참");
				wList.add(w);
			}else{
				Cpoint_info ci = new Cpoint_info();
				ci.setM_no(hm.get("vt_m_no"));
				ci.setCp_sort("p");
				ci.setCp_point(hm.get("vt_time") * 50);
				ci.setCp_point_re("봉사 참여");
				cList.add(ci);
			}
		}
		int result = vs.insertVolResult(list);
		for(int i = 0; i < wList.size(); i++){
			ws.insert(wList.get(i));
		}
		for(int i = 0; i < cList.size(); i++){
			cis.insert(cList.get(i));
		}
		return "redirect:volResultView.do?vt_no="+vt_no;
	}
	
	@RequestMapping("volResultView")
	public String volResultView(int vt_no, Model model){
		List<VolResult> list = vs.selectVolResult(vt_no);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/volResultView.jsp");
		return "module/main";
	}
	
	@RequestMapping("volResultList")
	public String volResultList(int vt_no, Model model){
		List<Member> list = ms.selectVolMember(vt_no);
		model.addAttribute("list", list);
		model.addAttribute("vt_no", vt_no);
		return "vt/volResultList";
	}
	
	@RequestMapping(value = "gugunList", method = RequestMethod.POST)
	public String gugunList(int sido_no, Model model) {
		List<SidoGugun> list = cs.selectGugunBySido_No(sido_no);
		model.addAttribute("list", list);
		return "vt/gugunList";
	}
	
	@RequestMapping(value = "dclassList", method = RequestMethod.POST)
	public String dclassList(int class_no,int dclass_no,String type, Model model) {
		List<Dclass> list = cs.selectDclassByClass_no(class_no);
		model.addAttribute("list", list);
		model.addAttribute("type", type);
		model.addAttribute("dclass_no", dclass_no);
		return "vt/dclassList";
	}

	@RequestMapping("centerList")
	public String centerList(Model model) {
		List<Organ> list = ms.selectAll();
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../vt/vSearch/vol_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/centerList.jsp");
		return "module/main";
	}

	@RequestMapping("centerView")
	public String centerView(int o_no, Model model) {
		Organ organ = ms.selectByO_no(o_no);
		model.addAttribute("organ", organ);
		model.addAttribute("pgm", "../vt/vSearch/vol_tamp.jsp");
		model.addAttribute("mypgm", "../../vt/centerView.jsp");
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
		Rqn rqn = new Rqn();
		rqn.setVt_no(vt_no);
		rqn.setVt_m_no(Integer.parseInt(session.getAttribute("no").toString()));
		int result = vs.selectRqn(rqn);
		Recruit rc = vs.selectRcByVt_no(vt_no);
		String addr = ms.selectO_addrByO_no(rc.getVt_o_no());
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("rc", rc);
		model.addAttribute("addr", addr);
		model.addAttribute("result", result);
		model.addAttribute("pgm", "../vt/vSearch/vol_tamp.jsp");
		model.addAttribute("mypgm", "../../calendar/View.jsp");
		return "module/main";
	}
	
	@RequestMapping("rqn")
	public String rqn(Rqn rqn, Model model) {
		int result = vs.insertRqn(rqn);
		if(result > 0){
			return "redirect:rqnList.do?vt_m_no="+rqn.getVt_m_no();
		}else{
			model.addAttribute("rqn", rqn);
			return "redirect:recruit.do";
		}		
	}
	
	@RequestMapping("applicantList")
	public String applicantList(int vt_no,int vt_tot, Model model){
		List<Applicant> list = vs.selectApplicant(vt_no);
		int appCount = vs.selectAppCount(vt_no);
		
		model.addAttribute("vt_no", vt_no);
		model.addAttribute("vt_tot", vt_tot);
		model.addAttribute("appCount", appCount);
		model.addAttribute("list", list);
		return "vt/applicantList";
	}
	
	@RequestMapping("appSelect")
	public String appSelect(int[] valueArr, int vt_no, Model model){
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("valueArr", valueArr);
		hm.put("vt_no", vt_no);
		int result = vs.updateYn(hm);
		String msg = "";
		if(result > 0){
			result = vs.updateSelYn(vt_no);
			msg = "봉사자 선정 완료";
		}else{
			msg = "봉사자 선정 실패";
		}
		model.addAttribute("msg", msg);
		return "vt/appSelect";
	}
	
	@RequestMapping("rqnList")
	public String rqnList(String pageNum,Recruit rc, HttpSession session, Model model){
		String num = pageNum;
		if(num == null){
			num = "1";
		}
		int pnum = Integer.parseInt(num);
		int m_no = 0;
		if(session.getAttribute("no") != null){
			m_no = Integer.parseInt(session.getAttribute("no").toString());
			rc.setVt_m_no(m_no);
			int total = vs.selectRcTotal(rc);
			Paging paging = new Paging(pnum, total);
			rc.setStartrow(paging.getStartRow());
			rc.setEndrow(paging.getEndRow());
			List<Recruit> list = vs.selectRqnList(rc);
			model.addAttribute("tot", total);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			model.addAttribute("rec", rc);
			model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
			model.addAttribute("mypgm", "../../calendar/rqnList.jsp");
			return "module/main";
		}else{
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("rqnDelete")
	public String rqnDelte(Rqn rqn, Model model) {
		int result = vs.deledteRqn(rqn);
		if(result > 0){
			return "redirect:rqnList.do?vt_m_no="+rqn.getVt_m_no();
		}else{
			model.addAttribute("rqn", rqn);
			return "redirect:recruit.do";
		}		
	}
	
	@RequestMapping("rqnList_finish")
	public String rqnList_finish(String pageNum,Recruit rc, HttpSession session, Model model){
		String num = pageNum;
		if(num == null){
			num = "1";
		}
		int pnum = Integer.parseInt(num);
		int m_no = 0;
		if(session.getAttribute("no") != null){
			m_no = Integer.parseInt(session.getAttribute("no").toString());
			rc.setVt_m_no(m_no);
			int total = vs.selectRcTotal(rc);
			Paging paging = new Paging(pnum, total);
			rc.setStartrow(paging.getStartRow());
			rc.setEndrow(paging.getEndRow());
			List<Recruit> list = vs.selectRqnListfinish(rc);
			model.addAttribute("tot", total);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			model.addAttribute("rec", rc);
			model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
			model.addAttribute("mypgm", "../../calendar/rqnList_finish.jsp");
			return "module/main";
		}else{
			return "redirect:login.do";
		}
	}
}