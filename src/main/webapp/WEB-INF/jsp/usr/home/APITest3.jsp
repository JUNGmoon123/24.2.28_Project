<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST3"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 생성하기</title>

</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script>
		async function getData2() {
			const API_KEY = 'ZQ%2BxIGD58N5UvuUXzJtGBoszPcFwmlnoSF%2Bs%2Bkski23QWapgj9WTE6vlrvNgjyeRGUk94TKqYRAIKw7GHAE80g%3D%3D';
			const url = 'https://api.odcloud.kr/api/15089109/v1/uddi:c7468573-84ff-4a92-a84b-884439ce23d3?page=1&perPage=10&serviceKey=' + API_KEY; ;
			const response = await fetch(url);
			const data = await response.json();
			console.log("data", data);
		}

		getData2();
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>
