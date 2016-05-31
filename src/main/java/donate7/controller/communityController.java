package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import donate7.model.Community;
import donate7.service.CommunityPagingBean;
import donate7.service.CommunityService;

@Controller
public class communityController {
	
	@Autowired
	private CommunityService cs;
	
	@RequestMapping(value="community")
	public String list(Community community, String pageNum, String searchType, String searchTxt, Model model) {
		
		final int rowPerPage = 10;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		if(searchType == null || searchType.equals("null") || searchType.equals("")){
			searchType = "all";
		}
		if(searchTxt == null || searchTxt.equals("null")){
			searchTxt = "";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = cs.getTotal(searchType, searchTxt, community);
		
		community.setStartRow(startRow);
		community.setEndRow(endRow);
		community.setSearchType(searchType);		
		community.setSearchTxt(searchTxt);
		
		CommunityPagingBean pb = new CommunityPagingBean(nowPage, total);
		
		List<Community> list = cs.list(startRow, endRow, searchType, searchTxt, community);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		
		if (community.getSearchType() != null) {
			model.addAttribute("searchType", community.getSearchType());
			model.addAttribute("searchTxt",community.getSearchTxt());
		}

		model.addAttribute("pgm", "../community/list.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="view")
	public String view(int brd_no, String pageNum, Model model) {
		cs.communityHit(brd_no);
		Community community = cs.communitySelect(brd_no);
		model.addAttribute("community", community);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../community/view.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="writeForm")
	public String writeForm(Community community, String pageNum, String brd_no, Model model) {
		community.setBrd_no(0);
		community.setRef(0);
		community.setRe_level(0);
		community.setRe_step(0);
		// 답변글 시작
		if(brd_no != null) {
			int no = Integer.parseInt(brd_no);
			Community board = cs.communitySelect(no);
			community.setBrd_no(board.getBrd_no());
			community.setRef(board.getRef());
			community.setRe_level(board.getRe_level());
			community.setRe_step(board.getRe_step());
		}
		// 끝
		model.addAttribute("community", community);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../community/write.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="write")
	public String write(Community community, String pageNum, Model model, HttpServletRequest request) {
		int number = cs.insertNo();
		// 답변글 시작
		if(community.getBrd_no() > 0) {
			cs.updateRe_step(community);
			community.setRe_level(community.getRe_level()+1);
			community.setRe_step(community.getRe_step()+1);
		}else {
			community.setRef(number);
		}
		// 답변글 끝
		String ip = request.getRemoteAddr();
		community.setBrd_no(number);
		community.setBrd_ip(ip);
		int result = cs.communityInsert(community);
		model.addAttribute("pageNum", pageNum);
		if(result > 0) {
			return "redirect:community.do";
		}else {
			model.addAttribute("msg", "입력 실패");
			model.addAttribute("community", community);
			return "forward:writeForm.do";
		}
	}
	
}
