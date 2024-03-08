<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl px-4">
	<div>상품설명</div>
	<div class="product_main_bar" id="product_main_bar">
		<!-- 메뉴가 여기에 동적으로 설정됩니다. -->
		<c:choose>
			<c:when test="${board.code eq 'FREE4'}">
				<!-- 와인 메뉴 -->
				<a href="../article/productlist?boardId=7&page=1">레드 와인</a>
				<a href="../article/productlist?boardId=7&page=1">화이트 와인</a>
				<a href="../article/productlist?boardId=7&page=1">스파클링 와인</a>
			</c:when>
			<c:when test="${board.code eq 'FREE5'}">
				<!-- 전통주 메뉴 -->
				<a href="../article/productlist?boardId=8&page=1">브랜드</a>
				<a href="../article/productlist?boardId=8&page=1">흑맥주</a>
				<a href="../article/productlist?boardId=8&page=1">수제맥주</a>
			</c:when>
			<c:when test="${board.code eq 'FREE6'}">
				<!-- 전통주 메뉴 -->
				<a href="../article/productlist?boardId=9&page=1">탁주</a>
				<a href="../article/productlist?boardId=9&page=1">청주</a>
			</c:when>
		</c:choose>
	</div>
	<div class="product_register">
		<div id="productList">
			<!-- 여기에 상품 목록이 동적으로 추가될 것입니다. -->
			<c:forEach var="product" items="${products}">
				<!-- 각 상품 행 -->
				<tr class="hover">
					<div>${product.id}</div>
					<div>${product.productName}</div>
					<div>${product.abv}</div>
					<div>${product.body}</div>
					<div>${product.price}</div>
				</tr>
			</c:forEach>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>