<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">




			<div class="page-header position-relative">
				<h1 class="pull-left">마감일자관리[19] list</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<%-- 마감일자 입력폼 --%>
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="test-form" action="${pageContext.request.contextPath }/17/19/add" method="post">
						<input type="hidden" type="text" name="no" id="cl-no"/>
						<input type="hidden" type="text" id="cl-yn"/>
						<div class="row-fluid">
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-ym-date-picker" style="text-align:left;width:120px;">년 월:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker" id="cl-ym-date-picker" name="closingYearMonth" type="text" data-date-format="yyyy-mm" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div><!-- /row -->
						<div class="row-fluid">
							<%-- 전체 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-total-date-picker" style="text-align:left;width:120px;">전체 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-total-date-picker" name="closingDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 자산 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-assets-date-picker" style="text-align:left;width:120px;">자산 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-assets-date-picker" name="closingAssetsDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 부채 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-debt-date-picker" style="text-align:left;width:120px;">부채 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-debt-date-picker" name="closingDebtDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 줄바꿈 --%>
						</div>
						<div class="row-fluid">
							<%-- 전표 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-stmt-date-picker" style="text-align:left;width:120px;">전표 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-stmt-date-picker" name="closingStatementDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 매입 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-purchase-date-picker" style="text-align:left;width:120px;">매입 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-purchase-date-picker" name="closingPurchaseDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- 매출 마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-sales-date-picker" style="text-align:left;width:120px;">매출 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-sales-date-picker" name="closingSalesDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
							<%-- 줄바꿈 --%>
						<div class="row-fluid">
							<%-- 결산마감일 --%>
							<div class="span4">
								<div class="control-group">
									<label class="control-label" for="cl-settlement-date-picker" style="text-align:left;width:120px;">결산 마감일:</label>
									<div class="controls" style="margin-left:120px;">
										<div class="row-fluid input-append">
											<input class="span11 date-picker cl-date-picker" id="cl-settlement-date-picker" name="closingSettlementDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>

					<%-- 구분선 --%>
					<div class="hr hr-18 dotted"></div>
						<%-- 입력수정삭제버튼 --%>
						<div class="row-fluid">
							<div class="span12">
								<%-- <button class="btn btn-info btn-small" style="margin-right:20px;">조회</button> --%>
								<button class="btn btn-primary btn-small" style="margin-right:20px;" id="submit-btn">입력</button>
								<button class="btn btn-warning btn-small" style="margin-right:20px; display:none;" id="update-btn">수정</button>
								<button class="btn btn-danger btn-small" style="margin-right:20px; display:none;" id="delete-btn">삭제</button>
								<button class="btn btn-small" style="margin-right:20px;" id="reset-btn">리셋</button>
							</div>
						</div>
					<div class="hr hr-18 dotted"></div>

					<%-- 마감일 조회 테이블 --%>
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
									<c:forEach var="cdt" items="${closingDateList }">
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
														결산완료
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
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
						</ul>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script>
	$(function() {
		// 데이트피커 한글설정
		$.fn.datepicker.dates['ko'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			today: "Today",
			clear: "Clear",
			format: "yyyy-mm-dd",
			titleFormat: "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart: 0
		};

		// 년월 설정 데이트피커
		$('#cl-ym-date-picker').datepicker({
			maxViewMode: 4,
			minViewMode: 1,
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});

		// 년월일 설정 데이트피커
		$('.cl-date-picker').datepicker({
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});


		// 버튼 prevent default 설정
		$('button').on('click', disableFormSubmit)

		// 입력버튼 이벤트 연결
		$('#submit-btn').on('click', saveClosingDate)

		// 수정버튼 이벤트 연결
		$('#update-btn').on('click', updateClosingDate)

		// 삭제버튼 이벤트 연결
		$('#delete-btn').on('click', deleteClosingDate)

		// 리셋버튼 이벤트 연결
		$('#reset-btn').on('click', clearForm)

		// 마감일 클릭 시 입력폼에 마감일 설정
		$('.cdt-tr').on('click', setClosingDate)
	})

	// 버튼 prevent default 설정
	function disableFormSubmit(event) {
		event.preventDefault();
	}

	// 마감일 신규 등록
	function saveClosingDate(event) {
		console.log(getClosingDates());

		var form = $('#test-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/19/add')
		form.submit()
	}

	// 마감일 입력 데이터 객체화
	function getClosingDates() {
		var closingDates;

		closingDates = {
			no: $('#cl-no').val(),
			closingYearMonth: $('#cl-ym-date-picker').val(),
			closingDates: $('#cl-total-date-picker').val(),
			closingStatementDate: $('#cl-stmt-date-picker').val(),
			closingPurchaseDate: $('#cl-purchase-date-picker').val(),
			closingSalesDate: $('#cl-sales-date-picker').val(),
			closingAssetsDate: $('#cl-assets-date-picker').val(),
			closingDebtDate: $('#cl-debt-date-picker').val(),
			closingSettlementDate: $('#cl-settlement-date-picker').val()
		}

		return closingDates
	}

	// 마감일 선택시 - 입력롬에 선택된 마감일 정보 등록
	function setClosingDate(event) {
		$('#cl-no').val($(this).attr('no'))
		$('#cl-yn').val($(this).attr('closing-yn'))
		$('#cl-ym-date-picker').val($(this).find('.closing-year-month').text()),
		$('#cl-total-date-picker').val($(this).find('.closing-date').text()),
		$('#cl-stmt-date-picker').val($(this).find('.closing-statement-date').text()),
		$('#cl-purchase-date-picker').val($(this).find('.closing-purchase-date').text()),
		$('#cl-sales-date-picker').val($(this).find('.closing-sales-date').text()),
		$('#cl-assets-date-picker').val($(this).find('.closing-assets-date').text()),
		$('#cl-debt-date-picker').val($(this).find('.closing-debt-date').text()),
		$('#cl-settlement-date-picker').val($(this).find('.closing-settlement-date').text())

		// 입력상태 변경
		changeStatus()
	}

	// 입력폼 데이터 리셋
	function clearForm() {
		$('#cl-no').val('')
		$('#cl-yn').val('')
		$('#cl-ym-date-picker').val(''),
		$('#cl-total-date-picker').val(''),
		$('#cl-stmt-date-picker').val(''),
		$('#cl-purchase-date-picker').val(''),
		$('#cl-sales-date-picker').val(''),
		$('#cl-assets-date-picker').val(''),
		$('#cl-debt-date-picker').val(''),
		$('#cl-settlement-date-picker').val('')

		// 입력상태 변경
		changeStatus()
	}

	// 마감일 수정
	function updateClosingDate() {
		console.log('updateClosingDate');

		var form = $('#test-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/19/update')
		form.submit()
	}

	// 마감일 삭제
	function deleteClosingDate() {
		console.log('deleteClosingDate');
		var form = $('#test-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/19/delete')
		form.submit()
	}

	// 마감일 신규등록, 수정상태 변경 - 상태에 따른 버튼 출력
	function changeStatus(event) {
		if ($('#cl-no').val()) {			// 마감일 번호 존재시
			$('#submit-btn').hide()
			if ($('#cl-yn').val() == 'false') {		// 결산 미완료시 수정, 삭제 버튼 노출
				$('#update-btn').show()
				$('#delete-btn').show()
			}
		} else {											// 마감일 번호 미존재시
			$('#update-btn').hide()
			$('#delete-btn').hide()
			$('#submit-btn').show()
		}
	}
</script>
</body>
</html>
