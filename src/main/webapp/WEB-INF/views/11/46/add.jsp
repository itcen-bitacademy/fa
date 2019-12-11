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
.above-table>*{grid-column: auto;}
.above-table-right>*{float: right; margin:0;}

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
.da-top{
	display: grid;
	grid-template-columns: repeat(2, 50%);
}
.bank-input-area input[type="text"]{width: 60%;}
.bank-input-area>button, .bank-input-area>input {margin: auto 0;}
.btn-bank-search{
	background-color: #6fb3e0;
    color: #FFF;
    PADDING: 4.5px 10px;
    border: none
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
				<h1 class="pull-left">단기차입금관리</h1>
			</div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="
" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
				<input type="hidden" name="no"/>
				<div class="input-area">
					<section>
						<div class="ia-left"><h4>단기차입금코드</h4></div>
						<div class="ia-right"><input type="text" id="code" name="code" placeholder="ex) P191128001 (P+년+월+일+번호)" required></div>
						<div class="ia-left"><h4>단기차입금명</h4></div>
						<div class="ia-right"><input type="text" id="name" name="name" required></div>
						<div class="ia-left"><h4>차입금액</h4></div>
						<div class="ia-right"><input type="text" id="debtAmount" name="debtAmount" required></div>
						<div class="ia-left"><h4>차입일자 ~ 만기일자</h4></div>
						<div class="ia-right">
							<input type="text" name="debtExpDate" id="debtExpDate" required>
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
							<input type="text" class="search-input-width-first" name="bankCode" placeholder="은행코드" required/>
							<input type="text" class="search-input-width-second" name="bankName" placeholder="은행명" required/>
							<a href="#" id="a-bankinfo-dialog" onclick="openDialog()">
								<span class="btn btn-small btn-info">
									<i class="icon-search nav-search-icon"></i>
								</span>
							</a>
						</div>
						
						<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
						<div id="dialog-message" title="은행코드" hidden="hidden">
							<section class="dialog-area">
								<section class="da-top">
									<div class="bank-input-area">
										<label>은행코드</label>
										<input type="text"  id="input-dialog-bankcode"/>
										<button type="button" id="btn-dialog-bankcode" class="btn-bank-search" onclick="searchByBankcode()">조회</button>
									</div>
									<div class="bank-input-area">
										<label>은행명</label>
										<input type="text"  id="input-dialog-bankname"/>
										<button type="button" id="btn-dialog-bankname" class="btn-bank-search" onclick="searchByBankname()">조회</button>
									</div>
								</section>
								
								<!-- 은행코드 및 은행명 데이터 리스트 -->
								<table id="modal-bank-table" class="table  table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">은행코드</th>
											<th class="center">은행명</th>
											<th class="center">지점명</th>
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
						<div class="ia-right"><input type="text" name="intRate" id="intRate" placeholder="(%)" required/></div>
						
						<div class="ia-left"><h4>담당자</h4></div>
						<div class="ia-right">
							<input type="text" class="mgr-input" name="mgr" id="mgr" required/>
							<h4 class="mgr-number-input-h4">담당자전화번호</h4>
							<input type="text" class="mgr-call-input" name="mgrCall" id="mgrCall" required/>
						</div>
						
						<div class="ia-left"><h4>계좌</h4></div>
						<div class="ia-right">
							<input type="text" class="search-input-width-first" name="depositNo" id="depositNo" required/>
							<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
							<input type="text" class="search-input-width-second" name="bankName" disabled="disabled"/>
						</div>
						<!-- 계좌정보 Modal pop-up : start -->
						<div id="dialog-account-message" title="계좌" hidden="hidden">
							<section>
								<table id="dialog-account-message-table">
									<tr>
										<td>
											<label>계좌번호</label>
											<input type="text" id="input-dialog-depositNo" style="width: 100px;" />
											<a href="#" id="a-dialog-depositNo">
											<span class="btn btn-small btn-info" style="margin-bottom: 10px;">조회</span>
											</a>
										</td>
									</tr>
								</table>
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
							<button type="submit" class="btn btn-primary btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">입력</button>
							<button type="submit" class="btn btn-warning btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
							<button type="button" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
							<button type="button" class="btn btn-info btn-small mybtn" onclick="search()">조회</button>
							<button id="dialog-repayment-button" type="button" class="btn" onclick="openRepayDialog()">상환</button>
							<button type="reset" class="btn btn-success btn-small mybtn">초기화</button>
						</div>
					</section>
					<section class="above-table-right" id="above-table-right">
						<h5>총  ${pagination.totalCnt }건</h5>
					</section>
				</section>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
			
			<!-- 상환  Modal pop-up : start -->
					<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
						<form id="repay-form">
							<table id ="dialog-repayment-table" align="center">
								<tr>
									<td>
										<label>차입금코드</label>
										<input type="text" name="code" readonly= "readonly"/>
									</td>
								</tr>
								<tr>
									<td>
										<label>납입금</label>
										<input type="text" name="payPrinc" id= "repay_bal"/>
									</td>
								</tr>
								<tr>
									<td>
										<label>납입일자</label>
										<div class="row-fluid input-prepend">
						                 <input class="date-picker" type="text" name="payDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd" />
						                    <span class="add-on">
						                     <i class="icon-calendar"></i>
						              	</span>
						                </div>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
					
			<!-- list -->
				<table  class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="chkbox-select-all"/>
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">단기차입금코드</th>
							<th class="center">단기차입금명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
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
						<c:forEach items="${list }" var="vo" varStatus="status">
								<tr onclick="selectRow(this)" id="${vo.no }">
									<form id="form${vo.no}">
										<td class="center"><label class="pos-rel"> 
											<input type="checkbox" name="no" value="${vo.no }" class="ace" /> 
											<span class="lbl"></span>
											</label>
										</td>
										<td class="center"><input type="hidden" name="code" value="${vo.code }">${vo.code }</td>
										<td class="center"><input type="hidden" name="name" value="${vo.name }">${vo.name }</td>
										<td class="center"><input type="hidden" name="majorCode" value="${vo.majorCode }">${vo.majorCode }</td>
										<td class="center"><input type="hidden" name="debtAmount" value="${vo.debtAmount }">${vo.debtAmount }</td>
										<td class="center"><input type="hidden" name="repayWay" value="${vo.repayWay }">${vo.repayWay }</td>
										<td class="center"><input type="hidden" name="debtDate" value="${vo.debtDate }">${vo.debtDate }</td> 
										<td class="center"><input type="hidden" name="expDate" value="${vo.expDate }">${vo.expDate }</td>
										<td class="center"><input type="hidden" name="intRate" value="${vo.intRate }">${vo.intRate }</td>
										<td class="center"><input type="hidden" name="intPayWay" value="${vo.intPayWay }">${vo.intPayWay }</td>
										<td class="center"><input type="hidden" name="mgr" value="${vo.mgr }">${vo.mgr }</td>
										<td class="center"><input type="hidden" name="mgrCall" value="${vo.mgrCall }">${vo.mgrCall }</td>
										<td class="center"><input type="hidden" name="bankCode" value="${vo.bankCode }">${vo.bankCode }</td>
										<td class="center"><input type="hidden" name="depositNo" value="${vo.depositNo }">${vo.depositNo }</td>
									</form>
								</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<section class="pagination" id="pagination">
					<ul id="pg-list" class="pg-list">
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li>
									<a onclick='paging(this)' id="${pagination.startPage - 1 }">
										<i class="icon-double-angle-left"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pg">
							<c:choose>
								<c:when test="${pg eq pagination.page }">
									<li class="active" onclick='pageClicked(this)' id="${pg }"><a>${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li onclick='paging(this)' id="${pg }"><a>${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pagination.next }">
								<li>
									<a onclick="paging(this)" id="${pagination.endPage + 1 }">
										<i class="icon-double-angle-right"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</section>
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
	
	//--------------------------------------------------------------------------------------------------------------------------//
	//Checkbox All Check
	$("#chkbox-select-all").click(function(){
		$('input[type=checkbox]').prop('checked', this.checked);	//All Checkbox 버튼의 check여부에 따라 바뀐다.
	});
	
	//--------------------------------------------------------------------------------------------------------------------------//
	//은행, 계좌 Dialog
	$("#dialog-message").dialog({
		autoOpen : false
	});
	
	$("#dialog-repayment").dialog({
		autoOpen : false
	});
});

