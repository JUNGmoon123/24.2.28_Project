<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.beer-details img {
	max-width: 200px; /* 이미지의 최대 너비 설정 */
	max-height: 200px; /* 이미지의 최대 높이 설정 */
}

.beer-details table {
	margin: 0 auto; /* 테이블을 가운데 정렬 */
	border-collapse: collapse; /* 테이블 셀 테두리 합치기 */
}

.beer-details th, .beer-details td {
	border: 1px solid black; /* 셀 테두리 설정 */
	padding: 8px; /* 셀 안 여백 설정 */
	text-align: left; /* 셀 내용 왼쪽 정렬 */
}
</style>


<title>상품 detail</title>

<section class="mt-8 text-xl px-4 beer-details">
	<table>
		<tbody>
			<tr>
				<th>상품번호</th>
				<td>${beer.id }</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<img src="${beer.src }" alt="" />
				</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>${beer.btype }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${beer.model }</td>
			</tr>
			<tr>
				<th>연도</th>
				<td>${beer.byear }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${beer.price }</td>
			</tr>
		</tbody>
	</table>
</section>



<%@ include file="../common/foot.jspf"%>