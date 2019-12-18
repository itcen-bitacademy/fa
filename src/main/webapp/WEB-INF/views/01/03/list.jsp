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
.search-input-width-first{
	width: .span4;
}

#dialog-message {
	overflow: auto;
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
				<form class="form-horizontal" id="input-form"  method="post">
					<div class="row-fluid">
						<div class="span6">
							
								<!-- 전표 등록 영역 -->
								
								<!-- 전표 등록 날짜 -->
								<div class="control-group">
									<label class="control-label" for="form-field-codename" style="text-align:left;width:120px;" >일자</label>
									<div class="controls">
										<div class="row-fluid input-append">
										<input class="span4 date-picker" id="regDate" name="regDate" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								
								<!-- 계정과목  -->
								<div class="control-group">
									<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;" >계정과목</label>
									<div class="controls">
										<select class="chosen-select" id="accountNo" name="accountNo" data-placeholder="계정과목코드">		
											<option value="" data-accountName=""></option>		
											<c:choose>
												<c:when test="${accountNo eq accountNo }">
													<option value="${accountNo}" data-accountName="${accountNo }" selected>${accountNo }</option>
												</c:when>										
											</c:choose>				
											<c:forEach items="${accountList }" var="vo">									
													<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>
											</c:forEach>
										</select> 
										<input type="text" id="accountName" name="accountName" placeholder="계정명칭" value="" style="text-align: center; width: 300px; height: 18px;" disabled />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >금액</label>
									<div class="controls">
										<input type="text" id="amount" name="amount" placeholder="0" onkeyup="inputNumberFormat(this)">
									</div>
								</div>
								
								
								<div class="control-group">
									<label class="control-label" style="text-align:left;width:120px;" >차대구분</label>
									<div class="controls">
										<select class="chosen-select" id="amountFlag" name="amountFlag" data-placeholder="차대구분">
											<option value="d">차변</option>
											<option value="c">대변</option>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >증빙코드</label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="manageNo" name="manageNo" value="" placeholder="증빙코드" /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="manageName" name ="manageName" value="" placeholder="세금계산서" readonly />
										</div>
									</div>
								</div>
						</div>
	
						<div class="span6">
							<div class="tabbable">
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >거래처 코드</label>
									<div class="controls">
										<span class="btn btn-small btn-info">
										<a href="#" id="a-customerinfo-dialog"> 
										<input type="text" class="search-input-width-first" id="customerNo" name="customerNo" />
										<i class="icon-search nav-search-icon"></i> 
										</a> 
									
										</span> 
										&nbsp; &nbsp;
										<input type="text" id="customerName" name="customerName" placeholder="거래처명" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >은행</label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="bankCode" name="bankCode" value="" placeholder="은행코드" readonly /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="bankName" name ="bankName" value="" placeholder="은행명" readonly />
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >카드번호</label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="cardNo" name="cardNo" value="" placeholder="카드번호" readonly />
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="cardUser" name ="cardUser" value="" placeholder="소유자" readonly />
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >계좌번호</label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="depositNo" name="depositNo" value="" placeholder="계좌번호" readonly /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="depositHost" name ="depositHost" value="" placeholder="소유자" readonly />
										</div>
									</div>
								</div>
								<!--  -->
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >전표사용목적</label>
									<div class="controls">
										<input class="span8" type="text" id="voucherUse" name="voucherUse" placeholder="전표사용목적"/>
										<input class="span8" type="hidden" id="voucherNo" name="no" />
										<input class="span8" type="hidden" id="insertTeam" name="insertTeam" />
									</div>
								</div>
								
								<!-- 거래처 Modal pop-up : start -->
								<div id="dialog-message" title="거래처" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>거래처코드</label> <input type="text"
												id="input-dialog-customerNo" style="width: 100px;" /> <a
												href="#" id="a-dialog-customerNo"> <span
													class="btn btn-small btn-info" style="margin-bottom: 10px;">
														<i class="icon-search nav-search-icon"></i>
												</span>
											</a></td>
										</tr>
									</table>
									<!-- 거래처코드 및 거래처명 데이터 리스트 -->
									<table id="modal-customer-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">거래처번호</th>
												<th class="center">거래처명</th>
												<th class="center">은행코드</th>
												<th class="center">은행명</th>
												<th class="center">카드번호</th>
												<th class="center">계좌번호</th>
												<th class="center">소유주</th>
											</tr>
										</thead>
										<tbody id="tbody-customerList">
											
										</tbody>
									</table>
								</div>
								<!-- 거래처 Modal pop-up : end -->
							</div>

						</div>

					</div><!-- /.row-fluid -->
					
			<div class="hr hr-18 dotted"></div>
			
			<!-- 가저장 테이블 -->
			<div class="row-fluid">
				<div class="span12">
                <input type="hidden" id="rowCnt" name="rowCnt" value="1">
                    <table id="save-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">일자</th>
                            <th class="center">계정과목코드</th>
                            <th class="center">계정과목명</th>
                            <th class="center">구분</th>
                            <th class="center">금액</th>
                            <th class="center">거래처번호</th>
                            <th class="center">거래처명</th>
                            <th class="center">증빙종류</th>
							<th class="center">증빙코드</th>
                            <th class="center">은행코드</th>
                            <th class="center">은행명</th>
                            <th class="center">카드번호</th>
                            <th class="center">계좌번호</th>
                            <th class="center">소유자</th>
                            <th class="center">사용목적</th>
                        </tr>
                        </thead>
                        
                        <tbody id="voucher_save">
                        
                        </tbody>
                        
                    </table>
                    <!-- PAGE CONTENT ENDS -->
                </div>
            </div>
			
			<div class="hr hr-18 dotted"></div>
			<!-- buttons -->
			<button class="btn btn-info btn-small" type="submit" id="btn-read" name="btn-read"
				formaction="${pageContext.request.contextPath}/01/03/read">조 회</button>
			<button class="btn btn-default btn-small" type="reset">취 소</button>
			</form>
			<div class="row-fluid">
				<div class="span8">
						
						<button class="btn btn-small" type="button" onclick="add();">입 력</button>
						<button class="btn btn-warning btn-small" type="submit" id="btn-update" name="btn-update"
							formaction="${pageContext.request.contextPath }/01/03/update">수 정</button>
						<button class="btn btn-danger btn-small" type="submit" id="btn-delete" name="btn-delete"
							formaction="${pageContext.request.contextPath }/01/03/delete">삭 제</button>
						<button class="btn btn-primary btn-small" type="submit" id="btn-create" 
							name="btn-create" onclick="save();">저 장</button>
						
						
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			<div class="hr hr-18 dotted"></div>
			<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 전표 ${dataResult.pagination.totalCnt } 건</p>
			
			<!--조회 테이블 영역 -->
			<div class="row-fluid">
				<div class="span12">
					<table id="simple-table-1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">일자</th>
								<th class="center">전표번호</th>
								<th class="center">순번</th>
								<th class="center">구분</th>
								<th class="center">계정과목코드</th>
								<th class="center">계정과목명</th>
								<th class="center">차변</th>
								<th class="center">대변</th>
								<th class="center">거래처번호</th>
								<th class="center">거래처</th>
								<th class="center">증빙종류</th>
								<th class="center">증빙코드</th>
								<th class="center">은행코드</th>
								<th class="center">은행명</th>
								<th class="center">카드번호</th>
								<th class="center">계좌번호</th>
								<th class="center">소유자</th>
								<th class="center">사용목적</th>
								<th class="center">관리팀</th>
							</tr>
						</thead>
						
						<tbody id="voucher_list">
							<c:forEach items='${dataResult.datas }' var='voucherVo' varStatus='status'>

								<tr>
									<td>${voucherVo.regDate }</td>
									<td>${voucherVo.no }</td>
									<td>${voucherVo.orderNo }</td>
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
								            <td><fmt:formatNumber value="${voucherVo.amount}" pattern="#,###" /></td>
								            <td></td>
								        </c:when>
								        <c:otherwise>
								        	<td></td>
								            <td><fmt:formatNumber value="${voucherVo.amount}" pattern="#,###" /></td>
								        </c:otherwise>
								    </c:choose>
								    <td>${voucherVo.customerNo }</td>
									<td>${voucherVo.customerName }</td>
									<c:choose>
										<c:when test="${voucherVo.manageNo == '' }">
								            <td></td>
								        </c:when>
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
										<c:when test="${voucherVo.customerName eq '여비' }">
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
							<li><a href="${pageContext.servletContext.contextPath }/01/03/read?page=${dataResult.pagination.startPage - 1 }&regDate=${param.regDate }&accountNo=${param.accountNo }&amount=${param.amount }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }"><i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/01/03/read?page=${pg }&regDate=${param.regDate }&accountNo=${param.accountNo }&amount=${param.amount }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/01/03/read?page=${pg }&regDate=${param.regDate }&accountNo=${param.accountNo }&amount=${param.amount }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/01/03/read?page=${dataResult.pagination.endPage + 1 }&regDate=${param.regDate }&accountNo=${param.accountNo }&amount=${param.amount }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }"><i class="icon-double-angle-right"></i></a></li>
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
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
	//입력폼에서 입력한 값 가저장 테이블에 저장하기
	//var voucherList = new Array();
	function add() {
		var regDate = $('#regDate').val();
		var accountNo = $('#accountNo').val();
		var accountName = $('#accountName').val();
		var amountFlag = $('#amountFlag').val();
		var amount = $('#amount').val();
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
		
		if(regDate == '' || accountNo == '' || accountName == '' || amount == '' || amountFlag == '' || customerNo == '' || customerName == '') {
			return;
		}
		
		var voucherVo = {regDate:regDate, accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
				manageNo:manageNo, customerNo:customerNo, customerName:customerName, bankCode:bankCode, bankName:bankName,
				cardNo:cardNo, cardUser:cardUser, depositNo:depositNo, depositHost:depositHost, voucherUse:voucherUse
			}
		
		//voucherList.push(voucherVo);
		
		var table = document.getElementById("save-table"); // 테이블 아이디
		var row = table.insertRow(table.rows.length); // 하단에 추가
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);
		var cell8 = row.insertCell(7);
		var cell9 = row.insertCell(8);
		var cell10 = row.insertCell(9);
		var cell11 = row.insertCell(10);
		var cell12 = row.insertCell(11);
		var cell13 = row.insertCell(12);
		var cell14 = row.insertCell(13);
		var cell15 = row.insertCell(14);
		
		cell1.innerHTML = '<td>' + regDate + '</td>';
		cell2.innerHTML = '<td>' + accountNo + '</td>';
		cell3.innerHTML = '<td>' + accountName + '</td>';
		cell4.innerHTML = '<td>' + amountFlag + '</td>';
		cell5.innerHTML = '<td>' + comma(amount) + '</td>';
		cell6.innerHTML = '<td>' + customerNo + '</td>';
		cell7.innerHTML = '<td>' + customerName + '</td>';
		if(manageNo == '') {
			cell8.innerHTML = '<td>' + '</td>';
			cell9.innerHTML = '<td>' + '</td>';
		} else if (manageNo != null) {
			cell8.innerHTML = '<td>' + '세금계산서' + '</td>';
			cell9.innerHTML = '<td>' + manageNo + '</td>';
		} else {
			cell8.innerHTML = '<td>' + '</td>';
			cell9.innerHTML = '<td>' + '</td>';
		}
		cell10.innerHTML = '<td>' + bankCode + '</td>';
		cell11.innerHTML = '<td>' + bankName + '</td>';
		if(customerName == '여비') {
			cell12.innerHTML = '<td>' + cardNo + '</td>';
			cell13.innerHTML = '<td>' + '</td>';
			cell14.innerHTML = '<td>' + cardUser + '</td>';
		} else {
			cell12.innerHTML = '<td>' + '</td>';
			cell13.innerHTML = '<td>' + depositNo + '</td>';
			cell14.innerHTML = '<td>' + depositHost + '</td>';
		}
		cell15.innerHTML = '<td>' + voucherUse + '</td>';
		
		$('#regDate').val('');
		$('#accountNo').val('');
		$('#accountName').val('');
		$('#amountFlag').val('');
		$('#amount').val('');
		$('#manageNo').val('');
		$('#customerNo').val('');
		$('#customerName').val('');
		$('#bankCode').val('');
		$('#bankName').val('');
		$('#cardNo').val('');
		$('#cardUser').val('');
		$('#depositNo').val('');
		$('#depositHost').val('');
		$('#voucherUse').val('');
		
    }
	
	// 전표 추가
	function save() {
		
		// array를 json으로 변환
		//var jsonString = JSON.stringify(voucherList);
		//console.log(jsonString);
		//var jsonData = JSON.parse(jsonString);
		//console.log(jsonData);
		
		var voucherList = [];
		$("#save-table tr").each(function(i){
			
			var tr = $(this);
			var td = tr.children();
			if(i > 0) {
				$('#regDate').val('');
				$('#accountNo').val('');
				$('#accountName').val('');
				$('#amountFlag').val('');
				$('#amount').val('');
				$('#manageNo').val('');
				$('#customerNo').val('');
				$('#customerName').val('');
				$('#bankCode').val('');
				$('#bankName').val('');
				$('#cardNo').val('');
				$('#cardUser').val('');
				$('#depositNo').val('');
				$('#depositHost').val('');
				$('#voucherUse').val('');
				
				var regDate =  td.eq(0).text();
				var accountNo =  td.eq(1).text();
				var accountName =  td.eq(2).text();
				var amountFlag =  td.eq(3).text();
				var amount =  uncomma(td.eq(4).text());
				var manageNo =  td.eq(5).text();
				var customerNo =  td.eq(6).text();
				var customerName =  td.eq(7).text();
				var bankCode =  td.eq(8).text();
				var bankName =  td.eq(9).text();
				var cardNo =  td.eq(10).text();
				var cardUser =  td.eq(11).text();
				var depositNo =  td.eq(12).text();
				var depositHost =  td.eq(13).text();
				var voucherUse =  td.eq(14).text();
				
				var voucherVo = {regDate:regDate, accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
						manageNo:manageNo, customerNo:customerNo, customerName:customerName, bankCode:bankCode, bankName:bankName,
						cardNo:cardNo, cardUser:cardUser, depositNo:depositNo, depositHost:depositHost, voucherUse:voucherUse
					};
				
				voucherList.push(voucherVo);
				
			}
		});
		
		var jsonString = JSON.stringify(voucherList);
		console.log("jsonString : " + jsonString);
		console.log(jsonString);
		
		
		$.ajax({
			url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/save",
			type: "post",
			dataType: "json",
			data: {
				'itemList' : jsonString
			},
			success: function(response) {
				console.log("success");
				console.log(response);
				// 전표 입력시 list로 이동
				window.location.href = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/read";
			},
			error: function(response) {
				console.log("error");
				console.log(response);
			}
			
		}); // ajax
	}
