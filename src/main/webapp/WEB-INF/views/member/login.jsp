<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이건 로그인 페이지다.
	<form action="loginConfirm" method="POST">
		<input type="text" id="user_id" name="user_id"
			placeholder="아이디를 입력하세요" /> <input type="password" name="pwd"
			id="pwd" placeholder="비밀번호를 입력하세요" /> <input type="submit"
			value="전송" />
	</form>
</body>
</html>