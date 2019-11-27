<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1 class="pull-left">매출세금계산서</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">

						<!-- PAGE CONTENT BEGINS -->
						<div class="row-fluid">
							<div class="span10">
								<div class="span6">
										<label for="form-field-mask-1"> 매출일자 <small
											class="text-success">12/25/2019</small>
										</label>
										<div class="input-append">
											<input class="input-small input-mask-date" type="text"
												id="form-field-mask-1"> <span class="btn btn-small">
												<i class="icon-calendar bigger-110"></i> 검색
											</span>
										</div>
								</div>

								<div class="span6">
										<label class="control-label" for="form-field-1">매 출 번 호</label>
										<div class="input-append">
											<input type="text" id="form-field-1" placeholder="Number">
											<button class="btn btn-small">조회</button>
										</div>
								</div>
								
								<!-- /span -->
							</div>
						</div>
						<!-- /row -->
						<!-- PAGE CONTENT ENDS -->
						<div class="hr hr-double dotted"></div>
					</div>
					<!-- /.span -->
				</div>
				<!-- /.row-fluid -->



			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>