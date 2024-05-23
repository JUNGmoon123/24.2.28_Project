<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.main_color {
    background-color: #f2f2f2; /* 원하는 배경색으로 설정 */
}


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

/* 검색창옵션 */
.search_box {
	/* 	border: 2px solid green; */
	width: 1000px; /* 너비 조정 (예시로 300px로 설정) */
	position: absolute; /* 절대 위치로 설정 */
	top: 35%; /* 원하는 위치로 조정 */
	right: 0; /* 오른쪽 정렬 */
	left: 60%;
	margin-top: 10px; /* 필요에 따라 여백 조정 */
	margin-right: 20px; /* 필요에 따라 오른쪽 여백 조정 */
}

.search_box_1 {
	margin-right: 0; /* 추가 스타일 조정 */
}

.search_option {
	max-width: 10rem;
}
	
/* 	목록리스트 스타일설정 */
   .table-box-1 {
        width: 100%; /* 테이블의 전체 너비를 설정 */
        max-width: 1200px; /* 원하는 최대 너비로 조정 */
        margin: 0 auto; /* 테이블을 중앙에 배치 */
    }

    .table-box-1 th, .table-box-1 td {
        padding: 8px; /* 셀의 내부 여백 조정 */
        text-align: center; /* 텍스트 정렬 */
    }

    .table-box-1 th {
        background-color: #e2e8f0; /* 헤더 배경색 */
    }

</style>

<div class="list_top_bar flex ">
	<div>
		<a href="../article/list?boardId=1&page=1">자유게시판</a>
	</div>
	<div>
		<a href="../article/list?boardId=2&page=1">술 리뷰</a>
	</div>
	<div>
		<a href="../article/list?boardId=3&page=1">와이너리 리뷰</a>
	</div>
</div>

<section class="mt-8 text-xl px-4 main_color">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="flex-grow"></div>
			<form action="" class="search_box">
				<div class="search_box_1">
					<input type="hidden" name="boardId" value="${param.boardId }" />
					<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm max-w-xs"
						name="searchKeywordTypeCode">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목+내용</option>
					</select>
					<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
						class="input-sm input input-bordered w-48 max-w-xs" />
					<button class="btn btn-ghost btn-sm" type="submit">검색</button>
				</div>
			</form>
		</div>
	</div>

	<c:if test="${rq.isLogined() }">
		<div style="padding-left: 1000px; padding-right: 50px; margin-bottom: 10px; text-align: center;">
			<a class="hover:underline "  href="../article/write">글 작성하기</a>
		</div>
	</c:if>
	<table class="table-box-1 table">
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

</section>



<%@ include file="../common/foot.jspf"%>