package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import donate7.model.Community;
import donate7.model.Warning;
import donate7.service.CommunityPagingBean;
import donate7.service.WarningService;

@Controller
public class WarningController {
	@Autowired
	private WarningService ws;
	@RequestMapping("warningList")
	public String warningList(HttpSession session,String pageNum,Model model){
		int m_no = (Integer) session.getAttribute("no");		
		final int rowPerPage = 10;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = ws.getTotal(m_no);		
		
		CommunityPagingBean pb = new CommunityPagingBean(nowPage, total);
		
		List<Warning> list = ws.list(startRow, endRow, m_no);
		
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_warningList.jsp");		
		return "module/main";
	}
}
