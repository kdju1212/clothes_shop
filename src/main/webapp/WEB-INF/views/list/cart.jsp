<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript">
function redirectToInfo(goodsId) {
    console.log("goodsId:", goodsId); // 콘솔에서 값 확인
    if (goodsId) {
        const contextPath = '${pageContext.request.contextPath}'; // JSP에서 contextPath 가져오기
        // URL 파라미터로 전달
        window.location.href = contextPath + '/details?goodsId=' + goodsId;
    } else {
        console.error("goodsId 값이 없습니다.");
    }
}
</script>
</head>
<body>
	<h1>장바구니</h1>

	<div>
		<div>
			<form action="/list/order" method="post">
				<c:forEach var="item" items="${cart}">
					<div>
						<!-- <img id="imageSlider" style="width: 25%; height: 25%;"
						src="${item.goodsImg1}" alt="${item.goodsName}" />  -->
						<img id="imageSlider" style="width: 150px; height: 150px;"
							src="/images/1ec915ab854c302720f315f2455d3fe2.jpg"
							alt="${item.goodsName}" onclick="redirectToInfo(${item.goodsId})" />
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