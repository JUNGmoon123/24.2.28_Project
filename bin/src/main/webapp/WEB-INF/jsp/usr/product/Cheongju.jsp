<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>
<section class="content mt-8 text-xl px-4">
	<div>흑맥주</div>
	<div class="container-fluid">
		<div class="row">
			<div class="container_side_bar ">
				<div class="filter-column side_bar">
					<h3 class="title">와인 선택</h3>
					<p class="subtitle">
						By type:
						<select id="myType" onchange="product_init()">
							<option>All</option>
							<option>red</option>
							<option>white</option>
						</select>
					</p>
					<p class="subtitle">
						By Price:
						<span class="bold-text" id="currentPrice"></span>
					</p>
					<input id="myRange" type="range" min="16000" max="100000" value="30000" onchange="product_init()">
					<p class="subtitle">Select</p>
					<div class="checkboxes clearfix">
						<div class="">
							<label for="white-color">
								<input type="checkbox" id="white-color" name="white" checked onchange="product_init()">
								White
							</label>
						</div>
						<div class="">
							<label for="craft-color">
								<input type="checkbox" id="craft-color" name="craft" checked onchange="product_init()">
								Craft
							</label>
						</div>
						<div class="">
							<label for="dark-color">
								<input type="checkbox" id="dark-color" name="dark" checked onchange="product_init()">
								dark
							</label>
						</div>
						<div class="">
							<label for="red-color">
								<input type="checkbox" id="red-color" name="red" checked onchange="product_init()">
								Red
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="product-main col-md-8">
				<div class="product-board" id="product"></div>
			</div>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>