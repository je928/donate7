package donate7.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Community;
import donate7.model.CommunityReply;
import donate7.model.Member;
import donate7.model.Register;
import donate7.model.Warning;
import donate7.service.CommunityPagingBean;
import donate7.service.CommunityService;
import donate7.service.MemberService;
import donate7.service.RegisterService;
import donate7.service.WarningService;

@Controller
public class RegisterController {
	@Autowired
	private CommunityService cs;
	@Autowired
	private MemberService ms;
	@Autowired
	private RegisterService rs;
	@Autowired
	private WarningService ws;
	@RequestMapping(value="registerPop",method=RequestMethod.GET)
	public String registerPop(int brd_no, String chk,Model model){
		if(chk.equals("w")){
			Community comm = cs.communitySelect(brd_no);
			Member member = ms.selectMember(comm.getNo());
			String nick = member.getM_nick();
			model.addAttribute("nick",nick);
			model.addAttribute("re_sort_no",comm.getBrd_no());
			model.addAttribute("reported_no",comm.getNo());			
		}else if(chk.equals("c")){
			CommunityReply cr = cs.replyOne(brd_no);
			Member member= ms.selectMember(cr.getNo());
			String nick = member.getM_nick();
			model.addAttribute("nick",nick);
			model.addAttribute("re_sort_no",cr.getCr_no());
			model.addAttribute("reported_no",cr.getNo());
		}		
		model.addAttribute("chk",chk);
		return "register/registerPop";
	}
	@RequestMapping(value="registerPro",method=RequestMethod.GET)
	public String registerPro(HttpSession session,String pageNum,String sort,Model model){
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
		
		Register reg = new Register();
		reg.setRe_chk(sort);
		int total = rs.getTotal(reg);		
		
		CommunityPagingBean pb = new CommunityPagingBean(nowPage, total);
		
		List<Register>list = rs.list(startRow, endRow, m_no, sort);
		
		model.addAttribute("pb", pb);
		model.addAttribute("sort", sort);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_registerPro.jsp");
		return "module/main";
	}
	@RequestMapping(value="reg_pro",method=RequestMethod.GET)
	public String reg_pro(int re_no,Model model){
		Register reg = rs.selectOne(re_no);
		Member member = ms.selectMember(reg.getReported_no());
		String reported = member.getM_nick();
		member = ms.selectMember(reg.getReporter_no());
		String reporter = member.getM_nick();
		
		if(reg.getRe_sort().equals("w")){
			Community comm = cs.communitySelect(reg.getRe_sort_no());		
			model.addAttribute("content", comm.getBrd_content());
			model.addAttribute("sort", "글");
		}else if(reg.getRe_sort().equals("c")){
			CommunityReply cr = cs.replyOne(reg.getRe_sort_no());		
			model.addAttribute("content", cr.getCr_content());
			model.addAttribute("sort", "댓글");
		}		
		model.addAttribute("reg", reg);
		model.addAttribute("reported", reported);
		model.addAttribute("reporter", reporter);
		return "register/reg_pro";
	}
	@RequestMapping(value="reg_update",method=RequestMethod.GET)
	public String reg_update(int re_no,String re_chk,Model model,int wa_cnt){
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		Register reg = rs.selectOne(re_no);
		hashMap.put("re_no",re_no);
		hashMap.put("re_chk",re_chk);
		int result = rs.updateChk(hashMap);
		if(result>0){			
			model.addAttribute("msg", "msg");
			if(reg.getRe_sort().equals("w")){
				cs.updateWarn(reg.getRe_sort_no());
			}
			if(reg.getRe_sort().equals("c")){
				cs.updateWarnR(reg.getRe_sort_no());
			}
			if(re_chk.equals("y")){
				Warning warning = new Warning();
				warning.setM_no(reg.getReported_no());
				warning.setRe_no(re_no);
				warning.setWa_sort("b");
				warning.setWa_cnt(wa_cnt);
				if(reg.getRe_sort().equals("c")){
					warning.setWa_re("댓글 신고");
				}else if(reg.getRe_sort().equals("w")){
					warning.setWa_re("게시글 신고");
				}
				ws.insert(warning);
			}
		}
		return "register/reg_pro";
	}
	@RequestMapping(value="registerPop",method=RequestMethod.POST)
	public String registerPop(Register register,Model model){
		int result = rs.insert(register);
		if(result>0){
			
			model.addAttribute("msg", "msg");
		}
		return "register/registerPop";
	}
}