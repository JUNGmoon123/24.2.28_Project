<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="양조장찾기"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<style>

/* 하단 와이너리 리스트모음 */
/*PEN STYLES*/
/* 메인 브루어리 스타일 */
.main_brewery {
	box-sizing: border-box;
}

/* body 스타일 */
body2 {
	background: #f1f1f1;
	display: flex;
	flex-direction: column;
	font-size: 1rem;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* 변수 정의 */
:root {
	--color-white: #fff;
	--color-prime: #5ad67d;
	--color-grey: #e2e2e2;
	--color-grey-dark: #a2a2a2;
}

/* 블로그 카드 스타일 */
.blog-card {
	display: flex;
	flex-direction: column;
	margin: 1rem auto;
	margin-bottom: 1.6%;
	background: var(--color-white);
	line-height: 1.4;
	font-family: sans-serif;
	border-radius: 5px;
	overflow: hidden;
	z-index: 0;
	border: 2px solid green;
	width: 100%;
}

/* 블로그 카드 내 하이퍼링크 스타일 */
.blog-card a {
	color: inherit;
}

/* 블로그 카드 내 하이퍼링크 호버 효과 */
.blog-card a:hover {
	color: var(--color-prime);
}

/* 블로그 카드 내 사진 호버 효과 */
.blog-card:hover .photo {
	transform: scale(1.3) rotate(3deg);
}

/* 블로그 카드 메타 섹션 스타일 */
.blog-card .meta {
	position: relative;
	z-index: 0;
	height: 200px;
}

/* 블로그 카드 내 사진 스타일 */
.blog-card .photo {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: center;
	transition: transform .2s;
}

/* 블로그 카드 내 디테일 섹션 및 리스트 스타일 */
.blog-card .details, .blog-card .details ul {
	margin: auto;
	padding: 0;
	list-style: none;
}

/* 블로그 카드 내 디테일 섹션 스타일 */
.blog-card .details {
	position: absolute;
	top: 0;
	bottom: 0;
	left: -100%;
	margin: auto;
	transition: left .2s;
	background: rgba(0, 0, 0, .6);
	color: var(--color-white);
	padding: 10px;
	width: 100%;
	font-size: .9rem;
}

/* 블로그 카드 내 디테일 섹션 내 하이퍼링크 스타일 */
.blog-card .details a {
	text-decoration: dotted underline;
}

/* 블로그 카드 내 태그 스타일 */
.blog-card .details ul li {
	display: inline-block;
}

/* 블로그 카드 내 작성자 아이콘 스타일 */
.blog-card .details .author:before {
	font-family: FontAwesome;
	margin-right: 10px;
	content: "\f007";
}

/* 블로그 카드 내 날짜 아이콘 스타일 */
.blog-card .details .homepage:before {
	font-family: FontAwesome;
	margin-right: 10px;
	content: "\f133";
}

/* 블로그 카드 내 태그 아이콘 스타일 */
.blog-card .details .tags ul:before {
	font-family: FontAwesome;
	content: "\f02b";
	margin-right: 10px;
}

/* 블로그 카드 내 태그 아이템 스타일 */
.blog-card .details .tags li {
	margin-right: 2px;
}

/* 블로그 카드 내 첫 번째 태그 아이템 스타일 */
.blog-card .details .tags li:first-child {
	margin-left: -4px;
}

/* 블로그 카드 내 설명 스타일 */
.blog-card .description {
	padding: 1rem;
	background: var(--color-white);
	position: relative;
	z-index: 1;
}

/* 블로그 카드 내 제목 스타일 */
.blog-card .description h1, .blog-card .description h2 {
	font-family: Poppins, sans-serif;
}

/* 블로그 카드 내 주요 제목 스타일 */
/* .blog-card .description h1 { */
/* 	line-height: 1; */
/* 	margin: 0; */
/* 	font-size: 1.7rem; */
/* } */
.blog-card h1 {
	line-height: 1;
	margin: 0;
	font-size: 1.7rem;
}

/* 블로그 카드 내 보조 제목 스타일 */
/* .blog-card .description h2 { */
/* 	font-size: 1rem; */
/* 	font-weight: 300; */
/* 	text-transform: uppercase; */
/* 	color: var(--color-grey-dark); */
/* 	margin-top: 5px; */
/* } */
.blog-card h2 {
	font-size: 1rem;
	font-weight: 300;
	text-transform: uppercase;
	color: var(--color-grey-dark);
	margin-top: 5px;
}

/* 블로그 카드 내 '더 읽기' 스타일 */
.blog-card .description .read-more {
	text-align: right;
}

/* 블로그 카드 내 '더 읽기' 하이퍼링크 스타일 */
.blog-card .description .read-more a {
	color: var(--color-prime);
	display: inline-block;
	position: relative;
}

/* 블로그 카드 내 '더 읽기' 하이퍼링크 호버 효과 */
.blog-card .description .read-more a:after {
	content: "\f061";
	font-family: FontAwesome;
	margin-left: -10px;
	opacity: 0;
	vertical-align: middle;
	transition: margin .3s, opacity .3s;
}

/* 블로그 카드 내 '더 읽기' 하이퍼링크 호버 후 아이콘 스타일 */
.blog-card .description .read-more a:hover:after {
	margin-left: 5px;
	opacity: 1;
}

/* 블로그 카드 내 단락 스타일 */
.blog-card p {
	position: relative;
	margin: 1rem 0 0;
}

/* 블로그 카드 내 첫 번째 단락 스타일 */
.blog-card p:first-of-type {
	margin-top: 1.25rem;
}

/* 블로그 카드 내 첫 번째 단락 전 구분선 스타일 */
.blog-card p:first-of-type:before {
	content: "";
	position: absolute;
	height: 5px;
	background: var(--color-prime);
	width: 35px;
	top: -0.75rem;
	border-radius: 3px;
}

/* 블로그 카드 호버 시 디테일 섹션 스타일 */
.blog-card:hover .details {
	left: 0%;
}

/* 미디어 쿼리 */
@media ( min-width : 640px) {
	.blog-card {
		flex-direction: row;
		max-width: 700px;
	}
	.blog-card .meta {
		flex-basis: 40%;
		height: auto;
	}
	.blog-card .description {
		flex-basis: 60%;
		position: relative;
	}
	.blog-card .description:before {
		transform: skewX(-3deg);
		content: "";
		background: #fff;
		width: 30px;
		position: absolute;
		left: -10px;
		top: 0;
		bottom: 0;
		z-index: -1;
	}
	.blog-card.alt {
		flex-direction: row-reverse;
	}
	.blog-card.alt .description:before {
		left: inherit;
		right: -10px;
		transform: skew(3deg);
	}
	.blog-card.alt .details {
		padding-left: 25px;
	}
}
</style>
<div class="badge badge-outline">${articlesCount }개</div>
<div class="body3">
	<div class="main_brewery">
		<div class="body2">
			<c:forEach var="brewery2" items="${brewerys2 }">
				<div class="blog-card alt">
					<div class="meta">
						<div class="photo"
							style="background-image: url(https://www.nongsaro.go.kr/cms_contents/1100/202753_MF_BIMG_01.jpg)"></div>
						<ul class="details">
							<li class="author">
								<a href="${brewery2.barWeb}">홈페이지 바로가기</a>
							</li>
							<li class="homepage" ><a href="${brewery2.barWeb}"></a>July. 15, 2015</li>
							<li class="tags">
								<ul>
									<li>
										<a href="#">Learn</a>
									</li>
									<li>
										<a href="#">Code</a>
									</li>
									<li>
										<a href="#">JavaScript</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="description">
						<td style="display: none;">${brewery2.id }</td>
						<h1>${brewery2.barName }</h1>
						<h2>연락처 ${brewery2.barNumber }</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad eum dolorum architecto obcaecati enim dicta
							praesentium, quam nobis! Neque ad aliquam facilis numquam. Veritatis, sit.</p>
						<p class="read-more">
							<a href="#">Read More</a>
						</p>
					</div>
				</div>
			</c:forEach>
					<!-- 동적 페이징  -->
		<div class="pagination2 flex justify-center mt-3">
			<c:set var="paginationLen" value="3" />
			<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
			<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

			<c:set var="baseUri" value="?boardId=${boardId }" />
			<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
			<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

			<c:if test="${startPage > 1 }">
				<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
				<button class="btn btn-sm btn-disabled">...</button>
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
			</c:forEach>

			<c:if test="${endPage < pagesCount }">
				<button class="btn btn-sm btn-disabled">...</button>
				<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
			</c:if>
		</div>
		</div>
	</div>
</div>
</body>
</html>

<%@ include file="../common/foot.jspf"%>