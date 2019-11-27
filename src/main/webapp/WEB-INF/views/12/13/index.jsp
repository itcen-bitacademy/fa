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
					<h1 class="pull-left">매출관리</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span10">

						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" method="post" action="">
							<div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-1">매출관리</label>
									<div class="controls">
										<input type="text" id="form-field-1" placeholder="매출관리">
									</div>
								</div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-2">매출번호</label>
									<div class="controls">
										<input type="text" id="form-field-2" placeholder="매출번호">
									</div>
								</div>
							</div>
							
							<div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-3">거래처코드</label>
									<div class="controls">
										<input type="text" id="form-field-3" placeholder="거래처코드">
									</div>
								</div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-4">거래처코드</label>
									<div class="controls">
										<input type="text" id="form-field-4" placeholder="거래처코드">
									</div>
								</div>
							</div>
							
							<div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-5">거래처담당자</label>
									<div class="controls">
										<input type="text" id="form-field-5" placeholder="거래처담당자">
									</div>
								</div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-6">거래처연락처</label>
									<div class="controls">
										<input type="text" id="form-field-6" placeholder="거래처연락처">
									</div>
								</div>
							</div>
							
							<div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-7">출고일</label>
									<div class="controls">
										<input type="text" id="form-field-7" placeholder="출고일">
									</div>
								</div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-8">세금계산서번호</label>
									<div class="controls">
										<input type="text" id="form-field-8" placeholder="세금계산서번호">
									</div>
								</div>								
							</div>
							
							<div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-9">수량합계</label>
									<div class="controls">
										<input type="text" id="form-field-9" placeholder="수량합계">
									</div>
								</div>
								<div class="control-group inline span6">
									<label class="control-label" for="form-field-10">공급가액합계</label>
									<div class="controls">
										<input type="text" id="form-field-10" placeholder="공급가액합계">
									</div>
								</div>
							</div>
							
							<div>
								<div class="control-group">
									<label class="control-label" for="form-field-9">수량합계</label>
									<div class="controls">
										<input type="text" id="form-field-9" placeholder="수량합계">
									</div>
								</div>
							</div>
							
							<div class="form-actions">
								<div class="btn-group">
									<button class="btn btn-success">입력</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-info">수정</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-danger">삭제</button>
								</div>
								<div class="btn-group">
									<button class="btn">행추가</button>
								</div>
								<div class="btn-group">
									<button class="btn">행삭제</button>
								</div>
							</div>
						</form>

						<div class="space-10"></div>
						<div>
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<tr>
									<th class="center"><input type="checkbox" class="ace">
										<span class="lbl"></span></th>
									<th>순번</th>
									<th>품목코드</th>
									<th>품목명</th>
									<th>수량</th>
									<th>공급가액</th>
									<th>부가세</th>
								</tr>
								<tr>
									<td>
									<span class="lbl"></span></td>
									<td>1</td>
									<td>1234567890</td>
									<td>모니터</td>
									<td>50</td>
									<td>30,000</td>
									<td>3,000</td>
								</tr>
								<tr>
									<td>
									<span class="lbl"></span></td>
									<td>1</td>
									<td>1234567890</td>
									<td>모니터</td>
									<td>50</td>
									<td>30,000</td>
									<td>3,000</td>
								</tr>
								<tr>
									<td>
									<span class="lbl"></span></td>
									<td>1</td>
									<td>1234567890</td>
									<td>모니터</td>
									<td>50</td>
									<td>30,000</td>
									<td>3,000</td>
								</tr>
								<tr>
									<td>
									<span class="lbl"></span></td>
									<td>1</td>
									<td>1234567890</td>
									<td>모니터</td>
									<td>50</td>
									<td>30,000</td>
									<td>3,000</td>
								</tr>
								<tr>
									<td>
									<span class="lbl"></span></td>
									<td>1</td>
									<td>1234567890</td>
									<td>모니터</td>
									<td>50</td>
									<td>30,000</td>
									<td>3,000</td>
								</tr>
							</table>							
						</div>
						<!-- PAGE CONTENT ENDS -->

					</div>
					<!-- /.span -->
					<!-- 				</div> -->
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