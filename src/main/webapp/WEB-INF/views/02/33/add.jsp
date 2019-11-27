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
									<div class="row-fluid input-append">
										<input class="span7" id="form-field-section-name" name="section-name" type="text" readonly="true"/>
										<span class="add-on">
											<a href="#"><i class="icon-search icon-on-right bigger-110"></i></a>
										</span>
									</div>
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
									<div class="row-fluid input-append" style="margin:0 0 5px 0">
										<input class="span9" id="form-field-factory-address" name="factory-address" type="text" readonly="true"/>
										<span class="add-on">
											<a href="#"><i class="icon-search icon-on-right bigger-110"></i></a>
										</span>
									</div>
									
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
							<button class="btn btn-info btn-small" type="submit">조회</button>
							<button class="btn btn-danger btn-small" type="submit">삭제</button>
							<button class="btn btn-warning btn-small" type="submit">수정</button>
							<button class="btn btn-primary btn-small" type="submit">입력</button>
							<button class="btn btn-default btn-small" type="submit">취소</button>
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
						
						<div class="dataTables_paginate paging_bootstrap pagination"><ul><li class="prev disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li class="next"><a href="#"><i class="icon-double-angle-right"></i></a></li></ul></div>
					</div>
					
					<!-- PAGE CONTENT ENDS -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
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