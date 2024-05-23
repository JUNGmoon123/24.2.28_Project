<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>
<!-- Member modify 관련 -->

<style>
/* 페이지 전체를 감싸는 컨테이너 */
.page-container {
	margin-top: 80px; /* 페이지 상단 여백 설정 */
}
.btn-outline {
	padding: 4px 8px; /* 버튼의 내부 여백 조정 */
	font-size: 12px; /* 버튼 텍스트 크기 조정 */
	outline: 1px solid; /* 버튼 outline */
	outline-color: #000; /* 버튼 outline 색상 */
}
/*     사용자내용테이블설정 */
.content-table {

	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6); /* 그림자 효과 추가 */
	margin-bottom: 20px; /* 아래쪽 마진 추가 */
}

/*    댓글 및 사용자내용 테이블 조정 */
.table-box-1 {

	width: 100%; /* 테이블의 전체 너비를 설정 */
	max-width: 800px; /* 원하는 최대 너비로 조정 */
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

<div class="myPage_background">
	<div class="box">
		
	</div>
</div>
<script type="text/javascript">
	let MemberModify__submitFormDone = false;
	function MemberModify__submit(form) {
		if (MemberModify__submitFormDone) {
			return;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length > 0) {
			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
			if (form.loginPwConfirm.value.length == 0) {
				alert('비번 확인 써라');
				form.loginPwConfirm.focus();
				return;
			}
			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('비번 불일치');
				form.loginPw.focus();
				return;
			}
		}
		form.name.value = form.name.value.trim();
		form.nickname.value = form.nickname.value.trim();
		form.cellphoneNum.value = form.cellphoneNum.value.trim();
		form.email.value = form.email.value.trim();

		MemberModify__submitFormDone = true;
		form.submit();
	}
</script>

<section class="mt-8 text-xl px-4 page-container">
	<div class="mx-auto">
		<form action="../member/doModify" method="POST" onsubmit="MemberModify__submit(this); return false;">
			<table class="member-modify-box table-box-1 mx-auto content-table" >
				<tbody>
					<tr>
						<th>가입일</th>
						<td>${rq.loginedMember.regDate }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${rq.loginedMember.loginId }</td>
					</tr>
					<tr>
						<th>새 비밀번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="새 비밀번호를 입력해주세요" name="loginPw" />
						</td>
					</tr>
					<tr>
						<th>새 비밀번호 확인</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="새 비밀번호 확인을 입력해주세요" name="loginPwConfirm" />
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="이름을 입력해주세요" name="name" value="${rq.loginedMember.name }" />
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="닉네임을 입력해주세요" name="nickname" value="${rq.loginedMember.nickname }" />
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="전화번호를 입력해주세요" name="cellphoneNum" value="${rq.loginedMember.cellphoneNum }" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="이메일을 입력해주세요" name="email" value="${rq.loginedMember.email }" />
						</td>
					</tr>

					<tr>
						<th></th>
						<td class="button-container">
							<input class="btn btn-outline btn-info" type="submit" value="수정" />
							<button class="btn btn-outline btn-info" type="button" onclick="history.back();">뒤로가기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>