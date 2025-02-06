<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
</head>
<body>
	<header>
		<nav>
			<ul class="My-site">
				<li><a href="<c:url value='/' />">쇼핑몰 이름</a></li>
			</ul>
			<ul class="flex-menu">
				<c:if test="${empty loginedMemberVo.user_id}">
					<li><a href="<c:url value='/' />">홈</a></li>
					<li class="dropdown"><a href="javascript:void(0)">카테고리</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/list/filter?category=상의' />">상의</a></li>
							<li><a href="<c:url value='/list/filter?category=하의' />">하의</a></li>
							<li><a href="<c:url value='/list/filter?category=아우터' />">아우터</a></li>
							<li><a href="<c:url value='/list/filter?category=신발' />">신발</a></li>
							<li><a href="<c:url value='/list/filter?category=기타' />">기타</a></li>
						</ul></li>
					<li><a href="<c:url value='/list/ranking' />">랭킹</a></li>
					<li><a href="<c:url value='/member/loginForm' />">로그인</a></li>
					<li><a href="<c:url value='/member/createForm' />">회원가입</a></li>
				</c:if>
				<c:if test="${not empty loginedMemberVo.user_id}">
					<c:if test="${loginedMemberVo.user_id != 'admin'}">
						<!-- 일반 사용자 -->
						<li><a href="<c:url value='/' />">홈</a></li>
						<li class="dropdown"><a href="javascript:void(0)">카테고리</a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/list/filter?category=상의' />">상의</a></li>
								<li><a href="<c:url value='/list/filter?category=하의' />">하의</a></li>
								<li><a href="<c:url value='/list/filter?category=아우터' />">아우터</a></li>
								<li><a href="<c:url value='/list/filter?category=신발' />">신발</a></li>
								<li><a href="<c:url value='/list/filter?category=기타' />">기타</a></li>
							</ul></li>
						<li><a href="<c:url value='/list/cart' />">장바구니</a></li>
						<li><a href="<c:url value='/list/ranking' />">랭킹</a></li>
						<li><a href="<c:url value='/member/mypage' />">마이페이지</a></li>
						<li><a href="<c:url value='/member/logout' />"
							onclick="return logoutCheck()">로그아웃</a></li>

						<li class="welcome-message">&nbsp;&nbsp;&nbsp;${loginedMemberVo.name}님&nbsp;</li>
					</c:if>
					<c:if test="${loginedMemberVo.user_id == 'admin'}">
						<!-- 관리자 -->
						<li><a href="<c:url value='/' />">홈</a></li>
						<li><a href="<c:url value='/list/recipeList' />">레시피 등록</a></li>
						<li><a href="<c:url value='/member/logoutConfirm' />"
							onclick="return logoutCheck()">로그아웃</a></li>
						<li><a href="<c:url value='/message' />">쪽지함</a></li>
						<li class="welcome-message">&nbsp;&nbsp;관리자 모드</li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</header>
</body>
</html>