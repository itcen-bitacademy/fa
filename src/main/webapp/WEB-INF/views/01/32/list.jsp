<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
	

	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
	<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>
	<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

	<script type="text/javascript">
		$(function() {
			$(".chosen-select").chosen({no_results_text: "일치하는 계정코드가 존재하지 않습니다."});
		})
	</script>

	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	
	<c:import url="/WEB-INF/views/common/head.jsp" />
	
</head>

<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
		
		
		
		
				<div class="page-header position-relative">
					<h1 class="pull-left">계정거래처원장조회[32]</h1>
					<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
						<i class="icon-plus-sign bigger-120 green"></i>
						팀 추가
					</a>
				</div><!-- /.page-header -->
			
				<div class="row-fluid"> <!-- 검색조건 -->
					<form class="form-horizontal; center">
							
							상호명/사업자등록번호:&nbsp;
									<div class="input-append">
										<a href="#" id="a-customerinfo-dialog">
											<input type="text" class="search-input-width-first" id="customerName" name="customerName" style="text-align: center; width:150px;" readonly/>
											<script type="text/javascript">
												var customerName = "${param.customerName}";
												$("#customerName").val(customerName);
												</script>
											<span class="add-on">
				                            <i class="icon-search icon-on-right bigger-110"></i>
				                            </span>
				                    	</a>
									</div>
				
						<input type="text" id="customerNo" name="customerNo" placeholder="자동입력" class="col-xs-10 col-sm-5" style="text-align: center; width:150px;" readonly />
						<script type="text/javascript">
							var customerNo = "${param.customerNo}";
							$("#customerNo").val(customerNo);
						</script>
							
							
							
						
					
						&nbsp; &nbsp;&nbsp; &nbsp;계정코드/계정명
							<select class="chosen-select" id="accountCode" name="accountCode" data-placeholder="계정과목코드" style="width:150px; float: left;">		
								<option value="" data-accountName="">선택안함</option>		
								<c:choose>
									<c:when test="${accountNo eq accountNo }">
										<option value="${accountNo}" data-accountName="${accountNo }" selected>${accountNo }</option>
									</c:when>										
								</c:choose>				
								<c:forEach items="${accountList }" var="vo">									
									<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>
								</c:forEach>
							</select>
								
							<script type="text/javascript">
								var accountCode = "${param.accountCode}";
								$("#accountCode").val(accountCode);
							</script>
						&nbsp; &nbsp; &nbsp;
						<input type="text" id="accountName" name="accountName" placeholder="계정명"  style="text-align: center; width:150px;" readonly="readonly" />
						<script type="text/javascript">
							var accountName = "${param.accountName}";
							$("#accountName").val(accountName);
						</script>
					
					
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
					
						&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;조회 기간 :&nbsp;
						<div class="input-append">
							<input type="text" id="datepicker1" name="datepicker1" class="cl-date-picker"  style="width:100px"/>
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
						
						<script type="text/javascript">
							var datepicker1 = "${param.datepicker1}";
							$("#datepicker1").val(datepicker1);
						</script>
						
						&nbsp; &nbsp; ~ &nbsp; &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" name="datepicker2" class="cl-date-picker"  style="width:100px"/> 
							<span class="add-on"> 
								<i class="icon-calendar"></i>
							</span>
						</div>
						
						<script type="text/javascript">
							var datepicker2 = "${param.datepicker2}";
							$("#datepicker2").val(datepicker2);
						</script>
					&nbsp; &nbsp;&nbsp;
					<button class="btn btn-small btn-info" type="submit" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
					</form>
				
				<div class="hr hr-18 dotted"></div>
			</div><!-- 검색조건 END -->
			
			<div class="row-fluid">
				<div class="span12">

					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<div style="width:100%; overflow-x:auto"> <!-- scroll auto -->
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											
											<th class="center">계정명</th>
											<th class="center">거래처명</th>
											<th class="center">일자</th>
											<th class="center">전표번호-순번</th>
											<th class="center">사용팀/성명</th>
											<th class="center">적요</th>
											<th class="center">카드번호/사용자</th>
											<th class="center">은행명/계좌번호/예금주</th>
											<th class="center">차대구분</th>
											<th class="center">차변</th>
											<th class="center">대변</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
											<tr>
												<td>${vo.accountName }</td>
												<td>${vo.customerName }</td>
												<td>${vo.regDate }</td>
												<td>${vo.voucherNo }-${vo.voucherOrderNo }</td>
												<td>${vo.insertTeam }/${vo.insertUserid }</td>
												<td>${vo.voucherUse }</td>
												<c:choose>
												<c:when test="${empty vo.cardNo }">
												<td></td>
												</c:when>
												<c:otherwise>
												<td>${vo.cardNo }/${vo.cardUser }</td>
												</c:otherwise>
												</c:choose>
												<c:choose>
												<c:when test="${empty vo.bankName}">
												<td></td>
												</c:when>
												<c:otherwise>
												<td>${vo.bankName }/${vo.depositNo }/${vo.depositHost }</td>
												</c:otherwise>
												</c:choose>
												<td>${vo.amountFlag }</td>
													<c:choose>
												        <c:when test="${vo.amountFlag == '차변' }">
												            <td><fmt:formatNumber value="${vo.amount}" pattern="#,###" /></td>
												            <td></td>
												        </c:when>
												        <c:otherwise>
												        	<td></td>
												            <td><fmt:formatNumber value="${vo.amount}" pattern="#,###" /></td>
												        </c:otherwise>
												    </c:choose>
											</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script>
		$(function() {
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
	
			$('#cl-ym-date-picker').datepicker({
				maxViewMode: 4,
				minViewMode: 1,
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
		});
		
		// 사업자번호 검색
		$("#a-dialog-customerno").click(function(event){
			event.preventDefault();
			$("#tbody-customerList").find("tr").remove();
		
			var customerNoVal = $("#input-dialog-customerno").val();
			console.log(customerNoVal);
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
	</script>
<script>
	$(function() {
		$("#dialog-message").dialog({
			autoOpen : false
		});

		$("#a-customerinfo-dialog").click(function() {
			$("#dialog-message").dialog('open');
			$("#dialog-message").dialog({
				title: "거래처정보",
				title_html: true,
			   	resizable: false,
			    height: 500,
			    width: 400,
			    modal: true,
			    close: function() {
			    	$('#tbody-customerList tr').remove();
			    },
			    buttons: {
			    "닫기" : function() {
			          	$(this).dialog('close');
			          	$('#tbody-customerList tr').remove();
			        }
			    }
			});
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

				<script type="text/javascript">
				$('#accountCode').change(function () {
			    	var accountName =$(this).find('option:selected').attr('data-accountName');
			    	$('#accountName').val(accountName);
			   	});
				</script>
</body>
</html>