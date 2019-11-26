<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">테스트 리스트27</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span6">
						<!-- <div class="col-sm-9">
											<span class="input-icon">
												<input type="text" id="form-field-icon-1" />
												<i class="ace-icon fa fa-leaf blue"></i>
											</span>

											<span class="input-icon input-icon-right">
												<input type="text" id="form-field-icon-2" />
												<i class="ace-icon fa fa-leaf green"></i>
											</span>
										</div> -->
							<form class="form-horizontal" role="form">
								<div class="form-group" style=float:left>
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 사업자 등록번호:&nbsp; </label>
									<input type="text" id="customer_no" placeholder="사업자등록번호" class="col-xs-10 col-sm-5" />	
								</div>
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 상호명:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="상호명" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 대표자:&nbsp; </label>
									<input type="text" id="customer_ceo" placeholder="대표자" class="col-xs-10 col-sm-5" />
								</div>
							</form>
							
						</div><!-- /span -->
						
						<div class="span6">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 법인번호:&nbsp; </label>
									<input type="text" id="form-field-1" placeholder="법인번호" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 관할 영업소:&nbsp; </label>
									<input type="text" id="form-field-1" placeholder="관할 영업소" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								
								<div class="form-group" style=float:left>
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 거래처 전화번호:&nbsp; </label>
									<input type="text" id="customer_no" placeholder="거래처 전화번호" class="col-xs-10 col-sm-5" />	
								</div>
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> E-mail:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="E-mail" class="col-xs-10 col-sm-5" />
								</div>
							</form>
							
						
						</div>
					</div>
					
					
					<!-- /row -->
					<!-- PAGE CONTENT ENDS -->
					
			</div><!-- /.row-fluid -->
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>