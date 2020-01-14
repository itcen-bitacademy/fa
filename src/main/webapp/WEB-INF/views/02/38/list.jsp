<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 달력 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/jquery-ui-1.10.3.full.min.css" />
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
/* list search css s*/
.chosen-single {
	margin-top: 4px;
}

.chosen-container {
	width: 270px !important;
}

.chosen-container-single .chosen-search:before {
	display: none
}

.chosen-container-single .chosen-search:after {
	display: none
}
/* list search css e*/
/* 기타 css s*/
input:focus {
	outline: none;
}

.control-label {
	margin-top: 4px;
}

#items-table {
	margin-bottom: 0px;
}

.radio {
	display: inline;
	margin-right: 10px;
}

#items-table thead tr th {
	text-align: center;
}
/* 기타 css e*/
</style>
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">매입세금계산서현황조회</h1>
				</div>
				<!-- /.page-header -->
				<form id="search-form" method="post"
					action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
					<div class="row-fluid">
						<div class="span12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="control-group">
								<label class="control-label span1" for="form-field-date">작성일자</label>
								<div class="controls span5">
									<div class="input-append">
										<input class="cl-date-picker calender" id="calender1"
											type="text" style="width: 80%" name="startDate"
											autocomplete="off" value="${searchData.startDate }">
										<span class="add-on"> <i class="icon-calendar"></i>
										</span>
									</div>
									~
									<div class="input-append">
										<input class="cl-date-picker calender" id="calender2"
											type="text" style="width: 80%" name="endDate"
											autocomplete="off" value="${searchData.endDate }"> <span
											class="add-on"> <i class="icon-calendar"></i>
										</span>
									</div>
								</div>
								<label class="control-label span1" for="tax-type">과세유형</label>
								<div class="controls span5">
									<select id="tax-type" name="taxType">
										<c:choose>
											<c:when test="${searchData.taxType == 'zero'}">
												<option value="">전체</option>
												<option value="tax">과세</option>
												<option value="zero" selected="selected">영세</option>
											</c:when>
											<c:when test="${searchData.taxType == 'tax'}">
												<option value="" selected="selected">전체</option>
												<option value="tax" selected="selected">과세</option>
												<option value="zero">영세</option>
											</c:when>
											<c:otherwise>
												<option value="" selected="selected">전체</option>
												<option value="tax">과세</option>
												<option value="zero">영세</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
								<label class="control-label span1" for="no">승인번호</label>
								<div class="controls span5">
									<input style="width: 256px" type="text" id="no" name="no"
										value="${searchData.no }"
										placeholder="ex) 20190420-44231234-57644467"
										autocomplete="off" maxlength="26" />
								</div>
								<label class="control-label span1" for="delete-flag">삭제여부</label>
								<div class="controls span5">
									<select id="delete-flag" name="deleteFlag">
										<c:choose>
											<c:when test="${searchData.deleteFlag == 'n'}">
												<option value="">전체</option>
												<option value="y">삭제</option>
												<option value="n" selected="selected">미삭제</option>
											</c:when>
											<c:when test="${searchData.deleteFlag == 'y'}">
												<option value="">전체</option>
												<option value="y" selected="selected">삭제</option>
												<option value="n">미삭제</option>
											</c:when>
											<c:otherwise>
												<option value="" selected="selected">전체</option>
												<option value="y">삭제</option>
												<option value="n">미삭제</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">

								<label class="control-label span1" for="customer-name">거래처명</label>
								<div class="controls span5">
									<select id="company-name" name="companyName"
										class="chosen-select" required>
										<c:choose>
											<c:when test="${flag == 'true'}">
												<option value="${searchData.companyName }" selected
													style="display: none">${searchData.companyName }</option>
												<option id="empty" value="없음">없음</option>
											</c:when>
											<c:otherwise>
												<option id="empty" value="없음" selected>없음</option>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${customerList }" var="list"
											varStatus="status">
											<option id="${status }" value="${list.name }">${list.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">

						<div class="control-group span12">
							<label class="control-label span1" for="order">정렬</label>
							<div class="controls span7">
								<c:choose>
									<c:when test="${searchData.order == 'writeDate'}">
										<label style="margin-left: -20px;" class="radio"> <input
											name="order" type="radio" class="ace" value="writeDate"
											checked> <span class="lbl">작성일 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="companyName"> <span class="lbl">거래처명
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="rowValue"> <span class="lbl">낮은총공급가액
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="highValue"> <span class="lbl">높은총공급가액
												순</span>
										</label>
									</c:when>
									<c:when test="${searchData.order == 'companyName'}">
										<label style="margin-left: -20px;" class="radio"> <input
											name="order" type="radio" class="ace" value="writeDate">
											<span class="lbl">작성일 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="companyName" checked> <span
											class="lbl">거래처명 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="rowValue"> <span class="lbl">낮은총공급가액
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="highValue"> <span class="lbl">높은총공급가액
												순</span>
										</label>
									</c:when>
									<c:when test="${searchData.order == 'rowValue'}">
										<label style="margin-left: -20px;" class="radio"> <input
											name="order" type="radio" class="ace" value="writeDate">
											<span class="lbl">작성일 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="companyName"> <span class="lbl">거래처명
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="rowValue" checked> <span
											class="lbl">낮은총공급가액 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="highValue"> <span class="lbl">높은총공급가액
												순</span>
										</label>
									</c:when>
									<c:when test="${searchData.order == 'highValue'}">
										<label style="margin-left: -20px;" class="radio"> <input
											name="order" type="radio" class="ace" value="writeDate">
											<span class="lbl">작성일 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="companyName"> <span class="lbl">거래처명
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="rowValue"> <span class="lbl">낮은총공급가액
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="highValue" checked> <span
											class="lbl">높은총공급가액 순</span>
										</label>
									</c:when>
									<c:otherwise>
										<label style="margin-left: -20px;" class="radio"> <input
											name="order" type="radio" class="ace" value="writeDate"
											checked> <span class="lbl">작성일 순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="companyName"> <span class="lbl">거래처명
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="rowValue"> <span class="lbl">낮은총공급가액
												순</span>
										</label>
										<label class="radio"> <input name="order" type="radio"
											class="ace" value="highValue"> <span class="lbl">높은총공급가액
												순</span>
										</label>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="controls span4">
								<div style="float: right;" class="btn-group">
									<button id="reset" class="btn btn-default btn-small"
										type="button" style="float: left; margin-left: 20px;">초기화</button>
								</div>
								<div style="float: right;" class="btn-group">
									<button class="btn btn-info btn-small" type="button"
										style="float: left; margin-left: 20px;"
										onclick="search_button();">조회</button>
								</div>
							</div>
						</div>
					</div>
					<div class="hr hr-10 dotted"></div>

				</form>

				<p>총 ${fn:length(buyTaxbillListAll)}건</p>
				<div class="control-group" style="width: 100%; overflow-x: scroll;">
					<table id="items-table"
						class="table table-striped table-bordered table-hover"
						style="width: 100%; min-width: 1920px;">
						<thead>
							<tr>
								<!-- 16개 -->
								<th>승인번호</th>
								<th>작성일자</th>
								<th>등록번호</th>
								<th>거래처명</th>
								<th>대표자명</th>
								<th>업태</th>
								<th>종목</th>
								<th>매입일자</th>
								<th>품목명</th>
								<th>수량</th>
								<th>공급가액</th>
								<th>세액</th>
								<th>총 공급가액</th>
								<th>총 세액</th>
								<th>과세유형</th>
								<th>삭제여부</th>
							</tr>
						</thead>
						<tbody id="select-purchaseitem-list">
							<c:choose>
								<c:when test="${fn:length(buyTaxbillListAll) == 0 }">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${pagebuyTaxbillList }" var="taxbill">
										<c:set var="count" value="0" />
										<c:set var="status" value="0" />
										<c:forEach items="${itemsList }" var="item">
											<c:if test="${taxbill.no == item.taxbillNo }">
												<c:set var="count" value="${count+1 }" />
											</c:if>
										</c:forEach>

										<c:forEach items="${itemsList }" var="item">
											<c:if test="${taxbill.no == item.taxbillNo }">
												<tr>
													<c:if test="${status == 0 }">
														<td rowspan="${count }">${taxbill.no }</td>
														<td rowspan="${count }">${taxbill.writeDate }</td>
													</c:if>
													<c:forEach items="${customerList }" var="customer">
														<c:if test="${taxbill.companyName == customer.name }">
															<c:if test="${status == 0 }">
																<td rowspan="${count }">${customer.no }</td>
																<td rowspan="${count }">${customer.name}</td>
																<td rowspan="${count }">${customer.ceo }</td>
																<td rowspan="${count }">${customer.conditions }</td>
																<td rowspan="${count }">${customer.item  }</td>
															</c:if>
														</c:if>
													</c:forEach>
													<td>${item.purchaseDate }</td>
													<td>${item.itemName }</td>
													<td style="text-align: right;">${item.amount }</td>
													<td style="text-align: right;"><fmt:formatNumber
															value="${item.supplyValue }" pattern="#,###"></fmt:formatNumber></td>
													<td style="text-align: right;"><fmt:formatNumber
															value="${item.taxValue }" pattern="#,###"></fmt:formatNumber>
													</td>
													<c:if test="${status == 0 }">
														<td rowspan="${count }" style="text-align: right;"><fmt:formatNumber
																value="${taxbill.totalSupplyValue }" pattern="#,###"></fmt:formatNumber></td>
														<td rowspan="${count }" style="text-align: right;"><fmt:formatNumber
																value="${taxbill.totalTaxValue }" pattern="#,###"></fmt:formatNumber></td>
														<td rowspan="${count }"><c:if
																test="${taxbill.taxType == 'zero' }">
																영세
															</c:if> <c:if test="${taxbill.taxType == 'tax' }">
																과세
															</c:if></td>
														<td rowspan="${count }">${taxbill.deleteFlag }</td>
													</c:if>
												</tr>
												<c:set var="status" value="${status+1 }" />
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<div class="row-fluid">
					<div class="pagination">
						<ul id="pagination_list">
							<fmt:parseNumber var="page_all_count" integerOnly="true"
								value="${((fn:length(buyTaxbillListAll)-1)/11) + 1}" />
							<fmt:parseNumber var="page_count" integerOnly="true"
								value="${((fn:length(buyTaxbillList)-1)/11) + 1}" />
							<fmt:parseNumber var="page_group_max" integerOnly="true"
								value="${(page_all_count-1) / 5 }" />

							<c:choose>
								<c:when test="${0 < page_group }">
									<li><a class="page_go_prev" href="javascript:void(0);"><i
											class="icon-double-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:void(0);"><i
											class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="pur_size" begin="1" end="${page_count }" step="1">
								<c:choose>
									<c:when test="${cur_page == pur_size }">
										<li class="active"><a id="select_num"
											href="javascript:void(0);">${pur_size }</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="page_go" href="javascript:void(0);">${pur_size }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page_group_max > page_group }">
									<li><a class="page_go_next" href="javascript:void(0);"><i
											class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:void(0);"><i
											class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.span -->
		</div>
		<!-- /.row-fluid -->
	</div>
	<!-- /.page-content -->

	<!-- /.main-content -->

	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

	<!-- jQeury관련 script -->
	<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
	<!-- 거래처명 찾기기능 -->
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(".chosen-select").chosen();
	</script>
	<!-- 금액 , 표시 함수 -->
	<script>
		function addCommas(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
	<!-- 달력관련 script -->
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
			$('.calender').datepicker({
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
		});
	</script>

	<!-- paging관련 ajax -->
	<script type="text/javascript">
		jQuery(function($) {
			$("#id-date-picker-1").datepicker({
				showOtherMonths : true,
				selectOtherMonths : false,
			});
		});
		$(function() {
			$(".chosen-select").chosen();
		});
		$(function() {
			$("body")
					.on(
							"click",
							".page_go",
							function(e) {
								var page_num = $(this).text();
								var page_group = parseInt((page_num - 1) / 5);

								$
										.ajax({
											url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
											type : "get",
											dataType : "json",
											data : $("#search-form")
													.serialize()
													+ "&page_num="
													+ page_num
													+ "&page_group="
													+ page_group,
											success : function(data) {
												console.log(data);
												updateTable(
														data.pagebuyTaxbillList,
														data.customerList,
														data.itemsList,
														page_num);
												updatePagination(
														data.buyTaxbillListAll,
														data.buyTaxbillList,
														page_num, page_group);
											},
											error : function(error) {
												alert("값을 찾을 수 없습니다.");
											}
										});
							});

			$("body")
					.on(
							"click",
							".page_go_prev",
							function(e) {
								var page_num = $("#select_num").text();
								var page_group = parseInt((page_num - 1) / 5);

								page_group = page_group - 1;
								page_num = (page_group * 5) + 5;

								$
										.ajax({
											url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
											type : "get",
											dataType : "json",
											data : $("#search-form")
													.serialize()
													+ "&page_num="
													+ page_num
													+ "&page_group="
													+ page_group,
											success : function(data) {
												console.log(data);
												updateTable(
														data.pagebuyTaxbillList,
														data.customerList,
														data.itemsList,
														page_num);
												updatePagination(
														data.buyTaxbillListAll,
														data.buyTaxbillList,
														page_num, page_group);
											},
											error : function(error) {
												alert("찾을 수 없는 품목입니다.");
											}
										});
							});

			$("body")
					.on(
							"click",
							".page_go_next",
							function(e) {
								var page_num = $("#select_num").text();
								var page_group = parseInt((page_num - 1) / 5);

								page_group = page_group + 1;
								page_num = (page_group * 5) + 1;

								$
										.ajax({
											url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
											type : "get",
											dataType : "json",
											data : $("#search-form")
													.serialize()
													+ "&page_num="
													+ page_num
													+ "&page_group="
													+ page_group,
											success : function(data) {

												updateTable(
														data.pagebuyTaxbillList,
														data.customerList,
														data.itemsList,
														page_num);
												updatePagination(
														data.buyTaxbillListAll,
														data.buyTaxbillList,
														page_num, page_group);
											},
											error : function(error) {
												alert("찾을 수 없는 품목입니다.");
											}
										});
							});

			function updateTable(buyTaxbillList, customerList, itemsList,
					page_num) {
				$("#select-purchaseitem-list").remove();
				$newTbody = $("<tbody id='select-purchaseitem-list'></tbody>")
				$("#items-table").append($newTbody)
				var i = 1;
				if (buyTaxbillList.legnth == 0) {
					$newTbody
							.append("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
				} else {
					for ( var taxbill in buyTaxbillList) {
						var count = 0;
						var status = 0;
						for ( var item in itemsList) {
							if (buyTaxbillList[taxbill].no == itemsList[item].taxbillNo) {
								count++;
							}
						}
						console.log("count : " + count);
						for ( var item in itemsList) {
							if (buyTaxbillList[taxbill].no == itemsList[item].taxbillNo) {
								$newTr = $('<tr></tr>');
								$newTbody.append($newTr);
								if (status == 0) {
									$newTr.append('<td rowspan="'+count+'">'
											+ buyTaxbillList[taxbill].no
											+ '</td>'
											+ '<td rowspan="'+count+'">'
											+ buyTaxbillList[taxbill].writeDate
											+ '</td>');
								}
								for ( var customer in customerList) {
									if (buyTaxbillList[taxbill].companyName == customerList[customer].name) {
										if (status == 0) {
											$newTr
													.append('<td rowspan="'+count+'">'
															+ customerList[customer].no
															+ '</td>'
															+ '<td rowspan="'+count+'">'
															+ customerList[customer].name
															+ '</td>'
															+ '<td rowspan="'+count+'">'
															+ customerList[customer].ceo
															+ '</td>'
															+ '<td rowspan="'+count+'">'
															+ customerList[customer].conditions
															+ '</td>'
															+ '<td rowspan="'+count+'">'
															+ customerList[customer].item
															+ '</td>');
										}
									}
								}
								$newTr
										.append('<td>'
												+ itemsList[item].purchaseDate
												+ '</td>'
												+ '<td>'
												+ itemsList[item].itemName
												+ '</td>'
												+ '<td style="text-align: right;">'
												+ itemsList[item].amount
												+ '</td>'
												+ '<td style="text-align: right;">'
												+ addCommas(itemsList[item].supplyValue)
												+ '</td>'
												+ '<td style="text-align: right;">'
												+ addCommas(itemsList[item].taxValue)
												+ '</td>');
								if (status == 0) {
									$newTr
											.append('<td  style="text-align: right;" rowspan="'+count+'">'
													+ addCommas(buyTaxbillList[taxbill].totalSupplyValue)
													+ '</td>'
													+ '<td  style="text-align: right;" rowspan="'+count+'">'
													+ addCommas(buyTaxbillList[taxbill].totalTaxValue)
													+ '</td>');
									if (buyTaxbillList[taxbill].taxType == 'zero') {
										$newTr
												.append('<td rowspan="'+count+'">'
														+ '영세</td>');
									} else {
										$newTr
												.append('<td rowspan="'+count+'">'
														+ '과세</td>');
									}
									$newTr
											.append('<td rowspan="'+count+'">'
													+ buyTaxbillList[taxbill].deleteFlag
													+ '</td>');
								}
								console.log('status : ' + status);
								status++;
							}
						}
					}
				}
			}
			function updatePagination(buyTaxbillListAll, buyTaxbillList,
					page_num, page_group) {
				$("#pagination_list").remove();
				$newUl = $("<ul id='pagination_list'></ul>")
				$(".pagination").append($newUl);
				var page_all_count = parseInt((buyTaxbillListAll.length - 1) / 11) + 1;
				var list_size = parseInt((buyTaxbillList.length - 1) / 11) + 1;
				var page_group_max = parseInt((page_all_count - 1) / 5);
				console.log(page_group_max);
				if (0 < page_group) {
					$newUl
							.append("<li><a class='page_go_prev' href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
				} else {
					$newUl
							.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
				}
				for (var li = 1; li <= list_size; li++) {
					if (page_num == (li + page_group * 5)) {
						$newUl
								.append("<li class='active'><a id='select_num' href='javascript:void(0);'>"
										+ (li + page_group * 5) + "</a></li>");
					} else {
						$newUl
								.append("<li><a class='page_go' href='javascript:void(0);'>"
										+ (li + page_group * 5) + "</a></li>");
					}
				}
				if (page_group_max > page_group) {
					$newUl
							.append("<li><a class='page_go_next' href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
				} else {
					$newUl
							.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
				}
			}
		});
	</script>

	<!-- 조회버튼  -->
	<script>
		function search_button() {
			$("#search-form")
					.attr(
							"action",
							"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list")
					.submit();
		}
	</script>
	<!-- 리셋버튼  -->
	<script>
		$('#reset').click(
				function() {
					var spanTag = $('.chosen-single').children("span");
					spanTag.text("없음");
					$("#empty").attr("selected", "selected");

					$("#no").val("");
					$("#calender1").val("");
					$("#calender2").val("");
					$("#tax-type option:eq(0)").prop("selected", true);
					$("#delete-flag option:eq(0)").prop("selected", true);
					$('input[name="order"]').filter("[value=writeDate]").prop(
							"checked", true);

				})
	</script>

</body>
</html>
