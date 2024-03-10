<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Products"></c:set>
<%@ include file="../common/head.jspf"%>
<section class="content mt-8 text-xl px-4">
	<div>스파클링와인</div>
	<div class="container-fluid">
		<div class="row">
			<div class="container_side_bar">
				<div class="filter-column">
					<h3 class="title">Choose your dream car</h3>
					<p class="subtitle">
						By type: <select id="myType" onchange="init()">
							<option>All</option>
							<option>Sedan</option>
							<option>SUV</option>
							<option>Truck</option>
							<option>Hybrid</option>
						</select>
					</p>
					<p class="subtitle">
						By Price: <span class="bold-text" id="currentPrice"></span>
					</p>
					<input id="myRange" type="range" min="16000" max="50000" value="30000" onchange="init()">
					<p class="subtitle">By color</p>
					<div class="checkboxes clearfix">
						<div class="checkbox">
							<label for="white-color"> <input type="checkbox" id="white-color" name="white" checked onchange="init()">
								White
							</label>
						</div>
						<div class="checkbox">
							<label for="black-color"> <input type="checkbox" id="black-color" name="black" checked onchange="init()">
								Black
							</label>
						</div>
						<div class="checkbox">
							<label for="blue-color"> <input type="checkbox" id="blue-color" name="blue" checked onchange="init()">
								Blue
							</label>
						</div>
						<div class="checkbox">
							<label for="red-color"> <input type="checkbox" id="red-color" name="red" checked onchange="init()">
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