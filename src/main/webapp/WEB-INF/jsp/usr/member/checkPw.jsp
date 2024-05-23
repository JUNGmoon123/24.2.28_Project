<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPw"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.login_table {
	width: 24%;
	margin: 0 auto;
	border-collapse: collapse;
	 justify-content: center; /* 가운데 정렬을 위해 flexbox를 사용하고 justify-content 속성을 center로 설정 */
}

.login_table th, .login_table td {
	padding: 10px;
}

.button-container {
	display: flex;
	 justify-content: center; /* 가운데 정렬을 위해 flexbox를 사용하고 justify-content 속성을 center로 설정 */
	gap: 10px; /* 버튼 사이 간격을 조절 */
}

.btn-outline {
	padding: 8px 16px;
	font-size: 14px;
	border: 1px solid;
	border-radius: 4px;
	color: black; /* 텍스트 색상을 검은색으로 설정 */
}

.btn-info {
	color: white;
}

.btn-info:hover {
	background-color: #f8f9fa;
}

.btn-outline:hover {
	background-color: #f8f9fa;
	color: black; /* 마우스를 올렸을 때 텍스트 색상을 검은색으로 유지 */
}

</style>

<div class="background-box4">
	<div class="box"></div>
</div>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../member/doCheckPw" method="POST">
			<table class="login_table table-box-1" >
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${rq.loginedMember.loginId }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="비밀번호를 입력해주세요" name="loginPw" />
						</td>
					</tr>
					<tr>
						 <th></th>
                        <td class="button-container">
                            <input class="btn btn-outline btn-info" type="submit" value="확인" />
                            <button class="btn btn-outline btn-info" type="button" onclick="history.back();">뒤로가기</button>
                        </td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>