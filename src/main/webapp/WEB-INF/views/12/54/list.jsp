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
<body class="skin-3">
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