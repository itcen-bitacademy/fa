<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
}

.search-input-width-first{
	width: .span4;
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
					<h1 class="pull-left">전표관리[1-03]</h1>
				</div><!-- /.page-header -->
				<form class="form-horizontal" method="post">
					<div class="row-fluid">
					
						<div class="span6">
								<!-- 전표 등록 영역 -->
								
								<!-- 전표 등록 날짜 -->
								<div class="control-group">
									<label class="control-label" for="form-field-codename">일자 :</label>
									<div class="controls">
										<div class="row-fluid input-append">
										<input class="span4 date-picker" id="regDate" name="regDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">계정 코드 :</label>
									<div class="controls">
										<span class="btn btn-small btn-info"> <a href="#"
											id=""> <i class="icon-search nav-search-icon"></i> 
										<input type="text" class="search-input-width-first" id="accountNo" name="accountNo" />
										</a> 
									
										</span> 
										&nbsp; &nbsp;
										<input type="text" id="accountName" name="accountName" placeholder="계정명" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">금액 :</label>
									<div class="controls">
										<input type="text" id="amount" name="amount">
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">차대구분 :</label>
									<div class="controls">
										<select class="chosen-select" id="amountFlag" name="amountFlag" data-placeholder="차대구분">
											<option value="d">차변</option>
											<option value="c">대변</option>
										</select>
		
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">증빙코드 :</label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="" name="manageNo" value="" placeholder="증빙코드" /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="" name ="" value="" placeholder="세금계산서" readonly />
										</div>
									</div>
								</div>
								
						</div>
	
						<div class="span6">
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 코드 :</label>
									<div class="controls">
										<span class="btn btn-small btn-info"> <a href="#"
											id=""> <i class="icon-search nav-search-icon"></i> 
										<input type="text" class="search-input-width-first" id="customerNo" name="customerNo" />
										</a> 
									
										</span> 
										&nbsp; &nbsp;
										<input type="text" id="customerName" name="customerName" placeholder="거래처명" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">은행 :</label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="bankCode" name="bankCode" value="" placeholder="은행코드" /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="bankCode" name ="bankName" value="" placeholder="은행명" />
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 번호 :</label>
									<div class="controls">
										<span class="btn btn-small btn-info"> <a href="#"
											id="a-bankaccountinfo-dialog"> <i class="icon-search nav-search-icon"></i> 
										<input type="text" class="search-input-width-first" id="cardNo" name="cardNo" />
										</a> 
									
										</span> 
										&nbsp; &nbsp;
										<input type="text" id="cardUser" name="cardUser" placeholder="소유자" readonly/>
									</div>
								</div>
								
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
								<div id="dialog-bank" title="계좌" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>카드번호</label> <input type="text"
												id="input-dialog-depositNo" style="width: 100px;" /> <a
												href="#" id=""> <span
													class="btn btn-small btn-info" style="margin-bottom: 10px;">
														<i class="icon-search nav-search-icon"></i>
												</span>
											</a></td>
										</tr>
									</table>
									<!-- 은행코드 및 은행명 데이터 리스트 -->
									<table id="modal-deposit-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">계좌번호</th>
												<th class="center">예금주</th>
												<th class="center">은행코드</th>
												<th class="center">은행명</th>
											</tr>
										</thead>
										<tbody id="tbody-bankaccountList">
											
										</tbody>
									</table>
								</div>
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
								<!--  -->
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호 :</label>
									<div class="controls">
										<span class="btn btn-small btn-info"> <a href="#"
											id=""> <i class="icon-search nav-search-icon"></i> 
										<input type="text" class="search-input-width-first" id="depositNo" name="depositNo" />
										</a> 
									
										</span> 
										&nbsp; &nbsp;
										<input type="text" id="depositHost" name="depositHost" placeholder="소유자" readonly/>
									</div>
								</div>
								<!--  -->
								
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">전표사용목적 :</label>
									<div class="controls">
										<input class="span8" type="text" id="voucherUse" name="voucherUse" placeholder="전표사용목적"/>
										<input class="span8" type="hidden" id="voucherNo" name="no" />
										<input class="span8" type="hidden" id="insertTeam" name="insertTeam" />
									</div>
								</div>
								

						</div>

					</div><!-- /.row-fluid -->

			
			<div class="hr hr-18 dotted"></div>
			<!-- buttons -->
			<div class="row-fluid">
				<div class="span8">
						<button type="submit" class="btn btn-info btn"  id="btn-read" name="btn-read"
									formaction="${pageContext.request.contextPath}/01/25/read">조회</button>
						<button class="btn btn-primary" type="submit" id="btn-create" name="btn-create"
							formaction="${pageContext.request.contextPath }/01/03/add">입 력</button>
						<button class="btn btn-warning" type="submit" id="btn-update" name="btn-update"
							formaction="${pageContext.request.contextPath }/01/03/update">수 정</button>
						<button class="btn btn-danger" type="submit" id="btn-delete" name="btn-delete"
							formaction="${pageContext.request.contextPath }/01/03/delete">삭 제</button>
						<button class="btn btn-default" type="reset">취 소</button>
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			<div class="hr hr-18 dotted"></div>
			</form>

			<!--조회 테이블 영역 -->
			<div class="row-fluid">
				<div class="span12">
					<table id="simple-table-1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>일자</th>
								<th>전표번호</th>
								<th>구분</th>
								<th>계정과목코드</th>
								<th>계정과목명</th>
								<th>차변</th>
								<th>대변</th>
								<th>거래처번호</th>
								<th>거래처</th>
								<th>증빙종류</th>
								<th>증빙코드</th>
								<th>은행코드</th>
								<th>은행명</th>
								<th>카드번호</th>
								<th>계좌번호</th>
								<th>소유자</th>
								<th>사용목적</th>
								<th>관리팀</th>
							</tr>
						</thead>
						
						<tbody id="voucher_list">
							<c:forEach items='${dataResult.datas }' var='voucherVo' varStatus='status'>

								<tr>
									<td>${voucherVo.regDate }</td>
									<td>${voucherVo.no }</td>
									<c:choose>
								        <c:when test="${voucherVo.amountFlag == 'd' }">
								            <td>차변</td>
								        </c:when>
								        <c:otherwise>
								            <td>대변</td>
								        </c:otherwise>
								    </c:choose>
									<td>${voucherVo.accountNo }</td>
									<td>${voucherVo.accountName }</td>
									<c:choose>
								        <c:when test="${voucherVo.amountFlag == 'd' }">
								            <td>${voucherVo.amount }</td>
								            <td></td>
								        </c:when>
								        <c:otherwise>
								        	<td></td>
								            <td>${voucherVo.amount }</td>
								        </c:otherwise>
								    </c:choose>
								    <td>${voucherVo.customerNo }</td>
									<td>${voucherVo.customerName }</td>
									<c:choose>
								        <c:when test="${voucherVo.manageNo != null }">
								            <td>세금계산서</td>
								        </c:when>
								        <c:otherwise>
								            <td></td>
								        </c:otherwise>
								    </c:choose>
									<td>${voucherVo.manageNo }</td>
									<td>${voucherVo.bankCode }</td>
									<td>${voucherVo.bankName }</td>
									<c:choose>
								        <c:when test="${voucherVo.cardNo != null }">
								            <td>${voucherVo.cardNo }</td>
								            <td></td>
								            <td>${voucherVo.cardUser }</td>
								        </c:when>
								        <c:otherwise>
								        	<td></td>
								        	<td>${voucherVo.depositNo }</td>
								            <td>${voucherVo.depositHost }</td>
								        </c:otherwise>
								    </c:choose>
									<td>${voucherVo.voucherUse }</td>
									<td>${voucherVo.insertTeam }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<!-- 페이징 영역 -->
			<div class="pagination">
				<ul>
					<c:choose>
						<c:when test="${dataResult.pagination.prev }">
							<li><a href="${pageContext.servletContext.contextPath }/01/03/list?page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/01/03/list?page=${pg }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/01/03/list?page=${pg }">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/01/03/list?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
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
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	/* // 전표 추가 & 리스트
	$('#btn-create').click(function(){
		var regDate = $('#regDate').val();
		var accountNo = $('#accountNo').val();
		var accountName = $('#accountName').val();
		var amount = $('#amount').val();
		var amountFlag = $('#amountFlag').val();
		var manageNo = $('#manageNo').val();
		var customerNo = $('#customerNo').val();
		var customerName = $('#customerName').val();
		var bankCode = $('#bankCode').val();
		var bankName = $('#bankName').val();
		var cardNo = $('#cardNo').val();
		var cardUser = $('#cardUser').val();
		var depositNo = $('#depositNo').val();
		var depositHost = $('#depositHost').val();
		var voucherUse = $('#voucherUse').val();
		
		console.log("11111" + regDate);
		console.log("22222" + accountNo);
		console.log("33333" + accountName);
		console.log("44444" + amount);
		console.log("55555" + amountFlag);
		if(regDate == '' || accountNo == '' || accountName == '' || amount == '' || amountFlag == '') {
			return;
		}
		
		var voucherVo = {regDate:regDate, accountNo:accountNo, accountName:accountName, amount:amount, amountFlag:amountFlag,
				manageNo:manageNo, customerNo:customerNo, customerName:customerName, bankCode:bankCode, bankName:bankName,
				cardNo:cardNo, cardUser:cardUser, depositNo:depositNo, depositHost:depositHost, voucherUse:voucherUse
			}
		
		$.ajax({
			url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add", 
			type: "post",
			dataType: "json",
			data: voucherVo,
			success: function(response){
				if(response.result == "fail") {
					console.error(response.message);
					return;
				}
				// 전표 입력시 list로 이동
				window.location.href = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list";
				 */
				
				/* console.log(response);
				let dataResult = response.datas;
				
				$("#voucher_list").empty(); // 태그는 남기고 내용 지우기
				console.log(dataResult);
				for(var i in dataResult) {
					var a = "";
					
					console.log("temp : " + dataResult[i]);
					
					if(dataResult[i].amountFlag == 'd') {
						a = "차변"
					}
					if(dataResult[i].amountFlag == 'c') {
						a = "대변"
					}
					
					var b = "";
					var c = "";
					if(dataResult[i].amountFlag == 'd') {
						b = dataResult[i].amount;
						c = "";
					}
					if(dataResult[i].amountFlag == 'c') {
						b = "";
						c = dataResult[i].amount;
					}
				
					var d = "";
					var e = "";
					if(dataResult[i].manageNo != null) {
						d = "세금계산서";
						e = dataResult[i].manageNo;
					}
					if(dataResult[i].manageNo == null) {
						d = "";
						e = "";
					}
					
					var f = "";
					var g = "";
					var h = "";
					if(dataResult[i].cardNo != null) {
						f = dataResult[i].cardNo;
						g = "";
						h = dataResult[i].cardUser;
					}
					if(dataResult[i].depositNo != null) {
						f = "";
						g = dataResult[i].depositNo;
						h = dataResult[i].depositHost;
					}
					
					var j = "";
					var k = "";
					if(dataResult[i].customerNo != null) {
						j = dataResult[i].customerNo;
						k = dataResult[i].customerName;
					}
					
					var l = dataResult[i].bankCode;
					var m = dataResult[i].bankName;
					if(dataResult[i].bankCode == null) {
						l = "";
						m = "";
					}
				
					$('#voucher_list').append(
						"<tr>" +
						"<td>" + dataResult[i].regDate + "</td>" + 										// 일자
				        "<td>" + dataResult[i].no + "</td>" + 											// 전표번호
				        "<td>" + a + "</td>" +						  									// 차대구분
				        "<td>" + dataResult[i].accountNo + "</td>" + 									// 계정코드
				        "<td>" + dataResult[i].accountName + "</td>" + 									// 계정명
				        "<td>" + b + "</td>" +															// 차변
				        "<td>" + c + "</td>" +															// 대변
				        "<td>" + j + "</td>" +															// 거래처코드
				        "<td>" + k + "</td>" +															// 거래처명
				        "<td>" + d + "</td>" +															// 증빙종류
				        "<td>" + e + "</td>" +															// 증빙코드
				        "<td>" + l + "</td>" +															// 은행코드
				        "<td>" + m + "</td>" +															// 은행명
				        "<td>" + f + "</td>" +															// 카드번호
				        "<td>" + g + "</td>" +															// 계좌번호
				        "<td>" + h + "</td>" +															// 소유주
				        "<td>" + dataResult[i].voucherUse + "</td>" +									// 사용목적
				        "</tr>");
					
					$('#regDate').val();
					$('#accountNo').val();
					$('#accountName').val();
					$('#amount').val();
					$('#amountFlag').val();
					$('#manageNo').val();
					$('#customerNo').val();
					$('#customerName').val();
					$('#bankCode').val();
					$('#bankName').val();
					$('#cardNo').val();
					$('#cardName').val();
					$('#depositNo').val();
					$('#depositHost').val();
					$('#voucherUse').val(); */
					
					/* 
					.append($('<tr/>').append($('<td/>').text(voucherList[i].regDate))
							.append($('<td/>').text(voucherList[i].voucherNo)) // 전표번호
							.append($('<td/>').text(a)) // 차대구분
							.append($('<td/>').text(voucherList[i].accountNo)) // 계정코드
							.append($('<td/>').text(voucherList[i].accountName)) // 계정명
							.append($('<td/>').text(b)) // 차변
							.append($('<td/>').text(c)) // 대변
							.append($('<td/>').text(voucherList[i].customerName)) // 거래처명
							.append($('<td/>').text(d)) // 증빙종류
							.append($('<td/>').text(e)) // 증빙코드
							.append($('<td/>').text(voucherList[i].bankName)) // 은행명
							.append($('<td/>').text(f)) // 카드번호
							.append($('<td/>').text(g)) // 계좌번호
							.append($('<td/>').text(h)) // 소유주
							.append($('<td/>').text("")) // 담당자
							.append($('<td/>').text(voucherList[i].voucherUse))) // 사용목적 
				}
				
			}
		}); // ajax
	}); // .click
	*/
	
	$(document.body).delegate('#simple-table-1 tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		$("input[name=regDate]").val(td.eq(0).text());
		$("input[name=no]").val(td.eq(1).text());
		$("input[name=amountFlag]").val(td.eq(2).text());
		$("input[name=accountNo]").val(td.eq(3).text());
		$("input[name=accountName]").val(td.eq(4).text());
		console.log($("input[name=no]").val());
		if(td.eq(5).text()== "") {
			$("input[name=amount]").val(td.eq(6).text());	
		} else {
			$("input[name=amount]").val(td.eq(5).text());	
		}
		$("input[name=customerNo]").val(td.eq(7).text());
		$("input[name=customerName]").val(td.eq(8).text());
		$("input[name=manageName]").val(td.eq(9).text());
		$("input[name=manageNo]").val(td.eq(10).text());
		$("input[name=bankCode]").val(td.eq(11).text());
		$("input[name=bankName]").val(td.eq(12).text());
		$("input[name=cardNo]").val(td.eq(13).text());
		$("input[name=depositNo]").val(td.eq(14).text());
		if(td.eq(13).text()== "") {
			$("input[name=depositHost]").val(td.eq(15).text());
		} else {
			$("input[name=cardUser]").val(td.eq(15).text());
		}
		
		
		$("input[name=voucherUse]").val(td.eq(16).text());
		$("input[name=insertTeam]").val(td.eq(17).text());
		
		$("input[name=bankName]").prop("readonly", true);
		$("input[name='bankLocation']").prop("readonly", true);
		$("input[name='banker']").prop("readonly", true);
		$("input[name='bankPhoneCall']").prop("readonly", true);  
	});
	
	
	// 팝업
	$(function() {
	      $("#dialog-bank").dialog({
	         autoOpen : false
	      });

	      $("#a-bankaccountinfo-dialog").click(function() {
	         $("#dialog-bank").dialog('open');
	         $("#dialog-bank").dialog({
	            title: "계좌정보",
	            title_html: true,
	               resizable: false,
	             height: 500,
	             width: 400,
	             modal: true,
	             close: function() {
	                $('#tbody-bankacoountList tr').remove();
	             },
	             buttons: {
	             "닫기" : function() {
	                      $(this).dialog('close');
	                      $('#tbody-bankaccountList tr').remove();
	                 }
	             }
	         });
	      });
	  });
	
	
  $('#dialog-message-table').on('click', '#a-dialog-depositNo', function(event) {
     event.preventDefault();
     $("#tbody-bankaccountList").find("tr").remove();
     
     var depositNo = $("#input-dialog-depositNo").val();
     
     // ajax 통신
     $.ajax({
        url: "${pageContext.request.contextPath }/01/25/gets?depositNo=" + depositNo,
        contentType : "application/json; charset=utf-8",
        type: "get",
        dataType: "json",
        data : "",
        statusCode: {
            404: function() {
              alert("page not found");
            }
        },
        success: function(result){
      	  if(result.success) {
      	  	$("#input-dialog-depositNo").val('');
      	  	var baccountList = result.bankAccountList;
      	  	console.log(result.bankAccountList);
      	  	for(let a in baccountList) {
      	  		$("#tbody-bankaccountList").append("<tr>" +
                        "<td class='center'>" + baccountList[a].depositNo + "</td>" +
                        "<td class='center'>" + baccountList[a].depositHost + "</td>" +
                        "<td class='center'>" + baccountList[a].bankCode + "</td>" +
                        "<td class='center'>" + baccountList[a].bankName + "</td>" +
                        "</tr>");

      	  	}
      	  }
        },
        error: function(xhr, error){
           console.error("error : " + error);
        }
     });
  });
  
  // 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 form에 추가
  $(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
     var tr = $(this);
     var td = tr.children();
     $("input[name=depositNo]").val(td.eq(0).text());
     $("input[name=depositHost]").val(td.eq(1).text());
     $("input[name=bankCode]").val(td.eq(2).text());
     $("input[name=bankName]").val(td.eq(3).text());
     $("#dialog-bank").dialog('close');
  });
}); // $(function

</script>
</body>
</html>