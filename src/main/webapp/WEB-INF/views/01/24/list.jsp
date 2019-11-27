<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<style>
.chosen-search {
	display: none;
}
</style>

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>


<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<script type="text/javascript">
	jQuery(function($) {

		$("#datepicker").datepicker({
			showOtherMonths : true,
			selectOtherMonths : false,
		});

		$("#datepicker2").datepicker({
			showOtherMonths : true,
			selectOtherMonths : false,
		});
	});
	
	$(function(){
		$(".chosen-select").chosen(); 
	});
</script>

<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">

				<div class="page-header position-relative">
					<h1 class="pull-left">카드 현황조회</h1>
				</div>


				<div class="row-fluid">
					<form class="form-horizontal">
						입력 기간

						<div class="input-append">
							<input type="text" id="datepicker" class="input-small" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" class="input-small" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>


						카드시작번호 : <input type="text" id="form-field-1" placeholder="시작번호" size=4 /> 
						카드종료번호 : <input type="text" id="form-field-1" placeholder="종료번호" /> 
						삭제여부 : <select class="chosen-select" id="form-field-select-1" name="parentNo" data-placeholder="상위메뉴 선택">
							<option value="false">N</option>
							<option value="true">Y</option>

						</select>

						<button class="btn btn-small btn-info">조회</button>



					</form>
					<div class="hr hr-18 dotted"></div>
				</div>



				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>카드번호</th>
									<th>유효기간</th>
									<th>CVC</th>
									<th>사용자</th>
									<th>카드발급자</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>비밀번호</th>
									<th>은행코드</th>
									<th>은행명</th>
									<th>카드사</th>
									<th>카드한도(만원)</th>
									<th>교통카드 유무</th>
									<th>해외사용 여부</th>
									<th>입력일자</th>
									<th>입력담당자</th>
									<th>수정일자</th>
									<th>수정담당자</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>1111-1111-1111-1111</td>
									<td>12/23</td>
									<td>111</td>
									<td>김승곤</td>
									<td>안대혁</td>
									<td>111-11-11111</td>
									<td>김승곤</td>
									<td>****</td>
									<td>11111111</td>
									<td>국민은행</td>
									<td>삼성</td>
									<td>100,000</td>
									<td>가능</td>
									<td>가능</td>
									<td>2019-11-18</td>
									<td>김승곤</td>
									<td>2019-11-27</td>
									<td>승곤</td>

								</tr>

							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>

				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#"><i
								class="icon-double-angle-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
					</ul>
				</div>
				
				
				
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