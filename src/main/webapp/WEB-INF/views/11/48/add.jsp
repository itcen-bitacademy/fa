<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script>
$(function(){
   $('#id-date-range-picker-1').daterangepicker().prev().on(ace.click_event, function(){
      $(this).next().focus();
   });
   $(".chosen-select").chosen(); 
});
</script>

<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
tr td:first-child {
	padding-right: 10px;
}

.radio {
	float: left;
	width: 10%;
}

.search-input-width-first {
	width: 130px;
}

.search-input-width-second {
	width: 235px;
}

.debt-name-input {
	width: 420px;
}

.mgr-input {
	width: 90px;
	display: inline;
}

.mgr-number-input-h4 {
	display: inline;
	margin-left: 30px;
	margin-right: 20px;
}

.mgr-call-input {
	width: 150px;
	display: inline;
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
				<h1 class="pull-left">장기차입금관리</h1>
			</div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
				<div class="container-fluid">
					<!-- Example row of columns -->
					<div class="row">
						<div class="span8">
							<table>
								<tr>
									<td><h4>장기차입금코드</h4></td>
									<td>
										<input type="text" name="code" />
									</td>
								</tr>
								<tr >
									<td><h4>장기차입금명</h4></td>
									<td colspan="2">
										<input type="text" name="name"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금액</h4></td>
									<td><input type="text" name="amount" /></td>
								</tr>
								<tr>
									<td><h4>차입일자 ~ 만기일자</h4></td>
									<td colspan="2">
				                        <div class="row-fluid input-prepend">
				                           <input type="text" name="date-range-picker" id="id-date-range-picker-1"  data-date-format="yyyy-mm-dd" />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                           </div>
									</td>
								</tr>
								<tr>
									<td><h4>이자지급방식</h4></td>
									<td colspan="2">
										<div class="radio">
											<label>
												<input name="form-field-radio" type="radio" class="ace" />
												<span class="lbl">년</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="form-field-radio" type="radio" class="ace" />
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="form-field-radio" type="radio" class="ace" />
												<span class="lbl">만기</span>
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td><h4>은행코드</h4></td>
									<td colspan="2">
										<input type="text" class="search-input-width-first" name="bankCode"/>
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
										<input type="text" class="search-input-width-second" name="bankName"/>
									</td>
								</tr>
							</table>
						</div>
						<div class="span8">
							<table>
								<tr>
									<td><h4>회계연도</h4></td>
									<td>
										<input type="number" min="1900" max="2099" step="1" value="2019" id="form-field-1" name="financialYear" placeholder="회계연도"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금대분류</h4></td>
									<td colspan="2">
										<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="차입금대분류">
											<option value=""></option>
											<option value="008001">국내은행</option>
											<option value="008002">저축은행</option>
											<option value="008003">신용금고</option>
											<option value="008004">새마을금고</option>
											<option value="008005">외국계은행</option>
											<option value="008006">증권</option>
										</select>
									</td>
								</tr>
								<tr>
								<td><h4>상환방법</h4></td>
									<td colspan="2">
											<div class="radio">
												<label>
													<input name="form-field-radio" type="radio" class="ace" />
													<span class="lbl">년</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="form-field-radio" type="radio" class="ace" />
													<span class="lbl">월</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="form-field-radio" type="radio" class="ace" />
													<span class="lbl">만기</span>
												</label>
											</div>
									</td>
									</tr>
								<tr>
									<td><h4>이율</h4></td>
									<td colspan="2">
										<input type="text" name="intRate" placeholder="(%)"/>
									</td>
								</tr>
								<tr>
									<td><h4>담당자</h4></td>
									<td>
										<input type="text" class="mgr-input" name="mgr" />
										<h4 class="mgr-number-input-h4">담당자전화번호</h4>
										<input type="text" class="mgr-call-input" name="mgrCall" />
									</td>
								</tr>
								<tr>
									<td><h4>계좌</h4></td>
									<td colspan="2">
										<input type="text" class="search-input-width-first" name="cardAccountDepno"/>
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
										<input type="text" class="search-input-width-second" name="cardAccountBankName"/>
									</td>
								</tr>
							</table>
						</div>

					</div>
				</div>
				<hr>
				<div>
					<button type="button" class="btn">입력</button>
					&nbsp;
					<button type="button" class="btn">수정</button>
					&nbsp;
					<button type="button" class="btn">삭제</button>
					&nbsp;
					<button type="button" class="btn">조회</button>
					&nbsp;
					<button type="button" class="btn">상환</button>
					&nbsp;
					<button type="button" class="btn ">초기화</button>
				</div>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
			
			<!-- list -->
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">장기차입금코드</th>
							<th class="center">장기차입금명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자 ~ 만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행코드</th>
							<th class="center">계좌</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td class="center"><label class="pos-rel"> <input
									type="checkbox" class="ace" /> <span class="lbl"></span>
							</label></td>
							<td class="center">2019112701</td>
							<td>GS칼텍스는...</td>
							<td class="center">008-국내은행</td>
							<td class="center">70,000,000,000</td>
							<td class="center">월</td>
							<td class="center">2019-10-29 ~ 2029-10-29</td>
							<td class="center">1.99%</td>
							<td class="center">월</td>
							<td class="center">홍길동</td>
							<td class="center">010-1234-5678</td>
							<td class="center">0010987</td>
							<td class="center">한국은행</td>
						</tr>
					</tbody>
				</table>
			</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>

<script>
$(function(){
	 $('#id-date-range-picker-1').daterangepicker().prev().on(ace.click_event, function(){
	      $(this).next().focus();
	   });
	 $('.icon-calendar').daterangepicker().prev().on(ace.click_event, function(){
	      $(this).next().focus();
	   });
	$(".chosen-select").chosen();
});
</script>
</body>
</html>