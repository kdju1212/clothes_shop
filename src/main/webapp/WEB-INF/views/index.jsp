<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Slider</title>
<script src="/js/clothes.js"></script>
<link rel="stylesheet" href="/css/clothes.css">
</head>
<body>

	<div class="main-content">
		<div class="product-list">
			<c:forEach var="item" items="${home}">
				<div class="product-card" onclick="redirectToInfo(${item.goodsId})">
					<img class="product-image" src="/library/upload/${item.goodsImg1}"
						alt="${item.goodsName}" />
					<div class="product-info">
						<p class="product-name">${item.goodsName}</p>
						<p class="product-views">조회수 : ${item.goodsCount}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


</body>
</html>
