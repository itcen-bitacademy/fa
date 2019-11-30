<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
input:focus {
	outline: none;
}

#sample-table-1 tr td {
	padding: 0;
}

#sample-table-1 tr td p {
	padding: 8px;
	margin: 0;
}

#sample-table-1 tr td input {
	padding: 8px;
	margin: 0;
	width: 94%;
	border: 0
}
</style>
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
				<form method="post"
					action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
					<!-- /.page-header -->
					<div class="row-fluid">
						<div class="span12">

							<!-- PAGE CONTENT BEGINS -->

							<div class="control-group">
								<label class="control-label span1" for="form-field-1">승인번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="form-field-1"
										name="id" placeholder="승인번호" />
								</div>
								<label class="control-label span1" for="form-field-2">관리번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="form-field-2"
										name="id" placeholder="관리번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label span1" for="form-field-3">등록번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="form-field-3"
										name="id" placeholder="등록번호" />
								</div>
								<label class="control-label span1" for="form-field-4">입금계좌번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="form-field-4"
										name="id" placeholder="입금계좌번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label span1" for="form-field-5">거래처명</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="form-field-5"
										name="id" placeholder="거래처명" />
								</div>
								<label class="control-label span1" for="form-field-6">성명</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="form-field-6"
										name="id" placeholder="성명" />
								</div>
								<label class="control-label span1" for="form-field-7">예금주</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="form-field-7"
										name="id" placeholder="예금주" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label span1" for="form-field-8">주소</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="form-field-8"
										name="id" placeholder="주소" />
								</div>
								<label class="control-label span1" for="form-field-9">은행</label>
								<div class="controls span5">
									<div class="controls span1">
										<input style="width: 100%" type="text" id="form-field-9-1"
											name="id" placeholder="은행" />
									</div>
									<div class="controls span4">
										<input style="width: 100%" type="text" id="form-field-9-2"
											name="id" placeholder="은행" />
									</div>

								</div>
							</div>
							<div class="control-group">
								<label class="control-label span1" for="form-field-10">업태</label>
								<div class="controls span2">
									<input style="width: 100%;" type="text" id="form-field-10"
										name="id" placeholder="업태" />
								</div>
								<label class="control-label span1" for="form-field-11">종목</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="form-field-11"
										name="id" placeholder="종목" />
								</div>
								<label class="control-label span1" for="form-field-12">과세구분</label>
								<div class="controls span5">
									<label style="display: inline"> <input
										name="form-field-radio-1" type="radio" class="ace"> <span
										class="lbl">과세</span>
									</label> <label style="display: inline"> <input
										name="form-field-radio-2" type="radio" class="ace"> <span
										class="lbl">영세</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
								<label class="control-label span1" for="form-field-13">일자</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="form-field-13"
										name="id" placeholder="일자" />
								</div>
								<label class="control-label span1" for="form-field-14">총
									공급가액</label>
								<div class="controls span4">
									<input style="width: 100%" type="text" id="form-field-14"
										name="id" placeholder="총 공급가액" />
								</div>
								<label class="control-label span1" for="form-field-15">총
									세액</label>
								<div class="controls span3">
									<input style="width: 100%" type="text" id="form-field-15"
										name="id" placeholder="총 세액" />
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<tr>
									<th>매입일자</th>
									<th>품목명</th>
									<th>수량</th>
									<th>공급가액</th>
									<th>부가세</th>
								</tr>
								<tr>
									<td><input type="text" id="form-field-tr1-td1"
										name="form-field-tr1-td1" /></td>
									<td><input type="text" id="form-field-tr1-td2"
										name="form-field-tr1-td2" /></td>
									<td><input type="text" id="form-field-tr1-td3"
										name="form-field-tr1-td3" /></td>
									<td><input type="text" id="form-field-tr1-td4"
										name="form-field-tr1-td4" /></td>
									<td><input type="text" id="form-field-tr1-td5"
										name="form-field-tr1-td5" /></td>
								</tr>
								<tr>
									<td><input type="text" id="form-field-tr2-td1"
										name="form-field-tr2-td1" /></td>
									<td><input type="text" id="form-field-tr2-td2"
										name="form-field-tr2-td2" /></td>
									<td><input type="text" id="form-field-tr2-td3"
										name="form-field-tr2-td3" /></td>
									<td><input type="text" id="form-field-tr2-td4"
										name="form-field-tr2-td4" /></td>
									<td><input type="text" id="form-field-tr2-td5"
										name="form-field-tr2-td5" /></td>
								</tr>
								<tr>
									<td><input type="text" id="form-field-tr3-td1"
										name="form-field-tr3-td1" /></td>
									<td><input type="text" id="form-field-tr3-td2"
										name="form-field-tr3-td2" /></td>
									<td><input type="text" id="form-field-tr3-td3"
										name="form-field-tr3-td3" /></td>
									<td><input type="text" id="form-field-tr3-td4"
										name="form-field-tr3-td4" /></td>
									<td><input type="text" id="form-field-tr3-td5"
										name="form-field-tr3-td5" /></td>
								</tr>
								<tr>
									<td><input type="text" id="form-field-tr4-td1"
										name="form-field-tr4-td1" /></td>
									<td><input type="text" id="form-field-tr4-td2"
										name="form-field-tr4-td2" /></td>
									<td><input type="text" id="form-field-tr4-td3"
										name="form-field-tr4-td3" /></td>
									<td><input type="text" id="form-field-tr4-td4"
										name="form-field-tr4-td4" /></td>
									<td><input type="text" id="form-field-tr4-td5"
										name="form-field-tr4-td5" /></td>
								</tr>
							</table>


							<div class="control-group">
								<button class="btn btn-danger btn-small"
									style="float: left; margin-left: 20px;">입력</button>
								<button class="btn btn-warning btn-small"
									style="float: left; margin-left: 20px;">수정</button>
								<button class="btn btn-primary btn-small"
									style="float: left; margin-left: 20px;">삭제</button>
								<button class="btn btn-default btn-small"
									style="float: left; margin-left: 20px;">조회</button>
							</div>
						</div>
					</div>
				</form>




			</div>
			<!-- PAGE CONTENT ENDS -->

		</div>
		<!-- /.span -->
	</div>
	<!-- /.row-fluid -->

	<!-- /.page-content -->

	<!-- /.main-content -->

	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>