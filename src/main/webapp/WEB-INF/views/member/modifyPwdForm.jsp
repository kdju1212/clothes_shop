<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<form action="/member/modifyPwdConfirm" method="post">
		<input type="hidden" name="user_id" value="${loginedMemberVo.user_id}">
		<input type="password" name="new_pwd" placeholder="새 비밀번호"> <input
			type="submit" value="전송">
	</form>
</body>
</html>