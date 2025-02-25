<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/modifyConfirm" method="post">
		<p>아이디 : ${loginedMemberVo.user_id}</p>
		<input type="hidden" name="user_id" value="${loginedMemberVo.user_id}">
		<p>
			이름 : <input type="text" name="name" value="${loginedMemberVo.name}">
		</p>
		<p>
			이메일 : <input type="text" name="email"
				value="${loginedMemberVo.email}">
		</p>
		<p>
			휴대폰 번호 : <input type="text" name="phone"
				value="${loginedMemberVo.phone}">
		</p>
		<p>
			성별 : <select name="gender" id="gender">
				<option value="1"
					<c:if test="${loginedMemberVo.gender == '1'}">selected</c:if>>남성</option>
				<option value="2"
					<c:if test="${loginedMemberVo.gender == '2'}">selected</c:if>>여성</option>
			</select>

		</p>
		<p>
			나이 : <input type="text" name="age" value="${loginedMemberVo.age}">
		</p>
		<input type="submit" value="전송">
	</form>
</body>
</html>