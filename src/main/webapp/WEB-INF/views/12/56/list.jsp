<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
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
	
	$(".chosen-select").chosen();
})
</script>
</head>
<body class="skin-3">

	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">품목 대분류별 매입매출 현황</h1>
					<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div><!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
							
							<div class="control-group">
								
									<div class="row-fluid">
										<div class="span3">
											<form class="form-horizontal">
												<div class="control-group">
													<label class="control-label" for="cl-ym-date-picker" style="text-align:left;width:120px;"> 년 월</label>
													<div class="controls" style="margin-left:120px;">
														<div class="row-fluid input-append">
															<input class="span11 date-picker" id="cl-ym-date-picker" name="closingYearMonth" type="text" data-date-format="yyyy-mm" />
															<span class="add-on">
																<i class="icon-calendar"></i>
															</span>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="span4">
											<form class="form-horizontal">
												<div class="control-group">
													<label class="control-label" for="form-field-select-2" style="text-align:left;width:120px;">대분류 코드</label>
													<div class="controls" style="margin-left:120px;">
														<select class="chosen-select" id="form-field-select-2" name="client_code" data-placeholder="대분류코드 선택">
															<option value="1">대분류코드11111</option>
															<option value="2">대분류코드22222</option>
														</select>														
													</div>
												</div>
											</form>
										</div>
										<div class="span4">
											<form class="form-horizontal">
												<div class="control-group">
													<label class="control-label" for="form-field-select-2" style="text-align:left;width:120px;">품목코드</label>
													<div class="controls" style="margin-left:120px;">
														<select class="chosen-select" id="form-field-select-2" name="client_code" data-placeholder="품목코드 선택">
															<option value="1">품목코드11111</option>
															<option value="2">품목코드22222</option>
														</select>														
														
													</div>
												</div>
											</form>
										</div>
										<div class="span1">
										<button class="btn btn-small btn-info">조회</button>
										
										</div>
									</div>
								
								<div class="hr hr-18 dotted"></div>
								
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
									<thead>
									<tr>
										<th>대분류코드</th>
										<th>대분류명</th>
										<th>품목코드</th>
										<th>품목명</th>
										<th>입고수량</th>
										<th>입고공급가액</th>
										<th>입고부가세</th>
										<th>입고금액</th>
										<th>출고수량</th>
										<th>출고공급가액</th>
										<th>출고부가세</th>
										<th>출고금액</th>
										<th>재고수량</th>
										<th>재고금액</th>
										<th>재고부가세</th>
									</tr>
									</thead>
									<c:forEach items='${list }' var='vo' varStatus='status'>
									<tr>
										<td>${vo.sectioncode }</td>
										<td>${vo.sectionname }</td>
										<td>${vo.itemcode }</td>
										<td>${vo.itemname }</td>
										<td>${vo.purchasemanagementquantity }</td>
										<td>${vo.purchasemanagementsupplyvalue }</td>
										<td>${vo.purchasemanagementtaxvalue }</td>
										<td>${vo.purchasemanagementtotalprice }</td>
										<td>${vo.salesquantity }</td>
										<td>${vo.salessupplyvalue }</td>
										<td>${vo.salestaxvalue }</td>
										<td>${vo.salestotalprice }</td>
										<td>${vo.stockquantity }</td>
										<td>${vo.stocktotalprice }</td>
										<td>${vo.stocktaxvalue }</td>
									</tr>
									</c:forEach>
								</table>
								
								</div>
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
						
						</div>
					</div>
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>