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

<script type="text/javascript">
	jQuery(function($) {
		$("#id-date-picker-1").datepicker({
			showOtherMonths : true,
			selectOtherMonths : false,
		});
	});
	
	$(function(){
		$(".chosen-select").chosen(); 
	});
</script>

</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매입품목관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
						
						<div class="span4">
							<div class="control-group">
								<label class="control-label" for="form-field-item-id">품목코드</label>
								<div class="controls">
									<input class="span5" type="text" id="form-field-item-id" name="item-id" placeholder="품목코드"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-section-name">품목 대분류명</label>
								<div class="controls">
									<input class="span7" type="text" id="form-field-section-name" name="section-name" readonly="true"/>
									<a href="#"><i class="icon-search icon-on-right bigger-110"></i></a>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-factory-name">생산공장명</label>
								<div class="controls">
									<input class="span8" type="text" id="form-field-factory-name" name="factory-name" placeholder="생산공장명"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-factory-address">생산공장 주소</label>
								<div class="controls">
									<input class="span10" type="text" id="form-field-factory-address" name="factory-address" style="margin:0 0 5px 0" readonly="true"/>
									<a href="#"><i class="icon-search icon-on-right bigger-110"></i></a>
									<input class="span10" type="text" id="form-field-factory-address" name="factory-address" placeholder="상세 주소"/>
								</div>
								
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-standard">규격</label>
								<div class="controls">
									<input type="text" id="form-field-standard" name="factory-standard" placeholder="ex) 20 x 35 cm"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-price">단가</label>
								<div class="controls">
									<input class="span4" type="text" id="form-field-price" name="factory-price"/>&nbsp;원
								</div>
							</div>
						</div>
						
						<div class="span8">
							<div class="control-group">
								<label class="control-label" for="form-field-item-name">품목명</label>
								<div class="controls">
									<input type="text" id="form-field-item-name" name="item-name" placeholder="품목명"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-section-code">품목 대분류코드</label>
								<div class="controls">
									<input class="span2" type="text" id="form-field-section-code" name="section-code" readonly="true"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-factory-manager">생산담당자</label>
								<div class="controls">
									<input class="span2" type="text" id="form-field-factory-manager" name="factory-manager" placeholder="생산담당자"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-date">생산 일자</label>
								<div class="controls">
									<div class="control-group">
										<div class="row-fluid input-append">
											<input class="span2 date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" style="margin:0 0 16px 0">
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
									<input type="text" id="form-field-purpose" name="field-purpose" style="margin:0 0 20px 0"/>
								</div>
							</div>
							<br>
							<br>
						</div>
						<div>
							<button class="btn" type="submit">입력</button>
							&nbsp;
							<button class="btn" type="submit">수정</button>
							&nbsp;
							<button class="btn" type="submit">삭제</button>
							&nbsp;
							<button class="btn" type="submit">조회</button>
							&nbsp;
						</div>
					</form>
					
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
					</div>
					
					<!-- PAGE CONTENT ENDS -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<div class="datepicker datepicker-dropdown dropdown-menu" style="display: block; top: 2059.95px; left: 24px;">
	<div class="datepicker-days" style="display: block;">
		<table class=" table-condensed">
			<thead>
			<tr>
				<th class="prev" style="visibility: visible;">
				<i class="icon-arrow-left"></i>
				</th>
				
				<th colspan="5" class="switch">May 2019</th>
				<th class="next" style="visibility: visible;">
				<i class="icon-arrow-right"></i>
				</th>
			</tr>
			
			<tr>
				<th class="dow">Su</th><th class="dow">Mo</th><th class="dow">Tu</th><th class="dow">We</th><th class="dow">Th</th><th class="dow">Fr</th><th class="dow">Sa</th></tr></thead><tbody><tr><td class="day old">28</td><td class="day old">29</td><td class="day old">30</td><td class="day">1</td><td class="day">2</td><td class="day">3</td><td class="day">4</td></tr><tr><td class="day">5</td><td class="day">6</td><td class="day">7</td><td class="day">8</td><td class="day">9</td><td class="day">10</td><td class="day">11</td></tr><tr><td class="day">12</td><td class="day">13</td><td class="day">14</td><td class="day">15</td><td class="day">16</td><td class="day">17</td><td class="day">18</td></tr><tr><td class="day">19</td><td class="day">20</td><td class="day">21</td><td class="day">22</td><td class="day">23</td><td class="day">24</td><td class="day">25</td></tr><tr><td class="day">26</td><td class="day">27</td><td class="day">28</td><td class="day">29</td><td class="day">30</td><td class="day">31</td><td class="day new">1</td></tr><tr><td class="day new">2</td><td class="day new">3</td><td class="day new">4</td><td class="day new">5</td><td class="day new">6</td><td class="day new">7</td><td class="day new">8</td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr></tfoot></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" style="visibility: visible;"><i class="icon-arrow-left"></i></th><th colspan="5" class="switch">2019</th><th class="next" style="visibility: visible;"><i class="icon-arrow-right"></i></th></tr></thead><tbody><tr><td colspan="7"><span class="month">Jan</span><span class="month">Feb</span><span class="month">Mar</span><span class="month">Apr</span><span class="month">May</span><span class="month">Jun</span><span class="month">Jul</span><span class="month">Aug</span><span class="month">Sep</span><span class="month">Oct</span><span class="month active">Nov</span><span class="month">Dec</span></td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr></tfoot></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev" style="visibility: visible;"><i class="icon-arrow-left"></i></th><th colspan="5" class="switch">2010-2019</th><th class="next" style="visibility: visible;"><i class="icon-arrow-right"></i></th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2009</span><span class="year">2010</span><span class="year">2011</span><span class="year">2012</span><span class="year">2013</span><span class="year">2014</span><span class="year">2015</span><span class="year">2016</span><span class="year">2017</span><span class="year">2018</span><span class="year active">2019</span><span class="year old">2020</span></td></tr></tbody><tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr></tfoot>
		</table>
	</div>
</div>

<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
</body>
</html>