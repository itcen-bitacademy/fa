<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">재무제표계정관리</h1>
				</div>
				<!-- /.page-headerr -->
				<div class="row-fluid">
					<div class="span16">
						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" method="post"
							action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							<div class="span2">
								<!-- 회계연도  -->
								<label class="control-label" for="form-field-1">회계연도</label>
								<div class="controls">
									<input type="number" min="1900" max="2099" step="1"
										value="2019" id="form-field-1" name="financial_usedyear"
										placeholder="회계연도"
										style="text-align: center; width: 100px; height: 18px;" />
								</div>
							</div>
							<div class="span3">
								<!-- 구분  -->
								<label class="control-label" for="form-field-select-1">구분</label>
								<div class="controls">
									<select class="select" id="form-field-select-1" name="menuNo"
										data-placeholder="메뉴선택">
										<option value="대차대조표">대차대조표</option>
										<option value="손익계산서">손익계산서</option>
									</select>
								</div>
							</div>
							<div class="span4">
								<!-- 계정명칭  -->
								<label class="control-label" for="form-field-select-1">계정명칭</label>
								<div class="controls">
									<!-- 계정명칭 -->
									<input type="text" id="form-field-1" name="financial_usedyear"
										placeholder="계정과목"
										style="text-align: center; width: 300px; height: 18px;" />
								</div>
							</div>

							<div class="span3">
								&nbsp;
								<button class="btn btn-info btn-small">조회</button>
								&nbsp;
								<button class="btn btn-default btn-small" type="reset">취소</button>
							</div>
						</form>
						<!-- PAGE CONTENT ENDS -->

					</div>
				</div>

				<!-- /.span -->

				<!-- /.row-fluid -->
				<!-- 제무재표 계정과목 리스트  -->
				<div class="span12">
					<table id="sample-table-1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center"><label> <input type="checkbox"
										class="ace"> <span class="lbl"></span>
								</label></th>
								<th>순번</th>
								<th>계정과목</th>
								<th>계정명칭</th>
								<th>잔액구분</th>
								<th>입력일자</th>
								<th>입력담당자</th>
								<th>수정일자</th>
								<th>수정담당자</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace"> <span class="lbl"></span>
								</label></td>
								<td>0010</td>
								<td>1000001</td>
								<td>자산</td>
								<td>차변</td>
								<td>2019.11.27</td>
								<td>이성훈</td>
								<td>2019.11.27</td>
								<td>이성훈</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->
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
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();
		});
	</script>
</body>
</html>