</script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	$(document.body).delegate('#simple-table-1 tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		$("input[name=regDate]").val(td.eq(0).text());
		$("input[name=no]").val(td.eq(1).text());
		$("input[name=orderNo]").val(td.eq(2).text());
		$("input[name=amountFlag]").val(td.eq(3).text());
		$('#accountNo').val(td.eq(4).text()).trigger('chosen:updated');
		$("input[name=accountName]").val(td.eq(5).text());
		console.log($("input[name=no]").val());
		if(td.eq(6).text()== "") {
			$("input[name=amount]").val(td.eq(7).text());	
		} else {
			$("input[name=amount]").val(td.eq(6).text());	
		}
		$("input[name=customerNo]").val(td.eq(8).text());
		$("input[name=customerName]").val(td.eq(9).text());
		$("input[name=manageName]").val(td.eq(10).text());
		$("input[name=manageNo]").val(td.eq(11).text());
		$("input[name=bankCode]").val(td.eq(12).text());
		$("input[name=bankName]").val(td.eq(13).text());
		$("input[name=cardNo]").val(td.eq(14).text());
		$("input[name=depositNo]").val(td.eq(15).text());
		if(td.eq(14).text()== "") {
			$("input[name=depositHost]").val(td.eq(16).text());
		} else {
			$("input[name=cardUser]").val(td.eq(16).text());
		}
		
		$("input[name=voucherUse]").val(td.eq(17).text());
		$("input[name=insertTeam]").val(td.eq(18).text());
		
		$("input[name=bankName]").prop("readonly", true);
		$("input[name='bankLocation']").prop("readonly", true);
		$("input[name='banker']").prop("readonly", true);
		$("input[name='bankPhoneCall']").prop("readonly", true);
	});
	
	//계정과목에 따른 계정명 불러오기
    $('#accountNo').change(function () {
    	var accountName =$(this).find('option:selected').attr('data-accountName');
    	$('#accountName').val(accountName);
   	});
	
	// 팝업
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
	             width: 700,
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
	  });
	
  $('#dialog-message-table').on('click', '#a-dialog-customerNo', function(event) {
     event.preventDefault();
     $("#tbody-customerList").find("tr").remove();
     
     var customerNo = $("#input-dialog-customerNo").val();
     
     // ajax 통신
     $.ajax({
        url: "${pageContext.request.contextPath }/01/03/getCustomer?customerNo=" + customerNo,
        contentType : "application/json; charset=utf-8",
        type: "get",
        dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
        data : "",
        statusCode: {
            404: function() {
              alert("page not found");
            }
        },
        success: function(result){
      	  if(result.success) {
      	  	$("#input-dialog-customerNo").val('');
      	  	var customerList = result.customerList;
      	  	console.log(result.customerList);
      	  	for(let a in customerList) {
      	  		if(customerList[a].cardNo != null) { // 카드번호값 셋팅
      	  			var cardNo = customerList[a].cardNo;
      	  		} else {
      	  			cardNo = '';
      	  		}
      	  		
	      	  	if(customerList[a].depositNo != null) {
	  	  			var depositNo = customerList[a].depositNo;
	  	  		} else {
	  	  			depositNo = '';
	  	  		}
	      	  	
      	  		if(customerList[a].customerName == '여비') {
      	  			var host = customerList[a].cardUser;
      	  		} else {
      	  			host = customerList[a].depositHost
      	  		}
      	  		
      	  		$("#tbody-customerList").append("<tr>" +
                        "<td class='center'>" + customerList[a].customerNo + "</td>" +
                        "<td class='center'>" + customerList[a].customerName + "</td>" +
                        "<td class='center'>" + customerList[a].bankCode + "</td>" +
                        "<td class='center'>" + customerList[a].bankName + "</td>" +
                        "<td class='center'>" + cardNo + "</td>" +
                        "<td class='center'>" + depositNo + "</td>" +
                        "<td class='center'>" + host + "</td>" +
                        "</tr>");
      	  	}
      	  }
        },
        error: function(xhr, error){
           console.error("error : " + error);
        }
     });
  });
  
  // 거래처 리스트에서 row를 선택하면 row의 해당 데이터 form에 추가
  $(document.body).delegate('#tbody-customerList tr', 'click', function() {
     var tr = $(this);
     var td = tr.children();
     $("input[name=customerNo]").val(td.eq(0).text());
     $("input[name=customerName]").val(td.eq(1).text());
     $("input[name=bankCode]").val(td.eq(2).text());
     $("input[name=bankName]").val(td.eq(3).text());
     $("input[name=cardNo]").val(td.eq(4).text());
     $("input[name=depositNo]").val(td.eq(5).text());
     $("input[name=depositHost]").val(td.eq(6).text());
     $("#dialog-message").dialog('close');
  });
  
  $("#input-form").submit(function(event) {
	  $("input[name=amount]").val($("input[name=amount]").val().replace(/[^0-9]/g,""));
  });
  
}); // $(function
</script>

<script>
	function comma(str) {
	  str = String(str);
	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	//콤마풀기
	function uncomma(str) {
		str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}

	//값 입력시 콤마찍기
	function inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}
</script>
<script type="text/javascript">
var regDate = "${param.regDate}";
$("#regDate").val(regDate);
</script>
<script type="text/javascript">
var accountNo = "${param.accountNo}";
$("#accountNo").val(accountNo);
</script>
<script type="text/javascript">
var accountNo = "${param.amount}";
$("#amount").val(amount);
</script>
<script type="text/javascript">
var customerNo = "${param.customerNo}";
$("#customerNo").val(customerNo);
</script>
<script type="text/javascript">
var voucherUse = "${param.voucherUse}";
$("#voucherUse").val(voucherUse);
</script>
</body>
</html>