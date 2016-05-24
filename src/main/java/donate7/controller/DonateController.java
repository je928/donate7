package donate7.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import donate7.model.Gift;
import donate7.service.DonateService;

@Controller
public class DonateController {
	@Autowired
	private DonateService ds;
	@RequestMapping(value="doReq", method=RequestMethod.POST)
	public String doReqForm(@RequestParam("d_img") MultipartFile mf,
			HttpServletRequest request,Model model) {
		String fileName = mf.getOriginalFilename();
		String uploadName = System.currentTimeMillis()+mf.getOriginalFilename();
		mf.transferTo(new File(request.getRealPath("/")+uploadName));
		donate.setD_img(uploadName);
		ds.insert(donate);
		model.addAttribute("msg", "파일업로드 : "+fileName);
		List<donate> list = ds.list();
		model.addAttribute("list", list);
		model.addAttribute("fileName", uploadName);
		model.addAttribute("pgm", "../donate/doReq.jsp");
		return "module/main";
	}

	

}
