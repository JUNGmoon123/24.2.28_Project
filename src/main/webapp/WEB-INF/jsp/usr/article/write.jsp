<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- Article write 관련 -->

<style>
/* 댓글 및 사용자내용 테이블 조정 */
.table-box-1 {
    width: 100%; /* 테이블의 전체 너비를 설정 */
    max-width: 900px; /* 원하는 최대 너비로 조정 */
    margin: 0 auto; /* 테이블을 중앙에 배치 */
    background-color: #ffffff; /* 회색 배경색 추가 */
    border-collapse: collapse; /* 테이블 테두리 겹치도록 설정 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* 그림자 추가 */
}

.table-box-1 th, .table-box-1 td {
    padding: 12px; /* 셀의 내부 여백 조정 */
    text-align: left; /* 텍스트 정렬 */
}

.table-box-1 th {
    background-color: #e2e8f0; /* 헤더 배경색 */
    width: 20%; /* 헤더의 너비 조정 */
}

.table-box-1 td {
    width: 80%; /* 데이터 셀의 너비 조정 */
}

</style>
<div class="myPage_background">
	<div class="box">
		
	</div>
</div>

<script type="text/javascript">
	let ArticleWrite__submitFormDone = false;
	function ArticleWrite__submit(form) {
		if (ArticleWrite__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value == 0) {
			alert('제목을 입력해주세요');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용 써라');
			editor.focus();
			return;
		}
		form.body.value = markdown;
		ArticleWrite__submitFormDone = true;
		form.submit();
	}
</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../article/doWrite" method="POST" onsubmit="ArticleWrite__submit(this); return false;">
			<input type="hidden" name="body">
			<table class="write-box table-box-1" >
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							<div>${rq.loginedMember.nickname }</div>
						</td>
					</tr>
					<tr>
						<th>게시판</th>
						<td>
							<select class="select select-ghost w-full max-w-xs input-bordered" name="boardId">
								<!-- 									<option selected="selected" disabled>게시판을 선택해주세요</option> -->
								<option value="1">자유게시판</option>
								<option value="2">술 리뷰</option>
								<option value="3">와이너리 리뷰</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-editor">
								<script type="text/x-template">
      </script>
							</div>
						</td>
					</tr>


					<tr>
						<th></th>
						<td>
							<button class="btn btn-outline btn-info" type="submit" value="작성">작성</button>
							<button class="btn btn-outline btn-info" class="" type="button" onclick="history.back();">뒤로가기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>