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
html,body{overflow-x:hidden; height:100%;}
.main-container{height:calc(100% - 45px); overflow-x: hidden;}
.main-content{overflow:auto;}
.page-content{min-width:1280px;}
@media screen and (max-width: 920px) {.main-container{height:calc(100% - 84px);}}

.form-horizontal .control-label {text-align: left;}

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
.selected{
	background-color:#ddd;
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
			<input type="hidden" id="search-condition"/>
			<input type="hidden" id="checked-voList"/>
			<div class="page-header position-relative">
				<h1 class="pull-left">상환내역관리</h1>
			</div>
			<div class="code-search-info" ><label class="control-label">* 상환내역을 조회할 때, 코드와 유형을 같이 입력해주세요.</label></div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="input-form" method="post" action="">
				<input type="hidden" name="no"/> <!-- tb_repay 테이블의 PK인 no값 전달 -->
				<input type="hidden" name="debtNo"/>
				<input type="hidden" name="voucherNo"/>
				<div class="input-area">
					<section>
						<div class="ia-left"><label class="control-label">차입금코드</label></div>
						<div class="ia-right"><input type="text" id="code" name="code" ></div>
						<div class="ia-left"><label class="control-label">납입금</label></div>
						<div class="ia-right"><input type="text" id="id-payPrinc" name="commaPayPrinc"  style="text-align:right;"> (원)<input type="hidden" name="payPrinc" /><input type="hidden" name="tempPayPrinc" /></div>
						<div class="ia-left"><label class="control-label">이자금액</label></div>
						<div class="ia-right"><input type="text" id="id-intAmount" name="commaIntAmount" style="text-align:right;" readonly="readonly"> (원)<input type="hidden" name="intAmount" /></div>
						<div class="ia-left"><label class="control-label">총액</label></div>
						<div class="ia-right"><input type="text" id="totalAmount" name="totalAmount" style="text-align:right;" readonly="readonly"> (원)</div>
					</section>
					
					<section>
						<div class="ia-left"><label class="control-label">부채유형</label></div>
						<div class="ia-right">
							<select name="debtType"  id="debtType" >
								<option value="초기값">부채유형을 선택해주세요.</option>
								<option value="S">단기차입금</option>
								<option value="L">장기차입금</option>
								<option value="P">사채</option>
							</select>
						</div>
						<div class="ia-left"><label class="control-label">상환일자</label></div>
						<div class="ia-right">
						<div class="row-fluid input-prepend">
							<input class="cl-date-picker" type="text" id="payDate" name="payDate" data-date-format="yyyy-mm-dd" />
							<span class="add-on">
				            	<i class="icon-calendar"></i>
				            </span>
				        </div>
						</div>
					</section>
				</div>	<!--  input area -->
				
				<hr>
				<section class="above-table">
					<section class="above-table-left">
						<div class="btn-list">
							<button type="button" id="updatebtn" class="btn btn-warning btn-small mybtn"  onclick="update()">수정</button>
							<button type="button" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
							<button type="button" class="btn btn-info btn-small mybtn" onclick="search()">조회</button>
							<button type="button"  id="formReset" class="btn btn-default btn-small mybtn">초기화</button>
						</div>
					</section>
				</section>
				<hr>
			</form>
			<div>
				<p id="total-cnt">총  ${contentsCount }건</p>
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
							<th class="center">등록일</th>
						</tr>
					</thead>
						<tbody id="tbody-list">
						
						</tbody>
				</table>
				
				<!-- 페이징 처리 코드 start -->
				<div class="pagination">
					<ul id="pg-list">
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
				
				<div id="dialog66" title="상환정보여부" hidden="hidden">
						
				</div>
				
				<%-- validation dialog --%>
				<div id="dialog-confirm" class="hide">
					<p id="dialog-txt" class="bolder grey">
					</p>
				</div>
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
<script src="${pageContext.request.contextPath }/assets/ace/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/ace-elements.min.js"></script>
<script>
$(function() {
	$(".chosen-select").chosen();
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// date picker 설정
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
	//--------------------------------------------------------------------------------------------------------------------------//
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// form에 입력한 모든 데이터 초기화
	$("#formReset").bind("click", function () {
		$('#input-form')[0].reset(); // form의 모든 데이터 초기화
		$('#debtType').val('초기값').trigger('chosen:updated'); // value 값으로 선택
		$('#code').attr('readonly',false);
		$("#tbody-list").find('tr').removeClass("selected");
		
    });
	//--------------------------------------------------------------------------------------------------------------------------//
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// 숫자에 콤마 적용해서 데이터 처리
    var rgx3 = /,/gi;
    $("#id-payPrinc").bind('keyup keydown', function(){
        inputNumberFormat(this);
        var amount = $('input[name=commaPayPrinc]').val();
        var coverAmount = amount.replace(/,/g, '');
        $('input[name=payPrinc]').val(coverAmount);
        console.log("coverAmount : " + coverAmount); // 차입금액
        
        var intAmount = removeCommaReturn($("input[name=commaIntAmount]").val()); // 이자금액
        console.log("intAmount : " + intAmount);
        
        var totalAmount = parseInt(coverAmount) + parseInt(intAmount);
        var convertTotalAmount = numberFormat(totalAmount);
		console.log("totalAmount : " + totalAmount);
        
        if(!$.isNumeric(totalAmount)) {
    		$('#totalAmount').val('0');
    		return;
    	}
    	
    	function numberFormat(inputNumber) {
    		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}
    		
    	$('input[name="totalAmount"]').val(convertTotalAmount);
    });
	//--------------------------------------------------------------------------------------------------------------------------//
	
	//--------------------------------------------------------------------------------------------------------------------------//
    // 삭제하기 위해 체크박스 눌렀을 때, row 전체선택 및 해제
	$("#checkall").click(function(){
		if ($(this).hasClass('allChecked')) {
			$('input[type="checkbox"]', '#simple-table').prop('checked', false).change();
		} else {
			$('input[type="checkbox"]', '#simple-table').prop('checked', true).change();
		}
		$(this).toggleClass('allChecked');
	});
 	//--------------------------------------------------------------------------------------------------------------------------//
  
	//--------------------------------------------------------------------------------------------------------------------------//
	getList();
 	
 	//-------------------------------------------------------------------------------------------------------------------------//
	$("#dialog66").dialog({
		autoOpen : false
	});
});

//--------------------------------------------------------------------------------------------------------------------------//
//javascript function
//-------------------------------------------getList(), search(), paging() 처리 -----------------------------------------//
function convertDebtType(debtType){
	var convertedDebtType;
	if(debtType == "S")
		convertedDebtType = "단기차입금";
	else if(debtType == "L")
		convertedDebtType = "장기차입금";
	else if(debtType == "P")
		convertedDebtType = "사채";
	return convertedDebtType;
}

function renderingPage(pagination){
	console.log("--------------------() renderingPage Called------------------------");
$("#pg-list li").remove();
	
	//이전버튼 Rendering
	if(pagination.prev){
		$("#pg-list").append("<li onclick='paging(this)'> id='" + (pagination.endPage + 1) + "'>" + 
								"<a>" + "<i class='icon-double-angle-left'></i>" + "</a>" +
							"</li>");
	}else{
		$("#pg-list").append("<li class='disabled'><a href='#'><i class='icon-double-angle-left'></i></a></li>");
	}
	//페이지 Rendering
	for(var i=pagination.startPage; i<=pagination.endPage ; ++i){
		if(i == pagination.page)
			$("#pg-list").append("<li class='active' onclick='paging(this)' id='" + i + "'><a>" + i + "</a></li>");
		else
			$("#pg-list").append("<li onclick='paging(this)' id='" + i + "'><a>" + i + "</a></li>");
	}
	//다음 버튼 Rendering
	if(pagination.prev){
		$("#pg-list").append("<li onclick='paging(this)'> id='" + (pagination.endPage + 1) + "'>" +
								"<a><i class='icon-double-angle-right'></i></a>"+
							"</li>");
	}else{
		$("#pg-list").append("<li class='disabled'><a href='#'><i class='icon-double-angle-right'></i></a></li>");
	}
	
	$("#total-cnt").text("총 " + pagination.totalCnt + "건");
	console.log("--------------------() renderingPage End------------------------");
}

function renderingList(list){
	console.log("--------------------() renderingListCalled------------------------");
	$("#tbody-list > *").remove();
	
	if(list.length == 0) {
		$('#code').val(''); // 차입금 코드 초기화
		$('#debtType').val('초기값'); // 상환유형 초기화
	}
	
	console.log("list length : " + list.length);
	for(var i=0; i < list.length; ++i){
		$("#tbody-list").append("<tr onclick='selectRow(this)'>" +
				 "<input type='hidden' name='vo' value='" + JSON.stringify(list[i]) + "'>" +
				 "<td class='center'>" +
					"<label class='pos-rel'></label>" +
					"<input type='checkbox' class='ace' name='no'  value='" + list[i].no + "' onchange='rowChecked(this)'/><span class='lbl'></span>" +
				"</td>" +
				 "<td >" + list[i].code + "</td>" +
				 "<td style='text-align:right;'>" + comma(list[i].payPrinc + list[i].intAmount) + "</td>" +
				 "<td style='text-align:right;'>" + comma(list[i].payPrinc) + "</td>" +
				 "<td style='text-align:right;'>" + comma(list[i].intAmount) + "</td>" +
				 "<td >" + convertDebtType(list[i].debtType) + "</td>" +
				 "<td >" + list[i].payDate + "</td>" +
				 "<td>" + list[i].insertDate + "</td>" +
			"</tr>");
	}
	console.log("--------------------() renderingLIst End------------------------");
}

function getList(){
	console.log("--------------------getList() Called------------------------");
	getListAjax(1);		
}

function search(){
	console.log("--------------------() search() Called------------------------");
	var inputForm = $("#input-form")[0];
	var vo = {"code":inputForm.code.value, "debtType": inputForm.debtType.value};
	
	$("#search-condition").val(JSON.stringify(vo));
	console.log("search-condition : " + $("#search-condition").val());
	console.log("vo.code : " + vo.code);
	console.log("vo.debtType : " + vo.debtType);
	
	if(vo.code == '' && vo.debtType == '초기값')	{		//빈값일떄
		$("#search-condition").val("{}");			//parse에러를 막기위한 빈객체 삽입
		dialog('차입금코드와 부채유형을 입력해주세요.', true);
		return;
	}
	
	getListAjax(1);
}

function paging(thisObj){
	console.log("--------------------() paging()Called------------------------");
	getListAjax($(thisObj).text());
}

function getListAjax(page){
	console.log("--------------------() getListAjax Called------------------------");
	var inputForm = $("#input-form")[0];
	
	if($("#search-condition").val() == "")	{		//빈값일떄
		$("#search-condition").val("{}");			//parse에러를 막기위한 빈객체 삽입
	}
		
	var vo = JSON.parse($("#search-condition").val());
	vo["page"] = page;
	
	
	$.ajax({
		url: $("#context-path").val() + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/getList",
		type: "POST",
		dataType: "json",
		data: vo,
		success: function(response){
			console.log("Ajax 성공");
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			
		},
		error: function(xhr,error){
			console.log("Ajax 실패");
		}
	});
	console.log("--------------------() getListAjax End------------------------");
}

//----------------------테이블에서 Row선택시 처리 함수----------------------//
function selectRow(thisObj){
	
	
	if($(thisObj).hasClass('selected') === false){
		$("#tbody-list").find('tr').removeClass("selected");
		
		$(thisObj).addClass('selected');
		
		var inputForm = $("#input-form")[0];
		var vo = JSON.parse($(thisObj).find("input[name=vo]").val());
		$('#totalAmount').val(comma(vo.payPrinc + vo.intAmount));
		
		inputForm.voucherNo.value = vo.voucherNo;
		inputForm.code.value = vo.code;
		inputForm.debtNo.value = vo.debtNo;
		inputForm.payPrinc.value = vo.payPrinc;
		inputForm.commaPayPrinc.value = comma(vo.payPrinc);
		inputForm.tempPayPrinc.value = vo.payPrinc;
		inputForm.intAmount.value = vo.intAmount;
		inputForm.commaIntAmount.value = comma(vo.intAmount);
		$('#debtType').val(vo.debtType).trigger('chosen:updated');
		inputForm.payDate.value = vo.payDate;
		$('#code').attr('readonly',true);
	}else{
		
		$('#input-form')[0].reset(); // form의 모든 데이터 초기화
		$('#debtType').val('초기값').trigger('chosen:updated'); // value 값으로 선택
		$('#code').attr('readonly',false);
		$(thisObj).removeClass("selected");
	}
		
}


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
function update(){
	var sendData = $("#input-form").serialize();
	console.log("sendData : " + sendData);
	
	var count = 0;
	
	$("#tbody-list tr").each(function(i){
		if($(this).hasClass('selected') === true){
			count++;
		}
	});
	
	/* if(count > 1){
		dialog('하나의 내용만 수정할 수 있습니다', true);
		return;
	} */
	
	if(count <= 0){
		dialog('수정할 데이터를 선택하여 주세요', true);
		return;
	}	
	
	if($('input[name=code]').val() == '' && $('input[name=commaPayPrinc]').val() == '' && $('input[name=payDate]').val() == ''){
		dialog('리스트에서 상환데이터를 선택해주세요.', true);
		return;
	}
	
	var intAmount = $('input[name=intAmount]').val();
	var payPrinc = $('input[name=tempPayPrinc]').val();
	
	//if (intAmount > payPrinc) {
	//	var noCommaIntAmount = comma(intAmount);
	//	dialog('이자 금액보다 납입금이 작습니다 납입금('+ noCommaIntAmount + '원)보다 크게 입력해주세요');
	//	return false;
	//}
	
	$.ajax({
		url: $("#context-path").val() + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/update",
		type: "POST",
		dataType: "json",
		data: sendData,
		success: function(response){
			
			if(response.data.isClosed == true){
				dialog('해당 데이터는 마감이 되었습니다.', true);
				return;
			}
			
			console.log("수정이 완료 되었습니다.");
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			
		},
		error: function(xhr,error){
			console.log("Ajax 실패");
		}
	});
}

// 상환내역리스트에서 선택한 row 삭제
function deleteChecked(){
	console.log("--------------------deleteChecked() End------------------------");
	
	if($("#checked-voList").val() == ''){
		dialog('삭제할 상환데이터를 선택해주세요.', true);
		return;
	}
	
	var voList = JSON.parse($("#checked-voList").val());
	
	$.ajax({
		url: $("#context-path").val() + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/deleteChecked",
		type: "POST",
		dataType: "json",
		contentType : 'application/json',
		data: JSON.stringify(voList),
		success: function(response){
			console.log("isClosed" + response.data.isClosed);
			if(response.data.isClosed == true){				//리스트가 존재하면
				alert("마감날짜가 지난 데이터는 삭제할 수 없습니다.");
				renderingRepayList4Dialog(response.data.passedAtClosingDateList);
				openDialog66();
				return;
			}
				
			console.log("삭제가 완료 되었습니다.");
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
		},
		error: function(xhr,error){
			console.log("Ajax 실패");
		}
	});
	console.log("--------------------deleteChecked() End------------------------");
}

function rowChecked(thisObj){
	if($("#checked-voList").val() == "")
		$("#checked-voList").val("[]");
	
	var tr = $(thisObj).closest("tr");
	var vo = JSON.parse(tr.find("input[name=vo]").val());
	var voList = JSON.parse($("#checked-voList").val());
	
	console.log("vo : " + vo);
	
	if(!$(thisObj).is(":checked")){
		voList.splice(voList.indexOf(vo), 1);				//해당  vo를 check 리스트에서 제거
	} else{
		voList.push(vo);
	}
	console.log("voList : " + voList);
	
	$("#checked-voList").val(JSON.stringify(voList));
	
}

//--------------------------------------------------------------------Dialog---------------------------------------------//
function openDialog66(){
	$("#dialog66").dialog('open');
	$("#dialog66").dialog({
        	title: "상환정보",
        	title_html: true,
          	resizable: false,
	        height: 500,
	        width: 400,
	        modal: true,
	        close: function() {
            $('#dialog66 *').remove();
         },
         buttons: {
         "닫기" : function() {
                  $(this).dialog('close');
                  $('#dialog66 *').remove();
             }
         }
     });
}

function renderingRepayList4Dialog(list){
	$("#dialog66").append("<label>마감 : 상환내역 리스트<label");
	list.forEach(vo => $("#dialog66").append("<p>" + vo.code + " : " + vo.no + "<p>"));
}

function isEmpty(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true ;
		}else{ 
			return false ;
		}
};

//--------------------------------------------------------------------validation---------------------------------------------//
// 핵심소스
// 유효성 검사시 Dialog Popup 창이 모달로 떠오르게 되는 소스
function dialog(txt, flag) {
	$("#dialog-txt").html(txt);
	var dialog = $( "#dialog-confirm" ).dialog({
		resizable: false,
		modal: true,
		buttons: 
		[
			{
				text: "OK",
				"class" : "btn btn-danger btn-mini",
				click: function() {
					if(flag){
						$( this ).dialog( "close" );
						//location.href="${pageContext.request.contextPath }/12/53";
					} else {
						$( this ).dialog( "close" ); 
					}
				}
			}
		]
	});
}
</script>
</body>
</html>