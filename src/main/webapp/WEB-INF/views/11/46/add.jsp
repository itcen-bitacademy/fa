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

body{font-family: 'Apple SD Gothic Neo','나눔고딕',NanumGothic,'맑은 고딕',Malgun Gothic,'돋움',dotum,'굴림',gulim,applegothic,sans-serif;}

#tbody-list tr{cursor: pointer;}

.input-area{
	display: grid;
	grid-template-columns: repeat(2, auto);
	margin-left: 8px;
}

.input-area>*{
	grid-column: auto;
	display: grid;
	grid-template-rows: repeat(6, auto);
	grid-template-columns: 150px auto;
	gap: 10px 0;
}

.la-radio-wrapper > input[type="radio"] {margin-left: 10px}
.la-radio-wrapper > span.lbl{margin-right: 10px;}
.la-radio-wrapper{
	display: grid;
	grid-template-columns: 50px 50px auto
}

.ia-left{grid-column:1;}
.ia-right{grid-column:2;}

tr td:first-child {
	padding-right: 10px;
}

.radio {
	float: left;
	width: 18%;
}

.search-input-width-first {
	width: 130px;
}

.search-input-width-second {
	width: 235px;
}

.debt-name-input {
	width: 420px;
}

.mgr-input {
	width: 90px;
	display: inline;
}

.mgr-number-input-h4 {
	display: inline;
	margin-left: 30px;
	margin-right: 20px;
}

.mgr-call-input {
	width: 150px;
	display: inline;
}
	
.mybtn{float:right;margin-right:20px;}

.pagination{
	display: grid;
	grid-template-columns: repeat(3,auto);
}

.pg-list{
	grid-column: 2;
}
.above-table{
	display: grid;
	grid-template-columns: repeat(2, 50%);
	height: 30px;
}

.btn-list{float: left; }
.btn-list>button{ 
	margin-right: 10px;
	float:none;
}
.btn-list>button:last-child{
	margin-right: 0;}
.btn-list>button:not(:first-child):not(:last_child){margin: 0 auto}

.dialog-area{
	display:grid;
	grid-template-rows:70px auto;
}
.bda-top{
	display: grid;
	grid-template-columns: repeat(2, 50%);
}
.modal-input-area input[type="text"]{width: 60%;}
.modal-input-area>button, .modal-input-area>input {margin: auto 0;}
.btn-search{
	background-color: #6fb3e0;
    color: #FFF;
    PADDING: 4.5px 10px;
    border: none
}

#repay-form{
	display: grid;
	grid-template-rows: repeat(5, auto);
	height: 80%;
	margin-top:30px
}
.repay-input-wrapper{
	display: grid;
	grid-template-columns: 30% auto auto;
	margin: auto 0;
}

input::-webkit-outer-spin-button,			/* input type=number 화살표 제거*/
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.input-num{text-align:right;}

.label-name{font-size: 14px}

.add-on {
    display: inline-block;
    width: auto;
    height: 20px;
    min-width: 16px;
    padding: 4px 5px;
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    text-align: center;
    text-shadow: 0 1px 0 #fff;
    background-color: #eee;
    border: 1px solid #ccc;
    vertical-align: top;
}

