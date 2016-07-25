package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Community;
import donate7.model.CommunityReply;
import donate7.model.Register;
import donate7.model.Warning;
import donate7.service.CommunityPagingBean;
import donate7.service.CommunityService;
import donate7.service.RegisterService;
import donate7.service.WarningService;

@Controller
public class WarningController {
	
	@Autowired
	private WarningService ws;
	@Autowired
	private RegisterService rs;
	@Autowired
	private CommunityService cs;

	@RequestMapping("warningList")
	public String warningList(HttpSession session, String pageNum, String sort, Model model) {
		int m_no = (Integer) session.getAttribute("no");
		final int rowPerPage = 10;
		if (sort == null || sort.equals("")) {
			sort = "all";
		}
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		Warning warn = new Warning();
		warn.setM_no(m_no);
		warn.setWa_sort(sort);
		int total = ws.getTotal(warn);

		CommunityPagingBean pb = new CommunityPagingBean(nowPage, total);

		List<Warning> list = ws.list(startRow, endRow, m_no, sort);

		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		model.addAttribute("sort", sort);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_warningList.jsp");
		return "module/main";
	}

	@RequestMapping(value = "detailWarn", method = RequestMethod.GET)
	public String detailWarn(int wa_no, Model model) {
		Warning warn = ws.selectOne(wa_no);
		if (warn.getWa_sort().equals("d")) {
			model.addAttribute("sort", "봉사");
			model.addAttribute("warn", warn);
			return "member/m_mypage/m_detailWarn";
		}
		Register reg = rs.selectOne(warn.getRe_no());
		if (reg.getRe_sort().equals("w")) {
			Community comm = cs.communitySelect(reg.getRe_sort_no());
			model.addAttribute("content", comm.getBrd_content());
			model.addAttribute("sort", "글");
		} else if (reg.getRe_sort().equals("c")) {
			CommunityReply cr = cs.replyOne(reg.getRe_sort_no());
			model.addAttribute("content", cr.getCr_content());
			model.addAttribute("sort", "댓글");
		}
		model.addAttribute("reg", reg);
		model.addAttribute("warn", warn);
		return "member/m_mypage/m_detailWarn";
	}
}