</script>
<script>
//-----------------------------------은행 Model 메서드 ---------------------------------//
//Dialog Open하는 함수
function openDialog(){
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
	// ajax 통신
	$.ajax({
		url: "${pageContext.request.contextPath }/api/selectone/getbankcode?bankcodeVal=" + bankcodeVal,
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
			$("#tbody-bankList").append("<tr onclick='selectBankRow(this)'>" +
									        "<td class='center'>" + response.code + "</td>" +
									        "<td class='center'>" + response.name + "</td>" +
									        "<td class='center'>" + response.store + "</td>" +
			       						 "</tr>");
		},
		error: function(xhr, error){
			console.error("error : " + error);
		}
	});
}

//은행명 검색 : 은행목록 리스트로 가져오기
function searchByBankname(){
	console.log("searchByBankname called");
	$("#tbody-bankList").find("tr").remove();
	
	var banknameVal = $("#input-dialog-bankname").val();
	// ajax 통신
	$.ajax({
		url: "${pageContext.request.contextPath }/api/selectone/getbankname?banknameVal=" + banknameVal,
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
			$("#input-dialog-bankname").val('');
			
			for(var i=0; i < data.length; ++i){
				 $("#tbody-bankList").append("<tr onclick='selectBankRow(this)'>" +
						                		"<td class='center'>" + data[i].code + "</td>" +
										        "<td class='center'>" + data[i].name + "</td>" +
										        "<td class='center'>" + data[i].store + "</td>" +
										    "</tr>");
			}
		},
		error: function(xhr, error){
			console.error("error : " + error);
		}
	});
}