tr.selected{background-color: #ddd}

.textarea{resize: none; width: 282px; height: 84px;}

.hideElement{display: none;}
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
				<h1 class="pull-left">단기차입금관리</h1>
			</div>
			
			<!-- PAGE CONTENT BEGINS -->
				<input id="search-condition" type="hidden">
				<input id="deleteVoList" type="hidden">
				<form class="form-horizontal" id="input-form" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
					<input type="hidden" name="vo"/>				
					<input type="hidden" name="no"/>
					<input type="hidden" name="voucherNo"/>
				<div class="input-area">
					<section>
						<div class="ia-left"><label class="label-name">단기차입금코드</label></div>
						<div class="ia-right">
							<input type="text" id="code" name="code" onkeydown="codeChanged()" onchange="codeChanged()" required>
							<button type="button" id='btn-chk-duplication' onclick="checkDuplication()">중복확인</button>
							<i class="icon-ok bigger-180 blue" id="img-checkcode" style="display: none;"></i>
							<input type="hidden" name="isDuplicated" value="Y">
						</div>
						<div class="ia-left"><label class="label-name">단기차입금명</label></div>
						<div class="ia-right"><textarea name="name" class="textarea" maxlength="90"></textarea></div>
						<div class="ia-left"><label class="label-name">차입금액</label></div>
						<div class="ia-right">
							<input type="text" id="debt-amount-comma" name="debtAmountComma" class="input-num">
							<input type="hidden" name="debtAmount" required>
							<label class="label-name" style="display: inline-block;">(원)</label>
						</div>
						<div class="ia-left"><label class="label-name">차입일자 ~ 만기일자</label></div>
						<div class="ia-right">
							<input type="text" name="debtExpDate" readonly="readonly" required>
							<span class="add-on"><i class="icon-calendar"></i></span>
						</div>
						<div class="ia-left"><label class="label-name">이자지급방식</label></div>
						<div class="ia-right la-radio-wrapper">
							<div>
								<input type="radio" name="intPayWay" value="Y" class="ace" checked="checked">
								<span class="lbl">년</span>
							</div>
							<div>
								<input type="radio" name="intPayWay" value="M" class="ace">
								<span class="lbl">월</span>
							</div>
							<div>
								<input type="radio" name="intPayWay" value="E" class="ace">
								<span class="lbl">해당없음</span>
							</div>
						</div>
						<div class="ia-left"><label class="label-name">은행코드</label></div>
						<div class="ia-right">
							<div class="input-append">
							<input type="text" class="search-input-width-first" name="bankCode" placeholder="은행코드" readonly="readonly" required/>
							<span class="add-on">
							<a href="#" id="a-bankinfo-dialog" onclick="openBankDialog()"><i class="icon-search icon-on-right bigger-110"></i></a>
							</span>
							</div>
							<input type="text" class="search-input-width-second" name="bankName" placeholder="은행명" readonly="readonly"/>
						</div>
						
					</section>
					<section>
						<div class="ia-left"><label class="label-name">회계연도</label></div>
						<div class="ia-right"><input type="number" min="1900" max="2099" step="1" id="financialyearId" name="financialYear" placeholder="회계연도"></div>
						
						<div class="ia-left"><label class="label-name">차입금대분류</label></div>
						<div class="ia-right">
							<select class="chosen-select form-control" name="majorCode" id="majorCode" data-placeholder="차입금대분류" required>
								<option value=""></option>
								<option value="008001">국내은행</option>
								<option value="008002">저축은행</option>
								<option value="008003">신용금고</option>
								<option value="008004">새마을금고</option>
								<option value="008005">외국계은행</option>
								<option value="008006">증권</option>
							</select>
						</div>
						
						<div class="ia-left"><label class="label-name">상환방법</label></div>
						<div class="ia-right la-radio-wrapper">
							<div>
								<input name="repayWay" type="radio" class="ace"  value="Y" checked="checked"/>
								<span class="lbl">년</span>
							</div>
							<div>
								<input name="repayWay" type="radio" class="ace"  value="M" />
								<span class="lbl">월</span>
							</div>
							<div>
								<input name="repayWay" type="radio" class="ace"  value="E" />
								<span class="lbl">만기</span>
							</div>
						</div>
						
						<div class="ia-left"><label class="label-name">이율</label></div>
						<div class="ia-right"><input type="text" id="int-rate" name="intRate" id="intRate" placeholder="(%) 100미만, 소수점 2자리 이하" class="input-num" required/><h5 style="display:inline">%</h5></div>
						
						<div class="ia-left"><label class="label-name">담당자</label></div>
						<div class="ia-right">
							<input type="text" class="mgr-input" name="mgr" id="mgr" required/>
							<label class="mgr-number-input-h4 label-name">담당자전화번호</label>
							<input type="text" class="mgr-call-input" name="mgrCall" id="mgrCall" required/>
						</div>
						
						<div class="ia-left"><label class="label-name">계좌</label></div>
						<div class="ia-right">
							<div class="input-append">
							<input type="text" class="search-input-width-first" name="depositNo" id="depositNo" placeholder="계좌번호" readonly="readonly" required/>
							<span class="add-on">
								<a href="#" onclick="openAccountDialog()"><i class="icon-search nav-search-icon"></i></a>
							</span>
							</div>
							<!-- <span class="btn btn-small btn-info" onclick="openAccountDialog()"><i class="icon-search nav-search-icon"></i></span> -->
							<input type="text" class="search-input-width-second" name="depositHost" disabled="disabled" placeholder="예금주"/>
						</div>
					</section>
				</div>	<!--  input area -->
				<hr>
				<section class="above-table">
					<section class="above-table-left">
						<div class="btn-list">
							<button type="button" class="btn btn-primary btn-small mybtn" id="btn-insert" onclick="insert()">입력</button>
							<button type="button" class="btn btn-warning btn-small mybtn" id="btn-update" onclick="update()">수정</button>
							<button type="button" class="btn btn-danger btn-small mybtn" id="btn-delete"onclick="deleteChecked()">삭제</button>
							<button type="button" class="btn btn-info btn-small mybtn" id="btn-search" onclick="search()">조회</button>
							<button type="button" class="btn btn-small mybtn" id="btn-repay" onclick="openRepayDialog()">상환</button>
							<button type="button" class="btn btn-success btn-small mybtn" onclick="resetForm()">초기화</button>
							<button type="button" class="btn btn-pink btn-small mybtn" onclick="openRepayDueDialog()">금주상환예정목록</button>
						</div>
					</section>
				</section>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
			
			<!-- 상환  Modal pop-up : start -->
					<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
						
					</div>
					<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
					
			<!-- list -->
				<section class="above-table-right" id="above-table-right">
				</section>
				<table  class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="chkbox-select-all" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">단기차입금코드</th>
							<th class="center">단기차입금명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환잔액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자</th>
							<th class="center">만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>	
							<th class="center">은행코드</th>
							<th class="center">계좌</th>
							<th class="center">등록일자</th>
						</tr>
					</thead>
					<tbody id="tbody-list">
						
					</tbody> 	<!-- tbody-list end -->
				</table>
				
				<section class="pagination" id="pagination">
					<ul id="pg-list" class="pg-list">
						
					</ul> <!-- pg-list end -->
				</section>
			</div><!-- /.page-content -->
			<!-- 모달 -->
			<div id="dialog46" hidden="hidden">
							
			</div>
			<div id="dialog-confirm" class="hide">
				<p id="dialog-txt" class="bolder grey">
				</p>
			</div>
			<!-- 모달 end -->
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
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>


<script>
$(function() {						//onload함수
	//1.Range Picker
	$(".chosen-select").chosen();
	//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
	$('input[name=debtExpDate]').daterangepicker({
		'applyClass' : 'btn-sm btn-success',
		'cancelClass' : 'btn-sm btn-default',
		format : 'YYYY-MM-DD',
		locale: {
			applyLabel: 'Apply',
			cancelLabel: 'Cancel',
		}
	})
	.next().on(ace.click_event, function(){
		$(this).next().focus();
	});
	
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
        $(this).prev().focus();
     });
	//--------------------------------------------------------------------------------------------------------------------------//
	//Checkbox All Check
	$("#chkbox-select-all").click(function(){
		$('input[type=checkbox]').prop('checked', this.checked).change();	//All Checkbox 버튼의 check여부에 따라 바뀐다. change event를 발생시킨다.
	});
	
	//--------------------------------------------------------------------------------------------------------------------------//
	
	changeBtnDisplay(false);
});

//Page ready시 table & paging list Rendering
$(document).ready(function(){
	getList();
});

$("#debt-amount-comma").on("focusout", function() {
    var x = $(this).val();
    
    var inputForm = $("#input-form")[0];
    inputForm.debtAmount.value = unComma(x);							//콤마를 안 붙힌 숫자의 값을 저장한다.
    if(x && x.length > 0) {								
        if(!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g,"");
        }
        x = comma(x);
        $(this).val(x);
    }
}).on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
    var inputForm = $("#input-form")[0];
    inputForm.debtAmount.value = unComma($(this).val());
    $(this).val(comma($(this).val()));
});

