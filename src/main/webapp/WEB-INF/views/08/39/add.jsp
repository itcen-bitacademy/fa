<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style>
 .form-horizontal .control-label {
    text-align: left
 }
 
 .publicValue {
    text-align: right;
 }
 
  .acqTax {
    text-align: right;
 }
 
  .acqPrice {
    text-align: right;
 }
 
  .etcCost {
    text-align: right;
 }
 </style>
 
</head>
<body class="skin-3">
 <input type="hidden" value="${closingDate }" name="closingDate" id="closingDate">

	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">

				<div class="page-header position-relative">
					<h1 class="pull-left">건물관리</h1>
				</div>
				<!-- /.page-header -->

				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->

							
							<form class="form-horizontal" name="manageForm" id="manage-building-form">
								<!-- 좌측 -->
								<div class="span6">
									<div class="control-group">
										<label class="control-label" for="form-field-1">건물코드</label>
										<div class="controls">
											<input type="text" id="buildingCode" name="id" placeholder="9자를 입력하세요"/>
											<input id="btn-check-code" style="height:28px" type="button" value="중복확인">
                              				<i class="icon-ok bigger-180 blue" id="img-check-code"></i>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">대분류</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-section" name="sectionName" data-placeholder="대분류">
											<option value=""></option>
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.code }" value="${sectionVo.classification}">${sectionVo.classification}</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" id="code" name="sectionNo" placeholder="대분류명을 지정하면 코드가 입력됩니다">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소</label>
										<div class="controls">
											<input class="span2" onclick="execDaumPostcode()" 
												class="btn-primary box" type="button" value="주소 찾기">
											<input class="span4" readonly type="text" id="wideAddress"
												name="wideAddress" placeholder="주소를 선택하면 입력됩니다."> 
											<input style="width: 230px" class="span5" readonly type="text"
												id="cityAddress" name="cityAddress"
												placeholder="주소를 선택하면 입력됩니다.">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">거래처</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-customer" data-placeholder="거래처" name="customerName">
												<option value=""></option>
												<c:forEach items="${customerList }" var="customerVo">
													<option customerNo="${customerVo.no}" managerName="${customerVo.managerName }" value="${customerVo.name }">${customerVo.name }</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" name="customerNo" id="customerNo" placeholder="거래처명을 지정하면 코드가 입력됩니다">
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="id-date-picker-1">매입일자</label>
											<div class="controls">
												<input style="width: 174px" class="cl-date-picker" readonly
													type="text" id="id-date-picker-1" name="payDate" placeholder="날짜를 선택하세요" />
												<div class="input-append">
													<span class="add-on"> <i class="icon-calendar"></i>
													</span>
												</div>
												
											</div>
										</div>
										<div style="float: left; width: 40%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">공시지가</label> 
												<input type="text" id="publicValue" name="publicValue" class="publicValue"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">기타비용</label>
										<div class="controls">
											<input type="text" id="etcCost" name="etcCost" class="etcCost"
												placeholder="금액을 입력하세요"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">합병코드</label>
										<div class="controls">
											<input type="text" id="combineNo" name="combineNo" 
												placeholder="" />
										</div>
									</div>
								</div>

								<!-- 우측 -->
								<div class="span6">
									<div class="control-group">
										<div style="float: left">
											<label class="control-label" for="form-field-1">평수</label>
											<div class="controls">
												<input style="width: 206px" type="text" id="area"
													name="area" placeholder="숫자만 입력하세요" />
											</div>
										</div>
										<div style="float: left">
											<label style="width: 60px; margin-left: 10px; margin-right: 10px;"
												class="control-label" for="form-field-1">층수</label>
											<div style="width: 205px; margin-left:40px" class="controls">
												<input style="width: 50px; margin-left : 10px;" type="text" id="floor"
													name="floor" placeholder="지상" /> <input
													style="width: 50px" type="text" id="basement"
													name="basement" placeholder="지하" />
											</div>
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">용도</label>
											<div class="controls">
												<input type="text" id="purpose" name="purpose" placeholder="내용을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">주 구조</label> 
												<input type="text" id="material" name="material" placeholder="내용을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">상세주소</label>
										<div class="controls">
											<input type="text" id="detailAddress" name="detailAddress" class="span10"
												placeholder="상세주소를 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">거래처 담당자</label>
											<div class="controls" id="form-input-customer">
												<input readonly type="text" name="managerName" id="managerName" placeholder="담당자" />
											</div>
											
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">건물소유자</label> <input
												type="text" id="ownerName" name="ownerName"
												placeholder="내용을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">취득금액</label>
											<div class="controls">
												<input type="text" id="acqPrice" name="acqPrice" class="acqPrice"
													placeholder="금액을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">취득세</label> 
											<input readonly type="text" id="acqTax" name="acqTax" class="acqTax" placeholder="" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">세금계산서번호</label>
										<div class="controls">
											<input type="text" class="span7" name="taxbillNo" id="taxbillNo">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-2">구분</label>
										<div class="controls">
											<input name="taxKind" type="radio" class="ace" id="tax" value="과세"> <span class="lbl">과세</span> 
											<input name="taxKind" type="radio" class="ace" id="zeroTax" value="영세"> <span class="lbl">영세</span>
										</div>
									</div>
									
									
								</div>
								<!-- 우측 -->
								<div class="row-fluid">
									<div class="span12">
										<div class="hr hr-18 dotted"></div>
										<div class="controls" style="margin-left: 0px;">
											<div class="controls" style="margin-left: 0px;">
												<button class="btn btn-primary btn-small" id="insert" 
													style="float: left; margin-right: 20px;">입력</button>
												<button class="btn btn-warning btn-small" id="modify"
													style="float: left; margin-right: 20px;">수정</button>
												<button class="btn btn-danger btn-small" id="delete"
													style="float: left; margin-right: 20px;">삭제</button>
												<button class="btn btn-info btn-small" id="search" 
													style="float: left; margin-right: 20px;">조회</button>
												<button class="btn btn-default btn-small" id="reset"
													style="float: left; margin-right: 20px;" type="reset">초기화</button>
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
						


				<!-- 테이블 -->
				<div class = "row-fluid">
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>건물코드</th>
							<th>건물대분류코드</th>
							<th>건물분류명</th>
							<th>평수</th>
							<th>층수(지상)</th>
							<th>층수(지하)</th>
							<th>주소(광역)</th>
							<th>주소(시/군/구)</th>
							<th>주소(상세)</th>
							<th>용도</th>
							<th>주 구조</th>
							<th>거래처코드</th>
							<th>거래처명</th>
							<th>담당자</th>
							<th>건물소유자</th>
							<th>매입일자</th>
							<th>공시지가(원)</th>
							<th>취득금액(원)</th>
							<th>기타비용(원)</th>
							<th>등록세(원)</th>
							<th>합병코드</th>
							<th>세금계산서번호</th>
							<th>구분</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
						<tr class="table-row" >
							<td>${vo.id }</td>
							<td>${vo.sectionNo }</td>
							<td>${vo.sectionName }</td>
							<td>${vo.area }</td>
							<td>${vo.floor }</td>
							<td>${vo.basement }</td>
							<td>${vo.wideAddress }</td>
							<td>${vo.cityAddress }</td>
							<td>${vo.detailAddress }</td>
							<td>${vo.purpose }</td>
							<td>${vo.material }</td>
							<td>${vo.customerNo }</td>
							<td>${vo.customerName }</td>
							<td>${vo.managerName }</td>
							<td>${vo.ownerName }</td>
							<td>${vo.payDate }</td>
							<td style="text-align : right"><fmt:formatNumber value="${vo.publicValue }" pattern="#,###"></fmt:formatNumber></td>
							<td style="text-align : right"><fmt:formatNumber value="${vo.acqPrice }" pattern="#,###"></fmt:formatNumber></td>
							<td style="text-align : right"><fmt:formatNumber value="${vo.etcCost }" pattern="#,###"></fmt:formatNumber></td>
							<td style="text-align : right"><fmt:formatNumber value="${vo.acqTax }" pattern="#,###"></fmt:formatNumber></td>
							<td>${vo.combineNo }</td>
							<td>${vo.taxbillNo }</td>
							<td>${vo.taxKind }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
					
			</div><!-- (row-fluid) PAGE CONTENT ENDS -->
			<div id="dialog-confirm" class="hide">
				<p id="dialog-txt" class="bolder grey">
				</p>
			</div>		
		</div><!-- /.span -->
						
	</div><!-- 좌,우측  row-fluid -->
				
