package com.office.clothes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;

	@GetMapping({ "", "/" })
	public String home(Model model) {

		List<HomeVo> home = homeService.home();

		model.addAttribute("home", home);

		return "index";
	}

	@GetMapping("details")
	public String details(@RequestParam("goodsId") Integer goodsId, Model model) {

		// String을 int로 변환
		// int parsedGoodsId = Integer.parseInt(goodsId);

		String nextPage = "details";

		 HomeVo home = homeService.getgoodsNo(goodsId);

		model.addAttribute("home", home);

		return nextPage;
	}

}