$("#int-rate").on("keydown",function(e){
	console.log("---------------keydown--------------");
	var value = $(this).val();
	var pattern = /^((\d{1,2}|100)([.]\d{0,2})?)?$/;	
   	
	var charCode = (e.which) ? e.which : e.keyCode;	
	
	if((charCode >= 48) && (charCode <= 57)){
		value = String(value) + String.fromCharCode(e.keyCode);
	}
	
	console.log("value : " + value);
   	console.log("keyCode String : " + String.fromCharCode(e.keyCode));
   	console.log("e.keyCode: " + e.keyCode);
   	console.log("charCode String : " + String.fromCharCode(charCode));
   	console.log("charCode : " + charCode);
   	
    if (!pattern.test(value)) {
        dialog("100 이하의 숫자만 입력가능하며,\n소수점 둘째자리까지만 허용됩니다.");
        return false;
    }
    
}).on("keyup", function(e){
	console.log("---------------keyup--------------");
	var value = $(this).val();
	console.log("value : " + value);
	
	var charCode = (e.which) ? e.which : e.keyCode;				//크로스 브라우징

	console.log("keyCode String : " + String.fromCharCode(e.keyCode));
	console.log("keyCode : " + e.keyCode);
	if((charCode < 48) || (charCode> 57)){
		if(charCode != 190){//숫자 + .만 입력 가능
			console.log("불가능");
			$(this).val("");
		}
	}
	console.log("value : " + $(this).val());
}).on("keypress", function(e){
	console.log("---------------keyPress--------------");
	var value = $(this).val();
	var charCode = (e.which) ? e.which : e.keyCode;				//크로스 브라우징
	
	console.log("code : " + charCode);
	console.log("value : " + value);
	
	var reg = /[.]/;
	if(reg.test(value)){
		if(charCode == 46){
			console.log(".못찍는다");
			return false;
		}
	}
});

$("#mgr").on("keyup", function(){
	var regexp= /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g;
	$(this).val($(this).val().replace(regexp, ""));
});

var financialYear = new Date().getFullYear();
document.getElementById("financialyearId").value = financialYear;
</script>
<script>
//-----------------------------------버튼 display 수정 -------------------------------//
function changeBtnDisplay(isRowSelected){
	if(isRowSelected){
		$("#btn-update").removeClass("hideElement");
		$("#btn-repay").removeClass("hideElement");
		$("#btn-insert").addClass("hideElement");
	}else{
		$("#btn-update").addClass("hideElement");
		$("#btn-repay").addClass("hideElement");
		$("#btn-insert").removeClass("hideElement");
	}
}
//-----------------------------------중복 확인 메서드 -----------------------------------//
function codeChanged(){					//code 변경 Event시 발생
	var inputForm = $("#input-form")[0];
	inputForm.isDuplicated.value = "Y";	
	$("#img-checkcode").css("display","none");
	$("#btn-chk-duplication").css("display", "inline-block");
}

function checkDuplication(){
	console.log("------------------------------checkDuplication() called ------------------------------");
	var inputForm = $("#input-form")[0];
	var code = inputForm.code.value;
	console.log("code : " + code);
	console.log({"code" : code});
	
	if(inputForm.code.value == ''){
		dialog("코드를 입력하세요.", inputForm.code);
		return;
	}else if(inputForm.code.value.substr(0) != "G"){
		dialog("단기차입금코드는 G로 시작해야합니다.", inputForm.code);
		return;
	}
	
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/checkDuplication?code=" + code,
		contentType : "application/json; charset=utf-8",
		type: "get",
		dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
		data: "",
		success: function(response){
			if(response.data == true){				//중복인경우
				dialog("중복입니다");
			} else{
				dialog("사용해도 되는 Code 입니다");
				inputForm.isDuplicated.value="N";
				$("#img-checkcode").css("display","inline");
				$("#btn-chk-duplication").css("display", "none");
			}
		},
		error: function(xhr, error){
			
		}
	});
	
	console.log("------------------------------checkDuplication() end ------------------------------");
}

function insert(){
	console.log("---------------------insert() called ---------------------------------");
	var inputForm = $("#input-form")[0];
	
	/* if(inputForm.vo.value != ""){
		dialog("새로운 데이터를 입력해주세요.");
		resetForm();
		return;
	}  */
	
	if(!isValidDebt(inputForm)){
		console.log("유효성 위반");
		return;
	}
	
	console.log("isDuplicated : " + inputForm.isDuplicated.value);
	if(inputForm.isDuplicated.value == "Y"){
		dialog('중복체크 하고 오세요');
		return;
	}
	
	var sendData = $("#input-form").serialize();
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/insert",
		type:"POST",
		dataType: "json",
		data: sendData,
		success: function(response){
			console.log("isClosed : " + response.data.isClosed);
			console.log("response.data : " + response.data);
			if(response.data.isClosed == true){
				dialog("차입일자가 마감일자전인 데이터는 수정할 수 없습니다.");
				return;
			}
			
			dialog("입력이 완료 되었습니다.");
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			resetForm();
		},
		error: function(xhr, error){
			
		}
	});
	
	console.log("---------------------insert() end ---------------------------------");
}

function isSelected(vo){
	return isEmpty(vo);
}
function update(){
	console.log("-----------------------------update() Called --------------------------------");
	var inputForm = $("#input-form")[0];
	var sendData = $("#input-form").serialize();
	
	if(isSelected(inputForm.vo.value)){
		dialog("하나의 차입금을 선택해주세요");
		return;
	}
	
	if(!isValidDebt(inputForm)){ //유효성이 어긋나면
		console.log("유효성 위반");
		return;
	}			
		
	
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/update",
		type:"POST",
		dataType: "json",
		data: sendData,
		success: function(response){
			console.log("isClosed : " + response.data.isClosed);
			console.log("response.data : " + response.data);
			if(response.data.isClosed == true){
				dialog("차입일자가 마감일자전인 데이터는 수정할 수 없습니다.");
				return;
			}
			
			if(response.data == true){			//상환내역이 존재하는경우
				dialog("해당 차입금정보는 상환내역이 있기때문에 수정할 수 없습니다.");
				return;
			}
			
			dialog("수정이 완료 되었습니다.");
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
		},
		error: function(xhr, error){
			
		}
	});
	console.log("-----------------------------update() End --------------------------------");
}

