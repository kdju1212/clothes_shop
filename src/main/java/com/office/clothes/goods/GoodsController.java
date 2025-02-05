package com.office.clothes.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	GoodsService goodsService;

	@GetMapping({ "", "/" })
	public String home() {

		List<GoodsVo> home = goodsService.home();

		return "index";
	}

}
