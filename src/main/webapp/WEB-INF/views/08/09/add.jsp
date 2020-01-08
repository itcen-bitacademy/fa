<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/jquery-ui-1.10.3.full.min.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode }"/>
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }"/>
<input type="hidden" value="${closingDate }" name="closingDate" id="closingDate">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
			<div class="page-header position-relative">
				<h1 class="pull-left">토지관리</h1>
			</div><!-- /.page-header -->
			<!-- PAGE CONTENT BEGINS -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid"><!-- 차변 대변 나누기 위한 row-fluid -->
						<form class="form-horizontal" id="insert-land-form" data-checkpurchaseno="no" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert" method="post" name="sendform" >
							<div class="span6"><!-- 차변 -->
								
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-select-1">토지 코드</label>
									<div class="controls">
										<input type="text" id="land_code" name="id" style="margin:0 5px 0 0" placeholder="9자를 입력하세요" maxlength="9"/>
										<input id="overlapBtn" style="height:28px" type="button" value="중복확인">
										<i id="check-icon" class="icon-ok bigger-180 blue" style="display:none;"></i>
										<input readonly type="text" class="span6" id="default-landcode" style="border:none;" placeholder="ex)2019년12월03일 191203001">
										<!--<input readonly type="text" class="span6" id="neverchange" style="border:none;color:#0067a3"  placeholder="토지코드는 변경할수 없습니다.">
										<input type="text" class="span6" id="onlynumber" style="border:none;color:red"  value="토지코드는 숫자만 입력하세요.">
										<input type="text" class="span6" id="null-landcode" style="border:none;color:red"  value="품목코드는 필수 입력 사항입니다!"> -->
									</div>									
								</div>
								
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-select-1">대분류 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-section" name="classification" data-placeholder="선택">
											<c:forEach items="${sectionList }" var="sectionVo">
												<option></option>
												<option landcode="${sectionVo.code }" value="${sectionVo.classification }">${sectionVo.classification }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="code" name="sectionNo" placeholder="대분류명을 선택하면 코드값이 입력됩니다.">
									</div>
								</div>
								
								 <div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">주소(광역)</label>
									<div class="controls">
										<input class="span2" onclick="execDaumPostcode()" class="btn-primary box" type="button" value="주소 찾기">
										<input class="span4" readonly type="text" id="wideAddr" name="wideAddress" placeholder="주소를 선택하면 입력됩니다.">
										<input style="width:230px"class="span5" readonly type="text" id="cityAddr" name="cityAddress" placeholder="주소를 선택하면 입력됩니다.">
									</div>
								</div> 
								
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-select-1">거래처 </label>
									<div class="controls">
										<select class="chosen-select" id="form-field-customerCode" name="customerName" data-placeholder="선택">
											<option></option>
											<c:forEach items="${customerList }" var="customerVo">
												<option managerName="${customerVo.managerName }" customerCode="${customerVo.no }" value="${customerVo.no }">${customerVo.name }</option>
											</c:forEach>
										</select>
										
										<input readonly type="text" class="span6" id="customerNo" name="customerNo" placeholder="거래처명을 선택하면 코드값이 입력됩니다.">
									</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label style="text-align:left;" class="control-label" for="id-date-picker-1">매입일자</label>
									<div class="controls" style="width:90%">
										<input readonly class="cl-date-picker" id="id-date-picker-1" name="payDate"  type="text" >
										<div class="input-append">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
										</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">
											<label style="text-align:left;" class="control-label" for="form-field-2">취득금액</label>
											<div class="controls">
												<input type="text" style="text-align:right;" id="acqPrice" name="acqPrice" />
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;text-align:left;" class="control-label" for="form-field-1">취득세</label>
											<input readonly style="text-align:right" type="text" id="acqTax" name="acqTax" />
										</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label style="text-align:left;" class="control-label" for="form-field-1">토지소유자</label>
											<div class="controls">
												<input type="text" id="ownerName" name="ownerName" placeholder="이름을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;text-align:left;" class="control-label" for="form-field-1">합병코드</label>
											<input type="text" id="combineNo" name="combineNo" placeholder="합병코드번호를 입력하세요"/>
										</div>
								</div>
							</div><!-- 차변 span -->
							<div class="span6"><!-- 대변 -->
								<div class="control-group" style="margin-top:50px;">
									<label style="text-align:left;" class="control-label" >평수</label>
									<div class="controls">
										<input type="text" id="area" name="landArea" placeholder="숫자만 입력해주세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">상세주소</label>
									<div class="controls">
										<input type="text" id="detailAddr" name="detailAddress" placeholder="상세주소를 입력하세요"/>
									</div>
								</div> 
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">담당자</label>
									<div class="controls">
										<input readonly type="text" id="customerManager" name="customerManager" />
									</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label style="text-align:left;" class="control-label" for="form-field-1">공시지가</label>
											<div class="controls">
												<input style="text-align:right;" type="text" id="publicValue" name="publicValue" />
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;text-align:left;" class="control-label" for="form-field-1">기타비용</label>
											<input style="text-align:right;" type="text" id="etcCost" name="etcCost" />
										</div>	
								</div>
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-select-1">세금계산서번호</label>
									<div class="controls">
										<input type="text" class="span7" id="taxbillNo" name="taxbillNo">
									</div>
								</div>
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-2">구분</label>
									<div class="controls">
										<input name="taxKind" type="radio" class="ace" id="tax" value="과세">
										<span class="lbl">과세</span>

										<input name="taxKind" type="radio" class="ace" id="zeroTax" value="영세">
										<span class="lbl">영세</span>
									</div>
								</div>
							</div><!-- 대변 span -->


					<div class="row-fluid">
					<div class="span12">
					<div class="hr hr-18 dotted"></div>
					<div class="controls" style="margin-left: 0px;">
						<div class="controls" style="margin-left: 0px;">
							 	   <button class="btn btn-primary btn-small" id="insert" style="float:left; margin-right:20px;" type="button">등록</button>
	                               <button class="btn btn-warning btn-small" id="modify" style="float:left;margin-right:20px;display:none;" type="button">수정</button>
	                               <button class="btn btn-danger btn-small" id="delete" style="float:left;margin-right:20px;display:none;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
	                               <button class="btn btn-info btn-small" id="search" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">조회</button>
	                               <button class="btn btn-default btn-small" id="clear" style="float:left;margin-right:20px;" type="button">초기화</button>
						</div>					
					</div>
					</div>
					<div class="row-fluid">
					<div class="span12">
					<div class="hr hr-18 dotted"></div>
					</div>
					</div>
					</div>
					</form>
					</div><!-- 차변 대변 나누기 위한 row-fluid -->
					
					<div class="row-fluid">
						<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<!-- <th class="center">
										<label>
											<input type="checkbox" class="ace" name="checkAll" id="th_checkAll" onclick="checkAll();">
											<span class="lbl"></span>
										</label>
									</th> -->
									<th>No</th>
									<th>토지코드</th>
									<th>토지대분류코드</th>
									<th>토지분류명</th>
									<th>주소(광역)</th>
									<th>주소(시/군/구)</th>
									<th>주소(상세)</th>
									<th>평수</th>
									<th>토지소유자명</th>
									<th>매입거래처코드</th>
									<th>매입거래처명</th>
									<th>거래처담당자</th>
									<th>매입일자</th>
									<th>공시지가(원)</th>
									<th>취득금액(원)</th>
									<th>기타비용(원)</th>
									<th>취득세(원)</th>
									<th>합병코드</th>
									<th>세금계산서번호</th>
									<th>구분</th>
									<!-- <th>작성자</th>
									<th>작성일</th> -->
								</tr>
							</thead>

							<tbody>
									<c:forEach items='${dataResult.datas }' var='land' varStatus="status">
										<tr class="clickme">
											<td>${(page-1)*11 + status.count}</td>
											<td>${land.id }</td>
											<td>${land.sectionNo}</td>
											<td>${land.sectionName}</td>
											<td>${land.wideAddress}</td>
											<td>${land.cityAddress}</td>
											<td>${land.detailAddress}</td>
											<td>${land.landArea}</td>
											<td>${land.ownerName}</td>
											<td>${land.customerNo}</td>
											<td>${land.customerName }</td>
											<td>${land.managerName }</td>
											<td>${land.payDate}</td>
											<td><fmt:formatNumber value="${land.publicValue}" pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${land.acqPrice}" pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${land.etcCost}" pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${land.acqTax}" pattern="#,###"></fmt:formatNumber></td>
											<td>${land.combineNo}</td>
											<td>${land.taxbillNo}</td>
											<td>${land.taxKind}</td>
											<%-- <td>${land.insertUserid}</td>
											<td>${land.insertDay}</td> --%>
										</tr>
									</c:forEach>




								
							</tbody>
						</table>
					</div>
					<!-- PAGE CONTENT ENDS -->
					<!-- 페이징 -->
					<div class="row-fluid">
							<div class="pagination">
								<ul>
									<c:choose>
										<c:when test="${dataResult.pagination.prev }">
											<li><a
												href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
													<i class="icon-double-angle-left"></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="#"><i
													class="icon-double-angle-left"></i></a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${dataResult.pagination.startPage }"
										end="${dataResult.pagination.endPage }" var="pg">
										<c:choose>
											<c:when test="${pg eq dataResult.pagination.page }">
												<li class="active"><a
													href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${dataResult.pagination.next }">
											<li><a
												href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }">
													<i class="icon-double-angle-right"></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="#"> <i
													class="icon-double-angle-right"></i></a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
						<!-- 유효성 검사 dialog -->
						<div id="dialog-confirm" class="hide">
							<p id="dialog-txt" class="bolder grey">
							</p>
						</div>

				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//토지코드 유효성 검사
 $(document).ready(function(){
	$("#neverchange").hide();
	console.log("clsosing" + $("#closingDate").val());
	checkClosing();
}); 
 //중복확인 버튼
 $("#overlapBtn").on("click", function(e){
		e.preventDefault();
		
		var id = "c" + $("#land_code").val();
		
		$.ajax({
			url : $("#context-path").val()  + "/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/checkId?id=" + id,
		    type : "get",
		    dataType : "json",
		    data : "",
			success:function(data) {
				if(data === "true") {
					dialog("사용가능한 품목코드입니다.", false);
					$("#insert-land-form").data("checkpurchaseno", "ok");
					$("#overlapBtn").hide();
					$("#default-landcode").hide();
					$("#check-icon").show();
					var checkpurchaseno = $("#insert-land-form").data("checkpurchaseno");
					console.log("사용가능한 품목코드입니다." + checkpurchaseno);
				} else if(data === "false") {
					dialog("중복된 품목코드입니다.", false);
					$("#insert-land-form").data("checkpurchaseno", "no");
					$("#land_code").val("");
				} else if(data === "none") {
					dialog("품목코드 9자를 입력해주세요.", false);
					$("#insert-land-form").data("checkpurchaseno", "no");
				}
			}, error:function(error) {
				dialog("찾을 수 없는 품목입니다.", true);
			}
		});
	});
    //토지코드 변화시 중복확인버튼 보이기.
	$("#land_code").on('keyup', function(event){
			var check = $("#insert-land-form").data("checkpurchaseno");
			
			if(check === "ok") {
				if($("#land_code").val().length < 9) {
				$("#insert-land-form").data("checkpurchaseno", "no");
				$("#overlapBtn").show(); //중복확인버튼
				$("#default-landcode").show(); //쓰는방법
				$("#check-icon").hide(); //체크아이콘
			}
			}
	});
	
	