</div><!-- /.page-content -->
			
			<!-- 페이징 row-fluid -->
			<div class="row-fluid">
			<!-- 페이징 -->
			<div class="pagination">
				<ul>
					<c:choose>
						<c:when test="${dataResult.pagination.prev }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
								<i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }">
							<i class="icon-double-angle-right"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#">
							<i class="icon-double-angle-right"></i></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div><!-- 페이징 -->
			</div><!-- 페이징 row-fluid -->

		</div><!-- /.main-content -->
		
	</div><!-- /.main-container -->
	
<!-- basic scripts -->

<c:import url="/WEB-INF/views/common/footer.jsp" />
	
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
var errorfocus = ""; // error 부분 focusing
var closeflag = $('#closingDate').val();
var checkId = false; //중복체크 유무를 확인

//유효성 검사
 $(document).ready(function(){
	 
	$("#modify").hide();
	$("#delete").hide();
	$("#img-check-code").hide();
	
	 // 마감일 체크
	checkClosing();

}); 

//건물코드 중복검사
 $("#btn-check-code").click(function(e){
	 
	 e.preventDefault();
	 
	var id = "b" + $("#buildingCode").val();
	
	if (!valid.nullCheck("buildingCode", "건물 코드")){
		errorfocus='#buildingCode';
		return false;
	}
	if (!valid.strCheck("buildingCode", "건물 코드")){
		errorfocus='#buildingCode';
		return false;
	}
	if (!valid.numberCheck("buildingCode", "건물 코드")){
		errorfocus='#buildingCode';
		return false;
	}
   $.ajax({
      url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/checkId?id=" + id,
      type : "get",
      dataType : "json",
      data : "",
      success: function(response){
         if(response.result == "fail"){
            console.error(response.message);
            return;
         }
         
         if(response.data == null){
			 checkId = true;
			 $("#btn-check-code").hide();
			 $("#img-check-code").show();
             return;
             
         } else if(response.data.flag == "d"){
        	 $("#buildingCode").val("");
        	 dialog("삭제된 코드입니다.");
			 
		 } else {
			 $("#buildingCode").val("");
			 dialog("이미 존재하는 코드 입니다.");
		 }
      },
      error: function(xhr, error) {
         console.error("error: " + error);
      }
	});
 });

