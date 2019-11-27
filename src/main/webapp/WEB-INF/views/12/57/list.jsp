<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />

<script type="text/javascript">
	
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
				<h1 class="pull-left">월별 거래처 매출 현황</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
					<div class="span9 center">
							<div class="control-group">
								년 월
							
									<input type="text" id="form-field-1" placeholder="년월6자리">
														
								&nbsp;
								
								거래처 코드
								<select class="chosen-select" id="form-field-select-2" name="client_code" data-placeholder="거래처코드 선택">
										<option value="1">거래처코드11111</option>
										<option value="2">거래처코드22222</option>
								</select>
								
								&nbsp;
								
								
								<button class="btn btn-small btn-info">조회</button>
								
								<div class="hr hr-18 dotted"></div>
								
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
																		<thead>
									<tr>
										<th>메출일자</th>
										<th>거래처코드</th>
										<th>거래처명</th>
										<th>담당자</th>
										<th>담당자 이메일</th>
										<th>품목</th>
										<th>수량</th>
										<th>공급가액</th>
										<th>부가세</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>2019.11.25</td>
										<td>거래처코드1234567</td>
										<td>거래처명</td>
										<td>김승곤</td>
										<td>kkk@kkk</td>
										<td>IBM서버</td>
										<td>10</td>
										<td>10000</td>
										<td>1000</td>
									</tr>
									</tbody>
								</table>
								</div>
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
					</div>

			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>