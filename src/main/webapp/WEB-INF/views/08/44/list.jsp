<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">무형자산현황조회</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
							
							
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
								<div class="span3">
									<div class="control-group">
										<label class="control-label" for="form-field-1">품목 코드</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="id" placeholder="10자로 입력하세요"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">거래처명</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="customerName" placeholder=""/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">설치주소</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="address" placeholder=""/>
										</div>
									</div>
								</div>
								
								<div class="span3">
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">무형자산 분류</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1" name="nameNo" data-placeholder="전체">
												<c:forEach items="${listMainMenu }" var="nameVo">
													<option value="${nameVo.no }">${nameVo.name }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">거래처 담당자</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="customerManager" placeholder=""/>
										</div>
									</div>
								</div>
							
								<div class="span6">
									<div class="control-group">
										<label class="control-label" for="id-date-range-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											<input class="span5" type="text" name="date-range-picker" id="id-date-range-picker-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">취득금액</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="acqPrice" placeholder="입력된 숫자 이하로 검색됩니다"/>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<div class="span3" style="float:right">
												<button class="btn btn-info btn-small" type="submit" style="float:right;margin-right:20px;"><i class="icon-ok bigger-80"></i>상세조회</button>
											</div>
											<div class="span2" style="float:right">
												<label style="float:right">
													<input name="checkDel" type="checkbox" class="ace">
														<span class="lbl"> 삭제포함</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div><!-- /row -->
						
						<div class="hr hr-18 dotted"></div>
						
						<div class="row-fluid">
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
								<div class="control-group">
									<div class="controls">
										<div class="span1" style="float:right">
											<button class="btn btn-info btn-small" type="submit" style="float:right;margin-right:20px;"><i class="icon-ok bigger-80"></i>조회</button>
										</div>
										<div class="span2" style="float:right">
											<input type="text" class="span11" id="form-field-1" name="search" placeholder="검색어를 입력하세요"/>
										</div>
									</div>
								</div>
							</form>
							
							<div>
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>무형자산코드</th>
											<th>무형자산명</th>
											<th>설치주소</th>
											<th>사용담당자</th>
											<th>대분류코드</th>
											<th>대분류명</th>
											<th>수량</th>
											<th>거래처코드</th>
											<th>거래처명</th>
											<th>담당자</th>
											<th>취득금액(원)</th>
											<th>용도</th>
											<th>부대비용(원)</th>
											<th>매입일자</th>
											<th>세금계산서번호</th>
											<th>구분</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>삭제여부</th>
										</tr>
									</thead>
	
									<tbody>
										<tr>
											<td>1</td>
											<td>무형자산코드</td>
											<td>무형자산명</td>
											<td>설치주소</td>
											<td>사용담당자</td>
											<td>대분류코드</td>
											<td>대분류명</td>
											<td>수량</td>
											<td>거래처코드</td>
											<td>거래처명</td>
											<td>담당자</td>
											<td>취득금액(원)</td>
											<td>용도</td>
											<td>부대비용(원)</td>
											<td>매입일자</td>
											<td>세금계산서번호</td>
											<td>구분</td>
											<td>작성자</td>
											<td>작성일</td>
											<td>
												<div class="hidden-phone visible-desktop btn-group">
													<button class="btn btn-mini btn-success">
														<i class="icon-ok bigger-120"></i>
													</button>
	
													<button class="btn btn-mini btn-info">
														<i class="icon-edit bigger-120"></i>
													</button>
	
													<button class="btn btn-mini btn-danger">
														<i class="icon-trash bigger-120"></i>
													</button>
	
													<button class="btn btn-mini btn-warning">
														<i class="icon-flag bigger-120"></i>
													</button>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
															<i class="icon-cog icon-only bigger-110"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
																	<span class="blue">
																		<i class="icon-zoom-in bigger-120"></i>
																	</span>
																</a>
															</li>
	
															<li>
																<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
																	<span class="green">
																		<i class="icon-edit bigger-120"></i>
																	</span>
																</a>
															</li>
	
															<li>
																<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
																	<span class="red">
																		<i class="icon-trash bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							  
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
<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script>
$(function() {
	$("#id-date-range-picker-1").daterangepicker().prev().on(ace.click_event, function(){
		$(this).next().focus();
	});
});
</script>
</body>
</html>