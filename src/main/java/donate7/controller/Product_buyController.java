package donate7.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import donate7.model.Product;
import donate7.model.Product_buy;
import donate7.service.Product_buyService;

@Controller
public class Product_buyController {
	@Autowired
	Product_buyService ds;

	@RequestMapping("m_delivery")
	public String m_deliveryForm(Model model, HttpSession session) {
		int pb_no = (Integer) session.getAttribute("no");
		List<Product_buy> list = ds.list(pb_no);
		model.addAttribute("list", list);
		model.addAttribute("ds", ds);
		model.addAttribute("pgm", "../member/m_mypage/m_tamp.jsp");
		model.addAttribute("mypgm", "../../product_buy/m_deliveryForm.jsp");
		return "module/main";
	}

	@RequestMapping("delivery")
	public String delivery(Model model, HttpSession session, int pr_no) {
		int no = (Integer) session.getAttribute("no");
		String NickName = ds.Nick(no);
		Product price = ds.selectOne(pr_no);
		model.addAttribute("price", price);
		model.addAttribute("nick", NickName);
		model.addAttribute("pgm", "../product_buy/deliveryForm.jsp");
		return "module/main";
	}

	@RequestMapping(value = "deliveryForm", method = RequestMethod.POST)
	public String deliveryForm(Product_buy pb, String addr1, String addr2, HttpSession session, Model model) {
		int no = (Integer) session.getAttribute("no");
		String pb_addr = addr1 + addr2;
		pb.setPb_mono(no);
		pb.setPb_addr(pb_addr);
		int insert = ds.insert(pb);
		model.addAttribute("insert", insert);
		return "redirect:m_delivery.do";
	}

	@RequestMapping("a_deliveryForm")
	public String a_deliveryForm(Model model, Product_buy pb) {
		List<Product_buy> list = ds.listAll();
		model.addAttribute("ds", ds);
		model.addAttribute("list", list);
		model.addAttribute("pgm", "../product_buy/a_deliveryForm.jsp");
		model.addAttribute("mypgm", "../../member/admin_page/a_memberAll.jsp");
		return "module/main";
	}

	@RequestMapping("am_delivery")
	public String a_delivery(Model model, int pb_no, int pr_no, int pb_mono) {
		Product_buy pb = ds.select(pb_no);
		Product price = ds.selectOne(pr_no);
		String NickName = ds.Nick(pb_mono);
		model.addAttribute("nick", NickName);
		model.addAttribute("pb", pb);
		model.addAttribute("price", price);
		model.addAttribute("pgm", "../product_buy/delivery.jsp");
		return "module/main";
	}

	@RequestMapping("exit")
	public String exit(Model model) {
		return "redirect:a_deliveryForm.do";
	}
}
