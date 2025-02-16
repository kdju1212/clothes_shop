package com.office.clothes.list;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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

		int result = listService.getCartProductZero(loginedMemberVo, listVo);

		if (result == 0) {
			int cart1 = listService.setCartProduct(loginedMemberVo, listVo);
			if (cart1 > 0) {
				List<ListVo> cart = listService.getGoodsListByUserId(loginedMemberVo);

				model.addAttribute("cart", cart);
				nextPage = "redirect:/list/cart";
			}
		}

		int cart1 = listService.updateCartProduct(loginedMemberVo, listVo);

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
	public String cart(HttpSession session, Model model) {

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

	/* 상품 추가 */
	@GetMapping("addclothes")
	public String addclothes(Model model) {

		String nextPage = "list/addclothes";

		return nextPage;
	}

	/* 상품 추가 컨펌 */
	@PostMapping("addclothesConfirm")
	public String addclothesConfirm(HomeVo recipe) {

		// 1. 첫 번째 이미지 처리
		MultipartFile file1 = recipe.getGoodsImgUrl1();
		if (file1 != null && !file1.isEmpty()) {
			String fileName1 = saveFile(file1);
			recipe.setGoodsImg1(fileName1); // DB 저장을 위해 파일명 설정
		}

		// 2. 두 번째 이미지 처리
		MultipartFile file2 = recipe.getGoodsImgUrl2();
		if (file2 != null && !file2.isEmpty()) {
			String fileName2 = saveFile(file2);
			recipe.setGoodsImg2(fileName2);
		}

		// 3. 세 번째 이미지 처리
		MultipartFile file3 = recipe.getGoodsImgUrl3();
		if (file3 != null && !file3.isEmpty()) {
			String fileName3 = saveFile(file3);
			recipe.setGoodsImg3(fileName3);
		}

		// DB에 레시피 정보 저장
		int result = listService.goodsInsert(recipe);

		if (result > 0) {
			return "redirect:/"; // 성공 시 리디렉션
		}
		return "ng";
	}

	private String saveFile(MultipartFile file) {
		String uploadDir = "C:/library/upload/";

		File dir = new File(uploadDir);
		if (!dir.exists()) {
			dir.mkdirs(); // 폴더 생성
		}

		String originalFileName = file.getOriginalFilename();
		String fileExtension = "";

		if (originalFileName != null && originalFileName.contains(".")) {
			fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		}

		String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
		File saveFile = new File(uploadDir, uniqueFileName);

		try {
			file.transferTo(saveFile); // 파일 저장
			System.out.println("파일 저장 성공: " + saveFile.getAbsolutePath());
			return uniqueFileName;
		} catch (IOException e) {
			System.err.println("파일 저장 실패: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
