<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl px-4">
	<div>상품설명</div>
	<div class="product_main_bar" id="product_main_bar">
		<!-- 메뉴가 여기에 동적으로 설정됩니다. -->
		<c:choose>
			<c:when test="${board.code eq 'WINE'}">
				<!-- 와인 메뉴 -->
				<a href="../article/productlist?boardId=7&page=1">레드 와인</a>
				<a href="../article/productlist?boardId=7&page=1">화이트 와인</a>
				<a href="../article/productlist?boardId=7&page=1">스파클링 와인</a>
			</c:when>
			<c:when test="${board.code eq 'BEER'}">
				<!-- 전통주 메뉴 -->
				<a href="../article/productlist?boardId=8&page=1">브랜드</a>
				<a href="../article/productlist?boardId=8&page=1">흑맥주</a>
				<a href="../article/productlist?boardId=8&page=1">수제맥주</a>
			</c:when>
			<c:when test="${board.code eq 'TRADITIONAL'}">
				<!-- 전통주 메뉴 -->
				<a href="../article/productlist?boardId=9&page=1">탁주</a>
				<a href="../article/productlist?boardId=9&page=1">청주</a>
				<a href="../article/productlist?boardId=9&page=1">증류주</a>
				<a href="../article/productlist?boardId=9&page=1">과실주</a>
			</c:when>
		</c:choose>
	</div>
	<div class="product_register">
    <div id="productList">
        <!-- 첫 번째 이미지와 상품 정보 -->
        <div class="product-row-container">
            <div class="product-row">
                <!-- 첫 번째 이미지 -->
                <div class="product-img">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRslOxlxZXznyP6ZAmiGR1eZLLRupkdz9NOUPBczlU8L7F85U_kqFPFlZtOm-A9Nc5w980&usqp=CAU" alt="Red Wine">
                </div>
                <!-- 첫 번째 상품 정보 -->
                <div>Red Wine</div>
                <div>14%</div>
                <div>Full-bodied</div>
                <div>$20</div>
            </div>
            <div class="product-row-separator"></div>
        </div>

        <!-- 두 번째 이미지와 상품 정보 -->
        <div class="product-row-container">
            <div class="product-row">
                <!-- 두 번째 이미지 -->
                <div class="product-img">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQ4W1Xf-8nF20OzZqDJUuVPP4Jqbs_CRT1DElS6gwPIlOrYTPLKNAmAbKotcdzlhE64g&usqp=CAU" alt="Craft Beer">
                </div>
                <!-- 두 번째 상품 정보 -->
                <div>Craft Beer</div>
                <div>6%</div>
                <div>Medium-bodied</div>
                <div>$15</div>
            </div>
            <div class="product-row-separator"></div>
        </div>

        <!-- 세 번째 이미지와 상품 정보 -->
        <div class="product-row-container">
            <div class="product-row">
                <!-- 세 번째 이미지 -->
                <div class="product-img">
                    <img src="https://img.fril.jp/img/665033131/l/2169130572.jpg?1707102611" alt="Soju">
                </div>
                <!-- 세 번째 상품 정보 -->
                <div>Soju</div>
                <div>20%</div>
                <div>Light-bodied</div>
                <div>$10</div>
            </div>
            <div class="product-row-separator"></div>
        </div>
    </div>
</div>
<!-- 	동적으로 이미지하기 포기 -->
<!-- 	<div class="product_register"> -->
<!-- 		<div id="productList"> -->
<%-- 			<c:forEach var="product" items="${products}"> --%>
<!-- 				각 상품 행 -->
<!-- 				<div class="product-row-container"> -->
<!-- 					<div class="product-row"> -->
<!-- 						상품 이미지 -->
<!-- 						<div class="product-img"> -->
<!-- 						</div> -->
<!-- 						상품 정보 -->
<%-- 						<div>${product.productName}</div> --%>
<%-- 						<div>${product.abv}</div> --%>
<%-- 						<div>${product.body}</div> --%>
<%-- 						<div>${product.price}</div> --%>
<!-- 					</div> -->
<!-- 					<div class="product-row-separator"></div> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->
</section>



<%@ include file="../common/foot.jspf"%>