<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
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
				<h1 class="pull-left">매입현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<form class="form-horizontal">
							<div class="span6">
							<div class="control-group">
									<label class="control-label" for="form-field-1">매 입 번 호</label>
									<div class="controls">
										<input class="input-small" type="text" id="form-field-1" placeholder="">										
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">거 래 처 번 호</label>
									<div class="controls">
										<input class="input-small" type="text" id="form-field-1" placeholder="">
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">품 목 번 호</label>
									<div class="controls">
										<input class="input-small" type="text" id="form-field-1" placeholder="">										
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">삭제여부</label>
									<div class="controls">
										<select class="chosen-select" id="zero" name="zero">
										<option value="10" selected="selected">Y</option>
										<option value="25">N</option>
										</select>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">정렬기준</label>
									<div class="controls">
										<select class="chosen-select" id="zero" name="zero">
										<option value="10" selected="selected">매입일자순</option>
										<option value="25">품목코드순</option>
										</select>
										<span class="btn btn-small">
													조회
										</span>
									</div>
							</div>
							</div>
							
							<div class="span6">
							<div class="control-group">
									<label class="control-label" for="form-field-1">기간</label>
									<div class="controls">
										<input class="cl-date-picker1" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>										
									<span>
										~
									</span>
									<input class="cl-date-picker2" id="id-date-picker-2" type="text" data-date-format="yyyy-mm-dd">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
										</div>
									
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">거 래 처 명</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="">
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">품 목 명</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="">
									</div>
							</div>
							
							</div>
							
							</form>
							<div class="hr"></div>
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<thead>
									<tr>
										<th class="center">매입일자</th>
										<th class="center">매입번호</th>
										<th class="center">매입순번</th>
										<th class="center">거래처코드</th>
										<th class="center">거래처명</th>
										<th class="center">담당자</th>
										<th class="center">품목코드</th>
										<th class="center">품목명</th>
										<th class="center">입고일자</th>
										<th class="center">출고일자</th>
										<th class="center">수량</th>
										<th class="center">공급가액</th>
										<th class="center">부가세</th>
										<th class="center">세금계산서번호</th>
										
									</tr>
								</thead>
								<tbody>
								<tr>
								<td class="center">20191127</td>
								<td class="center">0001</td>
								<td class="center">0001</td>
								<td class="center">A123456789</td>
								<td class="center">GS 리테일</td>
								<td class="center">이제구</td>
								<td class="center">Q123456789</td>
								<td class="center">생수</td>
								<td class="center">20191127</td>
								<td class="center">20191126</td>
								<td class="center">10</td>
								<td class="center">1000</td>
								<td class="center">100</td>
								<td class="center">123456789</td>
								</tr>
								</tbody>
							</table>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
					
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
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
			format: "yyyy-mm-dd",
			titleFormat: "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart: 0
			};
	
			$('#cl-ym-date-picker').datepicker({
				maxViewMode: 4,
				minViewMode: 1,
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
	
			$('.cl-date-picker1').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$('.cl-date-picker2').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$(".chosen-select").chosen();
		})
	</script>
</body>
</html>