function isValidDebt(inputForm){
	var isValid = false;
	
	if(inputForm.code.value == ''){
		dialog("코드를 입력하세요.", inputForm.code);
	}else if(inputForm.name.value == ''){
		dialog("차입금명을 입력하세요.", inputForm.name);
	}else if(inputForm.debtAmountComma.value == ''){
		dialog("차입금액을 입력하세요.", inputForm.debtAmountComma);
	}else if(inputForm.debtExpDate.value == ''){
		dialog("차입일자, 만기일자를 입력하세요.", inputForm.debtExpDate);
	}else if(inputForm.bankCode.value == ''){
		dialog("은행을 선택하세요.", inputForm.bankCode);
	}else if(inputForm.majorCode.value == ''){
		dialog("대분류를 선택하세요.", inputForm.majorCode);
	}else if(inputForm.intRate.value == ''){
		dialog("이율을 입력하세요.", inputForm.intRate);
	}else if(inputForm.mgr.value == ''){
		dialog("담당자를 입력하세요.", inputForm.mgr);
	}else if(inputForm.mgrCall.value == ''){
		dialog("담당자 전화를 입력하세요.", inputForm.mgrCall);
	}else if(inputForm.depositNo.value == ''){
		dialog("계좌를 선택하세요.", inputForm.depositNo);
	}else{
		isValid = true;
	}
	
	return isValid;
}
function resetForm(){
	var inputForm = $("#input-form")[0];
	$(inputForm.code).attr("readonly", false);
	$("#btn-chk-duplication").css("display", "inline-block");
	$("#img-checkcode").css("display","none");
	$("#tbody-list").find("tr").css("background-color", "inherit");
	inputForm.vo.value = "";
	inputForm.reset();
	changeBtnDisplay(false);
}
//-----------------------------------금주 상환내역 Modal ---------------------------------//
function openRepayDueDialog(){
	$("#dialog46").dialog(new DialogBody("금주 상환내역"));
	
	$.ajax({
	       url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/getRepayDueList",
	       contentType : "application/json; charset=utf-8",
	       type: "post",
	       dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
	       data: "",
	       statusCode: {
	           404: function() {
	             dialog("page not found");
	           }
	       },
	       success: function(response){
	    	   renderRepayDueDialog(response.data);
	       },
	       error: function(xhr, error){
	          console.error("error : " + error);
	       }
	    });
}

function renderRepayDueDialog(list){
	console.log(list);
	$("#dialog46").append(
			"<table class='table  table-bordered table-hover'>" + 
				"<thead>"+
					"<tr>"+
						"<th class='center'>코드</th>" +
						"<th class='center'>상환잔액</th>" +
						"<th class='center'>납입일</th>" +
					"</tr>" +
				"</thead>" +
	  			"<tbody>" +
               "</tbody>"+
         "</table>");
	for(let i in list){
		$("#dialog46 tbody").append(
				 "<tr>" +
                   "<td class='center'>" + list[i].code + "</td>" +
                   "<td class='center'>" + list[i].repayBal + "</td>" +
                   "<td class='center'>" + list[i].repayDue + "</td>" +
             	"</tr>");
	}//for end
}
//-----------------------------------은행 Model 메서드 ---------------------------------//
//Dialog Open하는 함수
function openBankDialog(){
	console.log("-------------------------openBankDialog() Called----------------------------------------");	
	
	renderBankDialog();
	
	$("#dialog46").dialog(new DialogBody("은행정보"));
	console.log("-------------------------openBankDialog() End----------------------------------------");
}

function renderBankDialog(){
	$("#dialog46").append("<section class='dialog-area'>" +
							 "<section class='bda-top'>" +
								"<div class='modal-input-area'>" +
									"<label>은행코드</label>" +
									"<input type='text' id='input-dialog-bankcode'/>" + 
									"<span class='add-on'>" +
										"<a href='#' onclick='searchByBankcode()'><i class='icon-search nav-search-icon'></i></a>" +
									"</span>" +
								"</div>" +
								"<div class='modal-input-area'>" +
									"<label>은행명</label>" +
									"<input type='text'  id='input-dialog-bankname'/>" +
									"<span class='add-on'>" +
										"<a href='#' onclick='searchByBankname()'><i class='icon-search nav-search-icon'></i></a>" +
									"</span>" +
								"</div>" +
							"</section>" +
							"<table id='modal-bank-table' class='table  table-bordered table-hover'>" +
							"<thead>" + 
								"<tr>" +
									"<th class='center'>은행코드</th>" +
									"<th class='center'>은행명</th>" +
								"</tr>" + 
							"</thead>" +
							"<tbody id='tbody-bankList'>" +
							"</tbody>" + 
						"</table>" +
						"</section>");
}
//은행코드 검색 : 최대 하나의 결과만 가져온다.
function searchByBankcode(){
	console.log("searchByBankcode called");
	$("#tbody-bankList").find("tr").remove();
    
    var bankcodeVal = $("#input-dialog-bankcode").val();
    console.log(bankcodeVal);
    // ajax 통신
    $.ajax({
       url: "${pageContext.request.contextPath }/api/customer/getbankCode?bankCodeVal=" + bankcodeVal,
       contentType : "application/json; charset=utf-8",
       type: "get",
       dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
       data: "",
       statusCode: {
           404: function() {
             dialog("page not found");
           }
       },
       success: function(response){
          $("#input-dialog-bankcode").val('');
           $.each(response.data,function(index, item){
                    $("#tbody-bankList").append("<tr onclick='selectBankRow(this)'>" +
                    	 "<input type='hidden' name='vo' value='" + JSON.stringify(item) + "'>" + 
                          "<td class='center'>" + item.no + "</td>" +
                          "<td class='center'>" + item.name + "</td>" +
                        "</tr>");
             })
       },
       error: function(xhr, error){
          console.error("error : " + error);
       }
    });
}

