<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>
<section class="mt-8 text-xl px-4">
<div>레드와인</div>
<div class="image-description-container">
    <div class="image-container">
        <img src="https://m.media-amazon.com/images/I/5129-mIYHIL._AC_UF1000,1000_QL80_.jpg" alt="이미지 설명 1">
    </div>
    <div class="description">
        설명 내용 1
    </div>
</div>

<div class="image-description-container">
    <div class="image-container">
        <img src="https://www.portugalist.com/wp-content/uploads/Portuguese-craft-beer-bottles-1200x900.jpg" alt="이미지 설명 2">
    </div>
    <div class="description">
        설명 내용 2
    </div>
</div>

<div class="image-description-container">
    <div class="image-container">
        <img src="https://i0.wp.com/urbanladies.co/wp-content/uploads/2021/10/gradient_5.jpg?fit=1980%2C1080" alt="이미지 설명 3">
    </div>
    <div class="description">
        설명 내용 3
    </div>
</div>
</section>



<%@ include file="../common/foot.jspf"%>