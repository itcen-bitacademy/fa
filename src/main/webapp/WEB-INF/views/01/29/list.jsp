<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
	<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />

	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>
	<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

<style>
.chosen-search {
	display: none;
}
</style>

	
<!-- DatePicker -->
<script>
	$(function() {
		// 데이트피커 한글설정
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
			format : "yyyy-mm",
			titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart : 0
		};

		// 년월 설정 데이트피커
		$('#datepicker').datepicker({
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
		
		
	});
</script>


<!-- popup 실행 -->
<script>
$(function() {
	$("#dialog-message").dialog({
		autoOpen : false
	});

	$("#a-customerinfo-dialog").click(function() {
		$("#dialog-message").dialog('open');
		
		$("#modal-customer-table").hide();
		$("#modal-bank-table").hide();
		
		$("#dialog-message").dialog({
			title: "거래처정보",
			title_html: true,
		   	resizable: false,
		    height: 500,
		    width: 700,
		    modal: true,
		    close: function() {
		    	$('#tbody-customerList tr').remove();
		    	$('#tbody-bankList tr').remove();
		    },
		    buttons: {
		    "닫기" : function() {
		          	$(this).dialog('close');
		          	$('#tbody-customerList tr').remove();
		          	$('#tbody-bank tr').remove();
		        }
		    }
		});
	});

	$("#a-dialog-customerno").click(function(){
		$("#modal-customer-table").show();
		$("#modal-bank-table").hide();
	});

	$("#a-dialog-customername").click(function(){
		$("#modal-customer-table").show();
		$("#modal-bank-table").hide();
	});
		
	

	//거래처리스트(customerList)의 row의 해당 데이터 form에 추가
	$(document.body).delegate('#tbody-customerList tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		var customerNo = td.eq(1).text();
		var noArray = customerNo.split('-');
		$("input[name=customerNo]").val(noArray[0]+noArray[1]+noArray[2]);
		$("input[name=customerName]").val(td.eq(2).text());
		$("#dialog-message").dialog('close');
	});


});
</script>

<script>
	$(function() {
		$("#dialog-message2").dialog({
			autoOpen : false
		});

		$("#a-accountinfo-dialog").click(function() {
			$("#dialog-message2").dialog('open');
			
			$("#modal-account-table").show();
			
			$("#dialog-message2").dialog({
				title: "계정정보",
				title_html: true,
			   	resizable: false,
			    height: 500,
			    width: 350,
			    modal: true,
			    close: function() {
			    	$('#tbody-accountList tr').remove();
			    },
			    buttons: {
			    "닫기" : function() {
			          	$(this).dialog('close');
			          	$('#tbody-accountList tr').remove();
			        }
			    }
			});
		});

		$("#a-dialog-accountno").click(function(){
			$("#modal-account-table").show();
		});

		$("#a-dialog-accountname").click(function(){
			$("#modal-account-table").show();
		});

		$(document.body).delegate('#tbody-accountList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=accountNo]").val(td.eq(1).text());
			$("input[name=accountName]").val(td.eq(0).text());
			$("#dialog-message2").dialog('close');
		});

	});
</script>