//은행명 검색 : 은행목록 리스트로 가져오기
function searchByBankname(){
	console.log("searchByBankname called");
	event.preventDefault();
    $("#tbody-bankList").find("tr").remove();
    var banknameVal = $("#input-dialog-bankname").val();
    // ajax 통신
    $.ajax({
       url: "${pageContext.request.contextPath }/api/customer/getbankName?bankNameVal=" + banknameVal,
       contentType : "application/json; charset=utf-8",
       type: "get",
       dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
       data: "",
       statusCode: {
           404: function() {
             dialog("page not found");
           }
       },
       success: function(response){
          $("#input-dialog-bankname").val('');
           $.each(response.data,function(index, item){
                    $("#tbody-bankList").append("<tr onclick='selectBankRow(this)'>" +
                    		 "<input type='hidden' name='vo' value='" + JSON.stringify(item) + "'>" +
                         	 "<td class='center'>" + item.no + "</td>" +
                        	 "<td class='center'>" + item.name + "</td>" +
                        "</tr>");
             })
       },
       error: function(xhr, error){
          console.error("error : " + error);
       }
    });
}

//은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 input form에 추가
function selectBankRow(thisObj){
	console.log("--------------------------------selectBaknkRow() Called ----------------------------");
	
	var inputForm = $("#input-form")[0];
	var inputVo = $(thisObj).find("input[name=vo]");
	var vo = JSON.parse(inputVo.val());
	console.log("vo " + vo);
	inputForm.bankCode.value = vo.no;
	inputForm.bankName.value = vo.name;
	$("#dialog46").dialog('close');
	
	console.log("--------------------------------selectBaknkRow() End ----------------------------");
}

//-----------------------------------상환 Model 메서드 ---------------------------------//
function addRepayBtn(buttons){
	buttons["상환"] =  function(){
		var isSuccess = repay(repayForm, vo.repayBal);		//상환Form, 상환잔액 반환
		if(isSuccess)
			$(this).dialog('close');
    }
}

function openRepayDialog(){
	console.log("---------------------------openRepayDialog() called--------------------------");
	var inputForm = $("#input-form")[0];			//선택된 차입금 form
	
	if(isEmpty(inputForm.vo.value)){
		dialog("하나의 차입금을 선택해주세요");	
		return;
	}
	var vo = JSON.parse(inputForm.vo.value);
	
	renderRepayDialog();								//그린다음
	var repayForm = $("#repay-form")[0];				//해당 폼을 찾는다.
	initRepayDialog(repayForm, vo);
	
	var dialogBody = new DialogBody("상환정보");
	addRepayBtn(dialogBody.buttons);
	    	
	$("#dialog46").dialog(dialogBody);
	
}//openRepayDailog() end

function renderRepayDialog(){
	console.log("------------------------------------renderRepayDialog() Called----------------------------------");
	$("#dialog46").append("<form id='repay-form'>" + 
			"<input type='hidden' name='debtNo'/>" +
			"<input type='hidden' name='code'/>" +
			"<section class='repay-input-wrapper'>" +
				"<label>차입금코드</label>" +
				"<input type='text' name='debtCode' readonly= 'readonly'/>" +
			"</section>" +
			"<section class='repay-input-wrapper'>" +
				"<label>납입일자</label>" +
				"<section>" +
					"<input class='cl-date-picker' type='text' name='payDate' id='id-date-picker-1'  data-date-format='yyyy-mm-dd'/>" +
					"<span class='add-on'>" +
					"<i class='icon-calendar'></i>" +
				"</section>" + 
			"</section>" +
			"<section class='repay-input-wrapper'>" +
				"<label>납입원금</label>" +
				"<input type='text' id='pay-princ-comma' name='payPrincComma'/>(원)" +
				"<input type='hidden' name='payPrinc'/>" +
			"</section>" +
			"<section class='repay-input-wrapper'>" +
				"<label>이자금액</label>" +
				"<input type='text' name='intAmountComma' readonly= 'readonly'/>(원)" +
				"<input type='hidden' name='intAmount'/>" +
			"</section>" +
			"<section class='repay-input-wrapper'>" +
				"<label>총액</label>" +
				"<input type='text' name='totalPayPrincComma' readonly='readonly'/>(원)" +
				"<input type='hidden' name='totalPayPrinc'/>" +
			"</section>" + 
		"</form>");
	
	//날짜 event추가
	$('.cl-date-picker').datepicker({
		language: 'ko'
	}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	//납입금 추가
	$("#pay-princ-comma").on("focusout", function() {
	    var x = unComma($(this).val());
	    
	    if(x && x.length > 0) {								
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        $(this).val(comma(x));
	    }
	}).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    $(this).val(comma($(this).val()));
	    var repayForm = $("#repay-form")[0];
	    
	    var totalPayPrinc = convertComma2Num(repayForm.payPrincComma.value) + convertComma2Num(repayForm.intAmountComma.value);
	    if(!$.isNumeric(totalPayPrinc))
	    	totalPayPrinc = repayForm.intAmountComma.value;
	    
	    repayForm.totalPayPrincComma.value= comma(totalPayPrinc);
	});
	console.log("------------------------------------renderRepayDialog() End----------------------------------");
}

function getIntAmount(vo){
	var inputForm = $("#input-form")[0];
	var vo = JSON.parse(inputForm.vo.value);
	var intPayWay = vo.intPayWay;
	var intAmount = 0;
	
	if(intPayWay == "Y"){
		intAmount = vo.repayBal * vo.intRate / 100;
	}else if(intPayWay == "M"){
		intAmount = vo.repayBal * vo.intRate / 100;
		intAmount = intAmount / 12;
	}
	
	return Math.round(intAmount,3);
}

function initRepayDialog(repayForm, vo){
	console.log("------------------------------------initRepayDialog() Call-----------------------------------");
	console.log("repayForm : " + repayForm);
	
	repayForm.debtNo.value = vo.no;
	repayForm.code.value = vo.code;
	repayForm.debtCode.value = vo.code;
	repayForm.intAmount.value = getIntAmount(vo);
	console.log("이자금액 : " + repayForm.intAmount.value);
	repayForm.intAmountComma.value= comma(repayForm.intAmount.value);
	repayForm.totalPayPrinc.value = repayForm.intAmount.value;
	repayForm.totalPayPrincComma.value= comma(repayForm.totalPayPrinc.value);
	console.log("------------------------------------initRepayDialog() End-----------------------------------");
}

