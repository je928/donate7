package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Cpoint_info;
import donate7.model.Warning;
import donate7.service.CommunityPagingBean;
import donate7.service.Cpoint_InfoService;

@Controller
public class CPointController {
	@Autowired
	private Cpoint_InfoService cs;
	@RequestMapping(value="addCash",method=RequestMethod.GET)
	public String addCash(){
		return "member/m_mypage/m_addCash";
	}
	@RequestMapping(value="addCash",method=RequestMethod.POST)
	public String addCash(HttpSession session,Model model,int cp_point){
		int m_no = (Integer) session.getAttribute("no");
		Cpoint_info ci = new Cpoint_info();
		ci.setCp_point(cp_point);
		ci.setCp_point_re("캐시 충전");
		ci.setCp_sort("c");
		ci.setM_no(m_no);
		int result = cs.insert(ci);
		if(result>0){
			model.addAttribute("msg", "msg");
		}
		return "member/m_mypage/m_addCash";
	}
	@RequestMapping("cpointList")
	public String cpointList(HttpSession session,String pageNum,String sort,Model model){		
		int m_no = (Integer) session.getAttribute("no");		
		final int rowPerPage = 10;
		if(sort == null || sort.equals("")){
			sort = "all";
		}
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		Cpoint_info ci = new Cpoint_info();
		ci.setM_no(m_no);
		ci.setCp_sort(sort);
		int total = cs.getTotal(ci);		
		
		CommunityPagingBean pb = new CommunityPagingBean(nowPage, total);
		
		List<Cpoint_info> list = cs.list(startRow, endRow, m_no,sort);
		int sumP = cs.sumPoint(m_no);
		int sumC = cs.sumCash(m_no);
		
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		model.addAttribute("sort", sort);
		model.addAttribute("sumP", sumP);
		model.addAttribute("sumC", sumC);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_cpList.jsp");		
		return "module/main";
	}
}
