<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<div>
		<div>
			<c:forEach var="item" items="${categorys}">
				<div onclick="redirectToInfo(${item.goodsId})">
					<img id="imageSlider" style="width: 25%; height: 25%;"
						src="/library/upload/${item.goodsImg1}" alt="${item.goodsName}" />
					<br>${item.goodsName}
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>