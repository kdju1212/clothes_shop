<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addclothesConfirm" method="post">
		<p>
			상품명 : <input type="text" name="goodsName">
		</p>
		<p>
			카테고리 : <input type="text" name="goodsCategory">
		</p>
		<p>
			상품내용 : <input type="text" name="goodsCategory">
		</p>
		<p>
			사이즈 : <input type="checkbox" name="goodsSize">
		</p>
		<p>
			상품색깔 : <input type="checkbox" name="goodsColor">
		</p>
		<p>
			상품 정가 : <input type="text" name="goodsPrice">
		</p>
		<p>
			상품 판매가격 : <input type="text" name="goodsSale">
		</p>
		<p>
			상품 재고 : <input type="text" name="goodsInventory">
		</p>
		<p>
			상품 사진1 : <input type="file" name="goodsImg1">
		</p>
		<p>
			상품 사진2 : <input type="file" name="goodsImg2">
		</p>
		<p>
			상품 사진3 : <input type="file" name="goodsImg3">
		</p>
		<input type="submit" value="전송">

	</form>
</body>
</html>