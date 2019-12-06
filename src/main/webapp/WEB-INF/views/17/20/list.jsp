<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
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
				<h1 class="pull-left">마감현황관리[20] list</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="closing-year-form" method="post">
						<%-- 년 월 select --%>
						<div class="control-group">
							<label class="control-label" for="closing-year" style="text-align:left;width:60px;">년도:</label>
							<div class="controls" style="margin-left:60px;">
								<select class="chosen-select" id="closing-year" name="year" data-placeholder="년도를 선택하세요">
									<c:forEach var="closingYear" items="${closingYearList }">
										<c:choose>
											<c:when test="${closingYear eq year }">
												<option value="${closingYear }" selected>${closingYear }</option>
											</c:when>
											<c:otherwise>
												<option value="${closingYear }">${closingYear }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<%-- 조회버튼 --%>
								<button class="btn btn-small btn-info" id="search-btn">조회</button>
							</div>
						</div>
					</form>
					<!-- /row -->

					<div class="hr hr-18 dotted"></div>

					<%-- 테이블 영역 --%>
					<div class="row-fluid">
						<div class="span12">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>년 월</th>
										<th>전체마감일</th>
										<th>전표마감일</th>
										<th>자산마감일</th>
										<th>부채마감일</th>
										<th>매입마감일</th>
										<th>매출마감일</th>
										<th>결산마감일</th>
										<th>결산여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty dataResult.datas }">
										<tr>
											<td colspan="9" class="center">등록된 마감일이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="cdt" items="${dataResult.datas }">
										<tr class="cdt-tr" no="${cdt.no }" closing-yn="${cdt.closingYn }">
											<td class="closing-year-month">${cdt.closingYearMonth }</td>
											<td class="closing-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingDate }"></fmt:formatDate></td>
											<td class="closing-statement-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingStatementDate }"></fmt:formatDate></td>
											<td class="closing-assets-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingAssetsDate }"></fmt:formatDate></td>
											<td class="closing-debt-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingDebtDate }"></fmt:formatDate></td>
											<td class="closing-purchase-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingPurchaseDate }"></fmt:formatDate></td>
											<td class="closing-sales-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingSalesDate }"></fmt:formatDate></td>
											<td class="closing-settlement-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${cdt.closingSettlementDate }"></fmt:formatDate></td>
											<td class="closing-yn">
												<c:choose>
													<c:when test="${cdt.closingYn }">
														완료
													</c:when>
													<c:otherwise>
														미결산
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->

					<%-- 페이징 --%>
					<div class="pagination">
						<ul>
							<c:choose>
								<c:when test="${dataResult.pagination.prev }">
									<li><a href="${pageContext.servletContext.contextPath }/17/20/list?year=${year }&page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
								<c:choose>
									<c:when test="${pg eq dataResult.pagination.page }">
										<li class="active"><a href="${pageContext.servletContext.contextPath }/17/20/list?year=${year }&page=${pg }">${pg }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.servletContext.contextPath }/17/20/list?year=${year }&page=${pg }">${pg }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li><a href="${pageContext.servletContext.contextPath }/17/20/list?year=${year }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

				</div><!-- /.span -->
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
	$(function(){
		$(".chosen-select").chosen();

		// 버튼 prevent default 설정
		$('button').on('click', disableFormSubmit)

		// 년도별 마감 현황 조회
		$('#search-btn').on('click', searchClosingState)
	});

	// 버튼 prevent default 설정
	function disableFormSubmit(event) {
		event.preventDefault();
	}

	// 년도별 마감 현황 조회
	function searchClosingState(event) {
		var form = $('#closing-year-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/20/list')
		form.submit();
	}
</script>
</body>
</html>
