<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" />
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
				<h1 class="pull-left">합계잔액시산표조회</h1>
			</div><!-- /.page-header -->

			<div class="row-fluid">
				<div class="span12">
					<h1 class="center">합계잔액시산표</h1>
				</div>
			</div>

			<%-- 결산일 선택 --%>
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
												<option value="${cd.no }" data-yearMonth="${cd.closingYearMonth }"  selected>${cd.closingYearMonth }</option>
											</c:when>
											<c:otherwise>
												<option value="${cd.no }">${cd.closingYearMonth }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>

								<%-- 조회버튼 --%>
								<button class="btn btn-small btn-info" id="search-btn">조회</button>
								<%-- 당월조회 --%>
								<%-- <button class="btn btn-small btn-info" id="month-btn" type="button" onclick="month_data();">당월조회</button> --%>
								<%-- 연도별조회 --%>
								<%-- <button class="btn btn-small btn-info" id="year-btn" type="button" onclick="year_data();">연도별조회</button> --%>
							    <%-- 전체조회 --%>
								<button class="btn btn-small btn-info" id="all-btn" type="button" onclick="all_data();">데이터 분석</button>
								
							</div>
						</div>
					</form>
				</div><!-- /.span -->
				<%-- 단위 표시 --%>
				<div class="span6">
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label" for="" style="float:right;">(단위: 원)</label>
						</div>
					</form>
				</div>
			</div><!-- /.row-fluid -->

			<%-- 시산표 데이터 테이블 --%>
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" colspan="3">차변</th>
								<th class="center" rowspan="2">계정과목</th>
								<th class="center" colspan="3">대변</th>
							</tr>
							<tr>
								<th class="center">당월</th>
								<th class="center">합계</th>
								<th class="center">잔액</th>
								<th class="center">잔액</th>
								<th class="center">합계</th>
								<th class="center">당월</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tb" items="${trialBalanceList }">
								<tr class="statement-${tb.statementYn }">
									<td class="debtor-spot-month" style="text-align:right;">
										<fmt:formatNumber value="${tb.debtorSpotMonth }" pattern="#,###"></fmt:formatNumber>
									</td>
									<td class="debtor-total" style="text-align:right;">
										<fmt:formatNumber value="${tb.debtorTotal }" pattern="#,###"></fmt:formatNumber>
									</td>
									<td class="debtor-balance" style="text-align:right;">
										<c:if test="${tb.balanceType eq 'D'}">
											<fmt:formatNumber value="${tb.debtorTotal - tb.creditTotal}" pattern="#,###"></fmt:formatNumber>
										</c:if>
									</td>
									<td class="center">${tb.accountName }</td>
									<td class="credit-balance" style="text-align:right;">
										<c:if test="${tb.balanceType eq 'C'}">
											<fmt:formatNumber value="${tb.creditTotal - tb.debtorTotal}" pattern="#,###"></fmt:formatNumber>
										</c:if>
									</td>
									<td class="credit-total" style="text-align:right;">
										<fmt:formatNumber value="${tb.creditTotal }" pattern="#,###"></fmt:formatNumber>
									</td>
									<td class="credit-spot-month" style="text-align:right;">
										<fmt:formatNumber value="${tb.creditSpotMonth }" pattern="#,###"></fmt:formatNumber>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td id="summary-debtor-spot-month" style="text-align:right;">0</td>
								<td id="summary-debtor-total" style="text-align:right;">0</td>
								<td id="summary-debtor-balance" style="text-align:right;">0</td>
								<td class="center">합계</td>
								<td id="summary-credit-balance" style="text-align:right;">0</td>
								<td id="summary-credit-total" style="text-align:right;">0</td>
								<td id="summary-credit-spot-month" style="text-align:right;">0</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<%-- 에러 모달  --%>
			<c:if test="${not empty param.error }">
				<input type="hidden" id="errorMessage" value="${param.error }"/>
			</c:if>

			<%-- <div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
			</div> --%>
			<div id="dialog-confirm" class="hide">
				<p id="dialog-txt" class="bolder grey"></p>
			</div>
			
			
			<div id="dd-select" title="그래프" hidden="hidden">
     		 <img src="http://192.168.1.25:8080/RImages/rdata6.png">
  			</div>


		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
	$(function(){
		$(".chosen-select").chosen();

		// 합계 계산
		calculateSummary()

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
	});

	// static backdrop modal
	var backdrop

	function openModal(title, message) {
		// $('#staticBackdropLabel').text('Error')
		// $('#staticBackdropBody').text(message)

		// backdrop.modal('show')

		dialog(message, true)
	}

	// 합계 저장용 변수
	var totalAmount = 0

	// 합계 계산
	function calculateSummary() {
		totalAmount = 0
		$('.statement-true .debtor-spot-month').each(summaryAmmount)
		$('#summary-debtor-spot-month').text(addComma(totalAmount))

		totalAmount = 0
		$('.statement-true .debtor-total').each(summaryAmmount)
		$('#summary-debtor-total').text(addComma(totalAmount))

		totalAmount = 0
		$('.statement-true .debtor-balance').each(summaryAmmount)
		$('#summary-debtor-balance').text(addComma(totalAmount))


		totalAmount = 0
		$('.statement-true .credit-spot-month').each(summaryAmmount)
		$('#summary-credit-spot-month').text(addComma(totalAmount))

		totalAmount = 0
		$('.statement-true .credit-total').each(summaryAmmount)
		$('#summary-credit-total').text(addComma(totalAmount))

		totalAmount = 0
		$('.statement-true .credit-balance').each(summaryAmmount)
		$('#summary-credit-balance').text(addComma(totalAmount))
	}

	// 합계 계산
	function summaryAmmount(index, item) {
		var c = $(item).text().trim().replace(/,/gi, '')
		totalAmount += Number(c)
	}

	// comma 추가
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}

	function dialog(txt, flag) {
		$("#dialog-txt").html(txt);
		var dialog = $( "#dialog-confirm" ).dialog({
			resizable: false,
			modal: true,
			buttons: [
				{
					text: "OK",
					"class" : "btn btn-danger btn-mini",
					click: function() {
						if(flag){
							$( this ).dialog( "close" );
							location.href="${pageContext.request.contextPath }/17/62";
						} else {
							$( this ).dialog( "close" );
						}
					}
				}
			]
		});
	}

	function month_data(){
		/*
    	var data = $('#year-month').find('option:selected').attr('data-yearMonth');	
    	console.log(data);
    	
		 $.ajax({
			    url: "http://192.168.1.23:7867/closingDataMonth?data="+ data,
			    type: "GET",
			    dataType: "json",
			    crossDomain:true
			 });
		*/
		 
    	
	}
	
	function year_data(){
    	var data = $('#year-month').find('option:selected').attr('data-yearMonth');	
    	//data = data.substring(0,4) + "%"
    	console.log(data);
    	
    	/*
		 $.ajax({
			    url: "http://192.168.1.23:7867/closingDataYear?data="+ data,
			    type: "GET",
			    dataType: "json",
			    crossDomain:true
			 });
		*/
	}
	
	
	function all_data(){
		
		 $.ajax({
			    url: "http://192.168.1.25:7867/closingDataYear",
			    type: "GET",
			    dataType: "json",
			    crossDomain:true
			 });
		 
		 $("#dd-select").dialog({
				autoOpen : false
			});
			
			$("#dd-select").dialog('open');
			$("#dd-select").dialog({
				title: "결산차트",
				title_html: true,
				resizable: false,
				height: 1000,
				width: 1200,
				modal: true,
				close: function() {
				},
             buttons: {
             "닫기":function() {
             	$(this).dialog('close');
             	}
				}
			});
	}
	
</script>
</body>
</html>
