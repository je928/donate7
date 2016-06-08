package donate7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Member;
import donate7.model.Organ;
import donate7.service.CommunityPagingBean;
import donate7.service.MemberService;

@Controller
public class adminController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "a_moAll", method = RequestMethod.GET)
	public String a_moAll(Model model) {
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_moAll.jsp");
		return "module/main";
	}
	
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
		
		return "/member/admin_page/a_memberAll";
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
		System.out.println("o_pb.total = " + o_pb.getTotal());
		model.addAttribute("organAll", organAll);
		model.addAttribute("o_pb", o_pb);
		
		return "/member/admin_page/a_organAll";
	}
	
	@RequestMapping(value="giftUpload", method=RequestMethod.GET)
	public String upload(Model model){
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../gift/giftUpload.jsp");
		return "module/main";
	}
		
}
