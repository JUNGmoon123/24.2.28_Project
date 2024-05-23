<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>

<style>
/* myPage 메뉴, 바 */

.myPage_main {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh; /* 화면 전체 높이의 80%로 설정 */
	width: 100%; /* 화면 전체 너비로 설정 */
	margin: 50px auto; /* 상하 50px, 좌우 자동으로 설정하여 가운데 정렬 */
}

.myPage_bar {
	background-color: #808080;
	background-color: rgb(255, 255, 255, 0.8);
	width: 100%; /* 너비를 70%로 설정 */
	max-width: 700px; /* 최대 너비를 500px로 설정 */
	padding: 30px; /* 내부 여백 설정 */
	border-radius: 10px; /* 테두리를 둥글게 설정 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

.myPage_bar table {
	width: 100%; /*테이블 너비를 부모 요소에 맞게 설정 */
	border-collapse: collapse; /* 테이블의 셀 테두리를 합칩니다. */
}

.myPage_bar th, .myPage_bar td {
	border: 1px solid black; /* 테두리를 검은색으로 설정합니다. */
	padding: 8px; /* 셀의 내부 여백을 추가합니다. */
}

.myPage_btn {
	margin-top: 20px; /* 버튼 위 여백 추가 */
	text-align: center; /* 버튼 가운데 정렬 */
}

.myPage_btn button {
	margin-top: 10px; /* 버튼 간 여백 추가 */
}
/*    댓글 및 사용자내용 테이블 조정 */
.table-box-1 {
	width: 100%; /* 테이블의 전체 너비를 설정 */
	max-width: 800px; /* 원하는 최대 너비로 조정 */
	margin: 0 auto; /* 테이블을 중앙에 배치 */
}

.table-box-1 th, .table-box-1 td {
	padding: 8px; /*셀의 내부 여백 조정 */
	text-align: center; /* 텍스트 정렬 */
}

.table-box-1 th {
	background-color: #e2e8f0; /* 헤더 배경색 */
}
</style>

<div class="myPage_background">
	<div class="box">
		
	</div>
</div>

<section class="myPage_main mt-8 text-xl px-4 ">
	<div class="mx-auto">
		<div class="myPage_bar">
			<table class="table-box-1" border="1">
				<tbody>
					<tr>
						<th><a href="../member/checkPw" >내 정보 수정하기</a></th>
					</tr>
					<tr>
						<th><a href="#">내가 찜한 목록</a></th>
					</tr>
					<tr>
						<th><a href="#">1 : 1 문의 상황</a></th>
					</tr>
					<tr>
						<th><a href="#">내가 쓴 댓글</a></th>
					</tr>
					<tr>
						<th><a href="#">내가 쓴 게시글</a></th>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="myPage_btn mx-auto">
			<button class="btn-text-link btn btn-active " type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>


<%@ include file="../common/foot.jspf"%>