//은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 input form에 추가
function selectBankRow(thisObj){
	var tr = $(thisObj);
	var td = tr.children();
	$("input[name=bankCode]").val(td.eq(0).text());
	$("input[name=bankName]").val(td.eq(1).text());
	$("#dialog-message").dialog('close');
}

//-----------------------------------상환 Model 메서드 ---------------------------------//
function openRepayDialog(){
	var repayForm = $("#repay-form")[0];
	var inputForm = $("#input-form")[0];
	repayForm.code.value = inputForm.code.value;
	$("#dialog-repayment").dialog('open');
	$("#dialog-repayment").dialog({
		title: "상환정보등록",
		title_html: true,
	   	resizable: false,
	    height: 500,
	    width: 400,
	    modal: true,
	    close: function() {
	    	repayForm.code.value = '';
	    	repayForm.repayBal.value = '';
	    	repayForm.payDate.value = '';
	    },
	    buttons: {
	    	//상환버튼 클릭시
	    "상환": function(){
	    	event.preventDefault();
			var vo = {
					"debtNo":inputForm.no.value,					//차입금 테이블 번호
					"payPrinc":repayForm.payPrinc.value,			//상환액
					"payDate":repayForm.payDate.value,				//상환일
					"depositNo":inputForm.depositNo.value	//계좌번호
			}
			
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/11/48/repay",
				contentType : "application/json; charset=utf-8",
				type: "post",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data:JSON.stringify(vo),
				success: function(response){
					console.log(response);
					if(response.result =="fail"){
						console.error(response.message);
						return;
					}
					if(response.data==null){
						alert("값을 정확히 입력하지 않았습니다.");
						return;
					}
					$("#tbody-list tr").each(function(i){
						var td = $(this).children();
						var n = td.eq(0).attr('lterm-no');
						if(n == response.data.no){
							td.eq(5).html(response.data.repayBal);
						}
					});
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
			$(this).dialog('close');
			//상환내역 반영
			
			
	    },
	    "닫기" : function() {
	          	$(this).dialog('close');
	        }
	    }
	});
}//openRepayDailog() end

//-----------------------------------Row Click input 영역 채워지도록 ---------------------------------//
function selectRow(thisTr){
	var dataForm = $("#form" + $(thisTr).attr('id'))[0];
	var inputForm = $("#input-form")[0];
	
	inputForm.no.value = dataForm.no.value;
	inputForm.code.value = dataForm.code.value;
	inputForm.name.value = dataForm.name.value;
	inputForm.debtAmount.value = dataForm.debtAmount.value;
	inputForm.debtExpDate.value = dataForm.debtDate.value + " - " + dataForm.expDate.value;	//없는걸 찾으면 error가 발생함. 밑에줄도 실행이안됨.
	$(inputForm).find("input[name='intPayWay']").each(function(i, e){
		if($(this).val() == dataForm.intPayWay.value){
			$(this).attr("checked", true);
		}
	});	
	inputForm.bankCode.value = dataForm.bankCode.value;		//bank name도 채워야함
	
	var options = inputForm.majorCode.options;					//SelectBox Options
	for(var i=0 ; i < options.length; ++i){
		if(options[i].value == dataForm.majorCode.value){
			options[i].selected = "selected";
			$("#majorCode_chosen").find("span")[0].innerHTML = options[i].innerHTML;
		}
	}
	
	$(inputForm).find("input[name='repayWay']").each(function(i, e){
		if($(this).val() == dataForm.repayWay.value){
			$(this).attr("checked", true);
		}
			
	});		
	inputForm.intRate.value = dataForm.intRate.value;
	inputForm.mgr.value = dataForm.mgr.value;
	inputForm.mgrCall.value = dataForm.mgrCall.value;
	inputForm.depositNo.value = dataForm.depositNo.value;		//bank name도 채워야함
	//$("#bankName").val(dataForm.elements[].value);
}

//-----------------------------------리스트 및 페이지 Rendering ---------------------------------//
//리스트를 받아서 Rendering 하는 함수
function renderingList(list){
	$("#tbody-list > *").remove();
	
	for(var i=0; i < list.length; ++i){
		$("#tbody-list").append("<tr>" +
				 "<td class='center'>" +
				 	"<label class='pos-rel'>" +
				 		"<input type='checkbox' name='" + list[i].no + "' value='" + list[i].no + "' class='ace' />" +"<span class='lbl'></span>" +
					 "</label>" +
				 "</td>" +
				 "<td class='center'>" + list[i].code + "</td>" +
				 "<td class='center'>" + list[i].name + "</td>" +
				 "<td class='center'>" + list[i].majorCode + "</td>" +
				 "<td class='center'>" + list[i].debtAmount + "</td>" +
				 "<td class='center'>" + list[i].repayWay + "</td>" +
				 "<td class='center'>" + list[i].debtDate + "</td>" + 
				 "<td class='center'>" + list[i].expDate + "</td>" +
				 "<td class='center'>" + list[i].intRate + "</td>" +
				 "<td class='center'>" + list[i].intPayWay + "</td>" +
				 "<td class='center'>" + list[i].mgr + "</td>" +
				 "<td class='center'>" + list[i].mgrCall + "</td>" +
				 "<td class='center'>" + list[i].bankCode + "</td>" +
				 "<td class='center'>" + list[i].depositNo + "</td>");
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
	$("#above-table-right").append("<h5>총  " + pagination.totalCnt +"건</h5>")
}

//-----------------------------------조회 및 페이지 클릭 Event Method ---------------------------------//
function search() {
	console.log("search");
	ajaxProcessing("search", null);
}

function paging(thisObj){
	console.log("paging");
	console.log("thisObj" + $(thisObj));
	ajaxProcessing("paging", thisObj)
}

function ajaxProcessing(urlStr, thisObj){
	var sendData = $("#input-form").serialize();
	console.log($(thisObj).attr('id'));
	if(thisObj != null){
		var page = $(thisObj).attr('id');
		console.log("page : " + page);
		sendData += "&page=" + page;
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
}

//-----------------------------------삭제 Click 메서드 ---------------------------------//
function deleteChecked(){
	var sendData = [];
	
	//넘어갈 no 배열을 생성한다.
	var checkedList = $("#tbody-list input[type=checkbox]:checked");
	checkedList.each(function(i, e){
		sendData.push($(this).val());
	});
	
	//no 배열을 넘겨준다.
	$.ajax({
		url : $("#context-path").val()  + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/deleteChecked",
		type : "POST",
		dataType : "json",
		data : {"sendData" : sendData},
		success: function(response){
			renderingList(response.data.list);
			renderingPage(response.data.pagination);
		},
		error : function(xhr, error){
		}
	})
}

</script>
</body>
</html>