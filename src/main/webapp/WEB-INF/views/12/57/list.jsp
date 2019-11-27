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
				<h1 class="pull-left">월별 거래처 매출 현황</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
					<div class="span9 center">
							<div class="control-group">
								<label class="control-label span2" for="form-field-1">년 월</label>
								<div class="controls span3">
									<input type="text" id="form-field-1" placeholder="년월6자리">
								</div>
								<label class="control-label span3" for="form-field-2">거래처 코드</label>
								<div class="controls span3">
								<select id="form-field-select-1">
								<option value>&nbsp;</option>
								<option value="품1">거래처 코드11111</option>
								<option value="품2">거래처 코드22222</option>
								</select>
								</div>
								<button class="btn btn-default span1">조회</button>
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
									<tbody>
									<tr>
									<th>매출일자</th>
									<th>거래처 코드</th>
									<th>거래처명</th>
									<th>담당자</th>
									<th>담당자 이메일</th>
									<th>품목</th>
									<th>수량</th>
									<th>공급가액</th>
									<th>부가세</th>
									</tr>
									</tbody>
								</table>
								</div>
						
						</div>
					</div>

			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>