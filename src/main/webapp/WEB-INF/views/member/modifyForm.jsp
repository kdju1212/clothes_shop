<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" type="text/css" href="/css/member-create.css">
<!-- member-create.css 연결 -->
</head>
<body>
	<div class="form-container">
		<h1>회원 정보 수정</h1>
		<form action="/member/modifyConfirm" method="post">
			<p>
				<strong>아이디:</strong> ${loginedMemberVo.user_id}
			</p>
			<input type="hidden" name="user_id"
				value="${loginedMemberVo.user_id}">

			<div class="form-group">
				<label for="name">이름:</label> <input type="text" name="name"
					id="name" value="${loginedMemberVo.name}" required>
			</div>

			<div class="form-group">
				<label for="email">이메일:</label> <input type="email" name="email"
					id="email" value="${loginedMemberVo.email}" required>
			</div>

			<div class="form-group">
				<label for="phone">휴대폰 번호:</label> <input type="text" name="phone"
					id="phone" value="${loginedMemberVo.phone}" required>
			</div>

			<div class="form-group">
				<label for="gender">성별:</label> <select name="gender" id="gender"
					required>
					<option value="1"
						<c:if test="${loginedMemberVo.gender == '1'}">selected</c:if>>남성</option>
					<option value="2"
						<c:if test="${loginedMemberVo.gender == '2'}">selected</c:if>>여성</option>
				</select>
			</div>

			<div class="form-group">
				<label for="age">나이:</label> <input type="number" name="age"
					id="age" value="${loginedMemberVo.age}" required>
			</div>

			<div class="form-group">
				<input type="submit" value="수정하기" class="submit-btn">
			</div>
		</form>
	</div>
</body>
</html>