function repay(repayForm, repayBal){									//상환버튼 클릭시
	repayBal = parseInt(repayBal);							//int로 변환
	var payPrinc = parseInt(repayForm.payPrinc.value);		//int로 변환
	
	var inputForm = $("#input-form")[0];
	
	if(payPrinc > repayBal){
		dialog("납입원금이 잔액보다 클 수 없습니다");
		return false;
	}
	if(!isValidRepay(repayForm))
		return false;
	
	
	repayForm.intAmount.value = unComma(repayForm.intAmountComma.value);
	repayForm.payPrinc.value = unComma(repayForm.payPrincComma.value);
	repayForm.totalPayPrinc.value = unComma(repayForm.totalPayPrincComma.value);
	
	var sendData = $(repayForm).serialize();
	console.log("sendData : " + sendData);
	// ajax 통신
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/repay",
		type: "POST",
		dataType: "json", 
		data: sendData,
		success: function(response){
			
			if(response.data.isClosed == true){
				dialog("마감일 이전 데이터는 넣을수 없습니다.");	
				return false;
			}
			
			if(payPrinc == repayBal){//상환완료인경우
				console.log("상환이 모두 완료되었습니다.")
			}else{
				dialog("상환이 되었습니다.");
			}			
			
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			
			return true;
		},
		error: function(xhr, error){
			console.error("error : " + error);
		}
	});
}

function isValidRepay(repayForm){
	if(repayForm.payDate.value == ''){
		dialog("상환일자를 입력하세요.");
	}else if(repayForm.payPrincComma.value == ''){
		dialog("납입원금을 입력하세요.");
	}
}

function convertComma2Num(commaNum){
	return parseInt(unComma(commaNum));
}

function openAccountDialog(){
	//var accountForm = $("#account-form")[0];
	console.log("openAccountDialog() called");
	
	renderAcctDialog();
	
	$("#dialog46").dialog(new DialogBody("계좌정보"));
}

function renderAcctDialog(){
	console.log("-------------------------------renderAcctDialog() Called ------------------------");
	$("#dialog46").append("<section class='dialog-area'>" + 
							"<section class='modal-input-area'>" + 
								"<label>계좌번호</label>" + 
								"<input type='text' id='input-dialog-depositNo' />" + 
								"<span class='add-on'>" +
									"<a href='#' onclick='searchAccountByNo()'><i class='icon-search nav-search-icon'></i></a>" +
								"</span>" +
							"</section>" +
							"<table id='modal-deposit-table' class='table  table-bordered table-hover'>" + 
							"<thead>" +
								"<tr>" +
									"<th class='center'>계좌번호</th>" + 
									"<th class='center'>예금주</th>" +
									"<th class='center'>은행코드</th>" + 
									"<th class='center'>은행명</th>" + 
								"</tr>" +
							"</thead>" +
							"<tbody id='tbody-bankaccountList'>"+
							"</tbody>" +
						 "</section>");
	console.log("-------------------------------renderAcctDialog() End ------------------------");
}


