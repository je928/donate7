package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Dclass;
import donate7.model.Recruit;
import donate7.model.Subject;
import donate7.service.CommService;
import donate7.service.MemberService;
import donate7.service.VolService;
/*import net.sf.json.JSONArray;*/

@Controller
public class VolController {
	@Autowired
	private VolService vs;
	@Autowired
	private CommService cs;
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "recruitForm", method = RequestMethod.GET)
	public String reqResistForm(Recruit rc, HttpSession session, Model model) {
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
	
	/*@RequestMapping(value = "reqResist", method = RequestMethod.POST)
	public String reqResist(VolReq volReq, Model model) {
		int result = vs.volReqInsert(volReq);
		List<VolReq> list = vs.volListByVt_Reg_O_No(volReq.getVt_Reg_O_No());
		if (result > 0) {
			model.addAttribute("list", list);
			model.addAttribute("pgm", "../vt/manageVol.jsp");
		} else {
			model.addAttribute("pgm", "../vt/req.jsp");
			model.addAttribute("volReq", volReq);
		}
		return "module/main";
	}

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
	/*@RequestMapping(value="http://www.test.com/get", method=RequestMethod.POST)
	@ResponseBody
	public Object getBookInfo(@RequestParam Map<String,Object> map) {
	     
	    String searchCd = (String) map.get("searchCd"); //검색코드
	     
	    //실제로 해당 부분은 서비스에서 처리 해야 하지만 그냥 Controller에서 처리
	    //검색코드를 조건으로 값을 가져 와야 하는데 설명을 위해 임의적으로 값을 셋팅
	 
	    List<Book> bookList = new ArrayList<Book>();
	    Book book = new Book();
	     
	    book.setName("홍길동전");
	    book.setPrice(100);
	     
	    bookList.add(book);
	     
	    book = new Book();
	     
	    book.setName("레미제라블");
	    book.setPrice(300);
	     
	    bookList.add(book);
	 
	     
	    Map<String, Object> retVal = new HashMap<String, Object>();
	     
	    retVal.put("bookList", bookList); //bookList란 키로 bookList의 값을 넣어줍니다. (웹에서 bookList키로 추출
	     
	    retVal.put("code", "OK");
	     
	    return retVal;
	     
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
}
