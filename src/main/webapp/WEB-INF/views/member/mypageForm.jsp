<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/css/mypage.css">
<!-- mypage.css 연결 -->
</head>
<body>
	<div class="mypage-container">
		<h1>마이페이지</h1>

		<!-- 사용자 정보(예시) -->
		<section class="user-info">
			<p>
				<strong>아이디: </strong>${loginedMemberVo.user_id}</p>
			<p>
				<strong>이름: </strong>${loginedMemberVo.name}</p>
			<p>
				<strong>이메일: </strong>${loginedMemberVo.email}</p>
			<p>
				<strong>전화번호: </strong>${loginedMemberVo.phone}</p>
			<p>
				<strong>성별: </strong>${loginedMemberVo.gender == 1 ? "남성" : "여성"}</p>
			<p>
				<strong>나이: </strong>${loginedMemberVo.age}</p>
		</section>

		<!-- 버튼들 -->
		<section class="action-buttons">
			<a href="<c:url value='/member/modifyForm' />" class="action-btn">정보
				수정</a> <a href="<c:url value='/member/modifyPwdForm' />"
				class="action-btn">비밀번호 변경</a> <a
				href="<c:url value='/member/dropForm' />" class="action-btn">탈퇴</a>
		</section>
	</div>
</body>
</html>
