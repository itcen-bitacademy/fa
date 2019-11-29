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
				<h1 class="pull-left">매입 관리</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
						
							<form class="form-horizontal">
							<div class="span4">
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">매 입 일 자</label>
									<div class="controls">
									<div class="input-append">
										<input class="cl-date-picker1 input-small" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									</div>
							</div>
						
							<div class="control-group">
									<label class="control-label" for="form-field-1">거래처코드</label>
										<div class=" controls">
										<select class="chosen-select span1" id="p_code" name="p_code">
										<option value="10" selected="selected">A123456789</option>
										<option value="25">B123456789</option>
										<option value="50">C123456789</option>
										<option value="100">D123456789</option>
										</select>
										</div>
							</div>
					
							<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 담당자</label>

									<div class="controls">
										<input class="input-small" type="text" id="form-field-1" placeholder="" readonly>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">세금계산서번호</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="">
										
									</div>
									<div class="controls">
									<label class="span3">
											<input name="form-field-radio" type="radio" class="ace">
											<span class="lbl"> 과세</span>
										</label>
										<label class="span3">
											<input name="form-field-radio" type="radio" class="ace">
											<span class="lbl"> 비과세</span>
										</label>
									</div>
							</div>
							</div>
							
							<div class="span4">
							<div class="control-group">
									<label class="control-label" for="form-field-1">매 입 번 호</label>
									<div class="controls">
										<input class="input-mini" type="text" id="form-field-1" placeholder="">
										<span class="btn btn-small">조회</span>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">거 래 처 명</label>
									<div class="controls">
										<input type="text" id="form-field-1" placeholder="" readonly>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">입 고 일 자</label>
									<div class="controls">
									<div class="input-append">
										<input class="cl-date-picker2 input-small" id="id-date-picker-2" type="text" data-date-format="yyyy-mm-dd">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">출 고 일 자</label>
									<div class="controls">
									<div class="input-append">
										<input class="cl-date-picker3 input-small" id="id-date-picker-3" type="text" data-date-format="yyyy-mm-dd">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									</div>
							</div>
							</div>
							
							<div class="span1">
							<div class="hr hr-18 dotted"></div>
								<button class="btn btn-info btn-small" style="float:left;margin-right:20px;margin-bottom:20px;">조회</button>
								<button class="btn btn-danger btn-small" style="float:left;margin-right:20px;margin-bottom:20px;">삭제</button>
								<button class="btn btn-warning btn-small" style="float:left;margin-right:20px;margin-bottom:20px;">수정</button>
								<button class="btn btn-primary btn-small" style="float:left;margin-right:20px;margin-bottom:20px;">입력</button>
								<button class="btn btn-default btn-small" style="float:left;margin-right:20px;margin-bottom:20px;">행추가</button>
								<button class="btn btn-default btn-small" style="float:left;margin-right:20px;margin-bottom:20px;">행삭제</button>				
							</div>
							</form>
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">							
							<thead>
									<tr>
										<th class="center">
											<label>
												<input type="checkbox" class="ace">
												<span class="lbl"></span>
											</label>
										</th>
										<th class="center">순번</th>
										<th class="center">품목코드</th>
										<th class="center">품목명</th>
										<th class="center">수량</th>
										<th class="center">공급가액</th>
										<th class="center">부가세</th>
									</tr>
								</thead>
								<tbody>
								<tr>
								<td class="center">
								<label>
								<input type="checkbox" class="ace">
								<span class="lbl"></span>
								</label>
								</td>
								<td class="center"><input class="input-mini" type="text" id="form-field-4" placeholder=""></td>
								<td class="center">
									<select class="chosen-select span1" id="itemCode" name="itemCode">
									<option value="10" selected="selected">A123456789</option>
									<option value="25">B123456789</option>
									<option value="50">C123456789</option>
									<option value="100">D123456789</option>
									</select>
								</td>
								<td class="center"><input class="input-large" type="text" id="form-field-4" placeholder="" readonly></td>	
								<td class="center"><input class="input-mini" type="text" id="form-field-4" placeholder=""></td>
								<td class="center"><input class="input-medium" type="text" id="form-field-4" placeholder="" readonly></td>
								<td class="center"><input class="input-medium" type="text" id="form-field-4" placeholder="" readonly></td>								
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
			
			$('.cl-date-picker3').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$(".chosen-select").chosen();
		})
	</script>
</body>
</html>