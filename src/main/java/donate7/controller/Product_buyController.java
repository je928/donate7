package donate7.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donate7.model.Cpoint_info;
import donate7.model.Product;
import donate7.model.Product_buy;
import donate7.service.CommunityPagingBean;
import donate7.service.Cpoint_InfoService;
import donate7.service.Product_buyService;

@Controller
public class Product_buyController {
	@Autowired
	Product_buyService ds;
	@Autowired
	private Cpoint_InfoService cs;

	@RequestMapping("m_delivery")
	public String m_deliveryForm(Product_buy pb, Model model, String pageNum, HttpSession session,String nyo) {
		int pb_mono = (Integer) session.getAttribute("no");
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = ds.mtotal(pb_mono);
		pb.setStartRow(startRow);
		pb.setEndRow(endRow);
		if(nyo==null|| nyo.equals("")){
			nyo="n";
		}
		pb.setPb_delivery(nyo);
		CommunityPagingBean pg = new CommunityPagingBean(nowPage, total);
		List<Product_buy> list = ds.list(startRow, endRow, pb_mono, pb);
		model.addAttribute("nyo",nyo);
		model.addAttribute("pg", pg);
		model.addAttribute("list", list);
		model.addAttribute("ds", ds);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product_buy/m_deliveryForm.jsp");
		return "module/main";
	}

	@RequestMapping("a_deliveryForm")
	public String a_deliveryForm(Model model, Product_buy pb, String pageNum,String nyo) {
		final int rowPerPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = ds.atotal();

		pb.setStartRow(startRow);
		pb.setEndRow(endRow);
		if(nyo==null|| nyo.equals("")){
			nyo="n";
		}
		pb.setPb_delivery(nyo);
		CommunityPagingBean pg = new CommunityPagingBean(nowPage, total);

		List<Product_buy> list = ds.listAll(startRow, endRow, pb);
		model.addAttribute("nyo",nyo);
		model.addAttribute("pg", pg);
		model.addAttribute("ds", ds);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../member/admin_page/a_tamp.jsp");
		model.addAttribute("mypgm", "../../product_buy/a_deliveryForm.jsp");
		return "module/main";
	}

	@RequestMapping("delivery")
	public String delivery(Model model, HttpSession session, int pr_no, String cnt) {
		int no = (Integer) session.getAttribute("no");
		String NickName = ds.Nick(no);
		Product price = ds.selectOne(pr_no);
		int ci = cs.sumCash(no);
		model.addAttribute("cnt", cnt);
		model.addAttribute("ci", ci);
		model.addAttribute("price", price);
		model.addAttribute("nick", NickName);
		model.addAttribute("pgm", "../product_buy/deliveryForm.jsp");
		return "module/main";
	}

	@RequestMapping(value = "deliveryForm", method = RequestMethod.POST)
	public String deliveryForm(Product_buy pb, String addr1, String addr2, HttpSession session, int pr_no, Model model,
			int cp_point, int hap) {
		int no = (Integer) session.getAttribute("no");
		if (cp_point < hap) {
			model.addAttribute("msg", "캐시가 부족합니다");
			return "forward:delivery.do?pr_no=" + pr_no;
		}
		if (cp_point >= hap) {
			Cpoint_info ci = new Cpoint_info();
			ci.setCp_point(-hap);
			ci.setCp_point_re("물품 결제");
			ci.setCp_sort("c");
			ci.setM_no(no);
			int result = cs.insert(ci);
		}
		String pb_addr = addr1 + addr2;
		pb.setPb_mono(no);
		pb.setPb_addr(pb_addr);
		ds.insert(pb);
		int qty = pb.getPb_buyqty(); // 구매수량
		if (qty >= 0) {
			int result = ds.update(pr_no, qty);
			return "redirect:m_delivery.do";
		} else {
			model.addAttribute("msg", "수량이 너무 많습니다");
			return "redirect:deliveryForm.do";
		}
	}

	@RequestMapping("am_delivery")
	public String a_delivery(Model model, int pb_no, int pr_no, int pb_mono) {
		Product_buy pb = ds.select(pb_no);
		Product pr = ds.selectOne(pr_no);
		String NickName = ds.Nick(pb_mono);
		int gup = Integer.parseInt(pr.getPr_price());
		String delivery = ds.delivery(pb_no);
		System.out.println(delivery);
		model.addAttribute("delivery", delivery);
		model.addAttribute("gup", gup);
		model.addAttribute("nick", NickName);
		model.addAttribute("pb", pb);
		model.addAttribute("price", pr);
		model.addAttribute("pgm", "../product_buy/delivery.jsp");
		return "module/main";
	}

	@RequestMapping("exit")
	public String exit(Model model, HttpSession session) {
		int num = (Integer) session.getAttribute("no");
		if (num == 1)
			return "redirect:a_deliveryForm.do";
		else
			return "redirect:m_delivery.do";
	}

}
