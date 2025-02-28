<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/clothes.css">
<script>
    var isLoggedIn = ${not empty sessionScope.loginedMemberVo}; // true 또는 false 값
</script>
<script src="/js/member.js"></script>

</head>
<body>
	<main class="main-content">
		<section class="product-list">

			<form action="/list/addcart" method="post"
				onsubmit="return loginCheck()">
				<div class="product-card">
					<img src="/library/upload/${home.goodsImg1}"
						alt="${home.goodsName}" class="product-image">

					<div class="product-info">
						<h2 class="product-name">${home.goodsName}</h2>
						<p class="product-category">카테고리: ${home.goodsCategory}</p>
						<p class="product-content">${home.goodsContent}</p>
						<p class="product-price">Price: ${home.goodsPrice}</p>
						<p class="product-sale">Sale: ${home.goodsSale}</p>

						<p>
							색깔 : <select name="goodsColor">
								<option value="blue">blue</option>
								<option value="red">red</option>
								<option value="green">green</option>
								<option value="black">black</option>
							</select>
						</p>
						<p>
							사이즈 : <select name="goodsSize">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
								<option value="XL">XL</option>
							</select>
						</p>
						<p>

							<select name="goodsCnt">
								<c:forEach var="i" begin="1" end="10">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</p>
						<input type="hidden" name="goodsSale" value="${home.goodsSale }" />
						<input type="hidden" name="goodsImg1" value="${home.goodsImg1 }" />
						<input type="hidden" name="goodsName" value="${home.goodsName }" />
						<input type="hidden" name="goodsId" value="${home.goodsId }" />
						<!-- <p class="product-inventory">Stock: ${home.goodsInventory}</p> -->
						<button type="submit" class="add-to-cart">Add to Cart</button>
						좋아요자리
					</div>
				</div>
			</form>

		</section>
		<div class="product-content">
			<p>${home.goodsContent}</p>
		</div>
	</main>
</body>
</html>

