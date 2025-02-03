package com.office.clothes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

}
