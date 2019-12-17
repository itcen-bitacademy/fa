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
								<div class="span3">
									<div class="control-group">
										<label class="control-label" for="form-field-1">품목 코드</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="id" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">거래처명</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="customerName" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">설치주소</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="address" />
										</div>
									</div>
								</div>

								<div class="span3">
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">무형자산
											분류</label>
										<div class="controls">
											<select class="span2 chosen-select" id="form-field-section"
												name="classification" data-placeholder="전체">
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.code }"
														value="${sectionVo.classification }">${sectionVo.classification }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">거래처
											담당자</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="customerManager" />
										</div>
									</div>
								</div>

								<div class="span6">
									<div class="control-group">
										<label class="control-label" for="id-date-range-picker-1">매입일자</label>
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
										<label class="control-label" for="form-field-1">취득금액</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="acqPrice"
												style="text-align: right;" value="0" />
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<div class="span3" style="float: right">
												<button class="btn btn-info btn-small" type="submit"
													style="float: right; margin-right: 20px;">
													<i class="icon-ok bigger-80"></i>조회
												</button>
											</div>
											<div class="span2" style="float: right">
												<label style="float: right"> <input name="isChecked"
													id="delete" value="삭제된 항목" type="checkbox" class="ace">
													<span class="lbl"> 삭제포함</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!-- /row -->

						<div class="hr hr-18 dotted"></div>

						<div class="row-fluid">
							<div id="listCount" style="float: left;"></div>

							<div>
								<table id="list-table"
									class="table table-striped table-bordered table-hover">
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

		<div class="pagination">
			<ul>
				<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a
							href="${pageContext.servletContext.contextPath }/08/44/list?page=${dataResult.pagination.startPage - 1 }"><i
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
								href="${pageContext.servletContext.contextPath }/08/44/list?page=${pg }">${pg }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.servletContext.contextPath }/08/44/list?page=${pg }&kwd=${kwd }">${pg }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${dataResult.pagination.next }">
						<li><a
							href="${pageContext.servletContext.contextPath }/08/44/list?page=${dataResult.pagination.endPage + 1 }"><i
								class="icon-double-angle-right"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i
								class="icon-double-angle-right"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();

			$("#listCount").ready(function() {
				var total = $('#list-table tbody tr').length;
				$('#listCount').text('총 ' + total + '건');
			});

		});
	</script>
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
	<script>
		$(function() {
			$("#id-date-range-picker-1").daterangepicker({
				format : 'YYYY-MM-DD'
			}).prev().on(
					ace.click_event,
					function() {
						$(this).next().focus();
		});
	</script>
</body>
</html>