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
		<div class="page-content" id="pg-content">




			<div class="page-header position-relative">
				<h1 class="pull-left">마감일자관리[19] list</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<%-- 마감일자 입력폼 --%>
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="closing-date-form" action="${pageContext.request.contextPath }/17/19/add" method="post">
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

					<%-- 총 게시글 수 출력 --%>
					<div class="row-fluid">
						<div class="span6" style="text-align:left;">
							<h6>총 ${dataResult.pagination.totalCnt }건</h6>
						</div>
						<div class="span6" style="text-align:right;">
						</div>
					</div>

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
							<c:choose>
								<c:when test="${dataResult.pagination.prev }">
									<li><a href="${pageContext.servletContext.contextPath }/17/19/list?page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
								<c:choose>
									<c:when test="${pg eq dataResult.pagination.page }">
										<li class="active"><a href="${pageContext.servletContext.contextPath }/17/19/list?page=${pg }">${pg }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.servletContext.contextPath }/17/19/list?page=${pg }">${pg }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li><a href="${pageContext.servletContext.contextPath }/17/19/list?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->


			<%-- 에러 모달  --%>
			<c:if test="${not empty param.error }">
				<input type="hidden" id="errorMessage" value="${param.error }"/>
			</c:if>

			<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="margin-top: 180px;">
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

		// 모달 설정
		backdrop = $('#staticBackdrop')
		backdrop.modal({
			keyboard: false,
			show: false
		})

		// 에러 모달 설정
		var errorMessage = $('#errorMessage')
		if (errorMessage.val()) {
			openModal('Error', errorMessage.val())

			window.history.pushState({}, document.title, '${pageContext.request.contextPath }/17/19/list')
		}
	})

	// static backdrop modal
	var backdrop

	function openModal(title, message) {
		$('#staticBackdropLabel').text('Error')
		$('#staticBackdropBody').text(message)

		backdrop.modal('show')
	}

	// 버튼 prevent default 설정
	function disableFormSubmit(event) {
		event.preventDefault();
	}

	var validationMessage = ''

	// validation check
	function saveValidation() {
		// let no = $('#cl-no').val()
		let yearMonth = $('#cl-ym-date-picker').val()
		let totalDate = $('#cl-total-date-picker').val()
		let statementDate = $('#cl-stmt-date-picker').val()
		let purchaseDate = $('#cl-purchase-date-picker').val()
		let salesDate = $('#cl-sales-date-picker').val()
		let assetsDate = $('#cl-assets-date-picker').val()
		let debtDate = $('#cl-debt-date-picker').val()
		let settlementDate = $('#cl-settlement-date-picker').val()

		if (!yearMonth) {
			validationMessage = '년월을 입력해주세요.'
			return false;
		} else if (!totalDate) {
			validationMessage = '최종 마감일을 입력해주세요.'
			return false
		} else if (!statementDate) {
			validationMessage = '전표 마감일을 입력해주세요.'
			return false
		} else if (!purchaseDate) {
			validationMessage = '매입 마감일을 입력해주세요.'
			return false
		} else if (!salesDate) {
			validationMessage = '매출 마감일을 입력해주세요.'
			return false
		} else if (!assetsDate) {
			validationMessage = '자산 마감일을 입력해주세요.'
			return false
		} else if (!debtDate) {
			validationMessage = '부채 마감일을 입력해주세요.'
			return false
		} else if (!settlementDate) {
			validationMessage = '결산 마감일을 입력해주세요.'
			return false
		}

		// 최종마감일과 비교
		var baseDateArr = totalDate.split('-')
		var baseDate = new Date(baseDateArr[0], parseInt(baseDateArr[1])-1, baseDateArr[2]);

		var compareDateArr
		var compareDate

		// 전표 마감일 비교
		compareDateArr = statementDate.split('-')
		compareDate = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);
		if (compareDate.getTime() > baseDate.getTime()) {
			validationMessage = '전표마감일이 최종마감일보다 늦을 수 없습니다.'
			return false
		}
		// 매입 마감일 비교
		compareDateArr = purchaseDate.split('-')
		compareDate = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);
		if (compareDate.getTime() > baseDate.getTime()) {
			validationMessage = '매입마감일이 최종마감일보다 늦을 수 없습니다.'
			return false
		}
		// 매출 마감일 비교
		compareDateArr = salesDate.split('-')
		compareDate = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);
		if (compareDate.getTime() > baseDate.getTime()) {
			validationMessage = '매출마감일이 최종마감일보다 늦을 수 없습니다.'
			return false
		}
		// 자산 마감일 비교
		compareDateArr = assetsDate.split('-')
		compareDate = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);
		if (compareDate.getTime() > baseDate.getTime()) {
			validationMessage = '자산마감일이 최종마감일보다 늦을 수 없습니다.'
			return false
		}
		// 부채 마감일 비교
		compareDateArr = debtDate.split('-')
		compareDate = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);
		if (compareDate.getTime() > baseDate.getTime()) {
			validationMessage = '부채마감일이 최종마감일보다 늦을 수 없습니다.'
			return false
		}
		// 결산 마감일 비교
		compareDateArr = settlementDate.split('-')
		compareDate = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);
		if (compareDate.getTime() > baseDate.getTime()) {
			validationMessage = '결산마감일이 최종마감일보다 늦을 수 없습니다.'
			return false
		}

		return true
	}

	// 수정 validation
	function updateValidation() {
		if (!deleteValidation() || !saveValidation()) {
			return false
		}

		return true
	}

	// 삭제 validation
	function deleteValidation() {
		let no = $('#cl-no').val()
		let noRegex = /^[0-9]{1,9}$/

		if (!no || no.length > 9 || !noRegex.test(no)) {
			validationMessage = '마감일 번호가 올바르지 않습니다.'
			return false
		}

		return true
	}

	// 마감일 신규 등록
	function saveClosingDate(event) {
		var form = $('#closing-date-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/19/add')

		if (!saveValidation()) {
			openModal('Error', validationMessage)
			return false
		}

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

	// 선택한 마감일이 수정 가능한 마감일인지 조회
	function isChangable(closingDate) {
		$.ajax({
			url: '${pageContext.request.contextPath }/17/19/api/changable',
			data: closingDate,
			method: 'post',
			success: function(response) {
				if (response.status == true) {
					updateAndDeleteAndResetButton()
				} else {
					hideAllButton()
				}
			}
		})
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

		if ($(this).attr('closing-yn') == 'true') {
			// api 호출
			var closingDate = {
				no: $(this).attr('no'),
				closingYearMonth: $(this).find('.closing-year-month').text()
			}
			isChangable(closingDate)
		} else {
			// 미결산 마감일 수정 가능
			updateAndDeleteAndResetButton()
		}
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
		submitAndResetButton()
	}

	// 마감일 수정
	function updateClosingDate() {
		var form = $('#closing-date-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/19/update')

		if (!updateValidation()) {
			openModal('Error', validationMessage)
			return false
		}

		form.submit()
	}

	// 마감일 삭제
	function deleteClosingDate() {
		var form = $('#closing-date-form')[0]
		$(form).attr('action', '${pageContext.request.contextPath }/17/19/delete')

		if (!deleteValidation()) {
			openModal('Error', validationMessage)
			return false
		}

		form.submit()
	}


	// 마감일 상태에 따른 버튼 변경
	// 수정, 삭제, 리셋 버튼
	function updateAndDeleteAndResetButton() {
		$('#update-btn').show()
		$('#delete-btn').show()
		$('#submit-btn').hide()
	}

	// 리셋 버튼
	function hideAllButton() {
		$('#update-btn').hide()
		$('#delete-btn').hide()
		$('#submit-btn').hide()
	}

	// 등록, 리셋 버튼
	function submitAndResetButton() {
		$('#update-btn').hide()
		$('#delete-btn').hide()
		$('#submit-btn').show()
	}
</script>
</body>
</html>
