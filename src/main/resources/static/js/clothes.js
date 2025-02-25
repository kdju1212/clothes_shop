/**
 * 
 */

function redirectToInfo(goodsId) {
	if (goodsId) {
		// const contextPath = '${pageContext.request.contextPath}'; // JSP에서 contextPath 가져오기
		// URL 파라미터로 전달
		// window.location.href = contextPath + '/details?goodsId=' + goodsId;
		window.location.href = '/details?goodsId=' + goodsId;
	} else {
		console.error("goodsId 값이 없습니다.");
	}
}