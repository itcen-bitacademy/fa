<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
			});
				
		});
		
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

		$('.cl-date-picker').datepicker({
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	})
</script>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매출거래처 관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span12">
							<form class="form-horizontal" action="">
								<div class="span6">
									<div class="control-group">
										<label class="control-label form-field-1">사업자번호</label>
										<div class="controls">
											<input class="span6" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">대표자</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">주소</label>
										<div class="controls">
											<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
											<input class="span2" type="text" id="form-field-1" readonly>
											<input class="span6" type="text" id="form-field-1" readonly>
											<input class="span9" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">업태</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">개설일자</label>
										<div class="row-fluid input-append span2">
											<input class="cl-date-picker" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">담당자명</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">입금계좌번호</label>
										<div class="controls">
											<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
											<input class="span6" type="text" id="form-field-1">
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<label class="control-label form-field-1">상호</label>
										<div class="controls">
											<input class="span7" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">법인번호</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">전화번호</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">종목</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">관할사무소</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">메일</label>
										<div class="controls">
											<input class="span7" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">예금주</label>
										<div class="controls">
											<input type="text" id="form-field-1" readonly>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">은행</label>
										<div class="controls">
											<input class="span2" type="text" id="form-field-1" readonly>
											<input class="span6" type="text" id="form-field-1" readonly>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper table-responsive" role="grid">
								<div class="hr hr-18 dotted"></div>
								<div class="row-fluid" style="background-color:white">
									<div id="sample-table-2_length" class="dataTables_length">
										<button class="btn btn-info btn-small">조회</button>
										<button class="btn btn-primary btn-small">입력</button>
										<button class="btn btn-warning btn-small">수정</button>
										<button class="btn btn-danger btn-small">삭제</button>
										<button class="btn btn-default btn-small">초기화</button>
									</div>
								</div>
								<div class="hr hr-18 dotted"></div>
								<table id="customer-table" class="table table-striped table-bordered table-hover" aria-describedby="sample-table-2_info">
									<thead>
										<tr role="row">
											<th class="center">
												<label>
													<input type="checkbox" class="ace">
													<span class="lbl"></span>
												</label>
											</th>
											<th>사업자번호</th>
											<th>상호</th>
											<th>대표자</th>
											<th>법인번호</th>
											<th>주소</th>
											<th>전화번호</th>
											<th>업태</th>
											<th>종목</th>
											<th>개설일자</th>
											<th>관할사무소</th>
											<th>거래처담당자성명</th>
											<th>담당자이메일</th>
											<th>계좌번호</th>
											<th>예금주</th>
											<th>은행코드</th>
											<th>은행명</th>
											<th>입력일자</th>
											<th>입력담당자ID</th>
											<th>수정일자</th>
											<th>수정담당자ID</th>
											<th>삭제여부</th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<tr class="odd">
											<td class="center">
												<label>
													<input type="checkbox" class="ace">
													<span class="lbl"></span>
												</label>
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="even">
											<td class="center">
												<label>
													<input type="checkbox" class="ace">
													<span class="lbl"></span>
												</label>
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
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
</body>
</html>