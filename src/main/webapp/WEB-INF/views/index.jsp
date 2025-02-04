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

	<div>
		<div>
			<!-- 첫 번째 이미지 -->
			<img id="imageSlider" style="width: 25%; height: 25%;"
				src="${pageContext.request.contextPath}/images/image1.jpg"
				alt="Image 1" />
		</div>
	</div>

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
	</script>
</body>
</html>
