<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<style>
.chosen-search {
	display: none;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script>
		$(function() {
			$.fn.datepicker.dates['ko'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			today: "Today",
			clear: "Clear",
			format: "yyyy-mm",
			titleFormat: "yyyy", /* Leverages same syntax as 'format' */
			weekStart: 0
			};
	
			$('#cl-ym-date-picker').datepicker({
				maxViewMode: 4,
				minViewMode: 1,
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
		})
	</script>



<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">



				<div class="page-header position-relative">
					<h1 class="pull-left">계정 명세서 조회</h1>
				</div>


				<div class="row-fluid">
					<form class="form-horizontal">
						입력 기간
						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" class="cl-date-picker" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>


						계정과목코드 : <input type="text" id="form-field-1" placeholder="계정과목코드" />



						<button class="btn btn-small btn-info">조회</button>


					</form>
					<div class="hr hr-18 dotted"></div>
				</div>



				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>날짜</th>
									<th>거래처 코드</th>
									<th>거래처명</th>
									<th>계정과목코드</th>
									<th>계정과목</th>
									<th>적요</th>
									<th>차변</th>
									<th>대변</th>
									<th>잔액</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>[전월이월]</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>-25,000,000</td>
									<td></td>
									<td>-25,000,000</td>

								</tr>

								<tr>
									<td>2019-12-22</td>
									<td>123-56-789</td>
									<td>아이티센</td>
									<td>1234567</td>
									<td>상품매출</td>
									<td>인건비</td>
									<td>-300,000</td>
									<td></td>
									<td>-25,300,000</td>

								</tr>

								<tr>
									<td>2019-12-22</td>
									<td>123-56-888</td>
									<td>비트컴퓨터</td>
									<td>1234567</td>
									<td>상품매출</td>
									<td>인건비</td>
									<td>-500,000</td>
									<td></td>
									<td>-25,800,000</td>

								</tr>

								<tr>
									<td>[합계]</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>-800,000</td>
									<td></td>
									<td></td>
								</tr>

								<tr>
									<td>[누계]</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>-25,800,000</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>

				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#"><i
								class="icon-double-angle-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
					</ul>
				</div>



			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>