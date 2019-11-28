<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">




			<div class="page-header position-relative">
				<h1 class="pull-left">마감일자관리[19] list</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<%-- 마감일자 입력폼 --%>
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="test-form" action="${pageContext.request.contextPath }/17/19/add" method="post">
						<div class="row-fluid">
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-ym-date-picker" style="text-align:left;width:120px;">년 월:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker" id="cl-ym-date-picker" name="closingYearMonth" type="text" data-date-format="yyyy-mm" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div><!-- /row -->
						<div class="row-fluid">
							<%-- 전체 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-total-date-picker" style="text-align:left;width:120px;">전체 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-total-date-picker" name="closingDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 자산 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-assets-date-picker" style="text-align:left;width:120px;">자산 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-assets-date-picker" name="closingAssetsDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 부채 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-debt-date-picker" style="text-align:left;width:120px;">부채 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-debt-date-picker" name="closingDebtDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 줄바꿈 --%>
						</div>
						<div class="row-fluid">
							<%-- 전표 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-stmt-date-picker" style="text-align:left;width:120px;">전표 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-stmt-date-picker" name="closingStatementDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 매입 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-purchase-date-picker" style="text-align:left;width:120px;">매입 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-purchase-date-picker" name="closingPurchaseDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 매출 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-sales-date-picker" style="text-align:left;width:120px;">매출 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-sales-date-picker" name="closingSalesDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
							<%-- 줄바꿈 --%>
						<div class="row-fluid">
							<%-- 결산마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-settlement-date-picker" style="text-align:left;width:120px;">결산 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-settlement-date-picker" name="closingSettlementDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 입력수정삭제버튼 --%>
							<div class="span8">
								<button class="btn btn-info btn-small" style="float:right;margin-right:20px;">조회</button>
								<button class="btn btn-danger btn-small" style="float:right;margin-right:20px;">삭제</button>
								<button class="btn btn-warning btn-small" style="float:right;margin-right:20px;">수정</button>
								<button class="btn btn-primary btn-small" style="float:right;margin-right:20px;" id="submit-btn">입력</button>
							</div>
						</div>
					</form>

					<%-- 구분선 --%>
					<div class="hr hr-18 dotted"></div>

					<%-- 마감일 조회 테이블 --%>
					<div class="row-fluid">
						<div class="span12">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>년 월</th>
										<th>전체마감일</th>
										<th>전표마감일</th>
										<th>자산마감일</th>
										<th>부채마감일</th>
										<th>매입마감일</th>
										<th>매출마감일</th>
										<th>결산마감일</th>
										<%-- <th>결산여부</th>
										<th>결산일</th>
										<th>작업자</th>
										<th>결산</th> --%>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2019-12</td>
										<td>2020-01-03</td>
										<td>2020-01-02</td>
										<td>2019-12-30</td>
										<td>2019-12-31</td>
										<td>2019-12-30</td>
										<td>2019-12-31</td>
										<td>2020-01-03</td>
										<%-- <td>미결산</td>
										<td>-</td>
										<td>-</td>
										<td> --%>
											<%-- <button class="btn btn-info btn-small">결산</button>
										</td> --%>
									</tr>
									<tr>
										<td>2019-11</td>
										<td>2019-12-03</td>
										<td>2019-12-02</td>
										<td>2019-11-29</td>
										<td>2019-11-30</td>
										<td>2019-11-29</td>
										<td>2019-11-30</td>
										<td>2019-12-03</td>
										<%-- <td>완료</td>
										<td>2019-12-03</td>
										<td>최웅</td>
										<td></td> --%>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->

					<%-- 페이징 --%>
					<div class="pagination">
						<ul>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
						</ul>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script>
	$(function() {
		// 데이트피커 한글설정
		$.fn.datepicker.dates['ko'] = {
		days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		daysShort: ["일", "월", "화", "수", "목", "금", "토"],
		daysMin: ["일", "월", "화", "수", "목", "금", "토"],
		months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		today: "Today",
		clear: "Clear",
		format: "yyyy-mm-dd",
		titleFormat: "yyyy MM", /* Leverages same syntax as 'format' */
		weekStart: 0
		};

		// 년월 설정 데이트피커
		$('#cl-ym-date-picker').datepicker({
			maxViewMode: 4,
			minViewMode: 1,
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});

		// 년월일 설정 데이트피커
		$('.cl-date-picker').datepicker({
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});


		// 버튼 prevent default 설정
		$('button').on('click', disableFormSubmit)

		// 입력버튼 이벤트 연결
		$('#submit-btn').on('click', saveClosingDate)
	})

	// 버튼 prevent default 설정
	function disableFormSubmit(event) {
		event.preventDefault();
	}

	// 마감일 신규 등록
	function saveClosingDate(event) {
		console.log(getClosingDates());
	}

	function getClosingDates() {
		var closingDates;

		closingDates = {
			no: $('#cl-no').val(),
			closingYearMonth: $('#cl-ym-date-picker').val(),
			closingDates: $('#cl-total-date-picker').val(),
			closingStatementDate: $('#cl-stmt-date-picker').val(),
			closingPurchaseDate: $('#cl-purchase-date-picker').val(),
			closingSalesDate: $('#cl-sales-date-picker').val(),
			closingAssetsDate: $('#cl-assets-date-picker').val(),
			closingDebtDate: $('#cl-debt-date-picker').val(),
			closingSettlementDate: $('#cl-settlement-date-picker').val()
		}

		var form = $('#test-form')[0]
		form.submit()

		return closingDates
	}
</script>
</body>
</html>
