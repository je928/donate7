package donate7.controller;

import java.util.List;

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
/*		int currentPage = Integer.parseInt(pageNum); */
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
	public String view(int num, String pageNum, Model model) {
		cs.communityHit(num);
		Community community = cs.communitySelect(num);
		model.addAttribute("community", community);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../community/view.jsp");
		return "module/main";
	}
	
}
