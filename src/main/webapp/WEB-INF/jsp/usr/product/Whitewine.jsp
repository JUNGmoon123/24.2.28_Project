<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>
<section class="mt-8 text-xl px-4">
<div>화이트와인</div>
<div class="image-description-container">
    <div class="image-container">
        <img src="이미지_경로_1" alt="이미지 설명 1">
    </div>
    <div class="description">
        설명 내용 1
    </div>
</div>

<div class="image-description-container">
    <div class="image-container">
        <img src="이미지_경로_2" alt="이미지 설명 2">
    </div>
    <div class="description">
        설명 내용 2
    </div>
</div>

<div class="image-description-container">
    <div class="image-container">
        <img src="이미지_경로_3" alt="이미지 설명 3">
    </div>
    <div class="description">
        설명 내용 3
    </div>
</div>
</section>



<%@ include file="../common/foot.jspf"%>