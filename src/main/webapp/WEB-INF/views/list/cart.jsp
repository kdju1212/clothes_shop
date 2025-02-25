<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="/js/clothes.js"></script>

</head>
<body>
	<h1>장바구니</h1>

	<div>
		<div>
			<form action="/list/order" method="post">
				<c:forEach var="item" items="${cart}">
					<div>
						<img src="/library/upload/${item.goodsImg1}"
							style="width: 150px; height: 150px;" alt="${item.goodsName}"
							class="product-image" onclick="redirectToInfo(${item.goodsId})">
						${item.goodsName} <select name="goodsColor">
							<c:forEach var="i" begin="1" end="10">
								<option value="${i}" ${i == item.goodsCnt ? 'selected' : ''}>${i}</option>
							</c:forEach>
						</select>${item.goodsSize } ${item.goodsSale } <input type="submit"
							value="주문하기" />
					</div>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>