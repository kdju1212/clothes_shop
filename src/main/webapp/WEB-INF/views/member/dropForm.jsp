<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	탈퇴페이지
	<h1>비밀번호를 입력하세요</h1>
	<form action="/member/dropConfirm" method="post">
		<input type="password" name="pwd" placeholder="비밀번호를 입력하세요"> <input
			type="submit" value="탈퇴" onclick="return confirm('탈퇴하시겠습니까?')" />
	</form>

</body>
</html>