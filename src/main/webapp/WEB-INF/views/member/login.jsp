<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/css/member.css">
</head>
<body>

	<div class="login-container">
		<div class="login-form">
			<h2>로그인</h2>
			<form action="loginConfirm" method="POST">
				<input type="text" id="user_id" name="user_id"
					placeholder="아이디를 입력하세요" class="input-field" required /> <input
					type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요"
					class="input-field" required /> <input type="submit" value="로그인"
					class="submit-btn" />
			</form>
		</div>
	</div>

</body>
</html>
