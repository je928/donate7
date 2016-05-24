package donate7.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Gift;
import donate7.model.Gift_Buy;
import donate7.service.GiftService;
import donate7.service.Gift_BuyService;

@Controller
public class m_mypageController {
	@Autowired
	private Gift_BuyService gbs;
	@Autowired
	private GiftService gs;
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
	@RequestMapping(value = "m_prList", method = RequestMethod.GET)
	public String mproList(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/m_prList.jsp");
		return "module/main";
	}
	@RequestMapping(value = "m_prWrite", method = RequestMethod.GET)
	public String m_prWriteForm(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/m_prWrite.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "m_prWrite", method = RequestMethod.POST)
	public String m_prWrite(Model model) {
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product/m_prWrite.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "ownGift", method = RequestMethod.GET)
	public String ownGift(Model model,HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		List<Gift_Buy> list = gbs.ownList(m_no);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/ownGift.jsp");
		model.addAttribute("list", list);
		model.addAttribute("gs", gs);
		return "module/main";
	}
	
	@RequestMapping(value = "ownGiftDetail", method = RequestMethod.GET)
	public String ownGiftDetail(int gb_no,Model model,HttpSession session) {
		int m_no = (Integer)session.getAttribute("no");
		Gift_Buy gb = gbs.selectOne(gb_no);
		Gift gift = gs.selectOne(gb.getG_no());
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../member/m_mypage/ownGiftDetail.jsp");
		model.addAttribute("gb", gb);
		model.addAttribute("gift", gift);
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
	public String list(Second second,String pageNum,Model model) {
		final int rowPerPage = 10;		
		if (pageNum==null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		second.setStartRow(startRow);
		board.setEndRow(endRow);
		int total = bs.getTotal(board);
		PagingBean pb = new PagingBean(currentPage,total);
		List<Board> list = bs.list(board);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		return "list";
	}
	*/
}
