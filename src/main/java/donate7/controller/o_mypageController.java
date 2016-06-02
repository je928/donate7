package donate7.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import donate7.model.Donate;
import donate7.model.Product;
import donate7.model.Second;
import donate7.service.DonateService;
import donate7.service.ProductService;
import donate7.service.SecondService;

@Controller
public class o_mypageController {
	@Autowired
	private SecondService ss;

	@RequestMapping(value = "o_myinfo", method = RequestMethod.GET)
	public String o_myinfo(Model model) {
		model.addAttribute("pgm", "../member/o_mypage/o_tamp.jsp");
		model.addAttribute("mypgm", "../../member/o_mypage/o_myinfo.jsp");
		return "module/main";
	}

}
