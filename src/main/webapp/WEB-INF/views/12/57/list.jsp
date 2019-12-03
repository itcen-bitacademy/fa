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

<style>
.chosen-search {
	display: none;
}
</style>
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
<div class="page-header position-relative">
				<h1 class="pull-left">월별 거래처 매출 현황</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span10">
							<form class="form-horizontal">
								<div class="span4">
									<div class="control-group">
										<label class="control-label form-field-1">년 월</label>
										<div class="row-fluid input-append span2">
											<input class="date-picker" id="cl-ym-date-picker" type="text" data-date-format="yyyy-mm">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label span2" for="form-field-1">거래처</label>
										<div class="span4">
											<select class="chosen-select" id="zero" name="zero" data-placeholder="선택">
												<option value="1234567890">비트컴퓨터</option>
												<option value="1234567891">비트교육센터</option>
											</select>
										</div>
									</div>
								</div>
								<div class="span2">
									<button class="btn btn-small btn-info">조회</button>
								</div>
			        		</form>
			        	</div>
			        </div>
			        <div class="hr hr-18 dotted"></div>
								
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
																		<thead>
									<tr>
										<th>메출일자</th>
										<th>사업자번호</th>
										<th>상호명</th>
										<th>담당자명</th>
										<th>담당자 이메일</th>
										<th>품목</th>
										<th>수량</th>
										<th>공급가액</th>
										<th>부가세</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>2019.11.25</td>
										<td>1234567890</td>
										<td>비트컴퓨터</td>
										<td>김승곤</td>
										<td>kkk@kkk</td>
										<td>IBM서버</td>
										<td>10</td>
										<td>10000</td>
										<td>1000</td>
									</tr>
									</tbody>
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