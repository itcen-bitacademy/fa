<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="/fa/ace/assets/js/ace-elements.min.js"></script>
<script src="/fa/ace/assets/js/ace.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />
<style>
.table-responsive {
	width: 100%;
	height: 100%;
	overflow: auto;
}

input:focus {
	outline: none;
}

.chosen-search {
	display: none;
}
</style>
<script type="text/javascript">
	jQuery(function($) {
		$("#id-date-picker-1").datepicker({
			showOtherMonths : true,
			selectOtherMonths : false,
		});
	});
	$(function() {
		$(".chosen-select").chosen();
	});
</script>
</head>
<body class="skin-3" style="min-width: 1280px">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">매입세금계산서관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i>메뉴 추가</a>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">

						<!-- PAGE CONTENT BEGINS -->
						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-date">작성일자</label>
							<div class="controls span5">
								<div class="input-append">
									<input class="date-picker" id="id-date-picker-1" type="text"
										data-date-format="dd-mm-yyyy" style="width: 70%"> <span
										class="add-on"> <i class="icon-calendar"></i>
									</span>
								</div>
								&nbsp; ~ &nbsp;
								<div class="input-append">
									<input class="date-picker" id="id-date-picker-2" type="text"
										data-date-format="dd-mm-yyyy" style="width: 70%"> <span
										class="add-on"> <i class="icon-calendar"></i>
									</span>
								</div>
							</div>
							<label class="control-label span1" for="form-field-1">과세유형</label>
							<div class="controls span5">
								<select class="chosen-select" id="zero" name="zero"
									data-placeholder="영세/비영세">
									<option value="전체">전체</option>
									<option value="과세">과세</option>
									<option value="영세">영세</option>
								</select>
							</div>
						</div>
						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">승인번호</label>
							<div class="controls span5">
								<input style="width: 95%" type="text" id="form-field-1"
									name="id" placeholder="승인번호" />
							</div>
						</div>
						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">품목명</label>
							<div class="controls span2">
								<div class="input-append">
									<input class="date-picker" id="id-date-picker-1" type="text"
										data-date-format="dd-mm-yyyy" style="width: 100%"> <span
										class="add-on"> <i class="icon-search"></i>
									</span>
								</div>
							</div>
							<label class="control-label span1" for="form-field-1">거래처명</label>
							<div class="controls span2">
								<div class="input-append">
									<input class="date-picker" id="id-date-picker-1" type="text"
										data-date-format="dd-mm-yyyy" style="width: 100%"> <span
										class="add-on"> <i class="icon-search"></i>
									</span>
								</div>
							</div>

						</div>
						<div class="control-group span12" style="margin: 0px 0px 10px">

							<label class="control-label span1" for="form-field-1">정렬</label>
							<div class="controls span4" style="margin: 0px 0px 10px">
								<label style="display: inline;"> <input
									name="form-field-radio" type="radio" class="ace"> <span
									class="lbl">최근 순</span>
								</label> <label style="display: inline;"> <input
									name="form-field-radio" type="radio" class="ace"> <span
									class="lbl">공급가액 순</span>
								</label> <label style="display: inline;"> <input
									name="form-field-radio" type="radio" class="ace"> <span
									class="lbl">품목명 순</span>
								</label> <label style="display: inline;"> <input
									name="form-field-radio" type="radio" class="ace"> <span
									class="lbl">거래처명 순</span>
								</label>

							</div>
							<button class="btn btn-default btn-small span1"
								style="float: left; margin-left: 20px;">조회</button>
						</div>
						<div class="control-group span12"
							style="overflow-x: scroll; max-width:1000px">
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover" style="width:1200px">
								<tr>
									<th>번호</th>
									<th>승인번호</th>
									<th>작성일자</th>
									<th>매입번호</th>
									<th>매입일자</th>
									<th>등록번호</th>
									<th>거래처명</th>
									<th>대표자명</th>
									<th>품목명</th>
									<th>업태</th>
									<th>종목</th>
									<th>수량</th>
									<th>단가</th>
									<th>총 공급가액</th>
									<th>총 세액</th>
									<th>과세유형</th>
									<th>삭제여부</th>
							
								</tr>
								<tr>

								</tr>
							</table>
						</div>
						<div class="control-group span12 pagination">
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


						<!-- PAGE CONTENT ENDS -->

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