package com.office.clothes.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.office.clothes.HomeVo;
import com.office.clothes.member.MemberVo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/list")
public class ListController {

	@Autowired
	ListService listService;

	/* 장바구니 담기 */
	// 나중에 동적으로 바꿔야함
	@PostMapping("addcart")
	public String addcart(HttpSession session, Model model, ListVo listVo) {

		String nextPage = "ng";

		MemberVo loginedMemberVo = (MemberVo) session.getAttribute("loginedMemberVo");

		int cart1 = listService.setCartProduct(loginedMemberVo, listVo);
		if (cart1 > 0) {
			List<ListVo> cart = listService.getGoodsListByUserId(loginedMemberVo);

			model.addAttribute("cart", cart);
			// 어차피 동적으로 부꿀거임
			nextPage = "redirect:/list/cart";
		}
		return nextPage;
	}

	/* 장바구니 list */
	@GetMapping("cart")
	public String cart(HttpSession session, Model model, ListVo listVo) {

		String nextPage = "list/cart";

		MemberVo loginedMemberVo = (MemberVo) session.getAttribute("loginedMemberVo");

		List<ListVo> cart = listService.getCartProduct(loginedMemberVo);

		model.addAttribute("cart", cart);

		return nextPage;
	}

//	@GetMapping("cart")
//	public String getGoodsListByUserId(HttpSession session, Model model) {
//
//		String nextPage = "list/cart";
//
//		MemberVo loginedMemberVo = (MemberVo) session.getAttribute("loginedMemberVo");
//
//		List<ListVo> cart = listService.getGoodsListByUserId(loginedMemberVo);
//		
//
//		model.addAttribute("cart", cart);
//
//		return nextPage;
//	}

}
