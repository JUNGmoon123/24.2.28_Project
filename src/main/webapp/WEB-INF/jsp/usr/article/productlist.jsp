<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div>상품판매할 곳</div>
	<div class="product_main_bar">
		<a href="#">레드 와인</a>
		<a href="#">화이트 와인</a>
		<a href="#">스파클링 와인</a>
	</div>
	<div class="product_register">
		<thead>
			<tr style="display: none;">
				<div>번호</div>
				<div>술 이름</div>
				<div>도수</div>
				<div>종류?</div>
				<div>가격</div>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${products}">
				<tr class="hover">
					<div>${product.id}</div>
					<div>${product.productName}</div>
					<div>${product.abv}</div>
					<div>${product.body}</div>
					<div>${product.price}</div>
				</tr>
			</c:forEach>
		</tbody>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>