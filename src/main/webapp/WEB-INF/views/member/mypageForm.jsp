<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	마이페이지
	<a href="<c:url value='/member/modifyForm' />">정보 수정</a>
	<a href="<c:url value='/member/modifyPwdForm' />">비밀번호 변경</a>
	<a href="<c:url value='/member/dropForm' />">탈퇴</a>
</body>
</html>