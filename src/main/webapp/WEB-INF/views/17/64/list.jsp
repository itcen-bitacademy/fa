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

			<%-- Page Header BEGIN --%>
			<div class="page-header position-relative">
				<h1 class="pull-left">손익계산서조회[64]</h1>
			</div>
			<%-- Page Header END --%>

			<%-- Page Content Header BEGIN--%>
			<div class="row-fluid">
				<div class="span12">
					<h1 class="center">손익계산서</h1>
				</div>
			</div>

			<%-- 손익계산서 선택 --%>
			<div class="row-fluid">
				<div class="span6">
					<form class="form-horizontal">
						<%-- 년 월 select --%>
						<div class="control-group">
							<label class="control-label" for="year-month" style="text-align:left;width:60px;">년 월:</label>
							<div class="controls" style="margin-left:60px;">
								<select class="chosen-select" id="year-month" name="closingDateNo" data-placeholder="년 월 선택">
									<c:forEach var="cd" items="${closingDateList }">
										<c:choose>
											<c:when test="${cd.no eq closingDateNo }">
												<option value="${cd.no }" selected>${cd.closingYearMonth }</option>
											</c:when>
											<c:otherwise>
												<option value="${cd.no }">${cd.closingYearMonth }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>

								<%-- 조회버튼 --%>
								<button class="btn btn-small btn-info" id="search-btn">조회</button>
							</div>
						</div>
					</form>
				</div><!-- /.span -->

				<%-- 단위 표시 --%>
				<div class="span6">
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label" for="year-month" style="float:right;">(단위: 원)</label>
						</div>
					</form>
				</div>
			</div><!-- /.row-fluid -->
			<%-- Page Content Header END --%>


			<%-- 손익계산서 데이터 테이블 BEGINS --%>
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" width="44%">계정</th>
								<th class="center" width="28%">당월</th>
								<th class="center" width="28%">합계</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${incomeStatementDataList }" var="data" varStatus='status' >
								<tr>
									<td style="text-align:left;">${data.accountName }</td>
									<td style="text-align:right;">
										<fmt:formatNumber value="${data.monthToAmount }" pattern="#,###"></fmt:formatNumber>
									</td>
									<td style="text-align:right;">
										<fmt:formatNumber value="${data.amount }" pattern="#,###"></fmt:formatNumber>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<%-- 손익계산서 데이터 테이블 ENDS --%>

			<%-- 에러 모달 --%>
			<c:if test="${not empty param.error }">
				<input type="hidden" id="errorMessage" value="${param.error }"/>
			</c:if>

			<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel"></h5>
						</div>
						<div class="modal-body" id="staticBackdropBody"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-small" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>


		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
	$(function(){
		$(".chosen-select").chosen();

		// 모달 설정
		backdrop = $('#staticBackdrop')
		backdrop.modal({
			keyboard: false,
			show: false
		})

		// 에러 모달 연결
		var errorMessage = $('#errorMessage')
		if (errorMessage.val()) {
			openModal('Error', errorMessage.val())

			window.history.pushState({}, document.title, '${pageContext.request.contextPath }/17/64')
		}
	});

	// static backdrop modal
	var backdrop

	function openModal(title, message) {
		$('#staticBackdropLabel').text('Error')
		$('#staticBackdropBody').text(message)

		backdrop.modal('show')
	}
</script>
</body>
</html>
