package com.office.clothes.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	/* 로그인 폼 */
	@GetMapping("/loginForm")
	public String loginForm() {

		return "member/login";
	}

	/* 로그인 확인 */
	@PostMapping("/loginConfirm")
	public String loginConfirm(MemberVo memberVo, HttpSession session, Model model) {

		String nextPage = "redirect:/";

		MemberVo loginedMemberVo = memberService.loginConfirm(memberVo.getUser_id(), memberVo.getPwd());

		if (loginedMemberVo == null) {
			// login ng
			model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			nextPage = "ng";

		} else {
			session.setAttribute("loginedMemberVo", loginedMemberVo);
			session.setMaxInactiveInterval(60 * 30);

		}

		return nextPage;

	}

	/* 회원가입 폼 */
	@GetMapping("createForm")
	public String createForm() {
		return "member/createForm";
	}

	/* 회원가입 확인 */
	@PostMapping("createConfirm")
	public String createConfirm(MemberVo memberVo) {

		String nextPage = "member/login";

		int result = memberService.createConfirm(memberVo);

		if (result <= 0)
			// join ng
			nextPage = "member/createForm";

		return nextPage;

	}

	/* 로그아웃 */
	@GetMapping("logout")
	public String logout(HttpSession session) {

		String nextPage = "redirect:/";

		session.removeAttribute("loginedMemberVo");
		session.invalidate();

		return nextPage;
	}

	/* 마이페이지 폼 */
	@GetMapping("mypage")
	public String mypageForm() {
		return "member/mypageForm";
	}

	/* 탈퇴 폼 */
	@GetMapping("dropForm")
	public String dropForm() {

		return "member/dropForm";
	}

	/* 탈퇴 확인 */
	@PostMapping("dropConfirm")
	public String dropConfirm(HttpSession session, MemberVo memberVo) {

		String nextPage = "ng";

		MemberVo loginedMemberVo = (MemberVo) session.getAttribute("loginedMemberVo");

		int result = memberService.dropConfirm(memberVo, loginedMemberVo);

		if (result > 0) {

			session.removeAttribute("loginedMemberVo");
			session.invalidate();

			nextPage = "redirect:/";
		}

		return nextPage;
	}

	/* 정보 수정 폼 */
	@GetMapping("modifyForm")
	public String modifyForm(HttpSession session, Model model) {

		MemberVo loginedMemberVo = (MemberVo) session.getAttribute("loginedMemberVo");
		model.addAttribute("loginedMemberVo", loginedMemberVo);

		return "member/modifyForm";
	}

	/* 정보 수정 확인 */
	@PostMapping("modifyConfirm")
	public String modifyConfirm(HttpSession session, MemberVo memberVo) {

		String nextPage = "ng";

		int result = memberService.modifyConfirm(memberVo);

		if (result > 0) {

			MemberVo loginedMemberVo = memberService.getUser(memberVo.getUser_id());
			session.setAttribute("loginedMemberVo", loginedMemberVo);
			nextPage = "redirect:/";

		}

		return nextPage;
	}

}