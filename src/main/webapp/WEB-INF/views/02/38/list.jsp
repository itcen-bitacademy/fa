<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<!-- select List를 위한 StyleSheet -->
<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<style>
.table-responsive {
	width: 100%;
	height: 100%;
	overflow: auto;
}

input:focus {
	outline: none;
}

.chosen-search {
	display: none;
}
</style>
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
				<!-- /.page-header -->
				<form method="post"
					action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
					<div class="row-fluid">
						<div class="span12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="control-group">
								<label class="control-label span1" for="form-field-date">작성일자</label>
								<div class="controls span5">
									<div class="input-append">
										<input class="cl-date-picker calender" id="calender"
											type="text" style="width: 70%" name="startDate"
											autocomplete="off"> <span class="add-on"> <i
											class="icon-calendar"></i>
										</span>
									</div>
									~ &nbsp;
									<div class="input-append">
										<input class="cl-date-picker calender" id="calender"
											type="text" style="width: 70%" name="endDate"
											autocomplete="off"> <span class="add-on"> <i
											class="icon-calendar"></i>
										</span>
									</div>
								</div>
								<label class="control-label span1" for="tax-type">과세유형</label>
								<div class="controls span5">
									<select class="chosen-select" id="tax-type" name="taxType">
										<option value="">전체</option>
										<option value="tax">과세</option>
										<option value="zero">영세</option>
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
									<input style="width: 97%" type="text" id="no" name="no"
										placeholder="승인번호" />
								</div>
								<label class="control-label span1" for="delete-flag">삭제여부</label>
								<div class="controls span5">
									<select class="chosen-select" id="delete-flag"
										name="deleteFlag">
										<option value="">전체</option>
										<option value="y">삭제</option>
										<option value="n">미삭제</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">

								<label class="control-label span1" for="customer-name">거래처명</label>
								<div class="controls span2">
									<div class="input-append">
										<input class="date-picker" id="company-name" type="text"
											name="companyName"> <span class="add-on"> <i
											class="icon-search"></i>
										</span>
									</div>
								</div>
								<div class="controls span9">
									<button class="btn btn-default btn-small span1"
										style="float: left; margin-left: 20px;">조회</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group span12">
								<label class="control-label span1" for="order">정렬</label>
								<div class="controls span5">

									<label style="display: inline;"> <input name="order"
										type="radio" class="ace" value="writeDate" checked> <span
										class="lbl">작성일 순</span>
									</label> <label style="display: inline;"> <input name="order"
										type="radio" class="ace" value="companyName"> <span
										class="lbl">거래처명 순</span>
									</label> <label style="display: inline;"> <input name="order"
										type="radio" class="ace" value="rowValue"> <span
										class="lbl">낮은총공급가액 순</span>
									</label> <label style="display: inline;"> <input name="order"
										type="radio" class="ace" value="highValue"> <span
										class="lbl">높은총공급가액 순</span>
									</label>

								</div>
							</div>
						</div>
					</div>
				</form>

				<div class="control-group"
					style="overflow-x: scroll; max-width: 1400px">
					<table id="sample-table-1"
						class="table table-striped table-bordered table-hover"
						style="width: 1700px">
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
						<tbody>
							<c:choose>
								<c:when test="${fn:length(taxbillList) == 0 }">
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
									<c:forEach items="${taxbillList }" var="taxbill">
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
													<td>${item.amount }</td>
													<td>${item.supplyValue }</td>
													<td>${item.taxValue }</td>
													<c:if test="${status == 0 }">
														<td rowspan="${count }">${taxbill.totalSupplyValue }</td>
														<td rowspan="${count }">${taxbill.totalTaxValue }</td>
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
					<div class="pagination"></div>
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

		})
	</script>
</body>
</html>