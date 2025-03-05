<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="/css/member-modify-pwd.css">
<!-- 비밀번호 변경 전용 CSS -->
</head>
<body>
	<div class="container">
		<h1>비밀번호 변경</h1>
		<form action="/member/modifyPwdConfirm" method="post"
			class="password-form">
			<!-- 숨겨진 필드로 사용자 ID 전달 -->
			<input type="hidden" name="user_id"
				value="${loginedMemberVo.user_id}">

			<!-- 새 비밀번호 입력 필드 -->
			<div class="form-group">
				<label for="new_pwd">새 비밀번호</label> <input type="password"
					id="new_pwd" name="new_pwd" placeholder="새 비밀번호를 입력하세요" required
					aria-label="새 비밀번호">
			</div>

			<!-- 제출 버튼 -->
			<div class="form-group">
				<button type="submit" class="submit-btn">비밀번호 변경</button>
			</div>
		</form>
	</div>
</body>
</html>
