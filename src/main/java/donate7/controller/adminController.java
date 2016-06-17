package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Member;
import donate7.model.Organ;
import donate7.model.Warning;
import donate7.service.CommunityPagingBean;
import donate7.service.Cpoint_InfoService;
import donate7.service.MemberService;
import donate7.service.WarningService;

@Controller
public class adminController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private WarningService ws;
	
	@Autowired
	private Cpoint_InfoService cs;
	
	@RequestMapping(value = "a_memberAll")
	public String a_memberAll(Member member, String pageNum, Model model) {
		final int rowPerPage = 10;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = ms.memberTotal();
		
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		
		CommunityPagingBean m_pb = new CommunityPagingBean(nowPage, total);
		
		List<Member> memberAll = ms.memberAll(startRow, endRow, member);
		
		model.addAttribute("memberAll", memberAll);
		model.addAttribute("m_pb", m_pb);
		
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_memberAll.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_info", method = RequestMethod.GET)
	public String m_info(Model model, String m_no, HttpSession session) {
		int no = (Integer)Integer.parseInt(m_no);
		Member member = ms.selectMember(no);
		Warning dr_warn = new Warning();
		Warning br_warn = new Warning();
		dr_warn.setM_no(no);
		dr_warn.setWa_sort("d");
		br_warn.setM_no(no);
		br_warn.setWa_sort("b");
		int dr_total = ws.getSum(dr_warn);
		int br_total = ws.getSum(br_warn);
		int sumC = cs.sumCash(no);
		int sumP = cs.sumPoint(no);
		model.addAttribute(member);
		model.addAttribute("dr_total", dr_total);
		model.addAttribute("br_total", br_total);
		model.addAttribute("sumC", sumC);
		model.addAttribute("sumP", sumP);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/m_info.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "a_organAll")
	public String a_organAll(Organ organ, String pageNum, Model model) {
		final int rowPerPage = 10;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = ms.organTotal();
		
		organ.setStartRow(startRow);
		organ.setEndRow(endRow);
		
		CommunityPagingBean o_pb = new CommunityPagingBean(nowPage, total);
		
		List<Organ> organAll = ms.organAll(startRow, endRow, organ);
		model.addAttribute("organAll", organAll);
		model.addAttribute("o_pb", o_pb);
		
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_organAll.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "o_info", method = RequestMethod.GET)
	public String o_info(Model model, HttpSession session) {
		int o_no = (Integer)session.getAttribute("no");
		Organ organ = ms.selectOrgan(o_no);
		model.addAttribute(organ);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/o_info.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="giftUpload", method=RequestMethod.GET)
	public String upload(Model model){
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../gift/giftUpload.jsp");
		return "module/main";
	}
		
}
