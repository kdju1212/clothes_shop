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
</head>
<body>

	<div>
		<div>
			<c:forEach var="item" items="${home}">
				<div onclick="redirectToInfo(${item.goodsId})">
					<img id="imageSlider" style="width: 25%; height: 25%;"
						src="/library/upload/${item.goodsImg1}" alt="${item.goodsName}" />
					<br>${item.goodsName} <br>조회수 : ${item.goodsCount }

				</div>
			</c:forEach>
		</div>
	</div>


</body>
</html>
