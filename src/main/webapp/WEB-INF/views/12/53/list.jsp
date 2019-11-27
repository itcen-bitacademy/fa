<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
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
					<h1 class="pull-left">매출세금계산서</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<!-- head  -->
					<div class="span12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row-fluid">
							
								<div class="form-horizontal">
									<div class="span6">
										<label class="control-label" for="form-field-1">매 출 일
											자</label>
										<div class="row-fluid input-append span2">
												<input class="cl-date-picker" id="cl-total-date-picker" 
												type="text" data-date-format="yyyy-mm-dd"> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
									</div>

									<div class="span6">
										<label class="control-label" for="form-field-1">매 출 번
											호 </label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
											<button class="btn btn-small btn-info">조회</button>
										</div>
									</div>
								</div>
							
						</div>
						<!-- Line -->
						<div class="hr hr-18 dotted"></div>
					</div>
					<!-- head end  -->
					
					<!-- middle  -->
					<div class="row-fluid">
					
						<div class="span12">
							
								<div class="form-horizontal">
								<div class="control-group">
									<div class="span6">
										<label class="control-label span2" for="form-field-1">거래처코드</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1"> <input
												class="span5" type="text" id="form-field-1">
										</div>
									</div>
		
									<div class="span6">
										<label class="control-label span6" for="form-field-1">대표자</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
										</div>
									</div>
								</div>
								</div>
								<div class="form-horizontal">
									<div class="control-group">
									<div class="span6">
										<label class="control-label span2" for="form-field-1">주소</label>
										<div class="controls">
											<span class="btn btn-small btn-info"><i
												class="icon-search nav-search-icon"></i></span> <input
												class="span5" type="text" id="form-field-1"> <input
												class="span5" type="text" id="form-field-1">
										</div>
									</div>

									<div class="span6">
										<div class="span5">
											<label class="control-label span1" for="form-field-1">담당자</label>
											<div class="controls">
												<input class="span12" type="text" id="form-field-1">
											</div>
										</div>


										<div class="span7">
											<label class="control-label span1" for="form-field-1">메일</label>
											<div class="controls">
												<input class="span12" type="text" id="form-field-1">
											</div>
										</div>
									</div>
									</div>
								</div>

								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">수량합계</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span6" for="form-field-1">공급가액합계</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
									</div>
								</div>

								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">세금계산서번호</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span6" for="form-field-1">부가세합계</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">세금계산서발행일</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1" data-date-format="yyyy-mm-dd">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span2" for="form-field-1">영세</label>
												<div class="span4">
														<select class="chosen-select" id="zero" name="zero" data-placeholder="영세/비영세">
															<option value="yes">yes</option>
															<option value="no">no</option>
														</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label" for="form-field-1">입금계좌번호</label>
											<div class="controls">
											<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
											<input class="span9" type="text" id="form-field-1">
										</div>
											
										</div>
	
										<div class="span6">
												<label class="control-label" for="form-field-1">출고일자</label>
												<div class="controls">
													<input class="span5" type="text" id="form-field-1">
												</div>
										</div>
									</div>
								</div>
								
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span6">
													<label class="control-label form-field-1">예금주</label>
													<div class="controls">
													<input type="text" id="form-field-1" readonly="">
													</div>
											</div>
												
											
		
											<div class="span6">
													<label class="control-label form-field-1">은행</label>
													<div class="controls">
														<input class="span2" type="text" id="form-field-1" readonly="">
														<input class="span6" type="text" id="form-field-1" readonly="">
													</div>
											</div>
										</div>
									</div>
								<!-- PAGE CONTENT ENDS -->
								<!-- /.span -->
							
							<!-- /.row-fluid -->
						</div>
					</div>
						<div class="hr hr-18 dotted"></div>
					<div class="span6">
						<div id="sample-table-2_length" class="dataTables_length">
									<button class="btn btn-info btn-small">발행</button>
									<button class="btn btn-default btn-small">발행취소</button>
									<button class="btn btn-warning btn-small">발행수정</button>
						</div>
					</div>
					<!-- /.page-content -->
				
				<div class="row-fluid">
				<div class="span12">
					<div class="hr hr-18 dotted"></div>
					<!-- PAGE CONTENT BEGINS -->
					
					<div class="row-fluid">
						<div class="span12">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>순 번</th>
										<th>품목코드</th>
										<th>품 목 명</th>
										<th>수량</th>
										<th>공급가액</th>
										<th>부가세</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>20134597</td>
										<td>64G메모리</td>
										<td>10</td>
										<td>35000</td>
										<td>3500</td>
									</tr>
									<tr>
										<td>2</td>
										<td>00154597</td>
										<td>메인보드</td>
										<td>1</td>
										<td>85000</td>
										<td>8500</td>
									</tr>
								</tbody>
							</table>
						</div><!-- /span -->
					</div><!-- /row -->
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
					<!-- PAGE CONTENT ENDS --><!-- /.span -->
				</div>
			</div>
				</div>
				<!-- /.main-content -->
			</div>
		</div>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<!-- basic scripts -->
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
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
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$(".chosen-select").chosen();
		})
	</script>
</body>
</html>