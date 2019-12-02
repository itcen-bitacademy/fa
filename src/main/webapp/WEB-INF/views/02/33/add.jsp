<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="/fa/ace/assets/js/ace-elements.min.js"></script>
<script src="/fa/ace/assets/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<script type="text/javascript">
	$(function(){
		$(".chosen-select").chosen(); 
	});
	
	$(function($) {
		$("#delete").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
		});
		
		$("#update").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update");
		});
		
		$("#add").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add");
		});
	});
	
	
</script>

</head>
<body class="skin-3" style="min-width:1500px">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매입품목관리</h1>
			</div><!-- /.page-header -->
			
			<!-- PAGE CONTENT BEGINS -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
						<div style="height:330px">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="form-field-item-id">품목코드</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-item-id" name="no" placeholder="품목코드"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-section-name">품목 대분류명</label>
									<div class="controls">
										<div class="row-fluid input-append">
											<input class="span5" id="form-field-section-name" name="section_name" type="text" readonly/>
											<span class="add-on">
												<a href="#" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-name">생산공장명</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-factory-name" name="factory_name" placeholder="생산공장명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-address">생산공장 주소</label>
									<div class="controls">
										<div class="row-fluid input-append" style="margin:0 0 5px 0">
											<input class="span6" id="form-field-factory-address" name="factory-address1" type="text" readonly/>
											<span class="add-on">
												<a href="#" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
										</div>
										
										<input class="span6" type="text" id="form-field-factory-address" name="factory_address2" placeholder="상세 주소"/>
									</div>
									
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-standard">규격</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-standard" name="standard" placeholder="ex) 20 x 35 cm"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-price">단가</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-price" name="price"/>&nbsp;원
									</div>
								</div>
							</div>
							
							
							
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="form-field-item-name">품목명</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-item-name" name="name" placeholder="품목명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-section-code">품목 대분류코드</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-section-code" name="section_code" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-manager">생산담당자</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-factory-manager" name="manager_name" placeholder="생산담당자"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-date">생산 일자</label>
									<div class="controls">
										<div class="control-group">
											<div class="row-fluid input-append">
												<input class="span3 cl-date-picker" id="id-date-picker-1" type="text" name="produce_date" data-date-format="yyyy-mm-dd" style="margin:0 0 16px 0">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-purpose">사용용도</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-purpose" name="purpose" style="margin:0 0 20px 0"/>
									</div>
								</div>
								<br>
								<br>
							</div>
							<div style="height:0; clear:both">&nbsp;</div>
						</div>
						
						<div class="hr hr-18 dotted"></div>
						
						<div>
							<button class="btn btn-info btn-small" type="submit" id="search">조회</button>
							<button class="btn btn-danger btn-small" type="submit" id="delete">삭제</button>
							<button class="btn btn-warning btn-small" type="submit" id="update">수정</button>
							<button class="btn btn-primary btn-small" type="submit" id="add">입력</button>
							<button class="btn btn-default btn-small" type="reset">초기화</button>
						</div>
											
						<div class="hr hr-18 dotted"></div>
					</form>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>품목코드</th>
									<th>품목명</th>
									<th>대분류코드</th>
									<th>대분류명</th>
									<th>규격</th>
									<th>단가</th>
									<th>담당자</th>
									<th>일자</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>
										<a href="#">1911180001</a>
									</td>
									<td>모니터</td>
									<td class="hidden-480">001</td>
									<td class="hidden-phone">사무용/컴퓨터장비</td>
									<td>
										30 x 25 cm
									</td>
									<td>
										7,000
									</td>
									<td>
										OOO
									</td>
									<td>
										2019.11.18
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- /span -->
					
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
				<!-- PAGE CONTENT ENDS -->
			</div>
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
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
		})
</script>

</body>
</html>