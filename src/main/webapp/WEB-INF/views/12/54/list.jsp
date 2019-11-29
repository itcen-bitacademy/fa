<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
	.chosen-search {
		display: none;
	}
</style>
</head>
<body class="skin-3" style="min-width:1500px">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
			<div class="page-header position-relative">
				<h1 class="pull-left">매출세금계산서 현황조회</h1>
			</div><!-- /.page-header -->
			
			<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
					<div class="span12">
						<div class="row-fluid">
									<div class="form-horizontal">
											<div class="span6">
												<label class="control-label" for="form-field-date">작 성 일 자</label>
													<div class="controls">
															<input class="span6 date-picker hasDatepicker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" style="width:130px">
															<span class="add-on"><i class="icon-calendar"></i>
															</span>
														&nbsp; ~ &nbsp;
															<input class="span6 date-picker hasDatepicker" id="id-date-picker-2" type="text" data-date-format="dd-mm-yyyy" style="width:130px">
															<span class="add-on"><i class="icon-calendar"></i>
															</span>
														&nbsp;
														<button class="btn btn-small btn-info">조회</button>
													</div>
											</div>
											
											<div class="span6">
												<div class="controls">
												</div>
											</div>
										
									</div>
						</div>
						<br>
					</div>
						
					<div class="row-fluid">
							<div class="span12">
							
									<div class="form-horizontal">
										<div class="control-group">
											
											<div class="span6">
												<label class="control-label span2" for="form-field-1">거래처</label>
												<div class="controls">
													 <input class="span5" type="text" id="form-field-1"> 
													 <input class="span5" type="text" id="form-field-1">
													 <span class="btn btn-small btn-info"><i
															class="icon-search nav-search-icon"></i></span>
												</div>
											</div>
											
											<div class="span6">
												<label class="control-label span1" for="form-field-1">세금계산서 번호</label>
												<div class="controls">
															<input class="span8" type="text" id="form-field-1">
															<span class="btn btn-small btn-info"><i
															class="icon-search nav-search-icon"></i></span>
												</div>
											</div>
											
										</div>
									</div>
									
									<div class="form-horizontal">
										<div class="control-group">
												<div class="span6">
													<label class="control-label span2" for="form-field-1">품목명</label>
													<div class="controls">
														 <input class="span5" type="text" id="form-field-1"> 
														 <input class="span5" type="text" id="form-field-1">
														 <span class="btn btn-small btn-info"><i
																class="icon-search nav-search-icon"></i></span>
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
													<div class="controls">
													</div>
												</div>
											
											<div class="span6">	
												<div class="control-group">
			
													<div class="controls">
														<label>
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;전체조회&nbsp;&nbsp;&nbsp;</span>
															
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;승인&nbsp;&nbsp;</span>
															
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;미승인 </span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="hr hr-18 dotted"></div>
									
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span6">	
												<div class="control">
													<label class="control-label">정렬순서</label>
													
													<div class="controls">
														<label>
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;최근순&nbsp;&nbsp;&nbsp;</span>
															
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;공급가액 순&nbsp;&nbsp;</span>
															
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;품목명 순&nbsp;&nbsp;</span>
															
															<input name="form-field-radio" type="radio" class="ace">
															<span class="lbl">&nbsp;거래처명 순&nbsp;&nbsp;</span>
															
															<button class="btn btn-small btn-info">조회</button>
														</label>
													</div>
												</div>
											</div>
											
											<div class="span6">
													<div class="controls"></div>
											</div>
										</div>
									</div>
									<div class="hr hr-18 dotted"></div>
									
									<div class="row-fluid">
						<div class="span12">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>번 호</th>
										<th>세금계산서번호</th>
										<th>작성일자</th>
										<th>매입번호</th>
										<th>등록번호</th>
										<th>거래처명</th>
										<th>대표자명</th>
										<th>담당자명</th>
										<th>품목명</th>
										<th>수량</th>
										<th>입고일자</th>
										<th>출고일자</th>
										<th>공급가액</th>
										<th>세액</th>
										<th>비고</th>
										<th>과세유형</th>
										<th>삭제여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>1102-4448-6665</td>
										<td>19/11/22</td>
										<td>110223</td>
										<td>1123-5569-7784</td>
										<td>삼성전자</td>
										<td>이재용</td>
										<td>안태영</td>
										<td>반도체</td>
										<td>1</td>
										<td>19/11/13</td>
										<td>19/11/19</td>
										<td>1,800,000</td>
										<td>180,000</td>
										<td>-</td>
										<td>영세</td>
										<td>F</td>
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
								</div>
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
					
				</div><!-- /.span -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<!-- basic scripts -->
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
		$(function() {
			$(".chosen-select").chosen();
		})
	</script>
</body>
</html>