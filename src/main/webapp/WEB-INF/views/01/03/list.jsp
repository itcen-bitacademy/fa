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
					<h1 class="pull-left">전표관리</h1>
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
										<input class="span4 date-picker" id="regDate" name="regDate" type="text" data-date-format="yyyy-mm-dd" readonly style="width:193px;" />
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
										<input type="text" id="accountName" name="accountName" placeholder="계정명칭" value="" style="text-align: center; width: 200px; height: 18px;" disabled />
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
										
										<div class="input-append">
											<input type="text" id="manageName" name ="manageName" value="" placeholder="세금계산서" style="text-align: center; width: 200px; height: 20px;" readonly />
										</div>
									</div>
								</div>
						</div>
	
						<div class="span6">
							<div class="tabbable">
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >거래처 코드</label>
									<div class="controls">
										<div class="input-append">
										<a href="#" id="a-customerinfo-dialog">
											<input type="text" class="search-input-width-first" id="customerNo" name="customerNo" style="width:180px;" />
											<span class="add-on">
												<i class="icon-search icon-on-right bigger-110"></i>
											</span> 
										</a>
									
										</div>
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
										<input class="span8" type="text" id="voucherUse" name="voucherUse" placeholder="전표사용목적" style="width:465px;" />
										<input class="span8" type="hidden" id="voucherNo" name="no" />
										<input class="span8" type="hidden" id="orderNo" name="orderNo" />
										<input class="span8" type="hidden" id="insertTeam" name="insertTeam" />
									</div>
								</div>
								
								
								<!-- 거래처 Modal pop-up : start -->
								<div id="dialog-message" title="거래처" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>거래처코드</label> <input type="text"
												id="input-dialog-customerNo" style="width: 100px;" />
												<div class="input-append">
													<a href="#" id="a-dialog-customerNo">
														<span class="add-on">
															<i class="icon-search icon-on-right bigger-110"></i>
														</span>
													</a>
												</div>
											</td>
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
												<th class="center">소유주</th>
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
                    <table id="save-table" class="table  table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">일자</th>
                            <th class="center">순번</th>
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
            
            <div id="dialog-confirm" class="hide">
				<p id="dialog-txt" class="bolder grey">
				</p>
			</div>
			
			<div class="hr hr-18 dotted"></div>
			<!-- buttons -->
			<button class="btn btn-info btn-small" type="submit" id="btn-read" name="btn-read"
				formaction="${pageContext.request.contextPath}/01/03/read">조 회</button>
			<input class="btn btn-small" type="button" value="입력" onclick="add();">
			<input class="btn btn-small" type="button" value="행 수정" onclick="modify();">
			<input class="btn btn-small" type="button" value="행 삭제" onclick="delete_row();">
			<input class="btn btn-primary btn btn-small" id="btn-create" name="btn-create" type="button" value="저 장" onclick="save();">
			<input class="btn btn-warning btn btn-small" id="btn-update" name="btn-update" type="button" value="수 정" onclick="update();">
			<input class="btn btn-danger btn-small" id="btn-delete" name="btn-delete" type="button" value="삭 제" onclick="delete1();">
			<%-- <button class="btn btn-danger btn-small" type="submit" id="btn-delete" name="btn-delete"
				formaction="${pageContext.request.contextPath }/01/03/delete">삭 제</button> --%>
			<input class="btn btn-default btn btn-small" type="button" value="취 소" onclick="window.location.reload();">

			</form>
			<!-- <div class="row-fluid">
				<div class="span8">
						<button class="btn btn-small" type="button" onclick="add();">입 력</button>
						<button class="btn btn-small" type="button" onclick="modify();">행 수정</button>
						<button class="btn btn-small" type="button" onclick="delete_row();">행 삭제</button>
						<button class="btn btn-primary btn-small" type="submit" id="btn-create" 
							name="btn-create" onclick="save();">저 장</button>
						<button class="btn btn-warning btn-small" type="submit" id="btn-update" 
							name="btn-update" onclick="update();">수 정</button>
						<button class="btn btn-default btn-small" type="button" onclick="window.location.reload()">취 소</button>
				</div>/.span
			</div>/.row-fluid -->
			<div class="hr hr-18 dotted"></div>
			<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 전표 ${dataResult.pagination.totalCnt } 건</p>
			
			<!--조회 테이블 영역 -->
			<div class="row-fluid">
				<div class="span12" style="overflow: auto;">
					<table id="simple-table-1"
                     	class="table  table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
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
								            <td style="text-align: right;"><fmt:formatNumber value="${voucherVo.amount}" pattern="#,###" /></td>
								            <td></td>
								        </c:when>
								        <c:otherwise>
								        	<td></td>
								            <td style="text-align: right;"><fmt:formatNumber value="${voucherVo.amount}" pattern="#,###" /></td>
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
										<c:when test="${(voucherVo.accountNo >= 8000000 && voucherVo.accountNo < 9000000) || (voucherVo.accountNo >= 9200000 && voucherVo.accountNo < 9300000) }">
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
		
		if(!valid.nullCheck("regDate", "일자")) return;
		if(!valid.nullCheck("accountNo", "계정과목 코드")) return;
		if(!valid.nullCheck("amount", "금액")) return;
		if(!valid.nullCheck("customerNo", "거래처 코드")) return;
		
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
		
		//voucherList.push(voucherVo);
		// 여기
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
		var cell16 = row.insertCell(15);
		
		cell1.innerHTML = '<td class="center">' + regDate + '</td>';
		cell2.innerHTML = '<td class="center">' + (table.rows.length-1) + '</td>';
		cell3.innerHTML = '<td class="center">' + accountNo + '</td>';
		cell4.innerHTML = '<td class="center">' + accountName + '</td>';
		cell5.innerHTML = '<td class="center">' + amountFlag + '</td>';
		cell6.innerHTML = '<td style="text-align: right">' + comma(amount) + '</td>';
		cell7.innerHTML = '<td class="center">' + customerNo + '</td>';
		cell8.innerHTML = '<td class="center">' + customerName + '</td>';
		if(manageNo == '') {
			cell9.innerHTML = '<td class="center">' + '</td>';
			cell10.innerHTML = '<td class="center">' + '</td>';
		} else if (manageNo != null) {
			cell9.innerHTML = '<td class="center">' + '세금계산서' + '</td>';
			cell10.innerHTML = '<td class="center">' + manageNo + '</td>';
		} else {
			cell9.innerHTML = '<td class="center">' + '</td>';
			cell10.innerHTML = '<td class="center">' + '</td>';
		}
		cell11.innerHTML = '<td class="center">' + bankCode + '</td>';
		cell12.innerHTML = '<td class="center">' + bankName + '</td>';
		if((accountNo >= 8000000 && accountNo < 9000000) || (accountNo >= 9200000 && accountNo < 9300000)) {
			cell13.innerHTML = '<td class="center">' + cardNo + '</td>';
			cell14.innerHTML = '<td class="center">' + '</td>';
			cell15.innerHTML = '<td class="center">' + cardUser + '</td>';
		} else {
			cell13.innerHTML = '<td class="center">' + '</td>';
			cell14.innerHTML = '<td class="center">' + depositNo + '</td>';
			cell15.innerHTML = '<td class="center">' + depositHost + '</td>';
		}
		cell16.innerHTML = '<td class="center">' + voucherUse + '</td>';
		
		var voucherVo = {regDate:regDate, orderNo:(table.rows.length-1), accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
				manageNo:manageNo, customerNo:customerNo, customerName:customerName, bankCode:bankCode, bankName:bankName,
				cardNo:cardNo, cardUser:cardUser, depositNo:depositNo, depositHost:depositHost, voucherUse:voucherUse
			}
		
		$('#regDate').val(regDate);
		$('#accountNo').val(accountNo);
		$('#accountName').val(accountName);
		$('#amountFlag').val(amountFlag);
		$('#amount').val('');
		$('#manageNo').val(manageNo);
		$('#customerNo').val('');
		$('#customerName').val('');
		$('#bankCode').val('');
		$('#bankName').val('');
		$('#cardNo').val('');
		$('#cardUser').val('');
		$('#depositNo').val('');
		$('#depositHost').val('');
		$('#voucherUse').val('');
		
		//$(".date-picker").datepicker("destroy");
		//$("#regDate").removeClass('hasDatepicker').datepicker();
		
		$("#regDate").attr( 'disabled', true );
		
		$("input[name=regDate]").prop("readonly", true);
		$("input[name=manageNo]").prop("readonly", true);
		$("input[name=customerName]").prop("readonly", true);
		$("input[name=bankCode]").prop("readonly", true);
		$("input[name=cardNo]").prop("readonly", true);
		$("input[name=cardUser]").prop("readonly", true);
		$("input[name=depositNo]").prop("readonly", true);
		$("input[name=depositHost]").prop("readonly", true);
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
				var orderNo = td.eq(1).text();
				var accountNo =  td.eq(2).text();
				var accountName =  td.eq(3).text();
				var amountFlag =  td.eq(4).text();
				var amount =  uncomma(td.eq(5).text());
				var customerNo =  td.eq(6).text();
				var customerName =  td.eq(7).text();
				var manageNo =  td.eq(9).text();
				var bankCode =  td.eq(10).text();
				var bankName =  td.eq(11).text();
				if(td.eq(12).text() == '') {
					var cardNo =  td.eq(12).text();
					var depositNo =  td.eq(13).text();
					var depositHost =  td.eq(14).text();
				}
				if(td.eq(13).text() == '') {
					var cardNo =  td.eq(12).text();
					var depositNo =  td.eq(13).text();
					var cardUser =  td.eq(14).text();
				}
				var voucherUse =  td.eq(15).text();
				
				var voucherVo = {regDate:regDate, orderNo:orderNo, accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
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
	
	// 행 삭제
	function delete_row() {
		var my_tbody = document.getElementById('save-table');
	    if (my_tbody.rows.length < 1) return;
	    // my_tbody.deleteRow(0); // 상단부터 삭제
	    my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
	}
	
	// 행 수정
	function modify() {
		var regDate = $('#regDate').val();
		var no = $('#voucherNo').val();
		var orderNo = $('#orderNo').val();
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
		
		var my_tbody = document.getElementById('voucher_save');
		console.log('순번');
		console.log(orderNo);
		console.log(no);
		my_tbody.deleteRow(orderNo-1);
		console.log(orderNo-1);
		
		
		var table = document.getElementById("save-table"); // 테이블 아이디
		var row = table.insertRow(orderNo); // 하단에 추가
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
		var cell16 = row.insertCell(15);
		console.log(regDate);
		console.log(no);
		console.log(orderNo);
		console.log(accountNo);
		console.log(accountName);
		console.log(amountFlag);
		console.log(customerNo);
		console.log(customerName);
		console.log(bankCode);
		console.log(bankName);
		console.log(cardNo);
		console.log(depositNo);
		
		cell1.innerHTML = '<td class="center">' + regDate + '</td>';
		cell2.innerHTML = '<td class="center">' + no + "-" + orderNo + '</td>';
		cell3.innerHTML = '<td class="center">' + accountNo + '</td>';
		cell4.innerHTML = '<td class="center">' + accountName + '</td>';
		cell5.innerHTML = '<td class="center">' + amountFlag + '</td>';
		cell6.innerHTML = '<td style="text-align: right">' + comma(amount) + '</td>';
		cell7.innerHTML = '<td class="center">' + customerNo + '</td>';
		cell8.innerHTML = '<td class="center">' + customerName + '</td>';
		if(manageNo == '') {
			cell9.innerHTML = '<td class="center">' + '</td>';
			cell10.innerHTML = '<td class="center">' + '</td>';
		} else if (manageNo != null) {
			cell9.innerHTML = '<td class="center">' + '세금계산서' + '</td>';
			cell10.innerHTML = '<td class="center">' + manageNo + '</td>';
		} else {
			cell9.innerHTML = '<td class="center">' + '</td>';
			cell10.innerHTML = '<td class="center">' + '</td>';
		}
		cell11.innerHTML = '<td class="center">' + bankCode + '</td>';
		cell12.innerHTML = '<td class="center">' + bankName + '</td>';
		if((accountNo >= 8000000 && accountNo < 9000000) || (accountNo >= 9200000 && accountNo < 9300000)) {
			cell13.innerHTML = '<td class="center">' + cardNo + '</td>';
			cell14.innerHTML = '<td class="center">' + '</td>';
			cell15.innerHTML = '<td class="center">' + cardUser + '</td>';
		} else {
			cell13.innerHTML = '<td class="center">' + '</td>';
			cell14.innerHTML = '<td class="center">' + depositNo + '</td>';
			cell15.innerHTML = '<td class="center">' + depositHost + '</td>';
		}
		cell16.innerHTML = '<td class="center">' + voucherUse + '</td>';
		
		var voucherVo = {regDate:regDate, orderNo:orderNo, accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
				manageNo:manageNo, customerNo:customerNo, customerName:customerName, bankCode:bankCode, bankName:bankName,
				cardNo:cardNo, cardUser:cardUser, depositNo:depositNo, depositHost:depositHost, voucherUse:voucherUse
			}
		
		$('#regDate').val(regDate);
		$('#accountNo').val(accountNo);
		$('#accountName').val(accountName);
		$('#amountFlag').val(amountFlag);
		$('#amount').val('');
		$('#manageNo').val(manageNo);
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
	
	// 수정
	function update() {
		
		var voucherList = [];
		$("#save-table tr").each(function(i){
			
			var tr = $(this);
			var td = tr.children();
			
			var noArray = td.eq(1).text().split('-');
			
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
				
				if(noArray[1] != null) {
					var no = noArray[0]
					var orderNo = noArray[1];
				} else {
					var orderNo = noArray[0];
				}
				
				var accountNo =  td.eq(2).text();
				var accountName =  td.eq(3).text();
				var amountFlag =  td.eq(4).text();
				var amount =  uncomma(td.eq(5).text());
				var customerNo =  td.eq(6).text();
				var customerName =  td.eq(7).text();
				var manageNo =  td.eq(9).text();
				var bankCode =  td.eq(10).text();
				var bankName =  td.eq(11).text();
				if(td.eq(12).text() == '') {
					var cardNo =  td.eq(12).text();
					var depositNo =  td.eq(13).text();
					var depositHost =  td.eq(14).text();
				}
				if(td.eq(13).text() == '') {
					var cardNo =  td.eq(12).text();
					var depositNo =  td.eq(13).text();
					var cardUser =  td.eq(14).text();
				}
				var voucherUse =  td.eq(15).text();
				
				var voucherVo = {regDate:regDate, no:no, orderNo:orderNo, accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
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
			url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
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
				window.location.reload();
			},
			error: function(response) {
				console.log("error");
				console.log(response);
				if(!valid.teamCheck("regDate", "관리팀")) return;
			}
			
		}); // ajax
		
		
	}
	
	function delete1() {
		var voucherList = [];
		$("#save-table tr").each(function(i){
			
			var tr = $(this);
			var td = tr.children();
			
			var noArray = td.eq(1).text().split('-');
			
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
				
				if(noArray[1] != null) {
					var no = noArray[0]
					var orderNo = noArray[1];
				} else {
					var orderNo = noArray[0];
				}
				
				var accountNo =  td.eq(2).text();
				var accountName =  td.eq(3).text();
				var amountFlag =  td.eq(4).text();
				var amount =  uncomma(td.eq(5).text());
				var customerNo =  td.eq(6).text();
				var customerName =  td.eq(7).text();
				var manageNo =  td.eq(9).text();
				var bankCode =  td.eq(10).text();
				var bankName =  td.eq(11).text();
				if(td.eq(12).text() == '') {
					var cardNo =  td.eq(12).text();
					var depositNo =  td.eq(13).text();
					var depositHost =  td.eq(14).text();
				}
				if(td.eq(13).text() == '') {
					var cardNo =  td.eq(12).text();
					var depositNo =  td.eq(13).text();
					var cardUser =  td.eq(14).text();
				}
				var voucherUse =  td.eq(15).text();
				
				var voucherVo = {regDate:regDate, no:no, orderNo:orderNo, accountNo:accountNo, accountName:accountName, amountFlag:amountFlag, amount:amount, 
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
			url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
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
				window.location.reload();
			},
			error: function(response) {
				console.log("error");
				console.log(response);
				if(!valid.teamCheck2("regDate", "관리팀")) return;
			}
			
		}); // ajax
	}

	
	// 유효성 검사시 Dialog Popup 창이 모달로 띄움
	function dialog(txt, flag) {
    	$("#dialog-txt").html(txt);
		var dialog = $( "#dialog-confirm" ).dialog({
			resizable: false,
			modal: true,
			buttons: [
				{
					text: "OK",
					"class" : "btn btn-danger btn-mini",
					click: function() {
						if(flag){
							$( this ).dialog( "close" ); 
							location.href="${pageContext.request.contextPath }/01/03";
						} else {
							$( this ).dialog( "close" ); 
						}
					}
				}
			]
		});
	}
	
	var valid = {
    		nullCheck: function(id, msg){ // null 체크
    			if($("#"+id).val()==""){
    				dialog(msg+" 을(를) 입력 해 주세요.");
    				return false;
    			} else {
    				return true;
    			}
    		},
			strCheck: function(id){  // 문자열 체크 
    			
    		}, 
			numberCheck: function(id, msg){  // 숫자 체크
    			if(!$.isNumeric($("#"+id).val())){        	
    				dialog(msg+" 은(는) 숫자만 입력 가능합니다.");
    				$("#"+id).focus();
    				return false;
    			} else {
    				return true;
    			}
    		},
    		teamCheck: function(id, msg){ // null 체크
    			if($("#"+id).val()==""){
    				dialog(msg+"이 달라서 수정 할 수 없습니다.");
    				return false;
    			} else {
    				return true;
    			}
    		},
    		teamCheck2: function(id, msg){ // null 체크
    			if($("#"+id).val()==""){
    				dialog(msg+"이 달라서 삭제 할 수 없습니다.");
    				return false;
    			} else {
    				return true;
    			}
    		}
    
    }
		
	
</script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	$(document.body).delegate('#voucher_list tr', 'click', function() {
		
		// input창에 값 셋팅해주기
		var tr = $(this);
		console.log("$(this)" + $(this));
		console.log($(this));
		var td = tr.children();
		
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
		
		if(td.eq(14).text() != "") {
			$("input[name=cardUser]").val(td.eq(16).text());
		} else {
			$("input[name=depositHost]").val(td.eq(16).text());
		}
		$("input[name=voucherUse]").val(td.eq(17).text());
		$("input[name=insertTeam]").val(td.eq(18).text());
		
		$("input[name=manageNo]").prop("readonly", true);
		$("input[name=customerName]").prop("readonly", true);
		$("input[name=bankCode]").prop("readonly", true);
		$("input[name=cardNo]").prop("readonly", true);
		$("input[name=cardUser]").prop("readonly", true);
		$("input[name=depositNo]").prop("readonly", true);
		$("input[name=depositHost]").prop("readonly", true);
		
		
		// 저장된 테이블에서 클릭시 가저장 테이블에 값 보여주기
		var tr = $(this);
		console.log("$(this)" + $(this));
		console.log($(this));
		var td = tr.children();
		
		var voucherNo = td.eq(1).text(); // 테이블 클릭 시 전표번호 가져오기
		console.log("voucherNo : " + voucherNo);
		console.log(voucherNo);
		
		$("#voucher_save").empty(); // 태그는 남기고 내용 지우기
		
		$.ajax({
			url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/getVoucher?voucherNo=" + voucherNo,
			type: "get",
			dataType: "json",
			data: "",
			success: function(response) {
				console.log("success");
				console.log(response);
				var voucherList = response.voucherList;
				var host = '';
				var cardNo = '';
				var depositNo = '';
				console.log(response.voucherList);
	      	  	for(let a in voucherList) {
		      	  	if((voucherList[a].accountNo >= 8000000 && voucherList[a].accountNo < 9000000) || (voucherList[a].accountNo >= 9200000 && voucherList[a].accountNo < 9300000)) {
	      	  			host = voucherList[a].cardUser;
	      	  		} else {
	      	  			host = voucherList[a].depositHost
	      	  		}
	      	  		console.log("voucherList[a].cardNo : " + voucherList[a].cardNo);
	      	  		console.log(voucherList[a].cardNo);
	      	  		console.log("voucherList[a].depositNo : " + voucherList[a].depositNo);
      	  			console.log(voucherList[a].depositNo);
	      	  		if(voucherList[a].cardNo != null) { // 카드번호값 셋팅
	      	  			cardNo = voucherList[a].cardNo;
	      	  			host = voucherList[a].cardUser;
	      	  			depositNo = '';
	      	  		} else {
	      	  			cardNo = '';
	      	  			depositNo = voucherList[a].depositNo;
	      	  			host = voucherList[a].depositHost;
	      	  		}
	      	  		
		      	  	if(voucherList[a].manageNo == '') {
		      	  		var manageName = '';
		      	  		var manageNo = '';
	      	  		} else if(voucherList[a].manageNo != null) {
	      	  			manageName = '세금계산서';
      	  				manageNo = voucherList[a].manageNo;
	      	  		} else {
	      	  			manageName = '';
	      	  			manageNo = '';
	      	  		}
		      	  	
		      	  	if(voucherList[a].bankCode != null) {
		      	  		var bankCode = voucherList[a].bankCode;
		      	  	} else {
		      	  		bankCode = '';
		      	  	}
		      	  	
		      	  if(voucherList[a].bankName != null) {
		      	  		var bankName = voucherList[a].bankName;
		      	  	} else {
		      	  		bankName = '';
		      	  	}
		      	  	console.log('host= =====' + host);
	      	  		$("#voucher_save").append("<tr>" +
	                        "<td>" + voucherList[a].regDate + "</td>" +
	                        "<td>" + voucherNo + "-" + voucherList[a].orderNo + "</td>" +
	                        "<td>" + voucherList[a].accountNo + "</td>" +
	                        "<td>" + voucherList[a].accountName + "</td>" +
	                        "<td>" + voucherList[a].amountFlag + "</td>" +
	                        "<td>" + comma(voucherList[a].amount) + "</td>" +
	                        "<td>" + voucherList[a].customerNo + "</td>" +
	                        "<td>" + voucherList[a].customerName + "</td>" +
	                        "<td>" + manageName + "</td>" +
	                        "<td>" + manageNo + "</td>" +
	                        "<td>" + bankCode + "</td>" +
	                        "<td>" + bankName + "</td>" +
	                        "<td>" + cardNo + "</td>" +
	                        "<td>" + depositNo + "</td>" +
	                        "<td>" + host + "</td>" +
	                        "<td>" + voucherList[a].voucherUse + "</td>" +
	                        "</tr>");
	      	  	}
	      	  	
	        },
			error: function(response) {
				console.log("error");
				console.log(response);
			}
			
		}); // ajax
		
		
		// 가저장 테이블
		$(document.body).delegate('#voucher_save tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			
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
			
			var noArray = td.eq(1).text().split('-');
			
			$("input[name=regDate]").val(td.eq(0).text());
			
			console.log("noArray[0] : " + noArray[0]);
			console.log(noArray[0]);
			console.log("noArray[1] : " + noArray[1]);
			console.log(noArray[1]);
			
			if(noArray[1] != null) {
				$("input[name=no]").val(noArray[0]);
				$("input[name=orderNo]").val(noArray[1]);
			} else {
				$("input[name=orderNo]").val(noArray[0]);
			}
     	    
     	    $('#accountNo').val(td.eq(2).text()).trigger('chosen:updated');
     	    $('#accountName').val(td.eq(3).text()).trigger('chosen:updated');
     	    $("input[name=amountFlag]").val(td.eq(4).text());
     	    $("input[name=amount]").val(td.eq(5).text());
     	     
     	    $("input[name=customerNo]").val(td.eq(6).text());
     	    $("input[name=customerName]").val(td.eq(7).text());
     	    $("input[name=manageNo]").val(td.eq(9).text());
     	    $("input[name=bankCode]").val(td.eq(10).text());
     	    $("input[name=bankName]").val(td.eq(11).text());
     	    $("input[name=cardNo]").val(td.eq(12).text());
     	    $("input[name=depositNo]").val(td.eq(13).text());
     	    if(td.eq(12).text()== "") {
     	    	$("input[name=depositHost]").val(td.eq(14).text());
     	    } else {
     	    	$("input[name=cardUser]").val(td.eq(14).text());
     	    }
     	    $("input[name=voucherUse]").val(td.eq(15).text());
     	    
     	    
	   		$("input[name=manageNo]").prop("readonly", true);
	   		$("input[name=customerName]").prop("readonly", true);
	   		$("input[name=bankCode]").prop("readonly", true);
	   		$("input[name=cardNo]").prop("readonly", true);
	   		$("input[name=cardUser]").prop("readonly", true);
	   		$("input[name=depositNo]").prop("readonly", true);
	   		$("input[name=depositHost]").prop("readonly", true);
     	     
     	  });
		
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
      	  		if(customerList[a].cardNo == null) {
      	  			customerList[a].cardNo = "";
      	  			customerList[a].cardUser = "";
      	  		}
      	  		
      	  		if(customerList[a].depositNo == null) {
      	  			customerList[a].depositNo = "";
      	  			customerList[a].depositHost = "";
      	  		}
      	  		
      	  		$("#tbody-customerList").append("<tr>" +
                        "<td class='center'>" + customerList[a].customerNo + "</td>" +
                        "<td class='center'>" + customerList[a].customerName + "</td>" +
                        "<td class='center'>" + customerList[a].bankCode + "</td>" +
                        "<td class='center'>" + customerList[a].bankName + "</td>" +
                        "<td class='center'>" + customerList[a].cardNo + "</td>" +
                        "<td class='center'>" + customerList[a].cardUser + "</td>" +
                        "<td class='center'>" + customerList[a].depositNo + "</td>" +
                        "<td class='center'>" + customerList[a].depositHost + "</td>" +
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
     $("input[name=cardUser]").val(td.eq(5).text());
     $("input[name=depositNo]").val(td.eq(6).text());
     $("input[name=depositHost]").val(td.eq(7).text());
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
var amount = "${param.amount}";
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