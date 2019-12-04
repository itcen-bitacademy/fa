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
				
					<div class="row-fluid">
						<div class="span6">
							<form class="form-horizontal">
								
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
									<label class="control-label" for="form-field-codename">계정과목코드 / 계정명 :</label>
									<div class="controls">
										<input class="span3" type="text" id="accountNo" name="accountNo" placeholder="계정과목코드"/>
										<input class="span5" type="text" id="accountName" name="accountName" placeholder="계정명"/>
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
									<label class="control-label" for="form-field-codename">증빙코드 / 증빙종류 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code1" placeholder="증빙코드"/>
										<input class="span5" type="text" id="manageNo" name="manageNo" placeholder="증빙종류"/>
									</div>
								</div>
								
							</form>
						</div>
	
						<div class="span6">
							<form class="form-horizontal">
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">거래처코드 / 거래처명 :</label>
									<div class="controls">
										<input class="span3" type="text" id="customerNo" name="customerNo" placeholder="거래처코드"/>
										<input class="span5" type="text" id="customerName" name="customerName" placeholder="거래처명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">은행코드 / 은행명 :</label>
									<div class="controls">
										<input class="span3" type="text" id="bankCode" name="bankCode" placeholder="은행코드"/>
										<input class="span5" type="text" id="bankName" name="bankName" placeholder="은행명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">카드번호 / 소유자 :</label>
									<div class="controls">
										<input class="span3" type="text" id="cardNo" name="cardNo" placeholder="카드번호"/>
										<input class="span5" type="text" id="cardUser" name="cardUser" placeholder="소유자"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">계좌번호 / 소유자 :</label>
									<div class="controls">
										<input class="span3" type="text" id="depositNo" name="depositNo" placeholder="계좌번호"/>
										<input class="span5" type="text" id="depositHost" name="depositHost" placeholder="소유자"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">전표사용목적 :</label>
									<div class="controls">
										<input class="span8" type="text" id="voucherUse" name="voucherUse" placeholder="전표사용목적"/>
									</div>
								</div>
								
							</form>
						</div>
					</div><!-- /.row-fluid -->


			<!-- buttons -->
			<div class="row-fluid">
				<div class="span12">
					<div class="form-actions">
						<button type="submit" class="btn btn-info btn"  id="btn-read" name="btn-read"
									formaction="${pageContext.request.contextPath}/01/25/read">조회</button>
						<button class="btn btn-primary" type="submit" id="btn-create" name="btn-create"
							formaction="${pageContext.request.contextPath }/01/03/add">입 력</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-warning" id="btn-update" name="btn-update"
							formaction="${pageContext.request.contextPath }/01/03/update">수 정</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-danger" id="btn-delete" name="btn-delete"
							formaction="${pageContext.request.contextPath }/01/03/delete">삭 제</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default" type="reset">취 소</button>
					</div>
					<div class="hr"></div>
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->


			<!--조회 테이블 영역 -->
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>일자</th>
								<th>전표번호</th>
								<th>구분</th>
								<th>계정과목코드</th>
								<th>계정과목명</th>
								<th>차변</th>
								<th>대변</th>
								<th>거래처</th>
								<th>증빙종류</th>
								<th>증빙코드</th>
								<th>은행명</th>
								<th>카드번호</th>
								<th>계좌번호</th>
								<th>소유자</th>
								<th>담당자</th>
								<th>사용목적</th>
							</tr>
						</thead>
						
						<tbody id="voucher_list">
							<c:forEach items='${list }' var='voucherVo' varStatus='status'>
								<tr>
									<td class="center"><label> <input type="checkbox"
											class="ace" /> <span class="lbl"></span>
									</label></td>

									<td>${voucherVo.regDate }</td>
									<td>${voucherVo.voucherNo }</td>
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
								    <td></td>
									<td>${voucherVo.voucherUse }</td>
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
	
	// 전표 추가 & 리스트
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
		var cardName = $('#cardName').val();
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
				cardNo:cardNo, cardName:cardName, depositNo:depositNo, depositHost:depositHost, voucherUse:voucherUse
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
				$("#voucher_list").empty(); // 태그는 남기고 내용 지우기
				
				let voucherList = response.data
				
				for(var i in voucherList) {
					var a = "";
					if(voucherList[i].amountFlag == 'd') {
						a = "차변"
					}
					if(voucherList[i].amountFlag == 'c') {
						a = "대변"
					}
					
					var b = "";
					var c = "";
					if(voucherList[i].amountFlag == 'd') {
						b = voucherList[i].amount;
						c = "";
					}
					if(voucherList[i].amountFlag == 'c') {
						b = "";
						c = voucherList[i].amount;
					}
					
					var d = "";
					var e = "";
					if(voucherList[i].manageNo != null) {
						d = "세금계산서";
						e = voucherList[i].manageNo;
					}
					if(voucherList[i].manageNo == null) {
						d = "";
						e = "";
					}
					
					var f = "";
					var g = "";
					var h = "";
					if(voucherList[i].cardNo != null) {
						f = voucherList[i].cardNo;
						g = "";
						h = voucherList[i].cardUser;
					}
					if(voucherList[i].depositNo != null) {
						f = "";
						g = voucherList[i].depositNo;
						h = voucherList[i].depositHost;
					}
					$('#voucher_list').append($('<tr/>').append($('<td/>').text(voucherList[i].regDate))
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
				$('#voucherUse').val();
			}
		}); // ajax
	}); // .click
}); // $(function

</script>
</body>
</html>