<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<style>
#sample-table-1 tr td {
	padding: 0;
}

#sample-table-1 tr td p {
	padding: 8px;
	margin: 0;
}

#sample-table-1 tr td input {
	padding: 8px;
	margin: 0;
	width: 94%;
	border: 0
}
</style>
<script>
	var cnt = 2;
	function add_row() {
		var table = document.getElementById("sample-table-1");
		var row = table.insertRow(table.rows.length); // 하단에 추가

		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		cell1.innerHTML = '<td><p>' + cnt + '</p></td>';
		cell2.innerHTML = '<td><input type="text" id="date'+cnt+'" name="purchaseDate"></td>';
		cell3.innerHTML = '<td><input type="text" id="item'+cnt+'" name="itemName"></td>';
		cell4.innerHTML = '<td><input type="text" id="amount'+cnt+'" name="amount"></td>';
		cell5.innerHTML = '<td><input type="text" id="supply-value'
				+ cnt
				+ '" name="supplyValue" onkeyup="sum_allsupply_alltax();"></td>';
		cell6.innerHTML = '<td><input type="text" id="tax-value'+cnt+'" name="taxValue"></td>';
		cnt++;

	}

	function delete_row() {

		var table = document.getElementById('sample-table-1');
		if (table.rows.length < 3) {
			return;
		} else {
			cnt--
			table.deleteRow(table.rows.length - 1);
		}
	}

	function sum_allsupply_alltax() {
		var sum = 0;
		for (var i = 1; i < cnt; i++) {
			var supply_value = document.getElementById('supply-value' + i).value;
			var amount = document.getElementById('amount' + i).value;
			sum = sum + (supply_value * amount);
		}
		document.getElementById('form-field-14').value = sum;
		document.getElementById('form-field-15').value = sum * 0.1;

	}

	function load_customer_imfo() {
		var company_name = document.getElementById("company-name").value;
		var deposit_no;
		alert(company_name);
		if (company_name == "") {
			$("#customer-name").val("");
			$("#customer-address").val("");
			$("#conditions").val("");
			$("#items").val("");
			$("#customer-no").val("");
			$("#deposit-no").val("");
			$("#deposit-host").val("");
			$("#bank-code").val("");
			$("#bank-name").val("");
		} else {
			<c:forEach items="${customerList }" var="list" varStatus="status">
			if (company_name == "${list.name }") {
				$("#customer-name").val("${list.ceo}");
				$("#customer-address").val("${list.address}");
				$("#conditions").val("${list.conditions}");
				$("#items").val("${list.item}");
				$("#customer-no").val("${list.no}");
				deposit_no = "${list.depositNo }";
				alert(deposit_no);
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
	}

	function update_button() {
		$("#manage-form")
				.attr(
						"action",
						"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update")
				.submit();
	}
	function delete_button() {
		$("#manage-form")
				.attr(
						"action",
						"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete")
				.submit();
	}
	function lookup_button() {
		$("#manage-form")
				.attr(
						"action",
						"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/lookUp")
				.submit();
	}
</script>
</head>
<body class="skin-3" style="min-width: 1920px">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">매입세금계산서관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i>메뉴 추가</a>
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
									<input style="width: 100%" type="text" id="no" name="no"
										value="${getAboutNoData.no }" placeholder="승인번호" /> <input
										style="width: 100%" type="hidden" id="no" name="originalNo"
										value="${getAboutNoData.no }" />
								</div>
								<label class="control-label span1" for="manage-no">관리번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="manage-no"
										value="${getAboutNoData.manageNo }" name="manageNo"
										placeholder="관리번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label span1" for="customer-no">등록번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="customer-no"
										value="${getAboutNoCustomerData.no }" name="id"
										placeholder="등록번호" />
								</div>
								<label class="control-label span1" for="deposit-no">입금계좌번호</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="deposit-no"
										value="${getAboutNoBankData.depositNo }" name="id"
										placeholder="입금계좌번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label span1" for="company-name">거래처명</label>
								<div class="controls span2">

									<select id="company-name" name="companyName"
										style="width: 100%;" onchange="load_customer_imfo();">
										<c:choose>
											<c:when test="${flag == 'true'}">
												<option value="${getAboutNoCustomerData.name }" selected
													style="display: none">${getAboutNoCustomerData.name }</option>
											</c:when>
											<c:otherwise>
												<option value="">&nbsp;</option>
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
										placeholder="성명" />
								</div>
								<label class="control-label span1" for="deposit-host">예금주</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="deposit-host"
										value="${getAboutNoCustomerData.depositHost }"
										placeholder="예금주" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label span1" for="customer-address">주소</label>
								<div class="controls span5">
									<input style="width: 100%" type="text" id="customer-address"
										value="${getAboutNoCustomerData.address }" name="id"
										placeholder="주소" />
								</div>
								<label class="control-label span1" for="bank">은행</label>
								<div class="controls span5">
									<div class="controls span2">
										<input style="width: 80%" type="text" id="bank-code"
											value="${getAboutNoBankData.bankCode }" name="id"
											placeholder="은행" />
									</div>
									<div class="controls span3">
										<input style="width: 100%" type="text" id="bank-name"
											value="${getAboutNoBankData.bankName }" name="id"
											placeholder="은행" />
									</div>

								</div>
							</div>
							<div class="control-group">
								<label class="control-label span1" for="conditions">업태</label>
								<div class="controls span2">
									<input style="width: 94%;" type="text" id="conditions"
										value="${getAboutNoCustomerData.conditions }" name="id"
										placeholder="업태" />
								</div>
								<label class="control-label span1" for="items">종목</label>
								<div class="controls span2">
									<input style="width: 100%" type="text" id="items" name="id"
										value="${getAboutNoCustomerData.item }" placeholder="종목" />
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
												type="radio" value="tax" class="ace"> <span
												class="lbl">과세</span>
											</label>
											<label style="display: inline"> <input name="taxType"
												type="radio" value="zero" class="ace" checked> <span
												class="lbl">영세</span>
											</label>
										</c:otherwise>
									</c:choose>
								</div>
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
								<label class="control-label span1" for="form-field-13">일자</label>
								<div class="controls span2">
									<div class="input-append" style="width: 100%">
										<input id="id-date-picker-1" class="cl-date-picker"
											value="${getAboutNoData.writeDate }" name="writeDate"
											type="text"> <span class="add-on"> <i
											class="icon-calendar"></i>
										</span>
									</div>
								</div>
								<label class="control-label span1" for="form-field-14">총
									공급가액</label>
								<div class="controls span4">
									<input style="width: 100%" type="text" id="form-field-14"
										value="${getAboutNoData.totalSupplyValue }"
										name="totalSupplyValue" placeholder="총 공급가액" />
								</div>
								<label class="control-label span1" for="form-field-15">총
									세액</label>
								<div class="controls span3">
									<input style="width: 100%" type="text" id="form-field-15"
										value="${getAboutNoData.totalTaxValue }" name="totalTaxValue"
										placeholder="총 세액" />
								</div>
							</div>
						</div>
					</div>
					<div class="hr hr-10 dotted"></div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
								<div class="btn-group">
									<button class="btn btn-small" type="button"
										onclick="add_row();">품목추가</button>
								</div>
								<div class="btn-group">
									<button class="btn btn-small" type="button"
										onclick="delete_row();">품목삭제</button>
								</div>
							</div>
							<div class="control-group">
								<table id="sample-table-1"
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
													<td><input type="text" id="date1" name="purchaseDate"
														value="${items.purchaseDate }"></td>
													<td><input type="text" id="item1" name="itemName"
														value="${items.itemName }"></td>
													<td><input type="text" id="amount1"
														onkeyup="sum_allsupply_alltax();" name="amount"
														value="${items.amount }"></td>
													<td><input type="text" id="supply-value1"
														onkeyup="sum_allsupply_alltax();" name="supplyValue"
														value="${items.supplyValue }"></td>
													<td><input type="text" id="tax-value1" name="taxValue"
														value="${items.taxValue }"></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td><p>1</p></td>
												<td><input type="text" id="date1" name="purchaseDate"></td>
												<td><input type="text" id="item1" name="itemName"></td>
												<td><input type="text" id="amount1"
													onkeyup="sum_allsupply_alltax();" name="amount"></td>
												<td><input type="text" id="supply-value1"
													onkeyup="sum_allsupply_alltax();" name="supplyValue"></td>
												<td><input type="text" id="tax-value1" name="taxValue"></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>


							</div>
							<div class="control-group">
								<button class="btn btn-danger btn-small"
									style="float: left; margin-left: 20px;">입력</button>
								<button class="btn btn-warning btn-small" type="button"
									style="float: left; margin-left: 20px;"
									onclick="update_button();">수정</button>
								<button class="btn btn-primary btn-small" type="button"
									style="float: left; margin-left: 20px;"
									onclick="delete_button();">삭제</button>
								<button class="btn btn-default btn-small" type="button"
									style="float: left; margin-left: 20px;"
									onclick="lookup_button();">조회</button>

							</div>
							<!-- PAGE CONTENT ENDS -->
						</div>
					</div>
				</form>
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
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$.fn.datepicker.dates['ko'] = {
				days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				today : "Today",
				clear : "Clear",
				format : "yyyy-mm-dd",
				titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
				weekStart : 0
			};

			$('#cl-ym-date-picker').datepicker({
				maxViewMode : 4,
				minViewMode : 1,
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});

			$('.cl-date-picker').datepicker({
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
		})
	</script>
</body>
</html>
