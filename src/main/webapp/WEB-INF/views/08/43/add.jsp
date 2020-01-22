<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/jquery-ui-1.10.3.full.min.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
html, body {
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

.table>thead>tr>th {
	text-align: center;
}

#count {
	text-align: center;
}

#price {
	text-align: right;
}

@media screen and (max-width: 920px) {
	.main-container {
		height: calc(100% - 84px);
	}
}

.chosen-container {
	width: 20% !important;
}
</style>
</head>
<body class="skin-3">
	<input type="hidden" id="context-path"
		value="${pageContext.request.contextPath }" />
	<input type="hidden" id="main-menu-code"
		value="${menuInfo.mainMenuCode }" />
	<input type="hidden" id="sub-menu-code"
		value="${menuInfo.subMenuCode }" />
	<input type="hidden" value="${closingDate }" name="closingDate"
		id="closingDate">

	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">무형자산관리</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->


							<form class="form-horizontal" method="post"
								action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"
								id="insert-intangibleAssets-form" data-checkpurchaseno="no"
								method="post" name="sendform"
								onkeypress="if(event.keyCode == 13) formCheck();">
								<div class="span6">
									<!-- 차변 -->
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">무형자산 코드</label>
										<div class="controls">
											<input type="text" class="span7" id="id" name="id" maxlength="9"
												placeholder="ex) 120400701 (월+일+007+번호)" /> <input
												id="overlapBtn" style="height: 28px" type="button"
												value="중복확인"> <i id="check-icon"
												class="icon-ok bigger-180 blue" style="display: none;"></i>
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">설치주소</label>
										<div class="controls">
											<input type="text" class="span11" id="form-field-1"
												name="address" placeholder="주소를 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-select-1">대분류 코드</label>
										<div class="controls">
											<select class="span2 chosen-select" id="classification"
												name="classification" data-placeholder="전체">
												<option value=""></option>
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.code }"
														value="${sectionVo.classification }">${sectionVo.classification }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6" name="code"
												id="code" placeholder="대분류명을 지정하면 코드가 등록됩니다">
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-select-1">거래처 코드</label>
										<div class="controls">
											<select class="chosen-select" id="customerNo"
												name="customerNo" data-placeholder="전체">
												<option value=""></option>
												<c:forEach items="${customerList }" var="customerVo">
													<option customerName="${customerVo.name }"
														customerManager="${customerVo.managerName }"
														value="${customerVo.no }">${customerVo.no }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6"
												name="customerName" id="customerName"
												value="코드를 지정하면 거래처명이 등록됩니다">
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">취득금액</label>
										<div class="controls">
											<input type="text" id="acqPrice" name="acqPrice"
												style="text-align: right;" placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">부대비용</label>
										<div class="controls">
											<input type="text" id="addiFee" name="addiFee"
												style="text-align: right;" placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group" id="taxbillNo">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">세금계산서 번호</label>
										<div class="controls">
											<input type="text" class="span7" id="form-field-1"
												name="taxbillNo" placeholder="12자로 입력하세요" />
										</div>
									</div>
								</div>
								<!-- 차변 span -->

								<div class="span6">
									<!-- 대변 -->
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">무형자산 명</label>
										<div class="controls">
											<input type="text" class="span11" id="name" name="name"
												placeholder="무형자산명을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">사용 담당자</label>
										<div class="controls">
											<input type="text" class="span7" id="user" name="user"
												placeholder="이름을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">수량</label>
										<div class="controls">
											<input type="text" id="copyCount" name="copyCount"
												style="text-align: right;" placeholder="수량을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">담당자</label>
										<div class="controls">
											<input readonly type="text" class="span7"
												name="customerManager" id="customerManager"
												value="코드를 지정하면 담당자가 등록됩니다" />
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="form-field-1">용도</label>
										<div class="controls">
											<select class="chosen-select" id="purpose" name="purpose"
												data-placeholder="전체">
												<option value=""></option>
												<c:forEach items="${purposeList }" var="purposeVo">
													<option value="${purposeVo.classification }">${purposeVo.classification }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label"
											for="id-date-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<input class="cl-date-picker" readonly id="id-date-picker-1"
													type="text" name="payDate"> <span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label style="text-align: left;" class="control-label">구분</label>
										<div class="controls">
											<div class="span2">
												<label> <input name="taxKind" type="radio" id="tax"
													value="과세" class="ace" checked> <span class="lbl">
														과세</span>
												</label>
											</div>
											<div class="span2">
												<label> <input name="taxKind" type="radio"
													id="zeroTax" value="영세" class="ace"> <span
													class="lbl"> 영세</span>
												</label>
											</div>
										</div>
									</div>
								</div>
								<!-- 대변 span -->

								<div class="row-fluid">
									<div class="span12"">
										<div class="hr hr-18 dotted"></div>
										<div class="control-group" style="margin-left: 0px;">
											<div class="controls" style="margin-left: 0px;">
												<button class="btn btn-primary btn-small" type="submit"
													id="add" style="float: left; margin-right: 20px;">등록</button>
												<button class="btn btn-info btn-small" type="submit"
													id="list" style="float: left; margin-right: 20px;">조회</button>
												<button class="btn btn-warning btn-small" type="button"
													id="update"
													style="float: left; margin-right: 20px; display: none;">수정</button>
												<button class="btn btn-danger btn-small" type="button"
													id="delete"
													style="float: left; margin-right: 20px; display: none;">삭제</button>
												<button class="btn btn-default btn-small" type="reset"
													id="reset" style="float: left; margin-right: 20px;">초기화</button>
											</div>
										</div>
										<div class="hr hr-18 dotted"></div>
									</div>
								</div>

							</form>
						</div>
						<!-- 차변 대변 나누기 위한 row-fluid -->
						<!-- PAGE CONTENT ENDS -->

					</div>
					<!-- /.span -->
				</div>
				<!-- /.row-fluid -->

				<div style="overflow-x: auto;">
					<table id="sample-table-1"
						class="table table-striped table-bordered table-hover"
						style="width: 2200px">
						<thead>
							<tr>
								<th>NO</th>
								<th>무형자산코드</th>
								<th>설치주소</th>
								<th>대분류명</th>
								<th>대분류코드</th>
								<th>거래처코드</th>
								<th>거래처명</th>
								<th>취득금액(원)</th>
								<th>부대비용(원)</th>
								<th>세금계산서번호</th>
								<th>무형자산명</th>
								<th>사용담당자</th>
								<th>수량</th>
								<th>담당자</th>
								<th>용도</th>
								<th>매입일자</th>
								<th>구분</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${dataResult.datas }" var="vo"
								varStatus="status">
								<tr class="clickme">
									<td id="count">${(page-1)*11 + status.count }</td>
									<td>${vo.id }</td>
									<td>${vo.address }</td>
									<td>${vo.classification }</td>
									<td>${vo.code }</td>
									<td>${vo.customerNo }</td>
									<td>${vo.customerName }</td>
									<td id="price"><fmt:formatNumber value="${vo.acqPrice }"
											pattern="#,###"></fmt:formatNumber></td>
									<td id="price"><fmt:formatNumber value="${vo.addiFee }"
											pattern="#,###"></fmt:formatNumber></td>
									<td>${vo.taxbillNo }</td>
									<td>${vo.name }</td>
									<td>${vo.user }</td>
									<td id="price"><fmt:formatNumber value="${vo.copyCount }"
											pattern="#,###"></fmt:formatNumber></td>
									<td>${vo.customerManager }</td>
									<td>${vo.purpose }</td>
									<td>${vo.payDate }</td>
									<td>${vo.taxKind }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="row-fluid">
				<div class="pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
										<i class="icon-double-angle-left"></i>
								</a></li>
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
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }">
										<i class="icon-double-angle-right"></i>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"> <i
										class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>

			<!-- 유효성 검사 dialog -->
			<div id="dialog-confirm" class="hide">
				<p id="dialog-txt" class="bolder grey"></p>
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/jquery-ui-1.10.3.full.min.js"></script>
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
			
			$("#taxbillNo").hide();
		});

		// 입력 유효성 검사
		function insert() {
			checkClosing();
			// Insert 에서 중복확인버튼을 통해 주어진 checkpurchaseno의 flag를 통해 구분한다
			var checkpurchaseno = $("#insert-intangibleAssets-form").data(
					"checkpurchaseno");
			var id = $("#id").val();
			console.log("품목 코드 중복확인 해주세요." + checkpurchaseno);
			console.log($("#id").val.length);
			if (checkpurchaseno === "no" || id.length < 9) {
				$("#insert- intangibleAssets -form").data("checkpurchaseno",
						"no");
				dialog("품목 코드를 중복확인 해주세요.", false);
			} else if (!valid.nullCheck("id", "무형자산 코드"))
				return;
			else if (!valid.numberCheck("id", "무형자산 코드"))
				return;
			else if (!valid.nullCheck("address", "설치 주소"))
				return;
			else if (!valid.nullCheck("code", "무형자산 분류"))
				return;
			else if (!valid.nullCheck("customerNo", "거래처"))
				return;
			else if (!valid.nullCheck("acqPrice", "취득 금액"))
				return;
			else if (!valid.nullCheck("addiFee", "부대 비용"))
				return;
			else if (!valid.nullCheck("code", "무형자산 명"))
				return;
			else if (!valid.nullCheck("user", "사용 담당자"))
				return;
			else if (!valid.nullCheck("copyCount", "수량"))
				return;
			else if (!valid.numberCheck("copyCount", "수량"))
				return;
			else if (!valid.nullCheck("customerManager", "담당자"))
				return;
			else if (!valid.nullCheck("id-date-picker-1", "매입일자"))
				return;
			else if (!valid.radioCheck("taxKind", "세금 종류"))
				return;
			else {
				$("#insert-intangibleAssets-form").submit();
			}
		}

		// 수정 유효성 검사
		function update() {
			checkClosing();
			if (!valid.nullCheck("id", "무형자산 코드"))
				return;
			if (!valid.numberCheck("id", "무형자산 코드"))
				return;
			if (!valid.nullCheck("address", "설치 주소"))
				return;
			if (!valid.nullCheck("code", "무형자산 분류"))
				return;
			if (!valid.nullCheck("customerNo", "거래처"))
				return;
			if (!valid.nullCheck("acqPrice", "취득 금액"))
				return;
			if (!valid.nullCheck("addiFee", "부대 비용"))
				return;
			if (!valid.nullCheck("code", "무형자산 명"))
				return;
			if (!valid.nullCheck("user", "사용 담당자"))
				return;
			if (!valid.nullCheck("copyCount", "수량"))
				return;
			if (!valid.numberCheck("copyCount", "수량"))
				return;
			if (!valid.nullCheck("customerManager", "담당자"))
				return;
			if (!valid.nullCheck("id-date-picker-1", "매입일자"))
				return;
			if (!valid.radioCheck("taxKind", "세금 종류"))
				return;
			
			// 무형자산 수정 : U
			var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update";
			
			$("#insert-intangibleAssets-form").attr("action", url).submit();
		}
		
		function deleteCheck() {
			checkClosing();
			var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete";
			
			$("#insert-intangibleAssets-form").attr("action", url).submit();
		}

		var valid = {
			// null 체크
			nullCheck : function(id, msg) {
				if ($("#" + id).val() == "") {
					dialog(msg + " 을(를) 입력 해 주세요.");
					$("#" + id).focus();
					return false;
				} else {
					return true;
				}
			},

			// 문자열 체크
			strCheck : function(id) {

			},

			// 문자열 체크 
			radioCheck : function(name, msg) {
				if (!jQuery('input[name=' + name + ']:checked').val()) {
					dialog(msg + " 를 선택해 주세요.");
					return false;
				} else {
					return true;
				}
			},

			// 숫자 체크
			numberCheck : function(id, msg) {
				if (!$.isNumeric($("#" + id).val())) {
					dialog(msg + "는 숫자만 입력 가능합니다.");
					$("#" + id).val("");
					$("#" + id).focus();
					return false;
				} else {
					return true;
				}
			}
		}
		// 마감일 세팅 여부
		function checkClosing() {
			if ($("#closingDate").val() == "true") {
				dialog("마감된 일자입니다. <br>저장되지 않았습니다", true);
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
											location.href = "${pageContext.request.contextPath }/08/43/list";
										} else {
											$(this).dialog("close");
										}
									}
								} ]
							});
		}

		$(function() {
			checkClosing();
			console.log("clsosing" + $("#closingDate").val());

			

			$(".chosen-select").chosen();

			// 중복확인 버튼 
			// form에 있는 checkpurchaseno로 flag를 준다.
			$("#overlapBtn").on(
					"click",
					function(e) {
						e.preventDefault();

						var id = "f" + $("#id").val();

						$.ajax({
							url : $("#context-path").val() + "/"
									+ $("#main-menu-code").val() + "/"
									+ $("#sub-menu-code").val()
									+ "/checkId?id=" + id,
							type : "get",
							dataType : "json",
							data : "",
							success : function(data) {
								if (data === "true") {
									dialog("사용가능한 품목 코드입니다.", false);
									$("#insert-intangibleAssets-form").data(
											"checkpurchaseno", "ok");
									$("#overlapBtn").hide();
									$("#check-icon").show();
									var checkpurchaseno = $(
											"#insert-intangibleAssets-form")
											.data("checkpurchaseno");
									console.log("사용가능한 품목 코드입니다."
											+ checkpurchaseno);

								} else if (data === "false") {
									dialog("중복된 품목코드입니다.", false);
									$("#insert-intangibleAssets-form").data(
											"checkpurchaseno", "no");
									$("#id").val("");

								} else if (data === "none") {
									dialog("품목코드 9자를 입력해주세요.", false);
									$("#insert-intangibleAssets-form").data(
											"checkpurchaseno", "no");

								}
							},
							error : function(error) {
								dialog("찾을 수 없는 품목입니다.", true);
							}
						});
					});

			// 무형자산코드 변화 시 중복확인버튼 보이기
			$("#id").on(
					'keyup',
					function(event) {
						var check = $("#insert-intangibleAssets-form").data(
								"checkpurchaseno");

						if (check == "ok") {
							if ($("#id").val().length < 9) {
								$("#insert-intangibleAssets-form").data(
										"checkpurchaseno", "no");
								$("#overlapBtn").show(); //중복확인버튼
								$("#check-icon").hide(); //체크아이콘
							}
						}
					});

			// 대분류명 선택시 대분류 코드 가져오기
			$('#classification').change(
					function() {
						var code = $('#classification option:selected').attr(
								'sectionList');
						$('#code').val(code);
					});

			// 거래처 코드 선택시 거래처 명 가져오기
			$('#customerNo').change(
					function() {
						var customerName = $('#customerNo option:selected')
								.attr('customerName');
						var customerManager = $('#customerNo option:selected')
								.attr('customerManager');

						$('#customerName').val(customerName);
						$('#customerManager').val(customerManager);
					});

			// 모든 입력항목 유효성 검사
			$("#add").click(function() {
				insert();
			});

			$("#update").click(function() {
				update();
			});
			
			$("#delete").click(function() {
				deleteCheck();
			});

			// 무형자산 등록 : C
			$('#add')
					.click(
							function(event) {
								event.preventDefault();
								$("form")
										.attr(
												"action",
												"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add");

							});

			function addCommas(x) {
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

			// 무형자산 등록할때 금액 3자리마다 ',' 넣기
			$(function() {
				$("#acqPrice").on(
						'keyup',
						function(event) {
							$(this).val(
									addCommas($(this).val().replace(/[^0-9]/g,
											"")));
						});
				$("#addiFee").on(
						'keyup',
						function(event) {
							$(this).val(
									addCommas($(this).val().replace(/[^0-9]/g,
											"")));
						});
			});

			// 무형자산 품목코드 조회 : R
			$('#list')
					.click(
							function() {
								var kwd = $("#id").val();

								$("form")
										.attr(
												"action",
												"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?kwd="
														+ kwd);

							});

			// 무형자산 삭제 : D
			/* $("#delete")
					.click(
							function(event) {
								$("form")
										.attr(
												"action",
												"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
							}); */

			// 초기화 버튼
			$("#reset").click(function() {
				location.reload();
			});

			// enter key 막기
			document.addEventListener('keydown', function(event) {
				if (event.keyCode === 13) {
					$(this).next('.inputs').focus();
					event.preventDefault();
				}
			}, true);

			// 조회시 셀렉트박스 값 고정 
			function updateClassification(sectionCode) {
				var options = document.getElementById("classification");
				for (var i = 0; i < options.length; ++i) {
					if (options[i].value == sectionCode) {
						options[i].selected = "selected";
						$("#classification_chosen").find("span")[0].innerHTML = options[i].innerHTML;
					}
				}
			}

			function updateCustomerNo(customer) {
				var options = document.getElementById("customerNo");
				for (var i = 0; i < options.length; ++i) {
					if (options[i].value == customer) {
						options[i].selected = "selected";
						$("#customerNo_chosen").find("span")[0].innerHTML = options[i].innerHTML;
					}
				}
			}

			function updatePurpose(purpose) {
				var options = document.getElementById("purpose");
				for (var i = 0; i < options.length; ++i) {
					if (options[i].value == purpose) {
						options[i].selected = "selected";
						$("#purpose_chosen").find("span")[0].innerHTML = options[i].innerHTML;
					}
				}
			}

			// 행 클릭시 수정, 삭제
			$(".clickme").click(function() {
				
				$("#overlapBtn").hide();
				$("#taxbillNo").show();

				// id값 수정, 삭제 못하게 readonly로 바꿈
				$("#id").prop('readonly', true);

				var str = ""
				var tdArr = new Array(); // 배열 선언

				// 현재 클릭된 Row(<tr>)
				var tr = $(this);
				var td = tr.children();

				console.log(tr.text());

				$("input[name=id]").val((td.eq(1).text()).replace('f', ""));

				$("input[name=address]").val(td.eq(2).text());

				updateClassification(td.eq(3).text());
				//$("#form_field_section_chosen").find("span").text(td.eq(3).text());

				$("input[name=code]").val(td.eq(4).text());

				updateCustomerNo(td.eq(5).text());
				//$("#form_field_customer_chosen").find("span").text(td.eq(5).text());

				$("input[name=customerName]").val(td.eq(6).text());

				$("input[name=acqPrice]").val((td.eq(7).text()));

				$("input[name=addiFee]").val((td.eq(8).text()));

				$("input[name=taxbillNo]").val(td.eq(9).text());

				$("input[name=name]").val(td.eq(10).text());

				$("input[name=user]").val(td.eq(11).text());

				$("input[name=copyCount]").val(td.eq(12).text());

				$("input[name=customerManager]").val(td.eq(13).text());

				updatePurpose(td.eq(14).text());
				//$("#form_field_purpose_chosen").find("span").text(td.eq(14).text());

				$("input[name=payDate]").val(td.eq(15).text());

				$("input[name=taxKind]").val(td.eq(16).text());

				if (td.eq(16).text() == "과세") {
					$("input[id=tax]").prop('checked', true);

				} else if (td.eq(16).text() == "영세") {
					$("input[id=zeroTax]").prop('checked', true);

				}

				if (td.eq(9).text() == "") {
					$("#add").hide();
					$("#list").hide();
					$("#update").show();
					$("#delete").show();

				} else if (td.eq(9).text() != "") {
					$("#add").hide();
					$("#list").hide();
					$("#update").hide();
					$("#delete").show();

				}
			});

		});
	</script>
</body>
</html>