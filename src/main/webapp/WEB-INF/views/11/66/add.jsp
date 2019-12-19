<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<!-- For Dialog -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
input[type="text"], input[type="date"], select {
	width: 300px;
}

.input-area {
	display: grid;
	grid-template-columns: repeat(2, auto);
	margin-left: 8px;
}

.input-area>* {
	grid-column: auto;
	display: grid;
	grid-template-rows: repeat(6, auto);
	grid-template-columns: 150px auto;
	gap: 10px 0;
}

.ia-left {
	grid-column: 1;
}

.ia-right {
	grid-column: 2;
}

.above-table {
	display: grid;
	grid-template-columns: repeat(2, 50%);
	height: 30px;
}

.above-table>* {
	grid-column: auto;
}

.above-table-left>* {
	float: left;
	margin: 0;
}

.btn-list {
	float: left;
}

.btn-list>button {
	margin-right: 10px;
	float: none;
}

.btn-list>button:last-child {
	margin-right: 0;
}

.btn-list>button:not (:first-child ):not (:last_child ){
	margin: 0 auto
}

.code-search-info {
	padding: 0 0 10px 10px;
}
</style>
</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode }"/>
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }"/>
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">

			<div class="page-header position-relative">
				<h1 class="pull-left">상환내역관리</h1>
			</div>
			<div class="code-search-info" ><h5>* 상환내역을 조회할 때, 코드와 유형을 같이 입력해주세요.</h5></div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="input-form" method="post" action="">
				<input type="hidden" name="no"/> <!-- tb_repay 테이블의 PK인 no값 전달 -->
				<input type="hidden" name="debtNo"/>
				<div class="input-area">
					<section>
						<div class="ia-left"><h4>차입금코드</h4></div>
						<div class="ia-right"><input type="text" id="code" name="code" ></div>
						<div class="ia-left"><h4>납입금</h4></div>
						<div class="ia-right"><input type="text" id="id-payPrinc" name="name-payPrinc"  style="text-align:right;"> <h5 style="display: inline-block;">(원)</h5><input type="hidden" name="payPrinc" /><input type="hidden" name="tempPayPrinc" /></div>
						<div class="ia-left"><h4>이자금액</h4></div>
						<div class="ia-right"><input type="text" id="id-intAmount" name="name-intAmount" style="text-align:right;" readonly="readonly"> <h5 style="display: inline-block;">(원)</h5><input type="hidden" name="intAmount" /></div>
					</section>
					
					<section>
						<div class="ia-left"><h4>부채유형</h4></div>
						<div class="ia-right">
							<select name="debtType"  id="debtType" >
								<option value="초기값">부채유형을 선택해주세요.</option>
								<option value="S">단기차입금</option>
								<option value="L">장기차입금</option>
								<option value="P">사채</option>
							</select>
						</div>
						<div class="ia-left"><h4>상환일자</h4></div>
						<div class="ia-right">
							<input type="date" id="payDate" name="payDate">
						</div>
					</section>
				</div>	<!--  input area -->
				
				<hr>
				<section class="above-table">
					<section class="above-table-left">
						<div class="btn-list">
							<button type="submit" class="btn btn-warning btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update" onclick="return payPrincCheck()">수정</button>
							<button type="submit" class="btn btn-danger btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete" onclick="deleteChecked()">삭제</button>
							<button type="submit" class="btn btn-info btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
							<button type="button"  id="formReset" class="btn btn-success btn-small mybtn">초기화</button>
						</div>
					</section>
				</section>
				<hr>
			</form>
			<div>
				<h5>총  ${contentsCount }건</h5>
			</div>
			<br>				
			<!-- PAGE CONTENT ENDS -->
			
			<!-- list -->
			<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" >
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="checkall" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">차입금코드</th>
							<th class="center">총납입금</th>
							<th class="center">납입금</th>
							<th class="center">이자금액</th>
							<th class="center">부채유형</th>
							<th class="center">상환일자</th>
							<th class="center">전표번호</th>
							<th class="center">등록일</th>
						</tr>
					</thead>
						<tbody id="tbody-list">
						<c:forEach items="${dataResult.datas}" var="vo" varStatus="status">
							<tr>
								<td class="center" data-no="${vo.no }">
									<label class="pos-rel"></label>
									<input type="checkbox" class="ace" name="no"  data-no="${vo.no }" /><span class="lbl"></span>
								</td>
								<td class="center">${vo.code}</td>
								<td class="center"><fmt:formatNumber value="${vo.totalPayPrinc}" pattern="#,###" /></td>	
								<td class="center"><fmt:formatNumber value="${vo.payPrinc}" pattern="#,###" /><input type="hidden" value="${vo.payPrinc}" /></td>	
								<td class="center"><fmt:formatNumber value="${vo.intAmount}" pattern="#,###" /><input type="hidden" value="${vo.intAmount}" /></td>
								<c:choose>
									<c:when test="${vo.debtType eq 'S'}"><td class="center">단기차입금</td></c:when>
									<c:when test="${vo.debtType eq 'L'}"><td class="center">장기차입금</td></c:when>
									<c:when test="${vo.debtType eq 'P'}"><td class="center">사채</td></c:when>
								</c:choose>
								<td class="center">${vo.payDate}</td>
								<td class="center">${vo.voucherNo}</td>
								<td class="center">${vo.insertDate}</td>
							</tr>
							</c:forEach>
						</tbody>
				</table>
				
				<!-- 페이징 처리 코드 start -->
				<div class="pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${dataResult.pagination.startPage - 1 }">
								<i class="icon-double-angle-left"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
							<c:choose>
								<c:when test="${pg eq dataResult.pagination.page }">
									<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${pg}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 페이징 처리 코드 end -->
				
			</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<!-- For Dialog -->

