package donate7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class m_mypageController {
	
	@RequestMapping(value = "m_myinfo", method = RequestMethod.GET)
	public String m_myinfo(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/m_myinfo.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "msecondList", method = RequestMethod.GET)
	public String msecondList(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecondList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "msecondForm", method = RequestMethod.GET)
	public String secondForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecondForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "msecond", method = RequestMethod.POST)
	public String second(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../second/msecondForm.jsp");
		return "module/main";
	}
	
/*	@RequestMapping("view")
	public String view(int num,String pageNum,Model model) {
		bs.updateReadCount(num); 
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}*/
/*	@RequestMapping("list")
	public String list(Board board,String pageNum,Model model) {
		final int rowPerPage = 10;		
		if (pageNum==null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		int total = bs.getTotal(board);
		PagingBean pb = new PagingBean(currentPage,total);
		List<Board> list = bs.list(board);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		if(board.getKeyword()!=null) {
			model.addAttribute("keyword", board.getKeyword());
			model.addAttribute("search", board.getSearch());
		}
		return "list";
	}*/
	
}
