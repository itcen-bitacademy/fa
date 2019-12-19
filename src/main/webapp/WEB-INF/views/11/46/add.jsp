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
	grid-template-columns: 30% auto;
	margin: auto 0;
}

input::-webkit-outer-spin-button,			/* input type=number 화살표 제거*/
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.input-num{text-align:right;}
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
				<input id="searchData" type="hidden">
				<input id="checkedData" type="hidden">
				<form class="form-horizontal" id="input-form" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
					<input type="hidden" name="vo"/>
					<input type="hidden" name="no"/>
				<div class="input-area">
					<section>
						<div class="ia-left"><h4>단기차입금코드</h4></div>
						<div class="ia-right">
							<input type="text" id="code" name="code" placeholder="ex) P191128001 (P+년+월+일+번호)" onkeydown="codeChanged()" required>
							<button type="button" id='btn-chk-duplication' class="btn btn-primary btn-small" onclick="checkDuplication()">중복확인</button>
							<img id="img-checkcode" style="width: 20px; display:none" src="/fa/assets/images/check.png">
							<input type="hidden" name="isDuplicated" value="Y">
						</div>
						<div class="ia-left"><h4>단기차입금명</h4></div>
						<div class="ia-right"><input type="text" name="name" placeholder="육하원칙으로 입력해주세요." required></div>
						<div class="ia-left"><h4>차입금액</h4></div>
						<div class="ia-right">
							<input type="text" id="debt-amount-comma" name="debtAmountComma" class="input-num">
							<input type="hidden" name="debtAmount" required>
							<h5 style="display: inline-block;">(원)</h5>
						</div>
						<div class="ia-left"><h4>차입일자 ~ 만기일자</h4></div>
						<div class="ia-right">
							<input type="text" name="debtExpDate" readonly="readonly" required>
							<span class="add-on"><i class="icon-calendar"></i></span>
						</div>
						<div class="ia-left"><h4>이자지급방식</h4></div>
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
						<div class="ia-left"><h4>은행코드</h4></div>
						<div class="ia-right">
							<input type="text" class="search-input-width-first" name="bankCode" placeholder="은행코드" readonly="readonly" required/>
							<input type="text" class="search-input-width-second" name="bankName" placeholder="은행명" readonly="readonly"/>
							<a href="#" id="a-bankinfo-dialog" onclick="openBankDialog()">
								<span class="btn btn-small btn-info">
									<i class="icon-search nav-search-icon"></i>
								</span>
							</a>
						</div>
						
						<!-- 은행조회 Modal pop-up : start -->
						<div id="dialog-message" title="은행코드" hidden="hidden">
							<section class="dialog-area">
								<section class="bda-top">
									<div class="modal-input-area">
										<label>은행코드</label>
										<input type="text"  id="input-dialog-bankcode"/>
										<button type="button" id="btn-dialog-bankcode" class="btn-search" onclick="searchByBankcode()">조회</button>
									</div>
									<div class="modal-input-area">
										<label>은행명</label>
										<input type="text"  id="input-dialog-bankname"/>
										<button type="button" id="btn-dialog-bankname" class="btn-search" onclick="searchByBankname()">조회</button>
									</div>
								</section>
								
								<!-- 은행코드 및 은행명 데이터 리스트 -->
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
							</section>
						</div>
					<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
						
					</section>
					<section>
						<div class="ia-left"><h4>회계연도</h4></div>
						<div class="ia-right"><input type="number" min="1900" max="2099" step="1" value="2019" id="form-field-1" name="financialYear" placeholder="회계연도"></div>
						
						<div class="ia-left"><h4>차입금대분류</h4></div>
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
						
						<div class="ia-left"><h4>상환방법</h4></div>
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
						
						<div class="ia-left"><h4>이율</h4></div>
						<div class="ia-right"><input type="number" id="int-rate" name="intRate" id="intRate" placeholder="(%) 100미만, 소수점 2자리 이하" class="input-num" required/><h5 style="display:inline">%</h5></div>
						
						<div class="ia-left"><h4>담당자</h4></div>
						<div class="ia-right">
							<input type="text" class="mgr-input" name="mgr" id="mgr" required/>
							<h4 class="mgr-number-input-h4">담당자전화번호</h4>
							<input type="text" class="mgr-call-input" name="mgrCall" id="mgrCall" required/>
						</div>
						
						<div class="ia-left"><h4>계좌</h4></div>
						<div class="ia-right">
							<input type="text" class="search-input-width-first" name="depositNo" id="depositNo" placeholder="계좌번호" readonly="readonly" required/>
							<span class="btn btn-small btn-info" onclick="openAccountDialog()"><i class="icon-search nav-search-icon"></i></span>
							<input type="text" class="search-input-width-second" name="depositHost" disabled="disabled" placeholder="예금주"/>
						</div>
						<!-- 계좌정보 Modal pop-up : start -->
						<div id="dialog-account-message" title="계좌" hidden="hidden">
							<section class="dialog-area">
								<section class="modal-input-area">
									<label>계좌번호</label>
									<input type="text" id="input-dialog-depositNo" />
									<button type="button" class="btn-search" onclick="searchAccountByNo()">조회</button>
								</section>
								
								<!-- 계좌정보 데이터 리스트 -->
								<table id="modal-deposit-table" class="table  table-bordered table-hover">
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
							</section>
						</div>
						<!-- 계좌정보 Modal pop-up : end -->
					</section>
				</div>	<!--  input area -->
				<hr>
				<section class="above-table">
					<section class="above-table-left">
						<div class="btn-list">
							<button type="button" class="btn btn-primary btn-small mybtn" onclick="insert()">입력</button>
							<button type="button" class="btn btn-warning btn-small mybtn" onclick="update()">수정</button>
							<button type="button" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
							<button type="button" class="btn btn-info btn-small mybtn" onclick="search()">조회</button>
							<button type="button" class="btn btn-small mybtn" onclick="openRepayDialog()">상환</button>
							<button type="reset" class="btn btn-success btn-small mybtn">초기화</button>
						</div>
					</section>
				</section>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
			
			<!-- 상환  Modal pop-up : start -->
					<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
						<form id="repay-form">
							<input type="hidden" name="debtNo">
							<input type="hidden" name="code">
							<section class="repay-input-wrapper">
								<label>차입금코드</label>
								<input type="text" name="debtCode" readonly= "readonly"/>
							</section>
							<section class="repay-input-wrapper">
								<label>납입금</label>
								<input type="text" name="payPrinc" id= "repay_bal"/>
							</section>
							<section class="repay-input-wrapper">
								<label>이자금액</label>
								<input type="text" name="intAmount" readonly= "readonly"/>
							</section>
							<section class="repay-input-wrapper">
								<label>납입일자</label>
								<section>
									<input class="date-picker" type="text" name="payDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd"/>
									<span class="add-on">
			                  	    <i class="icon-calendar"></i>
								</section>
							</section>
							<section class="repay-input-wrapper">
								<label>계좌번호</label>
								<input type="text" name="depositNo" readonly= "readonly"/>
							</section>
						</form>
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
			
			<!-- 상환 내역 리스트 -->
			<div id="dialog-repayment-delete" title="상환정보여부" hidden="hidden">
				<!-- 계좌정보 데이터 리스트 -->
						

			</div>
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
	//은행, 계좌 Dialog
	$("#dialog-message").dialog({
		autoOpen : false
	});
	
	$("#dialog-account-message").dialog({
		autoOpen : false
	});
	
	$("#dialog-repayment").dialog({
		autoOpen : false
	});
	
	$("#dialog-repayment-delete").dialog({			//삭제시 상환내역
	       autoOpen : false
	    });
	
});