//유효성 검사 시작.

$(function() {
	$("#insert").click(function() {
		insert();
	});
	$("#modify").click(function() {
		update();
	});
});

	
	
	function update(){ // 수정
		if(!valid.nullCheck("land_code", "토지 코드")) return;
		if(!valid.numberCheck("land_code", "토지 코드")) return;
		if(!valid.nullCheck("code", "토지 분류")) return;
		if(!valid.nullCheck("area", "평수")) return;
		if(!valid.numberCheck("area", "평수")) return;
		if(!valid.nullCheck("wideAddr", "주소")) return;
		if(!valid.nullCheck("customerNo", "거래처")) return;
		if(!valid.nullCheck("id-date-picker-1", "매입일자")) return;
		if(!valid.nullCheck("publicValue", "공시지가")) return;
		if(!valid.nullCheck("etcCost", "기타비용")) return;
		if(!valid.nullCheck("acqPrice", "취득 금액")) return;
		if(!valid.nullCheck("ownerName", "토지 소유자")) return;
		if(!valid.radioCheck("taxKind", "세금 종류")) return;
		
    	var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update";
    		$("#insert-land-form").attr("action",url).submit();
    }
	
	//// 핵심소스 - (예제)
	function insert(){
			var checkpurchaseno = $("#insert-land-form").data("checkpurchaseno");
			var landcode = $("#land_code").val();
			console.log("품목코드를 중복확인 해주세요." + checkpurchaseno);
			console.log($("#land_code").val.length);
			if(checkpurchaseno === "no" || landcode.length < 9) {
				$("#insert-land-form").data("checkpurchaseno", "no");
				
				dialog("품목코드를 중복확인 해주세요.", false);
			}
			else if(!valid.nullCheck("land_code", "토지 코드")) return;
			else if(!valid.numberCheck("land_code", "토지 코드")) return;
			else if(!valid.nullCheck("code", "토지 분류")) return;
			else if(!valid.nullCheck("area", "평수")) return;
			else if(!valid.numberCheck("area", "평수")) return;
			else if(!valid.nullCheck("wideAddr", "주소")) return;
   			else if(!valid.nullCheck("customerNo", "거래처")) return;
   			else if(!valid.nullCheck("id-date-picker-1", "매입일자")) return;
   			else if(!valid.nullCheck("publicValue", "공시지가")) return;
   			else if(!valid.nullCheck("etcCost", "기타비용")) return;
   			else if(!valid.nullCheck("acqPrice", "취득 금액")) return;
   			else if(!valid.nullCheck("ownerName", "토지 소유자")) return;
   			else if(!valid.radioCheck("taxKind", "세금 종류")) return;
   			else{
   				$("#insert-land-form").submit();
   			}
   			
        	}

	//// 핵심소스
	var valid = {
        		nullCheck: function(id, msg){ // null 체크
        			if($("#"+id).val()==""){
        				dialog(msg+" 을(를) 입력 해 주세요.");
        				$("#"+id).focus();
        				return false;
        			} else {
        				return true;
        			}
        		},
				strCheck: function(id){  // 문자열 체크 
        			
        		},
				radioCheck: function(name, msg){  // 문자열 체크 
					if(!jQuery('input[name='+ name +']:checked').val()){
        			dialog(msg+" 를 선택해 주세요.");
						return false;
					} else {
						return true;
					}
        		},
				numberCheck: function(id, msg){  // 숫자 체크
        			if(!$.isNumeric($("#"+id).val())){        	
        				dialog(msg+" 은(는) 숫자만 입력 가능합니다.");
        				$("#"+id).val("");
        				$("#"+id).focus();
        				return false;
        			} else {
        				return true;
        			}
        		}
        
        }

	 // 핵심소스
	 // 유효성 검사시 Dialog Popup 창이 모달로 떠오르게 되는 소스
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
								location.href="${pageContext.request.contextPath }/08/09/add";
							} else {
								$( this ).dialog( "close" ); 
							}
						}
					}
				]
			});
    	}
	
	function checkClosing(){ // 마감일 세팅 여부
		if($("#closingDate").val()=="true"){
			dialog("마감된 일자입니다. <br>저장되지 않았습니다", true);
		}
	}


