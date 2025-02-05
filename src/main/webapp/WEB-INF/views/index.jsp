<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Slider</title>
</head>
<body>

	<script>
	
	// 이미지 리스트
	const images = [ '/images/image1.jpg', // 첫 번째 이미지
	'/images/image2.png', // 두 번째 이미지
	'/images/image3.png' // 세 번째 이미지
	];

	let currentImageIndex = 0;

	function changeImage() {
		// 이미지 변경
		document.getElementById("imageSlider").src = images[currentImageIndex];

		// 이미지 인덱스 업데이트 (3초마다 다른 이미지를 보여줌)
		currentImageIndex = (currentImageIndex + 1) % images.length;
	}

	// 페이지 로드 시 3초마다 이미지 변경
	window.onload = function() {
		changeImage(); // 첫 번째 이미지를 즉시 표시
		setInterval(changeImage, 3000); // 3초마다 changeImage 함수 실행
	};
	
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
			<c:forEach var="item" items="${home}">
				<div onclick="redirectToInfo(${item.goodsId})">
					<img id="imageSlider" style="width: 25%; height: 25%;"
						src="${item.goodsImg1}" alt="${item.goodsName}" /> <br>${item.goodsName}
				</div>
			</c:forEach>
		</div>
	</div>


</body>
</html>
