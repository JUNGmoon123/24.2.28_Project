<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="myPage_background">
	<div class="box">
		<ul>
			<li>3background 속성은 애니메이션 속성을 설정합니다.</li>
		</ul>
	</div>
</div>
<div>1${loginedMember }</div>
<div>2${rq.loginedMember }</div>
<div>${loginedMember.loginId }</div>
<div>${rq.loginedMember.loginId }</div>
<div>${rq.loginedMember.getLoginId() }</div>
<section class="myPage_main mt-8 text-xl px-4 ">
	<div class="myPage_bar mx-auto">
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
					<th><a href="#">내가 구입한 목록</a></th>
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
	<div class="myPage_btn ">
		<button class="btn-text-link btn btn-active " type="button" onclick="history.back();">뒤로가기</button>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>