//Page ready시 table & paging list Rendering
$(document).ready(function(){
	getList();
});



$("#debt-amount-comma").on("focus", function() {
    var x = $(this).val();
    x = unComma(x);
    $(this).val(x);
}).on("focusout", function() {
    var x = $(this).val();
    
    var inputForm = $("#input-form")[0];
    inputForm.debtAmount.value = x;							//콤마를 안 붙힌 숫자의 값을 저장한다.
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
    inputForm.debtAmount.value = $(this).val();
});

$("#int-rate").on("keyup",function(){
	var pattern = /^(\d{1,2}([.]\d{0,2})?)?$/;
    var value = $(this).val();
    if (!pattern.test(value)) {
        alert("100 이하의 숫자만 입력가능하며,\n소수점 둘째자리까지만 허용됩니다.");
        $(this).val(value.substring(0,value.length - 1));
        $(this).focus();
    }
})
</script>
<script>
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
	
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/checkDuplication?code=" + code,
		contentType : "application/json; charset=utf-8",
		type: "get",
		dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
		data: "",
		success: function(response){
			if(response.data == true){				//중복인경우
				alert("중복입니다");
			} else{
				alert("사용해도 되는 Code 입니다");
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
	var vo = JSON.parse(inputForm.vo.value);
	
	console.log("isDuplicated : " + inputForm.isDuplicated.value);
	if(inputForm.isDuplicated.value == "Y"){
		alert("중복확인을 해주세요");
		return;
	}
	
	console.log("isNotClosedDate : " + isNotClosedDate(vo.debtDate));
	if(!isNotClosedDate(vo.debtDate)){				//마감이되었으면
		alert("차입일자가 마감일 이전인 데이터는 입력할 수 없습니다.");
		return;
	}
	
	inputForm.action = $("#context-path").val()  + "/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/insert";
	inputForm.submit();
	
	
	console.log("---------------------insert() end ---------------------------------");
}

function update(){
	var inputForm = $("#input-form")[0];
	var sendData = $("#input-form").serialize();
	var vo = JSON.parse(inputForm.vo.value);
	
	if(!isNotClosedDate(vo.debtDate)){				//마감이되었으면
		alert("차입일자가 마감일 이전인 데이터는 수정할 수 없습니다.");
		return;
	}
	
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/update",
		type:"POST",
		dataType: "json",
		data: sendData,
		success: function(response){
			if(response.data == true){			//상환내역이 존재하는경우
				alert("상환내역이 존재하는 차입금은 수정할 수 없습니다");
				return;
			}
			
			alert("수정이 완료 되었습니다.");
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
		},
		error: function(xhr, error){
			
		}
	});
}
//-----------------------------------은행 Model 메서드 ---------------------------------//
function openRepayListDialog(){
	$("#dialog-repayment-delete").dialog('open');
	$("#dialog-repayment-delete").dialog({
     	
        title: "상환정보",
        title_html: true,
           	resizable: false,
	           height: 500,
	           width: 400,
	           modal: true,
	           close: function() {
            $('#dialog-repayment-delete *').remove();
         },
         buttons: {
         "닫기" : function() {
                  $(this).dialog('close');
                  $('#dialog-repayment-delete *').remove();
             }
         }
     });
}
//Dialog Open하는 함수
function openBankDialog(){
	$("#dialog-message").dialog('open');
	$("#dialog-message").dialog({
		title: "은행정보",
		title_html: true,
	   	resizable: false,
	    height: 500,
	    width: 400,
	    modal: true,
	    close: function() {
	    	$('#tbody-bankList tr').remove();
	    },
	    buttons: {
	    "닫기" : function() {
	          	$(this).dialog('close');
	          	$('#tbody-bankList tr').remove();
	        }
	    }
	});
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
             alert("page not found");
           }
       },
       success: function(response){
          $("#input-dialog-bankcode").val('');
           $.each(response.data,function(index, item){
                    $("#tbody-bankList").append("<tr>" +
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
             alert("page not found");
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
	var inputForm = $("#input-form")[0];
	var inputVo = $(thisObj).find("input[name=vo]");
	console.log("inputVo" + inputVo);
	var vo = JSON.parse(inputVo.val());
	console.log("vo " + vo);
	inputForm.bankCode.value = vo.no;
	inputForm.bankName.value = vo.name;
	$("#dialog-message").dialog('close');
}

//-----------------------------------상환 Model 메서드 ---------------------------------//
function repay(repayForm, repayBal){									//상환버튼 클릭시
	repayBal = parseInt(repayBal);							//int로 변환
	var payPrinc = parseInt(repayForm.payPrinc.value);		//int로 변환
	if(payPrinc > repayBal){
		alert("납입원금이 잔액보다 클 수 없습니다");
		return;
	}
	
	var sendData = $(repayForm).serialize();
	console.log("sendData : " + sendData);
	// ajax 통신
	$.ajax({
		url: $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/repay",
		type: "POST",
		dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
		data: sendData,
		success: function(response){
			
			if(response.result =="fail"){
				console.error(response.message);
				return;
			}
			
			if(payPrinc == repayBal){//상환완료인경우
				alert("상환이 완료되었습니다");
				console.log("상환이 완료되었습니다.")
			}			
			
			alert("상환이 되었습니다.")
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			
		},
		error: function(xhr, error){
			console.error("error : " + error);
		}
	});
}

function openRepayDialog(){
	console.log("---------------------------openRepayDialog() called--------------------------");
	var repayForm = $("#repay-form")[0];			//상환폼
	var inputForm = $("#input-form")[0];			//선택된 차입금 form
	var vo = JSON.parse(inputForm.vo.value);
	//초깃값 지정
	repayForm.debtNo.value = vo.no;
	repayForm.code.value = vo.code;
	repayForm.debtCode.value = vo.code;
	repayForm.intAmount.value = (vo.repayBal * vo.intRate / 100);	
	repayForm.depositNo.value = vo.depositNo;
	
	$("#dialog-repayment").dialog('open');
	$("#dialog-repayment").dialog({
		title: "상환정보등록",
		title_html: true,
	   	resizable: false,
	    height: 500,
	    width: 400,
	    modal: true,
	    close: function() {
	    	repayForm.debtCode.value = '';
	    	repayForm.payPrinc.value = '';
	    	repayForm.intAmount.value= '';
	    	repayForm.payDate.value = '';
	    	repayForm.depositNo.value= '';
	    },
	    buttons: {
	    	//상환버튼 클릭시
	    "상환": function(){
			repay(repayForm, vo.repayBal);		//상환Form, 상환잔액 반환
			$(this).dialog('close');
			//상환내역 반영
	    },
	    "닫기" : function() {
	          	$(this).dialog('close');
	        }
	    }
	});
}//openRepayDailog() end


function openAccountDialog(){
	//var accountForm = $("#account-form")[0];
	console.log("openAccountDialog() called");
	
	$("#dialog-account-message").dialog('open');
	$("#dialog-account-message").dialog({
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
              alert("page not found");
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
	 $("#dialog-account-message").dialog('close');
 }


//-----------------------------------Row Click input 영역 채워지도록 ---------------------------------//
function selectRow(thisObj){
	console.log("selectRow() call");
	var inputVo = $(thisObj).find("input[name=vo]");	//해당vo에 대한 JSON객체 String 값을 가진 input을 반환
	
	var vo = JSON.parse(inputVo.val());					//JSON string형식을 JSON형식으로 변환, 객체 생성
	var inputForm = $("#input-form")[0];
	
	inputForm.vo.value = inputVo.val();
	inputForm.no.value = vo.no;
	inputForm.code.value = vo.code;
	inputForm.name.value = vo.name;
	inputForm.debtAmount.value = vo.debtAmount;
	inputForm.debtAmountComma.value = comma(vo.debtAmount);
	inputForm.debtExpDate.value = vo.debtDate + " - " + vo.expDate;	//없는걸 찾으면 error가 발생함. 밑에줄도 실행이안됨.
	$(inputForm).find("input[name='intPayWay']").each(function(i, e){
		if($(this).val() == vo.intPayWay){
			$(this).attr("checked", true);
		}
	});	
	inputForm.bankCode.value = vo.bankCode;		
	inputForm.bankName.value = vo.bankName;		//조인한 값
	
	var options = inputForm.majorCode.options;					//SelectBox Options
	for(var i=0 ; i < options.length; ++i){
		if(options[i].value == vo.majorCode){
			options[i].selected = "selected";
			$("#majorCode_chosen").find("span")[0].innerHTML = options[i].innerHTML;
		}
	}
	
	$(inputForm).find("input[name='repayWay']").each(function(i, e){
		if($(this).val() == vo.repayWay){
			$(this).attr("checked", true);
		}
			
	});		
	inputForm.intRate.value = vo.intRate;
	inputForm.mgr.value = vo.mgr;
	inputForm.mgrCall.value = vo.mgrCall;
	inputForm.depositNo.value = vo.depositNo;		
	inputForm.depositHost.value = vo.depositHost;		//조인한 값
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
			"</tr>");
	}
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

function renderingRepayLists(repayLists){
	console.log("--------------------renderingRepayLists Called --------------------------");
	for(let i in repayLists){
		var repayList = repayLists[i];
		console.log("repayList : " + repayList);
		
		$("#dialog-repayment-delete").append(
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
			$("#dialog-repayment-delete tbody").append(
					 "<tr>" +
	                   "<td class='center'>" + repayList[j].payPrinc + "</td>" +
	                   "<td class='center'>" + repayList[j].intAmount + "</td>" +
	                   "<td class='center'>" + repayList[j].payDate + "</td>" +
                 	"</tr>");
		}//for end
		
		openRepayListDialog();
		console.log("--------------------renderingRepayLists End --------------------------");
	}
}

function renderingClosedDateList(closedDateList){
	console.log("--------------------renderingClosedDateList Called --------------------------");
	console.log("closedDateList : " + closedDateList);
	
	$("#dialog-repayment-delete").append("<label>코드정보</label>");
	
	for(let i in closedDateList)
		$("#dialog-repayment-delete").append("<label>" + closedDateList[i].code + "</label>");
		
		openRepayListDialog();
		console.log("--------------------renderingClosedDateList End --------------------------");
	}
//-----------------------------------조회 및 페이지 클릭 Event Method ---------------------------------//
function getList(){							//패이지 onload event에서 사용될 rendering 함수, 전체 list를 가져온다
	console.log("----------------getList() called----------------");
	ajaxProcessing("getList", null);		
}
function search() {
	console.log("----------------search() called----------------");
	ajaxProcessing("search", null);
}

function paging(thisObj){
	console.log("----------------paging() called----------------");
	ajaxProcessing("paging", thisObj)
}

function ajaxProcessing(urlStr, thisObj){
	var sendData;
	
	if($("#searchData").val() == "")											//최초접근시
		$("#searchData").val(JSON.stringify({"none":0}));						//임의의 객체를 넣어준다	
	
	if(urlStr == "getList")								//조회조건이 없는 search로 분기, 전체 list를 가져온다.
		urlStr = "search";
		
	else if(urlStr == "search"){
		$("#searchData").val($("#input-form")[0].vo.value);					//조회조건 저장
		var vo = JSON.parse($("#searchData").val());
	}
	
	else if(urlStr == "paging"){
		sendData = JSON.parse($("#searchData").val());
		var page = $(thisObj).attr('id');					//page 값 
		sendData["page"] = page;								//page 속성 추가
		console.log(sendData);
	}
	
	$.ajax({
		url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/" + urlStr,
		type : "POST",
		dataType : "JSON",
		data : sendData,
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
	var voList = [];
	var checkedData;										//JSON 객체 변수
	var noList = [];
	var voucherNoList = [];
	
	console.log("no : " + vo.no);
	console.log("voucherNo : " + vo.voucherNo);
	
	if($("#checkedData").val() == "")									//최초 클릭인 경우
		checkedData = {"voList" : voList};
	
	else
		checkedData = JSON.parse($("#checkedData").val());
	
	if(!$(thisObj).is(":checked")){										//check 해제인 경우
		voList = checkedData.voList;
		
		voList.splice(voList.indexOf(vo),1);								//값 제거
	}		
		
	else{																//check를 한 경우
		voList = checkedData.voList;										//List 추출
		
		voList.push(vo);													//값 입력
	}//else : check된 경우
	
	$("#checkedData").val(JSON.stringify(checkedData));					//해당 객체를 String으로 변환후 저장
	console.log($("#checkedData").val());
	console.log("---------------------rowChecked() End -------------------------");
}
function deleteChecked(){
	$("#chkbox-select-all").prop("checked", false);
	console.log("------------------------------deleteChecked() called-------------------------");
	if( $("#checkedData").val() == "")					//체크된게 없는경우
		return;
	
	var checkedData = JSON.parse($("#checkedData").val());			//JSON 객체
	var voList = checkedData.voList;
	console.log("voList 길이: " + voList.length);
	var noList = [];
	var voucherNoList = [];
	
	for(var i=0; i < voList.length; ++i){
		noList.push(voList[i].no);
		voucherNoList.push(voList[i].voucherNo);
		
		if(!isNotClosedDate(voList[i].debtDate)){				//마감이되었으면
			alert("차입일자가 마감일 이전인 데이터는 입력할 수 없습니다.");
			renderingClosedDateList(voList[i]);
			return;
		}
	}
	
	/* if(noList == null){
		console.log("NoList null");
		return; */
		
	console.log("noList : " +  noList + " voucherNoList : " + voucherNoList);
	//각 배열을 넘겨준다.
	$.ajax({
		url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/deleteChecked",
		type : "POST",
		dataType : "json",
		data : {"noList" : noList, "voucherNoList" : voucherNoList},
		success: function(response){
			console.log(isEmpty(response.data.repayLists));
			if(!isEmpty(response.data.repayLists)){					//상환내역이 있는경우 삭제가 안됨.
				alert("상환내역이 있는 차입금은 삭제할 수 없습니다.");
				renderingRepayLists(response.data.repayLists);
				return;
			}
			
			console.log("repayLists : " + response.data.repayLists);
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
			$("#checkedData").val("");	
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

//---------------------------------------입력, 수정 마강확인------------------------------------------------//
function isNotClosedDate(debtDate){
	console.log("---------------------isNotClosedDate() called-------------------");
	$.ajax({
		url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/isNotClosedDate",
		type : "POST",
		dataType : "json",
		data : {"debtDate" : debtDate},
		success: function(response){
			return response.data;
		},
		error : function(xhr, error){
			
		}
	});
	console.log("---------------------isNotClosedDate() End-------------------");
}

</script>
</body>
</html>