//Validation

	//등록 동작
	$("#insert").click(function() {
		if(checkId == false) {
			dialog("코드 중복확인를 하세요.");
			return
		} else {
			//validation
			if(!manageValid()){
				return;
			}
			$('#manage-building-form').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/create');
			$('#manage-building-form').attr('method', 'POST');
			$('#manage-building-form').submit();
		}
	});

	//수정 동작
	$("#modify").click(function() {
		if(!manageValid()){
			return;
		}
		$('#manage-building-form').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update');
		$('#manage-building-form').attr('method', 'POST');
		$('#manage-building-form').submit();
	});

	//삭제 동작
	$("#delete").click(function() {
		$('#manage-building-form').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete');
		$('#manage-building-form').attr('method', 'POST');
		$('#manage-building-form').submit();
	});

	//조회 동작
	$("#search").click(function() {
		$('#manage-building-form').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }');
		$('#manage-building-form').attr('method', 'GET');
		$('#manage-building-form').submit();
	});


	//마감일 체크
	function checkClosing(){
		if (!valid.closingCheck("closingDate")){
			return false;
		}
		return true;
	}
	
	
	//// 관리 validation
	function manageValid() {
		if (!valid.nullCheck("buildingCode", "건물 코드")){
			errorfocus='#buildingCode';
			return false;
		}
		if (!valid.strCheck("buildingCode", "건물 코드")){
			errorfocus='#buildingCode';
			return false;
		}
		if (!valid.numberCheck("buildingCode", "건물 코드")){
			errorfocus='#buildingCode';
			return false;
		}
		if (!valid.nullCheck("area", "평수")){
			errorfocus='#area';
			return false;
		}
		if (!valid.numberCheck("area", "평수")){
			errorfocus='#area';
			return false;
		}
		if (!valid.nullCheck("floor", "층수(지상)")){
			errorfocus='#floor';
			return false;
		}
		if (!valid.numberCheck("floor", "층수(지상)")){
			errorfocus='#floor';
			return false;
		}
		if (!valid.nullCheck("basement", "층수(지하)")){
			errorfocus='#basement';
			return false;
		}
		if (!valid.numberCheck("basement", "층수(지하)")){
			errorfocus='#basement';
			return false;
		}
		if (!valid.nullCheck("code", "대분류")){
			return false;
		}
		if (!valid.nullCheck("purpose", "용도")){
			errorfocus='#purpose';
			return false;
		}
		if (!valid.nullCheck("material", "주 구조")){
			errorfocus='#material';
			return false;
		}
		if (!valid.nullCheck("wideAddress", "주소")){
			return false;
		}
		if (!valid.nullCheck("customerNo", "거래처")){
			return false;
		}
		if (!valid.nullCheck("ownerName", "건물소유자")){
			errorfocus='#ownerName';
			return false;
		}
		if (!valid.nullCheck("id-date-picker-1", "매입일자")){
			return false;
		}
		if (!valid.nullCheck("publicValue", "공시지가")){
			errorfocus='#publicValue';
			return false;
		}
		if (!valid.nullCheck("acqPrice", "취득 금액")){
			errorfocus='#acqPrice';
			return false;
		}
		if (!valid.radioCheck("taxKind", "구분")){
			return false;
		}
		return true;
	}

	var valid = {
		nullCheck : function(id, msg) { // null 체크
			if ($("#" + id).val() == "") {
				dialog(msg + "을(를) 입력 해 주세요.");
				$("#" + id).focus();
				return false;
			} else {
				return true;
			}
		},
		strCheck : function(id, msg) { // 글자 수 체크
			if ($("#" + id).val().length != 9) {
				dialog(msg + "은(는) 9자를 입력하셔야 합니다.");
				$("#" + id).focus();
				return false;
			} else {
				return true;
			}
		},
		radioCheck : function(name, msg) { // radio 버튼 체크 
			if (!jQuery('input[name=' + name + ']:checked').val()) {
				dialog(msg + "를 선택해 주세요.");
				$("#" + name).focus();
				return false;
			} else {
				return true;
			}
		},
		numberCheck : function(id, msg) { // 숫자 체크
			if (!$.isNumeric($("#" + id).val())) {
				dialog(msg + "은(는) 숫자만 입력 가능합니다.");
				$("#" + id).focus();
				return false;
			} else {
				return true;
			}
		},
		closingCheck : function(id) { // 마감일 체크
			if($("#" + id).val() == "true"){
				dialog("마감된 일자입니다. <br>저장되지 않았습니다.", true);
				return false;
			} else {
				return true;
			}
		}
	}

	// 유효성 검사시 Dialog Popup 창이 모달로 떠오르게 되는 소스
	 function dialog(txt, closeflag) {
        	$("#dialog-txt").html(txt);
    		var dialog = $( "#dialog-confirm" ).dialog({
				resizable: false,
				modal: true,
				buttons: [
					{
						text: "OK",
						"class" : "btn btn-danger btn-mini",
						click: function() {
							if(closeflag){
								$( this ).dialog( "close" );
								location.href="${pageContext.request.contextPath }/08/39/add";
							} else {
								$( this ).dialog( "close" );
							}
						}
					}
				]
			});
    	}

	//빈칸 검사
	function formCheck() {

		if ($("#buildingCode").val() == "") {
			document.getElementById(next).focus();
			alert("검색어를 입력해주시기 바랍니다.");
		}

		if (window.event.keyCode == 13) {

		} else {
			return;
		}
	}
