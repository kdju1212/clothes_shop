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
<link rel="stylesheet" href="/css/cart.css">
</head>
<body>

	<section class="cart-container">
		<h1>장바구니</h1>

		<form action="/list/order" method="post">
			<ul class="cart-items">
				<c:forEach var="item" items="${cart}">
					<li class="cart-item">
						<article class="product-info">
							<img src="/library/upload/${item.goodsImg1}"
								alt="${item.goodsName}" class="product-image"
								onclick="redirectToInfo(${item.goodsId})">
							<div class="cart-item-details">
								<p class="cart-item-name">${item.goodsName}</p>
								<p class="cart-item-info">사이즈: ${item.goodsSize} | 가격:
									${item.goodsSale}</p>
								<p class="cart-item-select">
									색상: <select name="goodsColor">
										<c:forEach var="i" begin="1" end="10">
											<option value="${i}" ${i == item.goodsCnt ? 'selected' : ''}>${i}</option>
										</c:forEach>
									</select>
								</p>
							</div>
						</article>
						<button type="submit" class="submit-btn">주문하기</button>
					</li>
				</c:forEach>
			</ul>
		</form>
	</section>

</body>
</html>
