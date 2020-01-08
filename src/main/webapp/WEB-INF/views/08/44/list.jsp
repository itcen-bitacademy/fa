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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
html, body {
	height: 100%;
}

.main-container {
	height: calc(100% - 45px);
	overflow-x: hidden;
}

.main-content {
	overflow: auto;
}

.page-content {
	min-width: 1280px;
}

@media screen and (max-width: 920px) {
	.main-container {
		height: calc(100% - 84px);
	}
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
					<h1 class="pull-left">무형자산현황조회</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->


							<form class="form-horizontal" method="post"
								action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
								<div class="span6" style="overflow: auto;">
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">품목 코드</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="id" value="${vo.id }" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">거래처명</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="customerName" value="${vo.customerName }" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">설치주소</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="address" value="${vo.address }" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">취득금액</label>
										<div class="controls">
											<input type="text" id="acqPrice" name="acqPrice"
												style="text-align: right;" value="0" />
										</div>
									</div>
								</div>

								<div class="span6">
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-select-1">무형자산 분류</label>
										<div class="controls">
											<select class="span2 chosen-select" id="form-field-section"
												name="classification" data-placeholder="전체">
												<option value=""></option>
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.code }"
														value="${sectionVo.classification }">${sectionVo.classification }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="id-date-range-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on"> <i class="icon-calendar"></i>
												</span> <input class="span12" type="text" name="payDate"
													id="payDate" class="cl-date-range-picker"
													id="id-date-range-picker-1">
											</div>
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">거래처 담당자</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="customerManager" value="${vo.customerManager }" />
										</div>
									</div>
								</div>

								<div class="span6" style="float: right; overflow: auto;">
									<div class="control-group">
										<div class="controls">
											<button class="btn btn-info btn-small" type="submit"
												style="float: right; margin-right: 20px;">
												<i class="icon-ok bigger-80"></i>조회
											</button>
											<button class="btn btn-default btn-small" type="reset"
												id="reset" style="float: right; margin-right: 20px;">초기화</button>
											<label style="float: right">
												<c:choose>
													<c:when test='${vo.isChecked eq null}'>
														<input name="isChecked" id="delete" value="d"
															 type="checkbox" class="ace"><span class="lbl" style="margin: 10px"> 삭제포함</span>
													</c:when>
													<c:otherwise>
														<input name="isChecked" id="delete" value="d" checked="checked"
															type="checkbox" class="ace"><span class="lbl" style="margin: 10px"> 삭제포함</span>
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!-- /row -->

						<div class="hr hr-18 dotted"></div>

						<div class="row-fluid">
							<label>총 ${dataResult.pagination.totalCnt }건</label>

							<div style="overflow-x: auto;">
								<table id="list-table"
									class="table table-striped table-bordered table-hover"
									style="width: 1920px">
									<thead>
										<tr>
											<th>NO</th>
											<th>무형자산코드</th>
											<th>설치주소</th>
											<th>대분류명</th>
											<th>대분류코드</th>
											<th>거래처코드</th>
											<th>거래처명</th>
											<th>취득금액(원)</th>
											<th>부대비용(원)</th>
											<th>세금계산서번호</th>
											<th>무형자산명</th>
											<th>사용담당자</th>
											<th>수량</th>
											<th>담당자</th>
											<th>용도</th>
											<th>매입일자</th>
											<th>구분</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>삭제여부</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${intangibleAssetsVo }" var="vo"
											varStatus="status">
											<tr>
												<td>${status.count }</td>
												<td>${vo.id }</td>
												<td>${vo.address }</td>
												<td>${vo.classification }</td>
												<td>${vo.code }</td>
												<td>${vo.customerNo }</td>
												<td>${vo.customerName }</td>
												<td><fmt:formatNumber value="${vo.acqPrice }"
														pattern="#,###"></fmt:formatNumber></td>
												<td><fmt:formatNumber value="${vo.addiFee }"
														pattern="#,###"></fmt:formatNumber></td>
												<td>${vo.taxbillNo }</td>
												<td>${vo.name }</td>
												<td>${vo.user }</td>
												<td><fmt:formatNumber value="${vo.copyCount }"
														pattern="#,###"></fmt:formatNumber></td>
												<td>${vo.customerManager }</td>
												<td>${vo.purpose }</td>
												<td>${vo.payDate }</td>
												<td>${vo.taxKind }</td>
												<td>${vo.insertUserId }</td>
												<td>${vo.insertDay }</td>
												<c:choose>
													<c:when test="${vo.flag == 'd'}">
														<td>삭제된 항목입니다</td>
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="pagination">
							<ul>
								<c:choose>
									<c:when test="${dataResult.pagination.prev }">
										<li><a
											href="${pageContext.servletContext.contextPath }/08/44/list${uri }&page=${dataResult.pagination.startPage - 1 }"><i
												class="icon-double-angle-left"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><a href="#"><i
												class="icon-double-angle-left"></i></a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="${dataResult.pagination.startPage }"
									end="${dataResult.pagination.endPage }" var="pg">
									<c:choose>
										<c:when test="${pg eq dataResult.pagination.page }">
											<li class="active"><a
												href="${pageContext.servletContext.contextPath }/08/44/list${uri }&page=${pg }">${pg }</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${pageContext.servletContext.contextPath }/08/44/list${uri }&page=${pg }&kwd=${kwd }">${pg }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${dataResult.pagination.next }">
										<li><a
											href="${pageContext.servletContext.contextPath }/08/44/list${uri }&page=${dataResult.pagination.endPage + 1 }"><i
												class="icon-double-angle-right"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><a href="#"><i
												class="icon-double-angle-right"></i></a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- /row -->
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
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();

			// 초기화 버튼
			$("#reset").click(function() {
				location.reload();
			});
		});
	</script>
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
	<script>
		$(function() {
			$("#payDate").daterangepicker({
				format : 'YYYY-MM-DD'

			}).prev().on(ace.click_event, function() {
				$(this).next().focus();
			});
		});

		function addCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		// 금액에 3자리마다 ',' 넣기
		$(function() {
			$("#acqPrice").on('keyup', function(event) {
				$(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
			});
		});
	</script>
</body>
</html>