<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script>
$(function() {
	$(".chosen-select").chosen();
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// 상환내역관리 리스트에서 row를 선택하면 row의 해당 데이터 form에 추가
	$("#tbody-list tr").click(function(){ 
		var tr = $(this);
		var td = tr.children();
		
		$("input[name=no]").val(td.eq(0).attr('data-no')); // 상환테이블 PK : no
		$("input[name=code]").val(td.eq(1).text()); // 차입금코드
		$("input[name=debtNo]").val(td.eq(2).text()); // 차입금코드
		
		// 상환금액 input 추가 (입력창에 보여지는 부분)
		$("input[name=name-payPrinc]").val(td.eq(3).text()); // 상환금액
		var payPrincWithoutComma = removeCommaReturn(td.eq(3).text()); // 콤마가 붙은 차입금액
		$("input[name=tempPayPrinc]").val(payPrincWithoutComma);
		
		// 상환금액 input 추가 (입력창에 보여지는 부분)
		$("input[name=name-intAmount]").val(td.eq(4).text()); // 이자금액
		var intAmountWithoutComma = removeCommaReturn(td.eq(4).text()); // 콤마가 붙은 차입금액
		$("input[name=intAmount]").val(intAmountWithoutComma);
		
		var debtType='';
		switch (td.eq(5).text()){
	    case '단기차입금' :
	    	debtType = 'S';
	        break;
	    case '장기차입금' :
	    	debtType = 'L';
		    break;
	    case '사채' :
	    	debtType = 'P';
	        break;
		}
		$('#debtType').val(debtType).trigger('chosen:updated'); // 부채유형
		
		$("input[name=payDate]").val(td.eq(6).text()); // 상환일자
	});
	//--------------------------------------------------------------------------------------------------------------------------//
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// form에 입력한 모든 데이터 초기화
	$("#formReset").bind("click", function () {
		$('#input-form')[0].reset(); // form의 모든 데이터 초기화
		$('#debtType').val('초기값').trigger('chosen:updated'); // value 값으로 선택
    });
	//--------------------------------------------------------------------------------------------------------------------------//
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// 숫자에 콤마 적용해서 데이터 처리
    var rgx3 = /,/gi;
    $("#id-payPrinc").bind('keyup keydown', function(){
        inputNumberFormat(this);
        var amount = $('input[name=name-payPrinc]').val();
        var coverAmount = amount.replace(/,/g, '');
        // hidden값에..콤마를 뺀 값을 넣어둔다.
        $('input[name="payPrinc"]').val(coverAmount);
    });
	//--------------------------------------------------------------------------------------------------------------------------//
	
	//--------------------------------------------------------------------------------------------------------------------------//
    // 삭제하기 위해 체크박스 눌렀을 때, row 전체선택 및 해제
	$("#checkall").click(function(){
		if ($(this).hasClass('allChecked')) {
			$('input[type="checkbox"]', '#simple-table').prop('checked', false);
		} else {
			$('input[type="checkbox"]', '#simple-table').prop('checked', true);
		}
		$(this).toggleClass('allChecked');
	});
 	//--------------------------------------------------------------------------------------------------------------------------//
  
  	//--------------------------------------------------------------------------------------------------------------------------//
	//--------------------------------------------------------------------------------------------------------------------------//
});

//--------------------------------------------------------------------------------------------------------------------------//
//javascript function
//<숫자에 콤마 적용해서 데이터 처리>
//1. 입력한 문자열 전달
function inputNumberFormat(obj) {
 obj.value = comma(uncomma(obj.value));
}
   
//2. 콤마찍기
function comma(str) {
 str = String(str);
 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//3. 콤마풀기
function uncomma(str) {
 str = String(str);
 return str.replace(/[^\d]+/g, '');
}

//4. 콤마 제거 (제거값리턴)
function removeCommaReturn(val){
   if(val != ""){
    	val = val.replace(/,/g, "");
   }
   return val;
}
//--------------------------------------------------------------------------------------------------------------------------//

// 상환내역 금액 수정 확인
function payPrincCheck(){
	var intAmount = $("input[name=intAmount]").val();
	if (intAmount > parseInt($("input[name=payPrinc]").val())) {
		alert("이자 금액보다 납입금이 작습니다 납입금(" + intAmount + ")보다 크게 입력해주세요");
		return false;
    } else {
        return true;
    }
}

// 상환내역리스트에서 선택한 row 삭제
function deleteChecked(){
	var sendData = [];
	var checkedList = $("#tbody-list input[type=checkbox]:checked");
	checkedList.each(function(i, e){
		sendData.push($(this).attr('data-no'));
	});
	
	$("input[name=no]").val(sendData);
	alert(sendData);
}


</script>
</body>
</html>