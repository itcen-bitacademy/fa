<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.form-horizontal .control-label {
    text-align: left
}
</style>

<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {

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

		$('#cl-ym-date-picker').datepicker({
			maxViewMode : 4,
			minViewMode : 1,
			language : 'ko'
		}).next().on(ace.click_event, function() {
			$(this).prev().focus();
		});

		$("#btn-submit").on("click", function() {
			$("#form-sales").submit();
		});
		/* 
		$(".pagination li a").on("click", function(event){
			event.preventDefault();
			var activePage = $(this).parent().attr("class");
			if(activePage == "disabled" || activePage == "active") {
				return;
			}
			var page = $(".pagination li").attr("class", "active").children().text();
			var icon = $(this).children().attr("class");
			if(icon == "icon-double-angle-left") {
				page += 1;
			} else if(icon == "icon-double-angle-right") {
				page -= 1;
			}
			
			$("#form-purchase input[name=page]").val(page);
			$("#form-purchase").submit();
		});
		 */
		$("#dialog-message").dialog({
			autoOpen : false
		});

		$(".a-customerinfo-dialog").click(function() {
			tf = $(this).parent().prev();
			$("#dialog-message").dialog({
				title : "매출거래처 정보",
				title_html : true,
				resizable : false,
				height : 500,
				width : 400,
				modal : true,
				close : function() {
					$('#tbody-customerList tr').remove();
				},
				buttons : {
					"닫기" : function() {
						$(this).dialog('close');
						$('#tbody-customerList tr').remove();
					}
				}
			});
			$("#dialog-message").dialog('open');
		});

		// 매입거래처 팝업 클릭시
		$('#dialog-message-table')
				.on(
						'click',
						'#a-dialog-customerNo',
						function(event, ui) {
							event.preventDefault();
							$("#tbody-customerList").find("tr").remove();

							var searchOption = $("#searchOption").val();
							var searchValue = $("#input-dialog-customerNo")
									.val();

							// ajax 통신
							$
									.ajax({
										url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/gets?"
												+ searchOption
												+ "="
												+ searchValue,
										contentType : "application/json; charset=utf-8",
										type : "get",
										dataType : "json", // JSON 형식으로 받을거다!! (MIME type)
										data : "",
										statusCode : {
											404 : function() {
												alert("page not found");
											}
										},
										success : function(data) {
											if (data.success) {
												$("#input-dialog-customerNo")
														.val('');
												var customerList = data.customerList;
												console.log(data.customerList);
												for ( let c in customerList) {
													$("#tbody-customerList")
															.append(
																	"<tr>"
																			+ "<td class='center'>"
																			+ customerList[c].no
																			+ "</td>"
																			+ "<td class='center'>"
																			+ customerList[c].name
																			+ "</td>"
																			+ "</tr>");

												}
											}
										},
										error : function(xhr, error) {
											console.error("error : " + error);
										}
									});
						});

		// 매출거래처 리스트(customerList)에서 row를 선택하면 row의 해당 데이터 form에 추가
		$(document.body).delegate('#tbody-customerList tr', 'click',
				function() {
					var tr = $(this);
					var td = tr.children();

					$(tf).val(td.eq(1).text());
					$(tf).parent().prev().val(td.eq(0).text());
					$("#dialog-message").dialog('close');
				});

		// 매출거래처 name 자동입력
		$('#customerCode')
				.on(
						'change',
						function(event) {
							var el = $(this);

							// ajax 통신
							$
									.ajax({
										url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/get?no="
												+ $(el).val(),
										contentType : "application/json; charset=utf-8",
										type : "get",
										dataType : "json", // JSON 형식으로 받을거다!! (MIME type)
										data : "",
										statusCode : {
											404 : function() {
												alert("page not found");
											}
										},
										success : function(data) {
											$(el).next().children("input").val(
													"");
											if (data.success
													&& data.customer != null) {
												var customer = data.customer;
												console.log(customer);
												console.log(customer.name);
												$(el).next().children("input")
														.val(customer.name);
											}
										},
										error : function(xhr, error) {
											console.error("error : " + error);
										}
									});
						});
	})
