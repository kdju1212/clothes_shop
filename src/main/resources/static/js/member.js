/**
 * 
 */
function loginCheck() {

	if (!isLoggedIn) {
		alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
		window.location.href = "/member/loginForm"; // 로그인 페이지로 이동
		return false; // 폼 제출 방지
	}

	return true; // 로그인 상태면 정상 진행
}