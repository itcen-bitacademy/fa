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
</style>

</head>
<body class="skin-3">
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
							<label class="control-label span1" for="form-field-1">승인번호</label>
							<div class="controls span5">
								<input style="width: 400px" type="text" id="form-field-1"
									name="id" placeholder="승인번호" />
							</div>
							<label class="control-label span1" for="form-field-1">관리번호</label>
							<div class="controls span5">
								<input style="width: 400px" type="text" id="form-field-1"
									name="id" placeholder="관리번호" />
							</div>
						</div>

						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">등록번호</label>
							<div class="controls span5">
								<input style="width: 400px" type="text" id="form-field-1"
									name="id" placeholder="등록번호" />
							</div>
							<label class="control-label span1" for="form-field-1">입금계좌번호</label>
							<div class="controls span5">
								<input style="width: 400px" type="text" id="form-field-1"
									name="id" placeholder="입금계좌번호" />
							</div>
						</div>

						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">거래처명</label>
							<div class="controls span2">
								<input style="width: 150px" type="text" id="form-field-1"
									name="id" placeholder="거래처명" />
							</div>
							<label class="control-label span1" for="form-field-1">성명</label>
							<div class="controls span2">
								<input style="width: 150px" type="text" id="form-field-1"
									name="id" placeholder="성명" />
							</div>
							<label class="control-label span1" for="form-field-1">예금주</label>
							<div class="controls span5">
								<input style="width: 400px" type="text" id="form-field-1"
									name="id" placeholder="예금주" />
							</div>
						</div>

						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">주소</label>
							<div class="controls span5">
								<input style="width: 400px" type="text" id="form-field-1"
									name="id" placeholder="주소" />
							</div>
							<label class="control-label span1" for="form-field-1">은행</label>
							<div class="controls span5">
								<input style="width: 100px" type="text" id="form-field-1"
									name="id" placeholder="은행" /> <input style="width: 280px"
									type="text" id="form-field-1" name="id" placeholder="은행" />
							</div>
						</div>

						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">업태</label>
							<div class="controls span2">
								<input style="width: 150px" type="text" id="form-field-1"
									name="id" placeholder="업태" />
							</div>
							<label class="control-label span1" for="form-field-1">종목</label>
							<div class="controls span2">
								<input style="width: 150px" type="text" id="form-field-1"
									name="id" placeholder="종목" />
							</div>
							<label class="control-label span1" for="form-field-1">과세구분</label>
							<div class="controls span5">
								<label style="display: inline;"> <input name="form-field-radio" type="radio"
									class="ace"> <span class="lbl">과세</span>
								</label> <label style="display: inline;"> <input name="form-field-radio" type="radio"
									class="ace"> <span class="lbl">영세</span>
								</label>
							</div>
						</div>

						<div class="control-group span12" style="margin: 0px 0px 10px">
							<label class="control-label span1" for="form-field-1">일자</label>
							<div class="controls span2">
								<input style="width: 150px" type="text" id="form-field-1"
									name="id" placeholder="일자" />
							</div>
							<label class="control-label span1" for="form-field-1">총
								공급가액</label>
							<div class="controls span4">
								<input style="width: 350px" type="text" id="form-field-1"
									name="id" placeholder="총 공급가액" />
							</div>
							<label class="control-label span1" for="form-field-1">총
								세액</label>
							<div class="controls span3">
								<input style="width: 200px" type="text" id="form-field-1"
									name="id" placeholder="총 세액" />
							</div>
						</div>
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
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
							</tr>
							<tr>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
							</tr>
							<tr>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
							</tr>
							<tr>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
								<td><input style="width: 95%; border: 0;" type="text"
									id="form-field-1" name="id" /></td>
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