<!-- popup ajax 처리 -->
<script>
	$(function() {
		// 사업자번호 검색
		$("#a-dialog-customerno").click(function(event){
			event.preventDefault();
			$("#tbody-customerList").find("tr").remove();
		
			var customerNoVal = $("#input-dialog-customerno").val();
			console.log("djlfajldjal"+customerNoVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/getcustomerNo?customerNoVal=" + customerNoVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json",
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(response){
					$("#input-dialog-customerno").val('');
					$.each(response.data,function(index, item){
						$("#tbody-customerList").append("<tr>" +
						        "<td class='center'>" + item.customerDiv + "</td>" +
						        "<td class='center'>" + item.no + "</td>" +
						        "<td class='center'>" + item.name + "</td>" +
						        "</tr>");
		        	 });
				
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// 계정 이름
		$("#a-dialog-accountname").click(function(event){
			event.preventDefault();
			$("#tbody-accountList").find("tr").remove();
			
			var accountNameVal = $("#input-dialog-accountname").val();
			console.log(accountNameVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/getaccountName?accountNameVal=" + accountNameVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(response){
					$("#input-dialog-accountname").val('');
					 $.each(response.data,function(index, item){
			                $("#tbody-accountList").append("<tr>" +
			                		"<td class='center'>" + item.accountName + "</td>" +
							        "<td class='center'>" + item.accountNo + "</td>" +
							        "</tr>");
			         })
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// 계정번호
		$("#a-dialog-accountno").click(function(event){
			event.preventDefault();
			$("#tbody-accountList").find("tr").remove();
			
			var accountNoVal = $("#input-dialog-accountno").val();
			console.log(accountNoVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/getaccountNo?accountNoVal=" + accountNoVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(response){
					$("#input-dialog-accountno").val('');
					 $.each(response.data,function(index, item){
			                $("#tbody-accountList").append("<tr>" +
			                		"<td class='center'>" + item.accountName + "</td>" +
							        "<td class='center'>" + item.accountNo + "</td>" +
							        "</tr>");
			         })
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		//거래처명 검색 :거래처목록 리스트로 가져오기
		$("#a-dialog-customername").click(function(event){
			event.preventDefault();
			$("#tbody-customerList").find("tr").remove();
			
			var customerNameVal = $("#input-dialog-customername").val();
			console.log(customerNameVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/getcustomerName?customerNameVal=" + customerNameVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(response){
					$("#input-dialog-customername").val('');
					 $.each(response.data,function(index, item){
			                $("#tbody-customerList").append("<tr>" +
			                		"<td class='center'>" + item.customerDiv + "</td>" +
							        "<td class='center'>" + item.no + "</td>" +
							        "<td class='center'>" + item.name + "</td>" +
							        "</tr>");
			         })
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
	});
</script>




<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">



				<div class="page-header position-relative">
					<h1 class="pull-left">계정 명세서 조회</h1>
				</div>


				<div class="row-fluid">
					<form class="form-horizontal" id="input-form" name="input-form">
						거래처/코드:
						
						<div class="input-append">
										<a href="#" id="a-customerinfo-dialog">
											<input type="text" class="search-input-width-first" id="customerName" name="customerName" style="text-align: center; width:150px;" readonly/>
											<span class="add-on">
				                            <i class="icon-search icon-on-right bigger-110"></i>
				                            </span>
				                    	</a>
									</div>
						<input type="text" id="customerNo" name="customerNo" placeholder="자동입력" class="col-xs-10 col-sm-5" style="text-align: center; width:150px;" readonly />
						
						
						&nbsp; &nbsp;
						입력 기간
						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker" name="regDate" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>

						&nbsp;&nbsp;
						계정코드/계정명
									<div class="input-append">
										<a href="#" id="a-accountinfo-dialog">
											<input type="text" class="search-input-width-first" id="accountNo" name="accountNo" style="text-align: center; width:150px;" readonly/>
											
											<span class="add-on">
				                            <i class="icon-search icon-on-right bigger-110"></i>
				                            </span>
				                    	</a>
									</div>
				
						<input type="text" id="accountName" name="accountName" placeholder="자동입력" class="col-xs-10 col-sm-5" style="text-align: center; width:150px;" readonly />
						
						<button class="btn btn-small btn-info" type="submit" formaction="${pageContext.request.contextPath}/${menuInfo.mainMenuCode}/${menuInfo.subMenuCode}/search">조회</button>

					</form>
					<div class="hr hr-18 dotted"></div>
				</div>
				
				
				<!-- 거래처 Modal pop-up : start -->
					<div id="dialog-message" title="계좌" hidden="hidden">
						<table id="dialog-message-table">
							<tr>
								<td>
									<label>사업자등록번호</label>
									<input type="text" id="input-dialog-customerno" style="width: 100px;" />
									<a href="#" id="a-dialog-customerno"> 
										<span class="btn btn-small btn-info" style="margin-bottom: 10px;">
											<i class="icon-search nav-search-icon"></i>
										</span>
									</a>
								</td>
								
								<td>
									<label>상호명</label>
									<input type="text" id="input-dialog-customername" style="width: 100px;" />
									<a href="#" id="a-dialog-customername">
										<span class="btn btn-small btn-info" style="margin-bottom: 10px;">
											<i class="icon-search nav-search-icon"></i>
										</span>
									</a>
								</td>
								
							</tr>
						</table>
						
						<!-- 거래처 데이터 리스트 -->
						<table id="modal-customer-table" class="table  table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">구분</th>
									<th class="center">사업자등록번호</th>
									<th class="center">상호명</th>
								</tr>
							</thead>
							
							<tbody id="tbody-customerList">
							</tbody>
						</table>
						
					</div>
					<!-- 거래처Modal pop-up : end -->
					
					<!-- 계정 Modal pop-up : start -->
					<div id="dialog-message2" title="계정" hidden="hidden">
						<table id="dialog-message-table">
							<tr>
								<td>
									<label>계정명</label>
									<input type="text" id="input-dialog-accountname" style="width: 100px;" />
									<a href="#" id="a-dialog-accountname">
										<span class="btn btn-small btn-info" style="margin-bottom: 10px;">
											<i class="icon-search icon-on-right bigger-110"></i>
										</span>
									</a>
								</td>
								
								<td>
									<label>계정코드</label>
									<input type="text" id="input-dialog-accountno" style="width: 100px;" />
									<a href="#" id="a-dialog-accountno">
										<span class="btn btn-small btn-info" style="margin-bottom: 10px;">
											<i class="icon-search icon-on-right bigger-110"></i>
										</span>
									</a>
								</td>
							</tr>
						</table>
						
						<!-- 계정 데이터 리스트 -->
						<table id="modal-account-table" class="table  table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">계정명</th>
									<th class="center">계정코드</th>
								</tr>
							</thead>
							
							<tbody id="tbody-accountList">
							</tbody>
						</table>
					</div>
					
					<!-- 계정 Modal pop-up : end -->



				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>날짜</th>
									<th>거래처 코드</th>
									<th>거래처명</th>
									<th>계정과목코드</th>
									<th>계정과목</th>
									<th>적요</th>
									<th>차변</th>
									<th>대변</th>
									<th>잔액</th>
								</tr>
							</thead>

							<tbody class = "origin-tbody">
								<tr>
									<td>[전월이월]</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								
								<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
										<tr>
											<td>${vo.regDate }</td>
											<td>${vo.customerNo}</td>
											<td>${vo.customerName }</td>
											<td>${vo.accountNo }</td>
											<td>${vo.accountName }</td>
											<td>${vo.voucherUse}</td>
											<c:choose>
												<c:when test="${ vo.amountFlag=='d' }">
													<td>${vo.amount }</td>
													<td></td>
												</c:when>
												<c:otherwise>
													<td></td>
													<td>${vo.amount }</td>
												</c:otherwise>
											</c:choose>

									</tr>
								</c:forEach>

								<tr>
									<td>[합계]</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>

								<tr>
									<td>[누계]</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>

			</div>
			<!-- /.page-content -->
			<div class="pagination">
				<ul>
					<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					</c:otherwise>
					</c:choose>
					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
					<c:choose>
					<c:when test="${pg eq dataResult.pagination.page }">
		
						<li class="active"><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${dataResult.pagination.next }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>