</script>
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
					<h1 class="pull-left">월별 거래처 매출 현황</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<div class="span10">
								<form class="form-horizontal" id="form-sales"
									action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
									<div class="span3">
										<div class="control-group">
											<label class="control-label form-field-1" style="text-align: left; width: 50px;">년 월</label>
											<div class="row-fluid input-append span2" style="margin-left: 5px;">
												<input class="date-picker" id="cl-ym-date-picker" type="text" style="width: 150px;" data-date-format="yyyy-mm" name="purchaseDate" value="${purchase.purchaseDate }">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="span4">
										<div class="control-group">
											<label class="control-label span2" for="form-field-1" style="text-align: left; width: 60px;">거래처</label>
											<div style="margin-left: 5px;">
												<input type="text" id="customerCode" name="customerCode" style="width: 100px;" value="${purchase.customerCode }">
					                            <div class="input-append">
						                              <input type="text" id="customerName" name="customerName" readonly style="width: 150px;" value="${purchase.customerName }">
						                              <span class="add-on">
							                              <a href="#" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i>
							                              </a>
						                              </span>
					                            </div>
											</div>
										</div>
									</div>
									<div class="span2" style="margin-left: 50px;">
										<button class="btn btn-small btn-info" id="btn-submit">조회</button>
									</div>
								</form>
								<!-- 매출거래처 사업자번호, 상호명 Modal pop-up : start -->
								<div id="dialog-message" title="매출거래처" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><select id="searchOption" style="width: 120px;">
													<option value="no">사업자번호</option>
													<option value="name">상호명</option>
											</select>
												<div class="input-append">
													<input type="text" id="input-dialog-customerNo"
														style="width: 150px;" /> <span class="add-on"> <a
														href="#" id="a-dialog-customerNo"> <i
															class="icon-search icon-on-right bigger-110"></i>
													</a>
													</span>
												</div></td>
										</tr>
									</table>
									<!-- 사업자번호 및 상호명 데이터 리스트 -->
									<table id="modal-customer-table"
										class="table table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">사업자번호</th>
												<th class="center">상호명</th>
											</tr>
										</thead>
										<tbody id="tbody-customerList">

										</tbody>
									</table>
								</div>
								<!-- 사업자번호, 상호명, 지점명 Modal pop-up : end -->
							</div>
						</div>
						<div class="hr hr-18 dotted"></div>

						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">매출일자</th>
									<th class="center">매출번호</th>
									<th class="center">매출순번</th>
									<th class="center">거래처코드</th>
									<th class="center">거래처명</th>
									<th class="center">담당자</th>
									<th class="center">품목코드</th>
									<th class="center">품목명</th>
									<th class="center">출고일자</th>
									<th class="center">수량</th>
									<th class="center">공급가액</th>
									<th class="center">부가세</th>
									<th class="center">합 계</th>
									<th class="center">세금계산서번호</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach items='${dataResult.datas }' var='sales'>
										<tr>
											<td>${sales.salesDate }</td>
											<td>${sales.salesNo }</td>
											<td style="text-align:right">${sales.number }</td>
											<td>${sales.customerCode }</td>
											<td>${sales.customerName }</td>
											<td>${sales.empManager }</td>
											<td>${sales.itemCode }</td>
											<td>${sales.itemName }</td>
											<td>${sales.releaseDate }</td>
											<td style="text-align:right"><fmt:formatNumber value="${sales.quantity }" pattern="#,###" /></td>
											<td style="text-align:right"><fmt:formatNumber value="${sales.supplyValue }" pattern="#,###" /></td>
											<td style="text-align:right"><fmt:formatNumber value="${sales.taxValue }" pattern="#,###" /></td>
											<td style="text-align:right"><fmt:formatNumber value="${sales.totalPrice }" pattern="#,###" /></td>
											<td>${sales.taxbillNo }</td>
										</tr>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<ul>
							<c:choose>
								<c:when test="${dataResult.pagination.prev }">
									<li><a
										href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?page=${dataResult.pagination.startPage - 1 }
										&salesDate=${param.salesDate}&customerCode=${param.customerCode}"><i
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
											href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?page=${pg }
											&salesDate=${param.salesDate}&customerCode=${param.customerCode}">${pg }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?page=${pg }
											&salesDate=${param.salesDate}&customerCode=${param.customerCode}">${pg }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li><a
										href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?page=${dataResult.pagination.endPage + 1 }
										&salesDate=${param.salesDate}&customerCode=${param.customerCode}"><i
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
				<!-- /.span -->
			</div>
			<!-- /.row-fluid -->



		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>