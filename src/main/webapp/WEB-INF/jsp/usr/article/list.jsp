<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>

<style>
/* list쪽 설정 */
.list_top_bar {
	width: 40%;
	height: 40px;
	margin-top: 50px;
	margin-left: 100px;
	/* 	border: 2px solid green; */
}

.list_top_bar>div {
	margin-top: 5px;
	margin-bottom: 5px;
	flex: 1; /* 동일한 너비의 영역을 가지도록 설정 */
	text-align: center;
	border: none; /* 테두리 제거 */
	position: relative; /* 상대적 위치 설정 */
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

.list_top_bar>div::after {
	content: '';
	position: absolute;
	left: 27%;
	bottom: -2px; /* 텍스트 아래로 조정 */
	width: 50%;
	height: 2px; /* 밑줄의 높이 */
	background-color: black; /* 밑줄 색상 */
	opacity: 0; /* 초기에는 밑줄을 숨깁니다. */
	transition: opacity 0.3s; /* 밑줄 나타내는 애니메이션을 추가합니다. */
}

.list_top_bar>div:hover::after {
	white-space: nowrap;
	opacity: 1; /* 마우스 호버 시 밑줄을 나타냅니다. */
	visibility: visible;
	transition: opacity 0.5s, visibility 0.5s;
}

</style>

<div class="list_top_bar flex ">
	<div><a href="../article/list?boardId=1&page=1">자유게시판</a></div>
	<div><a href="../article/list?boardId=2&page=1">술 리뷰</a></div>
	<div><a href="../article/list?boardId=3&page=1">와이너리 리뷰</a></div>
</div>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="badge badge-outline">${articlesCount }개</div>
			<div class="flex-grow"></div>
			<form action="">
				<input type="hidden" name="boardId" value="${param.boardId }" />
				<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
					name="searchKeywordTypeCode">
					<option value="title">title</option>
					<option value="body">body</option>
					<option value="title,body">title+body</option>
				</select>
				<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
					class="input-sm input input-bordered w-48 max-w-xs" />
				<button class="btn btn-ghost btn-sm" type="submit">검색</button>
			</form>
		</div>
	</div>
	<table class="table-box-1 table" border="1">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 20%" />
			<col style="width: 60%" />
			<col style="width: 10%" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>싫어요</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="article" items="${articles }">
				<tr class="hover">

					<td>${article.id }</td>
					<td>${article.regDate.substring(0,10) }</td>
					<td>
						<a href="detail?id=${article.id }">${article.title }
							<c:if test="${article.extra__repliesCnt > 0 }">
								<span style="color: red;">[${article.extra__repliesCnt }]</span>
							</c:if>
						</a>
					</td>
					<td>${article.extra__writer }</td>
					<td>${article.hitCount }</td>
					<td>${article.goodReactionPoint }</td>
					<td>${article.badReactionPoint }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 	동적 페이징 -->
	<div class="pagination flex justify-center mt-3">
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

	<!-- 	원래 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">
			<c:forEach begin="1" end="${pagesCount }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?page=${i }&boardId=${param.boardId}">${i }</a>
			</c:forEach>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>