//select Box 
$(function(){
	$(".chosen-select").chosen(); 
});



//엔터키 막기
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        $(this).next('.inputs').focus();
        event.preventDefault();
    }
}, true);


//체크박스 전체 클릭
function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
}

// 초기화버튼
$(function() {
	$("#clear").click(function() {
		console.log($('#land_code').val());
		$('#land_code').val("");
		console.log($('#land_code').val());
		var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add";
		$("#insert-land-form").attr("action",url).submit();
	});
});



//클릭한 행 받아와서 text에 값넣어주기
$(function() {
	$(".clickme").click(function() {
		$('#land_code').prop('readonly', true);
		$("#default-landcode").hide();
		$("#neverchange").show();
		$("#insert").hide();
		$("#modify").show();
		$("#search").hide();
		$("#delete").show();
		$("#check-icon").hide();
		$("#overlapBtn").hide();
		/* alert("등록") */
		var str = ""
		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();

		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());

		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		console.log("배열에 담긴 값 : "+ tdArr);
		
		var id = td.eq(1).text().replace("c", "");
		$('#land_code').val(id)
		
		var sectioncode = td.eq(2).text();
		$('#code').val(sectioncode)
		
		var section = td.eq(3).text();
		$('#form_field_section_chosen').find('span').text(section)
		
		var wideAddress = td.eq(4).text();  // 시/도
		$('#wideAddr').val(wideAddress)

		var cityAddress = td.eq(5).text(); //구군
		$('#cityAddr').val(cityAddress)
		
		var detailAddress = td.eq(6).text(); //상세주소
		$('#detailAddr').val(detailAddress)
		
		var landarea = td.eq(7).text();
		$('#area').val(landarea)
		
		var ownerName = td.eq(8).text();
		$('#ownerName').val(ownerName)
		
		var customerCode = td.eq(9).text();
		$('#customerNo').val(customerCode)
		
		var customerName = td.eq(10).text();
		$('#form_field_customerCode_chosen').find('span').text(customerName)
		
		var customerManager = td.eq(11).text();
		$('#customerManager').val(customerManager)
		
		var payDate = td.eq(12).text();
		$('#id-date-picker-1').val(payDate)
		
		var publicValue = td.eq(13).text();
		$('#publicValue').val(publicValue)
		
		var acqPrice = td.eq(14).text();
		$('#acqPrice').val(acqPrice)
		
		var etcCost = td.eq(15).text();
		$('#etcCost').val(etcCost)
		
		var acqTax = td.eq(16).text();
		$('#acqTax').val(acqTax)
		
		var combineNo = td.eq(17).text();
		$('#combineNo').val(combineNo)
		
		var taxbillNo = td.eq(18).text();
		$('#taxbillNo').val(taxbillNo)
		
		var taxKind = td.eq(19).text();
		console.log(typeof(taxKind))
		console.log(taxKind)
		if(taxKind=="과세"){
			$("#tax").prop("checked", true)
		}else if(taxKind=="영세"){
			$("#zeroTax").prop("checked", true)
		}
		
		console.log("코드 : " + code);
		
		//세금계산서가 있으면 수정 불가. 삭제만 가능
		if(taxbillNo != ""){
			$("#insert").hide();
			$("#modify").hide();
			$("#search").hide();
		}
	});
});
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//금액에 3자리마다 , 넣기
$(function() {
	$("#publicValue").on('keyup', function(event){
		 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});
	$("#etcCost").on('keyup', function(event){
		 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});
	$("#acqPrice").on('keyup', function(event){
		 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});
});

