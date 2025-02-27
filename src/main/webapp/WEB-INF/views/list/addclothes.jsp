<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addclothesConfirm" method="post"
		enctype="multipart/form-data">
		<p>
			상품명 : <input type="text" name="goodsName">
		</p>
		<p>
			카테고리 : <input type="radio" name="goodsCategory" value="상의">
			상의 <input type="radio" name="goodsCategory" value="하의"> 하의 <input
				type="radio" name="goodsCategory" value="아우터"> 아우터 <input
				type="radio" name="goodsCategory" value="신발"> 신발 <input
				type="radio" name="goodsCategory" value="기타"> 기타
		</p>
		<p>
			상품내용 : <input type="text" name="goodsContent">
		</p>
		<p>
			사이즈 : <input type="radio" name="goodsSize" value="S"> S <input
				type="radio" name="goodsSize" value="M"> M <input
				type="radio" name="goodsSize" value="L"> L
		</p>
		색깔 : <input type="radio" name="goodsColor" value="red"> 빨강 <input
			type="radio" name="goodsColor" value="blue"> 파랑 <input
			type="radio" name="goodsColor" value="green"> 초록 <input
			type="radio" name="goodsColor" value="black"> 검정
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
			상품 사진1 : <input type="file" name="goodsImgUrl1">
		</p>
		<p>
			상품 사진2 : <input type="file" name="goodsImgUrl2">
		</p>
		<p>
			상품 사진3 : <input type="file" name="goodsImgUrl3">
		</p>
		<input type="submit" value="전송">

	</form>
</body>
</html>