</script>
<script>
	$(function(){
		$(".chosen-select").chosen(); 
	});
	
	//select box 선택 시 값 등록
	
	//대분류
	$('#form-field-section').change(function() {
  		var code = $('#form-field-section option:selected').attr('sectionList'); // ${sectionVo.code}
 		$('#code').val(code); 
	});
	
	//거래처-담당자
	$('#form-field-customer').change(function() {
  		var customerno = $('#form-field-customer option:selected').attr('customerNo'); // ${customerVo.no}
  		$('#customerNo').val(customerno);
 		var managername = $('#form-field-customer option:selected').attr('managerName'); // ${customerVo.manager_name}
 		$('#managerName').val(managername);
	});
	
	//관리화면
	$(function() {
		//한행 클릭 >> 건물코드 가져오기
		   $(".table-row").click(function() {
			   
			  $("#modify").show();
			  $("#delete").show();
			  $("#insert").hide();
			  $("#search").hide();
			  $("#btn-check-code").hide();
			  
		      var str = ""
		      var tdArr = new Array();   // 배열 선언
		      
		      // 현재 클릭된 Row(<tr>)
		      var tr = $(this);
		      var td = tr.children();
		      
		      $("input[name=id]").val(td.eq(0).text().replace("b", ""));
		      $("input[name=sectionNo]").val(td.eq(1).text());
		      //sectionName 에 대한 값(classification)을 select box에 표시
		      $('#form-field-section').val(td.eq(2).text()).trigger('chosen:updated');
		      $("input[name=area]").val(td.eq(3).text());
		      $("input[name=floor]").val(td.eq(4).text());
		      $("input[name=basement]").val(td.eq(5).text());
		      $("input[name=wideAddress]").val(td.eq(6).text());
		      $("input[name=cityAddress]").val(td.eq(7).text());
		      $("input[name=detailAddress]").val(td.eq(8).text());
		      $("input[name=purpose]").val(td.eq(9).text());
		      $("input[name=material]").val(td.eq(10).text());
		      $("input[name=customerNo]").val(td.eq(11).text());
		      //customerName 에 대한 값(code)을 select box에 표시
		      $('#form-field-customer').val(td.eq(12).text()).trigger('chosen:updated'); 
		      $("input[name=managerName]").val(td.eq(13).text());
		      $("input[name=ownerName]").val(td.eq(14).text());
		      $("input[name=payDate]").val(td.eq(15).text());
		      $("input[name=publicValue]").val(td.eq(16).text());
		      $("input[name=acqPrice]").val(td.eq(17).text());
		      $("input[name=etcCost]").val(td.eq(18).text());
		      $("input[name=acqTax]").val(td.eq(19).text());
		      $("input[name=combineNo]").val(td.eq(20).text());
		      $("input[name=taxbillNo]").val(td.eq(21).text());
		      
		     //radio button
		      if(td.eq(22).text() == "과세"){
		          $("input[id=tax]").prop('checked', true);
		      }
		      else if(td.eq(22).text() == "영세"){
		          $("input[id=zeroTax]").prop('checked', true);
		      }
		     
		     //CRUD button
		      if($("#taxbillNo").val() != ''){
		    	  $("#modify").hide();
		      }
		      if($("#taxbillNo").val() == ''){
			   	 	$("#modify").show();
			  }
		      
			});
		
		 //초기화 누를시 CRUD버튼 보임
			$("#reset").click(function(){
				$("#insert").show();
		   		$("#update").show();
			  	$("#search").show();
			  	$('#form-field-customer').val('초기값').trigger('chosen:updated');
			  	$('#form-field-section').val('초기값').trigger('chosen:updated');
			});
		      
	});
	
	//엔터키 막기
	document.addEventListener('keydown', function(event) {
	    if (event.keyCode === 13) {
	        $(this).next('.inputs').focus();
	        event.preventDefault();
	    }
	}, true);
	
	//금액에 3자리마다 , 넣기
	function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
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

	//취득세 계산
	$(function() {
		$('button').on('click', function(e) {
			e.preventDefault();
		})
		$("#acqPrice").change(function() {
			var AcqPrice = $("#acqPrice").val();
			var RealAcqPrice = AcqPrice.split(',').join('');
			$("#acqTax").val(Math.floor(RealAcqPrice*0.04));
			$("#acqTax").val(addCommas($("#acqTax").val().replace(/[^0-9]/g,"")));
		});
	});
	
	//주소 API
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress;
				console.log(data)
				$("#wideAddress").val(data.sido);
				$("#cityAddress").val(data.sigungu);
				$("#detailAddress").val(data.roadname + " ");
				$("#detailAddress").focus();
			}
		}).open();
	}
</script>

<!-- date picker -->
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script>
	$(function() {
		$.fn.datepicker.dates['ko'] = {
		days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		daysShort: ["일", "월", "화", "수", "목", "금", "토"],
		daysMin: ["일", "월", "화", "수", "목", "금", "토"],
		months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		today: "Today",
		clear: "Clear",
		format: "yyyy-mm-dd",
		timeFormat:'HH:mm:ss',
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
	})
</script>
</body>
</html>