//취득세 등록세 계산
$(function() {
	$("#acqPrice").change(function() {
		
		var AcqPrice = $("#acqPrice").val();
		var RealAcqPrice = AcqPrice.split(',').join('');
		$("#acqTax").val(Math.floor(RealAcqPrice*0.04));
		$("#acqTax").val(addCommas($("#acqTax").val().replace(/[^0-9]/g,"")));
	});
});



//주소
function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress;
				console.log(data)
				$("#wideAddr").val(data.sido);
				$("#cityAddr").val(data.sigungu); 
				$("#detailAddr").val(data.roadname + " ");
				$("#detailAddr").focus();
			}
		}).open();
};


// 대분류코드 select box 변경시 이벤트
$('#form-field-section').change(function() {
		var sectionCode = $('#form-field-section option:selected').attr('landcode');
		var code = $('#code').val(sectionCode);
});

//거래처코드 select box 변경시 이벤트
$('#form-field-customerCode').change(function() {
		var customerCode = $('#form-field-customerCode option:selected').attr('customerCode');
		var customerNo = $('#customerNo').val(customerCode);
		console.log(customerNo)
		var managerName = $('#form-field-customerCode option:selected').attr('managerName');
		var managerName = $('#customerManager').val(managerName); 
		console.log(managerName)
});



</script>


<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$.fn.datepicker.dates['ko'] = {
				days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				today : "Today",
				clear : "Clear",
				format : "yyyy-mm-dd",
				titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
				weekStart : 0
			};

			$('#cl-ym-date-picker').datepicker({
				maxViewMode : 4,
				minViewMode : 1,
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});

			$('.cl-date-picker').datepicker({
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			
		});
	</script>
</body>
</html>