<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<div class="background-box4">
	<div class="box">
		<ul>
			<li>3background 속성은 애니메이션 속성을 설정합니다.</li>
		</ul>
	</div>
</div>
<section class="mt-8 text-xl px-4">
	<div class="login_main">
		<form action="../member/doLogin" method="POST">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
			<table class="login_table login-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="아이디를 입력해주세요" name="loginId" />
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="비밀번호를 입력해주세요" name="loginPw" />
						</td>
					</tr>
					<tr>
						<th>E-mail</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="E-mail을 입력해주세요" name="" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info w-full max-w-xs" type="submit" value="로그인" />
						</td>
					</tr>
				</tbody>
			</table>
			<div class="login_back btns flex justify-center mt-4">
				<button class="btn btn-outline" style="color: black" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</form>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>