function searchAccountByNo(){
	console.log("searchAccountByNo() called");
	
	 $("#tbody-bankaccountList").find("tr").remove();
     
     var depositNo = $("#input-dialog-depositNo").val();
     
     // ajax 통신
     $.ajax({
        url: "${pageContext.servletContext.contextPath }/api/deposit/gets?depositNo=" + depositNo,
        contentType : "application/json; charset=utf-8",
        type: "get",
        dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
        statusCode: {
            404: function() {
              dialog("page not found");
            }
        },
        success: function(result){
           console.log(result);
           if(result.success) {
              $("#input-dialog-depositNo").val('');
              var baccountList = result.bankAccountList;
              for(let a in baccountList) {
                 $("#tbody-bankaccountList").append("<tr onclick='selectBankAcct(this)'>" +
                		 									"<input type='hidden' name='vo' value='" + JSON.stringify(baccountList[a]) + "'>" +
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
 }
 
 function selectBankAcct(thisObj){
	 console.log("selectBankAcct() called");
	 var inputForm = $("#input-form")[0];
	 var inputVo = $(thisObj).find("input[name='vo']");
	 
	 var vo = JSON.parse(inputVo.val());
	 
	 inputForm.depositNo.value = vo.depositNo;
	 inputForm.depositHost.value = vo.depositHost; 
	 $("#dialog46").dialog('close');
 }


//-----------------------------------Row Click input 영역 채워지도록 ---------------------------------//
function changeCssRow(thisObj){
	console.log("--------------------------------------------changeCssRow() Called--------------------------------------------");
	if($(thisObj).hasClass("selected")){
		console.log("클래스 있다");
		$(thisObj).removeClass("selected");
	}else{
		$(thisObj).closest("table").find(".selected").removeClass("selected");
		$(thisObj).addClass("selected");
	}
	
	console.log("--------------------------------------------changeCssRow() End--------------------------------------------");
}
function selectRow(thisObj){
	console.log("--------------------------------selectRow() call--------------------------");
	var inputVo = $(thisObj).find("input[name=vo]");	//해당vo에 대한 JSON객체 String 값을 가진 input을 반환
	
	var vo = JSON.parse(inputVo.val());					//JSON string형식을 JSON형식으로 변환, 객체 생성
	var inputForm = $("#input-form")[0];
	
	if($(thisObj).hasClass("selected")){
		console.log("클래스 있다");
		$(thisObj).removeClass("selected");
		resetForm();	
		return;
	}else{
		$(thisObj).closest("table").find(".selected").removeClass("selected");
		$(thisObj).addClass("selected");
		
		//changeBtnDisplay(true);
	}
	
	$("#btn-chk-duplication").css("display", "none");
	//$(inputForm.code).attr("readonly", true);
	
	inputForm.vo.value= inputVo.val();
	inputForm.voucherNo.value = vo.voucherNo;
	inputForm.no.value = vo.no;
	$(inputForm.code).val(vo.code);
	inputForm.name.value = vo.name;
	inputForm.debtAmount.value = vo.debtAmount;
	inputForm.debtAmountComma.value = comma(vo.debtAmount);
	inputForm.debtExpDate.value = vo.debtDate + " - " + vo.expDate;	//없는걸 찾으면 error가 발생함. 밑에줄도 실행이안됨.
	$(inputForm).find("input[name='intPayWay']").each(function(i, e){
		$(this).prop("checked", false);
		
		if($(this).val() == vo.intPayWay){
			$(this).prop("checked", true);
		}
	});	
	inputForm.bankCode.value = vo.bankCode;		
	inputForm.bankName.value = vo.bankName;		//조인한 값
	
	var options = inputForm.majorCode.options;					//SelectBox Options
	for(var i=0 ; i < options.length; ++i){
		if(options[i].value == vo.majorCode){
			options[i].selected = "true";
			$("#majorCode_chosen").find("span")[0].innerHTML = options[i].innerHTML;
		}
	}
	
	$(inputForm).find("input[name='repayWay']").each(function(i, e){
		if($(this).val() == vo.repayWay){
			$(this).prop("checked", true);
			$(this).prop("checked", true);
		}
			
	});		
	inputForm.intRate.value = vo.intRate;
	inputForm.mgr.value = vo.mgr;
	inputForm.mgrCall.value = vo.mgrCall;
	inputForm.depositNo.value = vo.depositNo;		
	inputForm.depositHost.value = vo.depositHost;		//조인한 값
	
	console.log("--------------------------------selectRow() End--------------------------");
}

//-----------------------------------각 컬럼값 변환 함수 ---------------------------------//
function convertMajorCode(majorCode){
	var MajorName = "";
	if(majorCode == "008001")
		MajorName = "국내은행";
	else if(majorCode == "008002")
		MajorName = "저축은행";
	else if(majorCode == "008003")
		MajorName = "신용금고";
	else if(majorCode == "008004")
		MajorName = "새마을금고";
	else
		MajorName = "외국계은행";
	return MajorName;
}
function convertRepayWay(repayWay){
	var repayWayName = "";
	
	if(repayWay == "Y")
		repayWayName="연";
	else if(repayWay == "M")
		repayWayName="월";
	else if(repayWay =="E")
		repayWayName="만기";
	
	return repayWayName;
}
function convertIntPayWay(intPayWay){
	var intPayWayName = "";
	
	if(intPayWay == "Y")
		intPayWayName = "연";
	else if(intPayWay == "M")
		intPayWayName = "월";
	else if(intPayWay == "E")
		intPayWayName = "해당없음";
	
	return intPayWayName;
}
function convertIntRate(intRate){
	return intRate + "%";
}
function convertInsertDate(insertDate){
	return insertDate.slice(0, insertDate.length -2);
}

//-----------------------------------리스트 및 페이지 Rendering ---------------------------------//
//리스트를 받아서 Rendering 하는 함수
function renderingList(list){
	$("#tbody-list > *").remove();
	
	console.log("list length : " + list.length);
	for(var i=0; i < list.length; ++i){
		var vo = JSON.stringify(list[i]);			//각 vo값을 저장해둔다.
		
		list[i].majorCode = convertMajorCode(list[i].majorCode);
		list[i].repayWay = convertRepayWay(list[i].repayWay);
		list[i].intPayWay = convertIntPayWay(list[i].intPayWay);
		list[i].intRate = convertIntRate(list[i].intRate);
		
		$("#tbody-list").append("<tr onclick='selectRow(this)'>" +
				 "<input type='hidden' name='vo' value='" + vo + "'>" +
				 "<td class='center'>" +
				 	"<label class='pos-rel'>" +
				 		"<input type='checkbox' name='no' class='ace' onchange='rowChecked(this)'/>" +"<span class='lbl'></span>" +
					 "</label>" +
				 "</td>" +
				 "<td class='center'>" + list[i].code + "</td>" +
				 "<td class='center'>" + list[i].name + "</td>" +
				 "<td class='center'>" + list[i].majorCode + "</td>" +
				 "<td class='center'>" + comma(list[i].debtAmount) + "</td>" +
				 "<td class='center'>" + comma(list[i].repayBal) + "</td>" +
				 "<td class='center'>" + list[i].repayWay + "</td>" +
				 "<td class='center'>" + list[i].debtDate + "</td>" + 
				 "<td class='center'>" + list[i].expDate + "</td>" +
				 "<td class='center'>" + list[i].intRate + "</td>" +
				 "<td class='center'>" + list[i].intPayWay + "</td>" +
				 "<td class='center'>" + list[i].mgr + "</td>" +
				 "<td class='center'>" + list[i].mgrCall + "</td>" +
				 "<td class='center'>" + list[i].bankCode + "</td>" +
				 "<td class='center'>" + list[i].depositNo + "</td>" +
				 "<td class='center'>" + convertInsertDate(list[i].insertDate) + "</td>" +
			"</tr>");
	}//end for
}

//page 번호 Rendering 함수
function renderingPage(pagination){
	//페이징 리스트 삭제
	$("#pg-list li").remove();
	
	//이전버튼 Rendering
	if(pagination.prev){
		$("#pg-list").append("<li onclick='paging(this)'> id='" + (pagination.endPage + 1) + "'" + 
									"<a><i class='icon-double-angle-left'></i>" +
									"</a>"+
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
		$("#pg-list").append("<li onclick='paging(this)'> id='" + (pagination.endPage + 1) + "'" +
										"<a><i class='icon-double-angle-right'></i></a>"+
									"</li>");
	}else{
		$("#pg-list").append("<li class='disabled'><a href='#'><i class='icon-double-angle-right'></i></a></li>");
	}
	
	$("#above-table-right>*").remove();
	$("#above-table-right").append("<p>" +pagination.totalCnt + "건</p>")
}

//---------------------------상환리스트 Dialog---------------------------//
function openRepayListDialog(){
	
	//rendering
	renderingRepayLists();
	
	$("#dialog46").dialog(new DialogBody("상환정보"));
}

function renderingRepayLists(repayLists){
	console.log("--------------------renderingRepayLists Called --------------------------");
	for(let i in repayLists){
		var repayList = repayLists[i];
		console.log("repayList : " + repayList);
		
		$("#dialog46").append(
				"<label id='repay-code'>" + repayList[0].code + "</label>" +
				"<table class='table  table-bordered table-hover'>" + 
					"<thead>"+
						"<tr>"+
							"<th class='center'>상환금액</th>" +
							"<th class='center'>이자금액</th>" +
							"<th class='center'>상환일</th>" +
						"</tr>" +
					"</thead>" +
		  			"<tbody>" +
	               "</tbody>"+
             "</table>");
		for(let j in repayList){
			$("#dialog46 tbody").append(
					 "<tr>" +
	                   "<td class='center'>" + repayList[j].payPrinc + "</td>" +
	                   "<td class='center'>" + repayList[j].intAmount + "</td>" +
	                   "<td class='center'>" + repayList[j].payDate + "</td>" +
                 	"</tr>");
		}//for end
		
		console.log("--------------------renderingRepayLists End --------------------------");
	}
}

//---------------------------삭제시 마감 Dialog---------------------------//
function openClosingDateListDialog(){
	//rendering
	renderClosingDateList();
	
	$("#dialog46").dialog(new DialogBody("차입금 상환내역 리스트"));
}

function renderClosingDateList(closedDateList){
	console.log("--------------------renderClosingDateList Called --------------------------");
	console.log("closedDateList : " + closedDateList);
	
	$("#dialog46").append("<label>코드정보</label>");
	
	for(let i in closedDateList)
		$("#dialog46").append("<label>" + closedDateList[i].code + "</label>");
		
		console.log("--------------------renderClosingDateList End --------------------------");
	}
//-----------------------------------조회 및 페이지 클릭 Event Method ---------------------------------//
function getList(){							//패이지 onload event에서 사용될 rendering 함수, 전체 list를 가져온다
	console.log("----------------getList() called----------------");
	getListAjax(1);		
}
function search() {
	console.log("----------------search() called----------------");
	var inputForm = $("#input-form")[0];
	var conditionVo = {"code": inputForm.code.value, "financialYear":inputForm.financialYear.value};
	$("#search-condition").val(JSON.stringify(conditionVo));
	getListAjax(1);
}

function paging(thisObj){
	console.log("----------------paging() called----------------");
	
	console.log("page : " + $(thisObj).attr("id"));
	getListAjax($(thisObj).attr("id"))
}

function getListAjax(page){
	var sendData;
	
	if($("#search-condition").val() == "")											//최초접근시
		$("#search-condition").val("{}");						//임의의 객체를 넣어준다	
	
	var conditionVo = JSON.parse($("#search-condition").val());
	
	conditionVo["page"] = page;								//page 속성 추가
	console.log("conditionVo : " + conditionVo);
	
	$.ajax({
		url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/getList",
		type : "POST",
		dataType : "JSON",
		data : conditionVo,
		success : function(response){
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
		},
		error : function(xhr, error){
			
		}
	});
	console.log("----------------Ajax Processing() End----------------");
}

//-----------------------------------삭제 Click 메서드 ---------------------------------//
function rowChecked(thisObj){
	console.log("-----------rowChecked Called----------------");
	
	var tr = $(thisObj).closest("tr");
	var voInput = $(tr).find("input[name=vo]");
	
	var vo = JSON.parse(voInput.val());
	
	if($("#deleteVoList").val() == "")									//최초 클릭인 경우
		$("#deleteVoList").val("[]");
	
	deleteVoList = JSON.parse($("#deleteVoList").val());
	
	if(!$(thisObj).is(":checked")){										//check 해제인 경우
		deleteVoList.splice(deleteVoList.indexOf(vo),1);								//값 제거
	}else{																//check를 한 경우
		deleteVoList.push(vo);													//값 입력
	}//else : check된 경우
	
	console.log("deleteVoList : " + deleteVoList);
	$("#deleteVoList").val(JSON.stringify(deleteVoList));					//해당 객체를 String으로 변환후 저장
	console.log("---------------------rowChecked() End -------------------------");
}
function deleteChecked(){
	$("#chkbox-select-all").prop("checked", false);
	console.log("------------------------------deleteChecked() called-------------------------");
	if( $("#deleteVoList").val() == "" || $("#deleteVoList").val() == "[]"){
		dialog("하나 이상의 차입금을 선택해주세요.");
		return;
	}					
	
	console.log("deleteVoList : " + deleteVoList);
	//각 배열을 넘겨준다.
	$.ajax({
		url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/deleteChecked",
		type : "POST",
		dataType : "json",
		contentType: "application/json",
		data : $("#deleteVoList").val(),
		success: function(response){
			console.log(isEmpty(response.data.repayLists));
			
			if(response.data.isClosed == true){
				dialog("차입일자가 마감일자전인 데이터는 수정할 수 없습니다.");
				return;
			}
			
			if(!isEmpty(response.data.isPossibleDelete == false)){					//상환내역이 있는경우 삭제가 안됨.
				dialog("상환내역이 있는 차입금은 삭제할 수 없습니다.");
				renderingRepayLists(response.data.repayLists);
				return;
			}
			
			console.log("repayLists : " + response.data.repayLists);
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			$("#deleteVoList").val("");	
			dialog("삭제가 완료되었습니다.");
		},
		error : function(xhr, error){
			
		}
	});
	
	console.log("------------------------------deleteChecked() end-------------------------");
}

//**---------------------------------------------숫자에 콤마 붙이기 -------------------------------------**//
//1. 콤마찍기
function comma(str) {
str = String(str);
return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//2. 콤마풀기
function unComma(str) {
str = String(str);
return str.replace(/[^\d]+/g, '');
}

function isEmpty(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true ;
		}else{ 
			return false ;
		}
};

//--------------------------------------Validation ------------------------------------//
 function dialog(txt, element) {
	        $("#dialog-txt").html(txt);
	    	var dialog = $("#dialog-confirm").dialog({
				resizable: false,
				modal: true,
				buttons: [
					{
						text: "OK",
						"class" : "btn btn-danger btn-mini",
						click: function() {
							$(this).dialog("close");
							if(element != null)
								element.focus();
						}
					}
				]
			});
}
	    
 function DialogBody(title){
		this.title = title;
		this.title_html = true;
	   	this.resizable = false;
	    this.height = 500;
	    this.width = 400;
	    this.modal = true;
	    this.close = function() {
	    	$("#dialog46>*").remove();
	    	$(this).dialog('close');
	    };
	    this.buttons = {
			    "닫기" : function() {
			    		$("#dialog46>*").remove();
			          	$(this).dialog('close');
			        }
			    };
	}	    
</script>
</body>
</html>