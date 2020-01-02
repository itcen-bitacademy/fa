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
					<h1 class="pull-left">계정거래처원장조회</h1>
				</div><!-- /.page-header -->
			
				<div class="row-fluid"> <!-- 검색조건 -->
					<form class="form-horizontal; center">
							
							거래처 코드/거래처명:&nbsp;
									<div class="input-append">
										<a href="#" id="a-customerinfo-dialog">
											<input type="text" class="search-input-width-first" id="customerNo" placeholder="거래처코드" name="customerNo" style="text-align: center; width:150px;" readonly/>
											<script type="text/javascript">
												var customerNo = "${param.customerNo}";
												$("#customerNo").val(customerNo);
												</script>
											<span class="add-on">
				                            <i class="icon-search icon-on-right bigger-110"></i>
				                            </span>
				                    	</a>
									</div>
				
						<input type="text" id="customerName" name="customerName" placeholder="거래처명" class="col-xs-10 col-sm-5" style="text-align: center; width:150px;" readonly />
						<script type="text/javascript">
							var customerName = "${param.customerName}";
							$("#customerName").val(customerName);
						</script>
					
						&nbsp; &nbsp;&nbsp; &nbsp;계정코드/계정명
									<div class="input-append">
										<a href="#" id="a-accountinfo-dialog">
											<input type="text" class="search-input-width-first" placeholder="계정코드" id="accountNo" name="accountNo" style="text-align: center; width:150px;" readonly/>
											<script type="text/javascript">
												var accountNo = "${param.accountNo}";
												$("#accountNo").val(accountNo);
												</script>
											<span class="add-on">
				                            <i class="icon-search icon-on-right bigger-110"></i>
				                            </span>
				                    	</a>
									</div>
				
						<input type="text" id="accountName" name="accountName" placeholder="계정명" class="col-xs-10 col-sm-5" style="text-align: center; width:150px;" readonly />
						<script type="text/javascript">
							var accountName = "${param.accountName}";
							$("#accountName").val(accountName);
						</script>
					
					
					<!-- 거래처 Modal pop-up : start -->
					<div id="dialog-message" title="계좌" hidden="hidden">
						<table id="dialog-message-table">
							<tr>
								<td>
									<h3>상호 검색</h3>
									<div class="input-append" style="text-align:center;">
								<select id="searchCustomerOption" style="width:120px;">
											<option value="no">사업자번호</option>
											<option value="name">상호명</option>
									</select>
										<input type="text" id="input-dialog-customerno" style="width: 100px;" />
										<a href="#" id="a-dialog-customerno">
											<span class="add-on">
												<i class="icon-search icon-on-right bigger-110"></i>
											</span>
										</a>
									</div>
								</td>
								<td>
									<h3>은행검색</h3>
									<div class="input-append">
								<select id="searchBankOption" style="width:120px;">
											<option value="no">은행코드</option>
											<option value="name">은행명</option>
									</select>
										<input type="text" id="input-dialog-bankcode" style="width: 100px;" />
										<a href="#" id="a-dialog-bankcode">
											<span class="add-on">
												<i class="icon-search icon-on-right bigger-110"></i>
											</span>
										</a>
									</div>
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
						
						<table id="modal-bank-table" class="table  table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">은행코드</th>
									<th class="center">은행명</th>
								</tr>
							</thead>
							
							<tbody id="tbody-bankList">
							</tbody>
						</table>
					</div>
					<!-- 거래처Modal pop-up : end -->
					
					<!-- 계정 Modal pop-up : start -->
					<div id="dialog-message2" title="계정" hidden="hidden">
						<table id="dialog-message-table">
						<tr>
						</tr>
						
							<tr>
								<td>
									<div class="input-append" >
										<select id="searchAccountOption" style="width:120px;">
											<option value="accountNo">계정코드</option>
											<option value="accountName">계정명</option>
										</select>
									<input type="text" id="input-dialog-accountname" style="width: 100px;" />
									<a href="#" id="a-dialog-accountname"> 
                                    	<span class="add-on">
                                        	<i class="icon-search icon-on-right bigger-110"></i>
                                    	</span>
									</a>
									</div>
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
					
						&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;조회 기간 :&nbsp;
						<div class="input-append">
							<input type="text" id="datepicker1" name="datepicker1" class="cl-date-picker"  style="width:100px" readonly="readonly"/>
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
							<input type="text" id="datepicker2" name="datepicker2" class="cl-date-picker"  style="width:100px" readonly="readonly"/> 
							<span class="add-on"> 
								<i class="icon-calendar"></i>
							</span>
						</div>
						
						<script type="text/javascript">
							var datepicker2 = "${param.datepicker2}";
							$("#datepicker2").val(datepicker2);
						</script>
					&nbsp; &nbsp;&nbsp;
					<button class="btn btn-small btn-info" id="btn-submit" type="submit" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
					&nbsp;
					<button class="btn btn-default btn-small" id="btn-reset" type = "reset">초기화</button>
					</form>
				
				<div class="hr hr-18 dotted"></div>
				
				<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 거래처별 원장 ${dataResult.pagination.totalCnt } 건</p>
				
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
											
											<th class="center">계정과목명</th>
											<th class="center">거래처</th>
											<th class="center">일자</th>
											<th class="center">전표번호-순번</th>
											<th class="center">차대구분</th>
											<th class="center">차변</th>
											<th class="center">대변</th>
											<th class="center">은행명</th>
											<th class="center">카드번호</th>
											<th class="center">계좌번호</th>
											<th class="center">소유자</th>
											<th class="center">사용목적</th>
											<th class="center">관리팀</th>
											
											
										</tr>
									</thead>
									
									<tbody style="text-align: center;">
										<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
											<tr style="text-align: center;">

												<td class="center">${vo.accountName }</td>
												<td class="center">${vo.customerName } </td>
												<td class="center">${vo.regDate }</td>
												<td class="center">${vo.voucherNo }-${vo.voucherOrderNo }</td>
												<td class="center">${vo.amountFlag }</td>
													<c:choose>
												        <c:when test="${vo.amountFlag == '차변' }">
												            <td style="text-align: right;"><fmt:formatNumber value="${vo.amount}" pattern="#,###" /></td>
												            <td style="text-align: right;"></td>
												        </c:when>
												        <c:otherwise>
												        	<td style="text-align: right;"></td>
												            <td style="text-align: right;"><fmt:formatNumber value="${vo.amount}" pattern="#,###" /></td>
												        </c:otherwise>
												    </c:choose>
												<td class="center">${vo.bankName }</td>
													<c:choose>
														<c:when test="${vo.customerName eq '여비' }">
															<td>${vo.cardNo }</td>
												            <td></td>
												            <td>${vo.cardUser }</td>
												        </c:when>
												        <c:otherwise>
												        	<td></td>
												        	<td>${vo.depositNo }</td>
												            <td>${vo.depositHost }</td>
												        </c:otherwise>
												    </c:choose>
												<td class="center">${vo.voucherUse }</td>
												<td class="center">${vo.insertTeam }</td>
												    
											</tr>
											
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
				</div>
				<div id="staticBackdrop" class="hide">
					<br>
					<pre id="staticBackdropBody" class="bolder grey" style="text-align: center; background-color: white; border-color: white" >
					</pre>
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			 <!-- 페이징 영역 -->
			<div class="pagination">
				<ul>
					<c:choose>
						<c:when test="${dataResult.pagination.prev }">
							<li><a href="${pageContext.servletContext.contextPath }/01/32/list?page=${dataResult.pagination.startPage - 1 }&customerName=${param.customerName }&customerNo=${param.customerNo }&accountNo=${param.accountNo }&accountName=${param.accountName }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }"><i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/01/32/list?page=${pg }&customerName=${param.customerName }&customerNo=${param.customerNo }&accountNo=${param.accountNo }&accountName=${param.accountName }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/01/32/list?page=${pg }&customerName=${param.customerName }&customerNo=${param.customerNo }&accountNo=${param.accountNo }&accountName=${param.accountName }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/01/32/list?page=${dataResult.pagination.endPage + 1 }&customerName=${param.customerName }&customerNo=${param.customerNo }&accountNo=${param.accountNo }&accountName=${param.accountName }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }"><i class="icon-double-angle-right"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
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
		
		// 사업자번호 및 상호명으로 검색
		$("#a-dialog-customerno").click(function(event){
			event.preventDefault();
			$("#tbody-customerList").find("tr").remove();
			
			var searchCustomerOption = $("#searchCustomerOption").val();
			var customerNoVal = $("#input-dialog-customerno").val();
			console.log("djlfajldjal"+customerNoVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/searchOptionCustomer?"+searchCustomerOption+"="+customerNoVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json",
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
			    success: function(data){
				  	  if(data.success) {
				  	  	$("#input-dialog-customerNo").val('');
				  	  	var customerList = data.customerList;
				  	  	console.log(data.customerList);
				  	  	for(const c in customerList) {
				  	  		$("#tbody-customerList").append("<tr>" +
				                    "<td class='center'>" + customerList[c].customerDiv + "</td>" +
				                    "<td class='center'>" + customerList[c].no + "</td>" +
				                    "<td class='center'>" + customerList[c].name + "</td>" +
				                    "</tr>");
				
				  	  	}
				  	  }
				    },
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		//은행코드, 은행명을 선택적으로 검색
		$("#a-dialog-bankcode").click(function(event){
			event.preventDefault();
			$("#tbody-bankList").find("tr").remove();
			
			var searchBankOption = $("#searchBankOption").val();
			var bankCodeVal = $("#input-dialog-bankcode").val();
			console.log(bankCodeVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/searchOptionBank?"+searchBankOption+"="+bankCodeVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(data){
				  	  if(data.success) {
					$("#input-dialog-bankcode").val('');
			  	  	var bankList = data.bankList;
			  	  	for(const b in bankList) {
			                $("#tbody-bankList").append("<tr>" +
				                    "<td class='center'>" + bankList[b].no + "</td>" +
				                    "<td class='center'>" + bankList[b].name + "</td>" +
				                    "</tr>");
			  	  	}
			         }
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		//계정명, 계정코드로 검색
		$("#a-dialog-accountname").click(function(event){
			event.preventDefault();
			$("#tbody-accountList").find("tr").remove();
			
			var accountNameVal = $("#input-dialog-accountname").val();
			var searchAccountOption = $("#searchAccountOption").val();
			console.log(accountNameVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/searchOptionAccount?"+searchAccountOption+"="+accountNameVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(data){
				  	  if(data.success) {
							$("#input-dialog-accountname").val('');
					  	  	var accountList = data.accountList;
					  	  	for(const a in accountList) {
					                $("#tbody-accountList").append("<tr>" +
						                    "<td class='center'>" + accountList[a].accountName + "</td>" +
						                    "<td class='center'>" + accountList[a].accountNo + "</td>" +
						                    "</tr>");
					  	  	}
					         }
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
			
			$("#modal-customer-table").hide();
			$("#modal-bank-table").hide();
			
			$("#dialog-message").dialog({
				title: "거래처정보",
				title_html: true,
			   	resizable: false,
			    height: 500,
			    width: 550,
			    modal: true,
			    close: function() {
			    	$('#tbody-customerList tr').remove();
			    	$('#tbody-bankList tr').remove();
			    },
			    buttons: {
			    "닫기" : function() {
			          	$(this).dialog('close');
			          	$('#tbody-customerList tr').remove();
			          	$('#tbody-bankList tr').remove();
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
		
		$("#a-dialog-bankname").click(function(){
			$("#modal-bank-table").show();
			$("#modal-customer-table").hide();
		});

		$("#a-dialog-bankcode").click(function(){
			$("#modal-bank-table").show();
			$("#modal-customer-table").hide();
		});
		
		

		//거래처와 은행 리스트를 row의 해당 데이터 form에 추가
		$(document.body).delegate('#tbody-customerList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			var customerNo = td.eq(1).text();
			var noArray = customerNo.split('-');
			if (noArray[1] !=null || noArray[2] !=null){
				$("input[name=customerNo]").val(noArray[0]+noArray[1]+noArray[2]);
			} else if (noArray[1]==null){
				$("input[name=customerNo]").val(noArray[0]);
				
			}
			$("input[name=customerName]").val(td.eq(2).text());
			$("#dialog-message").dialog('close');
		});

		$(document.body).delegate('#tbody-bankList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=customerNo]").val(td.eq(0).text());
			$("input[name=customerName]").val(td.eq(1).text());
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
	
	
	var validationMessage ='';
	var errortitle='';
	var errorfield ='';
	var nochecked = false;
	
	function openErrorModal(title, message,errorfield) {
		$('#staticBackdropLabel').html(title);
		$('#staticBackdropBody').text(message);
		
		console.log($('#staticBackdropLabel').text());
		console.log($('#staticBackdropBody').text());
	
		$( "#staticBackdrop" ).dialog({
			resizable: false,
			modal: true,
			title: title,
			buttons: [
				{
					text: "OK",
					"class" : "btn btn-danger btn-mini",
					click: function() {
						$(this).dialog('close');
			          	$('#staticBackdropBody').text('');
						$(errorfield).focus();
					}
				}
			]
		});
	
		$("#staticBackdrop").dialog('open');//모달을 띄운다
	}
	
	//search Validation
	function SearchValidation(){
		let customerName =$('#customerNo').val();//거래처명
		let accountNo =$('#accountNo').val();//계정코드
		let datepicker1 =$('#datepicker1').val();//시작날짜
		let datepicker2 =$('#datepicker2').val();//종료날짜
		
		//사업자등록번호
		if("" == customerNo){
			errortitle = 'CUSTOMER_SELECTED ERROR';
			validationMessage = '거래처명, 거래처코드는 필수 입력항목입니다.\r\n팝업창을 통해 입력해주세요.';
			errorfield='#customerNo';
			return false;
			
		}

		if("" == accountNo){
			errortitle = 'ACCOUNT_SELECTED ERROR';
			validationMessage = '계정명, 코드는 필수 입력항목입니다.\r\n팝업창을 통해 입력해주세요.';
			errorfield='#accountNo';
			return false;
			
		}
		
		//datepicker 관련 Valid
		if(datepicker1 > datepicker2){
			errortitle = 'DATE_RANGE_ERROR';
			validationMessage = '조회기간 범위 오류입니다.\r\n 종료일을 시작일 이후로 설정해주세요';
			errorfield='#datepicker2';
			return false;
			
		}
	
		return true;
	}
	
	$(function(){
		$("#btn-submit").click(function(){
			if(!SearchValidation()){
				openErrorModal(errortitle,validationMessage,errorfield);
				return false;
			}
			return true;
		});
	});
	
	
</script>
</body>
</html>