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



<link href="${pageContext.request.contextPath }//ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>

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
					<h1 class="pull-left">카드 관리</h1>
				</div>

				<div class="row-fluid">
					<div class="span6">
						<div class="tabbable">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="form-field-1">카 드 번 호</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="카드 번호" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">사 용 자</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="사용자" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label" for="form-field-1">카 드 발 급
										자 </label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="카드발급자" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">계 좌 번 호
									</label> <input type="text" id="form-field-1" placeholder="계좌번호" /> <input
										type="text" value="예금주" readonly />

								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">은 행 </label> <input
										type="text" value="은행코드" readonly /> <input type="text"
										value="은행명" readonly />

								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">카드한도(만원)
									</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="한도" />
									</div>
								</div>



							</form>
						</div>
					</div>


					<div class="span6">
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="form-field-1">유효기간 </label> <input
									type="text" id="form-field-1" placeholder="MM" /> / <input
									type="text" id="form-field-1" placeholder="YY" /> <label
									class="control-label" for="form-field-1">CVC </label> <input
									type="text" id="form-field-1" placeholder="CVC" />

							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">교통카드 유무
								</label> <input name="form-field-radio" type="radio" class="ace" checked />
								<span class="lbl"> Yes</span> <input name="form-field-radio"
									type="radio" class="ace" /> <span class="lbl"> No</span>

							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">해외사용 여부
								</label> <input name="form-field-radio2" type="radio" class="ace"
									checked /> <span class="lbl"> Yes</span> <input
									name="form-field-radio2" type="radio" class="ace" /> <span
									class="lbl"> No</span>

							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">비밀번호 </label>

								<div class="controls">
									<input type="text" id="form-field-1" placeholder="비밀번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">카드사 </label>

								<div class="controls">
									<input type="text" id="form-field-1" placeholder="카드사" />
								</div>
							</div>


						</form>
					</div>
					<!-- /.span -->
				</div>
				<!-- /row -->
				<!-- /.row-fluid -->


				<!-- buttons -->
				<div class="row-fluid">
					<div class="span8">
						<button class="btn btn-info btn-small">조회</button>
						<button class="btn btn-danger btn-small">삭제</button>
						<button class="btn btn-warning btn-small">수정</button>
						<button class="btn btn-primary btn-small">입력</button>
						<button class="btn btn-default btn-small">취소</button>
					</div>

				</div>
				<div class="hr hr-18 dotted"></div>


				<!-- Tables -->
				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label> <input type="checkbox"
											class="ace" /> <span class="lbl"></span>
									</label></th>
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
									<td class="center"><label> <input type="checkbox"
											class="ace" /> <span class="lbl"></span>
									</label></td>


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
				<!-- /row -->
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
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>