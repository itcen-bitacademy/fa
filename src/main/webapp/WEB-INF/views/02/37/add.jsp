<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
/* 스크롤 깨짐 css s */
html, body {
	overflow-x: hidden;
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
/* 스크롤 깨짐 css e */
/* table css s*/
#item-table tr td {
	overflow: hidden;
	padding: 0;
}

#item-table tr td p {
	padding: 7px;
	margin: 0;
}

#item-table tr td input {
	padding: 7px;
	margin: 0;
	width: 95.5%;
	border: 0
}

.chosen-single {
	margin-top: 4px;
}

.chosen-container {
	width: 200px !important;
}

.chosen-container-single .chosen-search:before {
	display: none
}

.chosen-container-single .chosen-search:after {
	display: none
}
/* table css e*/
/* 기타 css s*/
.control-label {
	margin-top: 4px;
}
/* 기타 css e*/
</style>
</head>
<body class="skin-3" onload="startFunctions();">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">매입세금계산서관리</h1>
				</div>
				<form id="manage-form" method="post"
					action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
					<!-- /.page-header -->
					<div class="row-fluid">
						<div class="span12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="control-group">
								<label class="control-label span1" for="no">승인번호</label>
								<div class="controls span5">
									<c:choose>
										<c:when test="${flag == 'true'}">
											<input style="display: none;" id="hidden-no"
												value="${getAboutNoData.no }" />
											<input style="width: 100%" type="text" id="no" name="no"
												value="${getAboutNoData.no }"
												placeholder="ex) 20190420-44231234-57644467"
												autocomplete="off" onclick="impossible_no();" />
										</c:when>
										<c:otherwise>
											<input style="width: 100%" type="text" id="no" name="no"
												value="${getAboutNoData.no }"
												placeholder="ex) 20190420-44231234-57644467"
												autocomplete="off" maxlength="26" />
										</c:otherwise>
									</c:choose>
								</div>
								<label class="control-label span1" for="manage-no">관리번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="manage-no"
										value="${getAboutNoData.manageNo }" name="manageNo"
										placeholder="ex) TX2019116301143" autocomplete="off"
										maxlength="20" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label span1" for="customer-no">등록번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="customer-no"
										value="${getAboutNoCustomerData.no }" name="id"
										autocomplete="off" readonly />
								</div>
								<label class="control-label span1" for="deposit-no">계좌번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="deposit-no"
										value="${getAboutNoBankData.depositNo }" name="id"
										autocomplete="off" readonly />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label span1" for="company-name">거래처명</label>
								<div class="controls span2">
									<select id="company-name" class="chosen-select"
										name="companyName" onchange="load_customer_imfo();" required>
										<c:choose>
											<c:when test="${flag == 'true'}">
												<option value="${getAboutNoCustomerData.name }" selected
													style="display: none">${getAboutNoCustomerData.name }</option>
											</c:when>
											<c:otherwise>
												<option selected>없음</option>
											</c:otherwise>
										</c:choose>

										<c:forEach items="${customerList }" var="list"
											varStatus="status">
											<option id="${status }" value="${list.name }">${list.name }</option>
										</c:forEach>
									</select>
								</div>
								<label class="control-label span1" for="customer-name">성명</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="customer-name"
										value="${getAboutNoCustomerData.ceo }" name="id"
										autocomplete="off" autocomplete="off" readonly />
								</div>
								<label class="control-label span1" for="deposit-host">예금주</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="deposit-host"
										value="${getAboutNoCustomerData.depositHost }"
										autocomplete="off" readonly />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label span1" for="customer-address">주소</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="customer-address"
										value="${getAboutNoCustomerData.address }" name="id"
										autocomplete="off" readonly />
								</div>
								<label class="control-label span1" for="bank">은행</label>
								<div class="controls span5">
									<div class="controls span2">
										<input style="width: 80%" type="text" id="bank-code"
											value="${getAboutNoBankData.bankCode }" name="id"
											autocomplete="off" readonly />
									</div>
									<div class="controls span3">
										<input style="width: 100%" type="text" id="bank-name"
											value="${getAboutNoBankData.bankName }" name="id"
											autocomplete="off" readonly />
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label span1" for="conditions">업태</label>
								<div class="controls span2">
									<input style="width: 93%;" type="text" id="conditions"
										value="${getAboutNoCustomerData.conditions }" name="id"
										autocomplete="off" readonly />
								</div>
								<label class="control-label span1" for="items">종목</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="items" name="id"
										value="${getAboutNoCustomerData.item }" autocomplete="off"
										readonly />
								</div>
								<label class="control-label span1" for="taxType">과세구분</label>
								<div class="controls span2">
									<c:choose>
										<c:when test="${flag == 'true'}">
											<c:choose>
												<c:when test="${getAboutNoData.taxType == 'zero'}">
													<label style="display: inline"> <input
														name="taxType" type="radio" value="tax" class="ace">
														<span class="lbl">과세</span>
													</label>
													<label style="display: inline"> <input
														name="taxType" type="radio" value="zero" class="ace"
														checked> <span class="lbl">영세</span>
													</label>
												</c:when>
												<c:otherwise>
													<label style="display: inline"> <input
														name="taxType" type="radio" value="tax" class="ace"
														checked> <span class="lbl">과세</span>
													</label>
													<label style="display: inline"> <input
														name="taxType" type="radio" value="zero" class="ace">
														<span class="lbl">영세</span>
													</label>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<label style="display: inline"> <input name="taxType"
												type="radio" value="tax" class="ace" checked> <span
												class="lbl">과세</span>
											</label>
											<label style="display: inline"> <input name="taxType"
												type="radio" value="zero" class="ace"> <span
												class="lbl">영세</span>
											</label>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- 필요한 hiiden값-->
								<div class="controls span3">
									<input style="width: 100%" type="hidden" id="insertUserid"
										name="insertUserid" value="${getAboutNoData.insertUserid }" />
									<input style="width: 100%" type="hidden" id="insertDay"
										name="insertDay" value="${getAboutNoData.insertDay }" />
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
								<label class="control-label span1" for="id-date-picker-1">일자</label>
								<div class="controls span3">
									<div class="input-append" style="width: 100%">
										<input id="id-date-picker-1" class="calender"
											value="${getAboutNoData.writeDate }" name="writeDate"
											type="text" autocomplete="off"> <span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
								</div>
								<label class="control-label span1" for="form-field-14">총
									공급가액</label>
								<div class="controls span3">
									<input style="width: 100%; text-align: right;" type="text"
										id="form-field-14"
										value="<fmt:formatNumber value="${getAboutNoData.totalSupplyValue }" pattern="#,###"/>"
										name="totalSupplyValue" autocomplete="off" placeholder="0"
										readonly />
								</div>
								<label class="control-label span1" for="form-field-15">총
									세액</label>
								<div class="controls span3">
									<input style="width: 100%; text-align: right;" type="text"
										id="form-field-15"
										value="<fmt:formatNumber value="${getAboutNoData.totalTaxValue }"
										pattern="#,###"/>"
										name="totalTaxValue" autocomplete="off" placeholder="0"
										readonly />
								</div>
							</div>
						</div>
					</div>
					<div class="hr hr-10 dotted"></div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
								<div class="btn-group">
									<button class="btn btn-primary btn-small" type="button"
										onclick="insert_button();">입력</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-warning btn-small" type="button"
										onclick="update_button();">수정</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-danger btn-small" type="button"
										onclick="delete_button();">삭제</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-info btn-small" type="button"
										onclick="lookup_button();">조회</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-default btn-small" type="button"
										onclick="add_row();">품목추가</button>

								</div>
								<div class="btn-group">
									<button class="btn btn-default btn-small" type="button"
										onclick="delete_row();">품목삭제</button>
								</div>
							</div>
							<div class="hr hr-10 dotted"></div>
							<div class="control-group">
								<table id="item-table"
									class="table table-striped table-bordered table-hover">
									<tr>
										<th>순번</th>
										<th>매입일자</th>
										<th>품목명</th>
										<th>수량</th>
										<th>공급가액</th>
										<th>부가세</th>
									</tr>
									<c:choose>
										<c:when test="${flag == 'true'}">
											<c:forEach items="${getAboutItmesList }" var="items"
												varStatus="status">
												<tr>
													<td><p>${status.count }</p></td>
													<td><input type="text" id="date${status.count }"
														class="calender" name="purchaseDate"
														value="${items.purchaseDate }" autocomplete="off"></td>
													<td><input type="text" id="item${status.count }"
														name="itemName" value="${items.itemName }"
														autocomplete="off"></td>
													<td><input style="text-align: right;" type="text"
														id="amount${status.count }" name="amount"
														value="${items.amount }" onkeyup="sumAllSupplyAllTax();"
														placeholder="0" autocomplete="off"></td>
													<td><input style="text-align: right;" type="text"
														id="supply-value${status.count }"
														onkeyup="sumAllSupplyAllTax();" name="supplyValue"
														value="<fmt:formatNumber value="${items.supplyValue }" pattern="#,###"/>"
														placeholder="0" autocomplete="off"></td>
													<td><input style="text-align: right;" type="text"
														id="tax-value${status.count }" name="taxValue"
														value="<fmt:formatNumber value="${items.taxValue }" pattern="#,###"/>"
														placeholder="0" onkeyup="sumAllSupplyAllTax();"
														autocomplete="off"></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td><p>1</p></td>
												<td><input type="text" id="date1" class="calender"
													name="purchaseDate" autocomplete="off"></td>
												<td><input type="text" id="item1" name="itemName"
													autocomplete="off"></td>
												<td><input style="text-align: right;" type="text"
													id="amount1" name="amount" onkeyup="sumAllSupplyAllTax();"
													placeholder="0" autocomplete="off"></td>
												<td><input style="text-align: right;" type="text"
													id="supply-value1" onkeyup="sumAllSupplyAllTax();"
													placeholder="0" name="supplyValue" autocomplete="off"></td>
												<td><input style="text-align: right;" type="text"
													id="tax-value1" name="taxValue" placeholder="0"
													onkeyup="sumAllSupplyAllTax();" autocomplete="off"></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>

							<!-- PAGE CONTENT ENDS -->
						</div>
					</div>
				</form>
				<div id="dialog-confirm" class="hide">
					<p id="dialog-txt" class="bolder grey"></p>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.span -->
	</div>
	<!-- /.row-fluid -->
	<!-- /.page-content -->
	<!-- /.main-content -->
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
	<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

	<!-- 페이지로드될 때 발생하는 script함수 -->  
	<script>
		function startFunctions() {
			addElementCommas();
			addElementCalender();
			if('${insertFlag }'){
				checkDuplicateNo();
			}
			if('${searchFlag }'){
				checkSearchNo();
			}
			if('${deleteFlag }'){
				checkDeleteNo();
			}
			
		}
	</script>
	<!-- 거래처명 찾기기능 -->
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(".chosen-select").chosen();
	</script>
	<!-- 달련 관련 script -->
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
		function addElementCalender() {
			$('#id-date-picker-1').datepicker({
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			for (var i = 1; i <= $("#item-table tr").length - 1; i++) {
				$("#date" + i).datepicker({
					language : 'ko'
				}).next().on(ace.click_event, function() {
					$(this).prev().focus();
				});
			}
		}
		$.fn.datepicker.dates['ko'] = {
			days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
			monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			today : "Today",
			clear : "Clear",
			format : "yyyy-mm-dd",
			titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart : 0
		};
	</script>
	<script>
		// 품목 행 추가할 때
		function add_row() {
			var table = document.getElementById("item-table");
			var cnt = table.rows.length;
			var row = table.insertRow(cnt);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			cell1.innerHTML = '<td><p>' + cnt + '</p></td>';
			cell2.innerHTML = '<td><input type="text" id="date'+cnt+'" class="calender" name="purchaseDate" autocomplete="off"></td>';
			cell3.innerHTML = '<td><input type="text" id="item'+cnt+'" name="itemName" autocomplete="off"></td>';
			cell4.innerHTML = '<td><input style="text-align:right;" type="text" id="amount'
					+ cnt
					+ '" name="amount" onkeyup="sumAllSupplyAllTax();" placeholder="0" autocomplete="off"></td>';
			cell5.innerHTML = '<td><input style="text-align:right;" type="text" id="supply-value'
					+ cnt
					+ '"name="supplyValue" onkeyup="sumAllSupplyAllTax();" placeholder="0" autocomplete="off"></td>';
			cell6.innerHTML = '<td><input style="text-align:right;" type="text" id="tax-value'
					+ cnt
					+ '"name="taxValue" onkeyup="sumAllSupplyAllTax();" placeholder="0" autocomplete="off"></td>';
			cnt++;
			addElementCommas();
			addElementCalender();
		}
		// 품목 행 삭제할 때 
		function delete_row() {
			var table = document.getElementById('item-table');
			var cnt = table.rows.length;
			if (table.rows.length < 3) {
				return;
			} else {
				cnt--;
				table.deleteRow(table.rows.length - 1);
			}
			addElementCommas();
			sumAllSupplyAllTax();
		}
		// 금액이 콤마 생기고, focus없어지면 콤마 사라지게 하는 부분
		function addElementCommas() {
			for (var i = 1; i <= $("#item-table tr").length - 1; i++) {
				$("#supply-value" + i).on(
						'keyup',
						function(event) {
							$(this).val(
									addCommas($(this).val().replace(/[^0-9]/g,
											"")));
						});
				$("#tax-value" + i).on(
						'keyup',
						function(event) {
							$(this).val(
									addCommas($(this).val().replace(/[^0-9]/g,
											"")));
						});
			}
		}
		function addCommas(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function numberFormat(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		//품목들의 수량과 공급가액 or 세액을 계산하여 총 공급가액 or 총 세액에 기입해주는 부분
		function sumAllSupplyAllTax() {
			var supplySum = 0;
			var taxSum = 0;
			for (var i = 1; i <= $("#item-table tr").length - 1; i++) {
				var supplyValue = document.getElementById('supply-value' + i).value;
				var taxValue = document.getElementById('tax-value' + i).value;
				var amount = document.getElementById('amount' + i).value;
				supplyValue = supplyValue.replace(/,/g, "");
				taxValue = taxValue.replace(/,/g, "");
				supplySum = supplySum + (supplyValue * amount);
				taxSum = taxSum + (taxValue * amount);
			}
			document.getElementById('form-field-14').value = numberFormat(supplySum);
			document.getElementById('form-field-15').value = numberFormat(taxSum);
		}
		// 거래처 이름을 받으면 관련된 정보를 땡겨오는 부분
		function load_customer_imfo() {
			var company_name = document.getElementById("company-name").value;
			var deposit_no;
			alert('"' + company_name + '"과(와) 관련된 정보를 가져옵니다.');

			$("#customer-name").val("");
			$("#customer-address").val("");
			$("#conditions").val("");
			$("#items").val("");
			$("#customer-no").val("");
			$("#deposit-no").val("");
			$("#deposit-host").val("");
			$("#bank-code").val("");
			$("#bank-name").val("");

			<c:forEach items="${customerList }" var="list" varStatus="status">
			if (company_name == "${list.name }") {
				$("#customer-name").val("${list.ceo}");
				$("#customer-address").val("${list.address}");
				$("#conditions").val("${list.conditions}");
				$("#items").val("${list.item}");
				$("#customer-no").val("${list.no}");
				deposit_no = "${list.depositNo }";
			}
			</c:forEach>
			<c:forEach items="${customerBankList }" var="list" varStatus="status">
			if (deposit_no == "${list.depositNo}") {
				$("#deposit-no").val("${list.depositNo}");
				$("#deposit-host").val("${list.depositHost}");
				$("#bank-code").val("${list.bankCode}");
				$("#bank-name").val("${list.bankName}");
			}
			</c:forEach>

		}
		// back단으로 넘길 때 콤마를 없애서 보내준다.
		function prevent_commas_error() {
			var totalSupplyValue = $("#form-field-14").val();
			var totalTaxValue = $("#form-field-15").val();

			totalSupplyValue = totalSupplyValue.replace(/,/gi, "");
			totalTaxValue = totalTaxValue.replace(/,/gi, "");

			$("#form-field-14").val(totalSupplyValue);
			$("#form-field-15").val(totalTaxValue);

			for (var i = 1; i < $("#item-table tr").length; i++) {
				var supplyValue = $("#supply-value" + i).val();
				var taxValue = $("#tax-value" + i).val();
				supplyValue = supplyValue.replace(/,/gi, "");
				taxValue = taxValue.replace(/,/gi, "");
				$("#supply-value" + i).val(supplyValue);
				$("#tax-value" + i).val(taxValue);
			}
		}
		// 삭제했을 때 세금계산서 번호가 없는 것을 체크할 떄
		function checkDeleteNo(){
			dialog("※주의<br /><br />없는 세금계산서 번호입니다.<br />세금계산서 번호를 다시한번 확인해주시기를 바랍니다.");
		}
		// 조회했을 때 세금계산서 번호가 없는 것을 체크할 때
		function checkSearchNo(){
			dialog("※주의<br /><br />없는 세금계산서 번호입니다.<br />세금계산서 번호를 다시한번 확인해주시기를 바랍니다.");
		}
		// 세금계산서 중복 dialog
		function checkDuplicateNo(){
			dialog("※주의<br /><br />중복된 세금계산서 번호가 있습니다.<br />세금계산서 번호를 다시한번 확인해주시기를 바랍니다.");
		}
		
		// 세금계산서 수정 불가 alert
		function impossible_no() {
			dialog("※주의<br /><br />세금계산서 번호는 수정할 수 없습니다.<br />수정을 원하시면 삭제 후 재입력 해주시기를 바랍니다.");
		}
		
		// 입력버튼 클릭시 
		function insert_button() {

			prevent_commas_error();

			if (!valid.nullCheck("no", "승인번호"))
				return; // 승인번호 널 체크
			if (!valid.nullCheck("manage-no", "관리번호"))
				return; // 관리번호 널 체크
			if (!valid.nullCheck("customer-no", "등록번호"))
				return; // 등록번호 널 체크
			if (!valid.nullCheck("deposit-no", "계좌번호"))
				return; // 계좌번호 널 체크
			if (!valid.nullCheck("customer-name", "성명"))
				return; // 성명 널 체크
			if (!valid.nullCheck("deposit-host", "예금주"))
				return; // 예금주 널 체크
			if (!valid.nullCheck("customer-address", "주소"))
				return; // 주소 널 체크
			if (!valid.numberCheck("bank-code", "은행코드"))
				return; // 은행코드 널 체크
			if (!valid.nullCheck("bank-name", "은행이름"))
				return; // 은행이름 널 체크
			if (!valid.nullCheck("conditions", "업태"))
				return; // 업태 널 체크
			if (!valid.nullCheck("items", "종목"))
				return; // 종목 널 체크
			if (!valid.nullCheck("id-date-picker-1", "일자"))
				return; // 일자 널 체크

			for (var i = 1; i <= $("#item-table tr").length - 1; i++) {
				if (!valid.nullCheck("date" + i, "매입일자"))
					return;
				if (!valid.nullCheck("item" + i, "품목명"))
					return;
				if (!valid.numberCheck("amount" + i, "수량"))
					return;
				if (!valid.numberCheck("supply-value" + i, "공급가액"))
					return;
				if (!valid.numberCheck("tax-value" + i, "부가세"))
					return;
			}

			$("#manage-form")
					.attr(
							"action",
							"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add")
					.submit();

		}

		// 수정버튼 클릭시 
		function update_button() {

			prevent_commas_error();

			if (!valid.nullCheck("no", "승인번호"))
				return; // 승인번호 널 체크
			if (!valid.nullCheck("manage-no", "관리번호"))
				return; // 관리번호 널 체크
			if (!valid.nullCheck("customer-no", "등록번호"))
				return; // 등록번호 널 체크
			if (!valid.nullCheck("deposit-no", "계좌번호"))
				return; // 계좌번호 널 체크
			if (!valid.nullCheck("customer-name", "성명"))
				return; // 성명 널 체크
			if (!valid.nullCheck("deposit-host", "예금주"))
				return; // 예금주 널 체크
			if (!valid.nullCheck("customer-address", "주소"))
				return; // 주소 널 체크
			if (!valid.numberCheck("bank-code", "은행코드"))
				return; // 은행코드 널 체크
			if (!valid.nullCheck("bank-name", "은행이름"))
				return; // 은행이름 널 체크
			if (!valid.nullCheck("conditions", "업태"))
				return; // 업태 널 체크
			if (!valid.nullCheck("items", "종목"))
				return; // 종목 널 체크
			if (!valid.nullCheck("id-date-picker-1", "일자"))
				return; // 일자 널 체크

			for (var i = 1; i <= $("#item-table tr").length - 1; i++) {
				if (!valid.nullCheck("date" + i, "매입일자"))
					return;
				if (!valid.nullCheck("item" + i, "품목명"))
					return;
				if (!valid.numberCheck("amount" + i, "수량"))
					return;
				if (!valid.numberCheck("supply-value" + i, "공급가액"))
					return;
				if (!valid.numberCheck("tax-value" + i, "부가세"))
					return;
			}
			
			if($("#hidden-no").val() != $("#no").val()) {
				impossible_no();
				return;
			}
			$("#manage-form")
					.attr(
							"action",
							"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update")
					.submit();
		}

		// 삭제버튼 클릭시 
		function delete_button() {
			if ($("#no").val() == "") {
				dialog("승인번호를 입력 후 삭제해주시기를 바랍니다.");
				return;
			} else {
				$("#manage-form")
						.attr(
								"action",
								"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete")
						.submit();
			}
		}

		// 조회버튼 클릭시 
		function lookup_button() {
			if ($("#no").val() == "") {
				dialog("승인번호를 입력 후 조회해주시기를 바랍니다.");
				return;
			} else {
				$("#manage-form")
						.attr(
								"action",
								"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/lookUp")
						.submit();
			}

		}
	</script>

	<!-- 유효성 검사 -->
	<script>
		var valid = {
			nullCheck : function(id, msg) { // null 체크
				if ($("#" + id).val() == "") {
					dialog(msg + " 을(를) 입력 해 주세요.");
					return false;
				} else {
					return true;
				}
			},
			numberCheck : function(id, msg) { // 숫자 체크
				if (!$.isNumeric($("#" + id).val())) {
					dialog(msg + "은(는) 숫자만 입력 가능합니다.");
					$("#" + id).focus();
					return false;
				} else {
					return true;
				}
			}

		}

		// 유효성 검사시 Dialog Popup 창이 모달로 떠오르게 되는 소스
		function dialog(txt, flag) {
			$("#dialog-txt").html(txt);
			var dialog = $("#dialog-confirm")
					.dialog(
							{
								resizable : false,
								modal : true,
								buttons : [ {
									text : "OK",
									"class" : "btn btn-danger btn-mini",
									click : function() {
										if (flag) {
											$(this).dialog("close");
											location.href = "${pageContext.request.contextPath }/12/37";
										} else {
											$(this).dialog("close");
										}
									}
								} ]
							});
		}
	</script>

</body>
</html>