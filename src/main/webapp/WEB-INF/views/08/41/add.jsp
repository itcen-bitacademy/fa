<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/js/08/41/41.js" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />


<style>
.limitation{
	width:200px;
	text-align:right;
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
					<h1 class="pull-left">차량관리</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							
							<!-- PAGE CONTENT BEGINS -->
							<form class="form-horizontal" method="post" id="input-form" name="sendform" onkeypress="if(event.keyCode == 13) formCheck();">

								<div class="span6">
									<!-- 차변 -->
									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">차량 코드</label>
										<div class="controls">
											<input type="text" id="vehicle_code" name="id" placeholder="9자를 입력하세요" />
<%-- 											<input type="hidden" id="vehicleNo" value="${saleslist[0].salesNo }">
											<input type="text" class="span6" id="default-vehiclecode" style="border:none;" placeholder="ex)2019년12월03일 191203001">
											<input type="text" class="span6" id="overlap-vehiclecode" style="border:none;color:red"  value="사용중인 품목코드입니다">
											<input type="text" class="span6" id="onlynumber" style="border:none;color:red"  value="차량코드는 숫자만 입력하세요.">
											<input type="text" class="span6" id="null-vehiclecode" style="border:none;color:red"  value="품목코드는 필수 입력 사항입니다!"> --%>
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-select-1">대분류 코드</label>
										<div class="controls">
											<select class="chosen-select" id="sectionNo" name="sectionNo" data-placeholder="전체">
											 	<option></option>  
												<c:forEach items="${sectionList }" var="sectionVo">
													<option vehiclecode="${sectionVo.classification}" value="${sectionVo.code }">${sectionVo.code }</option>
												</c:forEach>
											</select>
											<input readonly type="text" class="span6" id="classification" name="classification" value="코드를 지정하면 대분류명이 등록됩니다">
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">주소(광역)</label>
										<div class="controls">
											<input class="span2" onclick="execDaumPostcode()" class="btn-primary box" type="button" value="주소 찾기">
											<input class="span4" readonly type="text" id="wideAddr" name="wideAddress" placeholder="주소를 선택하면 입력됩니다."> 
											<input style="width:230px" class="span5" readonly type="text" id="cityAddr" name="cityAddress" placeholder="주소를 선택하면 입력됩니다.">
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-select-1">거래처 코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-customerCode" name="customerName" data-placeholder="전체">
											 	<option></option> 
												<c:forEach items="${customerList }" var="customerVo">
													<option managerName="${customerVo.managerName }" customerCode="${customerVo.no }" value="${customerVo.no }">${customerVo.name }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6" id="customerNo"
												name="customerNo" value="거래처명을 지정하면 코드가 등록됩니다">
										</div>
									</div>

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">매입일자</label>
											<div class="controls">
												<input class="cl-date-picker" style="width: 150px" type="text" id="payDate" name="payDate" placeholder="" />
												<i class="icon-calendar"></i>
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 60px; margin-left: 10px; margin-right: 10px;" class="control-label" for="form-field-1">출시가</label>
												 <input style="width: 200px; margin-left : 10px;" class=limitation type="text" id="publicValue" name="publicValue" placeholder="금액을 입력하세요" />
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">부대비용</label>
										<div class="controls">
											<input type="text" class=limitation id="etcCost" name="etcCost" placeholder="금액을 입력하세요" />
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">보증금</label>
										<div class="controls">
											<input type="text" class=limitation id="deposit" name="deposit" placeholder="금액을 입력하세요" />
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">월 사용료</label>
										<div class="controls">
											<input readonly type="text" class=limitation id="monthlyFee" name="monthlyFee"  />
										</div>
									</div>

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">사용 개월</label>
											<div class="controls">
												<input readonly type="text" class="span6" id="usingMonth" name="usingMonth" value="최대 60개월">
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="text-align:left;" style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">월 사용료 총 납부금액</label>
											<input readonly type="text" class="span6" id="all-monthly-fee" value="월 누적금액">
										</div>
									</div>
								</div>


								<div class="span6">
									<!-- 대변 -->

									<div class="control-group" style="margin-top: 50px">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">직급</label>
											<div class="controls" style="width: 90%">
												<select class="chosen-select" id="staffNoId" name="staffNo" data-placeholder="전체">
												 	<option></option>  
													<c:forEach items="${jikNameList}" var="StaffVo">
														<option staffNo="${StaffVo.no }" value="${StaffVo.no }">${StaffVo.staffName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 60px; margin-left: 10px; margin-right: 10px;"
												class="control-label" for="form-field-1">사용자</label> <input
												style="width: 200px; margin-left : 10px;" type="text" id="ownerName" name="ownerName" placeholder="차량 사용자를 입력하세요" />
										</div>
									</div>


									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">상세주소</label>
										<div class="controls">
											<input type="text" id="detailAddr" name="detailAddress" placeholder="상세주소를 입력하세요" />
										</div>
									</div>


									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">거래처 담당자</label>
										<div class="controls">
											<input type="text" id="customerManager" name="managerName" placeholder="이름을 입력하세요" />
										</div>
									</div>
									
									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">취득세</label>
										<div class="controls">
											<input type="text" class=limitation id="acqTax" name="acqTax"   placeholder="금액을 입력하세요" />
										</div>
									</div>


									<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">세금계산서 번호</label>
									<div class="controls">
										<input  type="text" class="span7" id="taxbillNo" name="taxbillNo" placeholder="12자로 입력하세요"/>
									</div>
								</div> 
								

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">보증금 납부 예정일</label>
											<div class="controls" style="width: 90%">
												<input class="cl-date-picker" type="text" style="width: 150px" id="dueDate" name="dueDate" placeholder="" /> <i class="icon-calendar"></i>
											</div>
										</div>
										<div style="float: left;">
											<button class="btn btn-default btn-small" id="nabbu" 
												style="float: right; margin-right: 20px;" type="reset">납부</button>
										</div>
									</div>


									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">월 사용료 납부 예정일</label>
											<div class="controls">
												<input type="text" class="span10" id="feeDate" name="feeDate" placeholder="일자 2자리를 입력하세요" />
											</div>
										</div>
										<div style="float: left;">
											<button class="btn btn-default btn-small" id="walsa" style="float: right; margin-right: 20px;" type="reset">납부</button>
										</div>
									</div>

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">구분</label>
											<div class="controls">
												<input type="radio" name="taxKind" id="tax" value="과세">과세
												<input type="radio" name="taxKind" id="zeroTax" value="영세">영세
											</div>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<button class="btn btn-default btn-small" type="button"
												id="segumBtn">세금계산서보기</button>
										</div>
									</div>
								</div>
								<!-- 대변 span -->


								<div class="row-fluid">
									<div class="span12">
										<div class="hr hr-18 dotted"></div>
										<div class="controls" style="margin-left: 0px;">
											<div class="controls" style="margin-left: 0px;">
												<button class="btn btn-primary btn-small"
													id="insert" style="float: left; margin-right: 20px;">등록</button>
												<button class="btn btn-warning btn-small"
													id="modify" style="float: left; margin-right: 20px;">수정</button>
												<button class="btn btn-danger btn-small" id="delete"
													style="float: left; margin-right: 20px;">삭제</button>
												<button class="btn btn-info btn-small" id="search"
													style="float: left; margin-right: 20px;">조회</button>
												<button class="btn btn-default btn-small" id="clear"
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
						</div>
						<!-- 차변 대변 나누기 위한 row-fluid -->
						<div>
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>차량코드</th>
										<th>차량대분류</th>
										<th>차량배기량</th>
										<th>직급</th>
										<th>사용자</th>
										<th>주소(광역)</th>
										<th>주소(시/군/구)</th>
										<th>주소(상세)</th>
										<th>매입거래처코드</th>
										<th>매입거래처명</th>
										<th>매입거래처담당자</th>
										<th>매입일자</th>
										<th>출시가(원)</th>
										<th>취득세(원)</th>
										<th>부대비용(원)</th>
										<th>보증금(원)</th>
										<th hidden="hidden">보증금,월사용료 실제 납부일자</th>
										<th>보증금 예정일자</th>
										<th>월 사용료(원)</th>
										<th>월 사용료 납부일</th>
										<th>과세/영세</th>
										<th>사용개월</th>
										<th hidden="hidden">월 사용료 납부금액</th>
										<th>세금계산서 번호</th>
										
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${dataResult.datas }" var="VehicleVo" varStatus="status">
										<tr>
											<td>${(page-1)*11 + status.count}</td>  <!-- 0 -->
											<td class="vehicle-id">${VehicleVo.id}</td>  <!-- 1 -->
											<td>${VehicleVo.sectionNo}</td>  <!-- 2 -->
											<td>${VehicleVo.classification}</td>  <!-- 3 -->
											<td>${VehicleVo.staffName}</td>  <!-- 4 -->
											<td>${VehicleVo.ownerName}</td>  <!-- 5 -->
											<td>${VehicleVo.wideAddress}</td>  <!-- 6 -->
											<td>${VehicleVo.cityAddress}</td>  <!-- 7 -->
											<td>${VehicleVo.detailAddress}</td>  <!-- 8 -->
											<td>${VehicleVo.customerNo}</td> <!-- 9 -->
											<td>${VehicleVo.customerName}</td> <!-- 10 -->
											<td>${VehicleVo.managerName}</td> <!-- 11 -->
											<td class="pay-date">${VehicleVo.payDate}</td> <!-- 12 -->
											<td><fmt:formatNumber value="${VehicleVo.publicValue}" pattern="#,###"></fmt:formatNumber></td> <!-- 13 -->
											<td><fmt:formatNumber value="${VehicleVo.acqTax}" pattern="#,###"></fmt:formatNumber></td> <!-- 14 -->
											<td><fmt:formatNumber value="${VehicleVo.etcCost}" pattern="#,###"></fmt:formatNumber></td> <!-- 15 -->
											<td><fmt:formatNumber value="${VehicleVo.deposit}" pattern="#,###"></fmt:formatNumber></td> <!-- 16 -->
											<td>${VehicleVo.dueDate}</td> <!-- 17 -->
											<td class="monthly-fee"><fmt:formatNumber value="${VehicleVo.monthlyFee}" pattern="#,###"></fmt:formatNumber></td> <!-- 18 -->
											<td>${VehicleVo.feeDate}</td> <!-- 19 -->
											<td>${VehicleVo.taxKind}</td> <!-- 20 -->
											<td class="using-month"></td> <!-- 21 -->
											<td hidden class="month-cost"></td> <!-- 22 -->
											<td hidden>${VehicleVo.depositDate}</td> <!-- 보증금, 월사용료 실제 납부날짜 --> <!-- 23 -->
											<td class= "taxbillNo">${VehicleVo.taxbillNo}</td> <!-- 24 -->
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div id="dialog-message" title="세금계산서번호" hidden="hidden">
								<table id="dialog-message-table" align="center">
									<tr>
										<td>
											<form action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/segum" method="POST">
												
												<label>차량코드</label> 
												<input readonly type="text" id="vehicleNo" name="vehicleNo" value="차량코드">

												<label id="bonapil-label">보증금 납부 예정일</label> 
												<input readonly type="text" id="bonapil-input" name="bonapil" value="납부예정일">
												
												<label class="deposits">보증금</label>
												<input readonly type="text" id="depositPop" name="depositPop" value="">
												
												<label id="walnapil-label">월사용료 납부 예정일</label>
												<input readonly type="text" id="walnapil-input" name="walnapil" >
												
												<label class="monthfee">월 사용료</label>
												<input readonly type="text" id="monthlyFeePop" name="monthlyFeePop" value="">
												
												<label>세금계산서번호</label> 
												<input type="text" id="input-dialog-bankname" name="taxbillNoPoP" placeholder="세금계산서번호" />
										
												<input type="hidden" id="cusNo" name="cusNo" value="">
												<input type="hidden" id="gubun" name="gubun" value="">
												
												<br>
												<br>
												<br>
												<button class="btn btn-info btn-small" id="segum" >입력</button>
												
											</form>
										</td>
									</tr>
								</table>
							</div>

								<div id="segumList" title="차량 세금계산서" hidden="hidden">
									<!-- 차량코드, 납부일, 세금계산서 번호 데이터 리스트 -->
									<table id="segum-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="vehicle-code">차량코드</th>
												<th class="pay">가격</th>
												<th class="pay-day">납부일</th>
												<th class="due-day">납부예정일</th>
												<th class="taxbillno">세금계산서번호</th>
												<th class="voucherno">전표번호</th>
												<th class="gubun">구분</th>
											</tr>
										</thead>
										<tbody id="tbody-segumList">
										</tbody>
									</table>
								</div>
							</div>
				<!-- PAGE CONTENT ENDS -->
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
							<!-- 페이징 -->
							</div>
						</div>
						<!-- valid -->
						 <div id="dialog-confirm" class="hide">
						<p id="dialog-txt" class="bolder grey"></p>
						</div>
						<!-- /.span -->
					</div>
					<!-- /.row-fluid -->
					
					
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
		</div>
		<!-- /.main-container -->
		<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//목표 !!! => 큰 function안에 함수들 다 넣기 
	//$(function(){
	
			//차량코드 유효성 검사
			$(document).ready(function(){
				
				$("#nabbu").hide();
				$("#walsa").hide();
				$("#segumBtn").hide();
				
				
				$("#overlap-vehiclecode").hide();
				$("#onlynumber").hide();
				$("#null-vehiclecode").hide();
				
				$("#vehicle_code").focus();
				
				$("#vehicle_code").on("change", function(e){
					
					if(isNaN($("#vehicle_code").val()) /*=== true*/){
						$("#default-vehiclecode").hide();
						$("#overlap-vehiclecode").hide();
						$("#null-vehiclecode").hide();
						$("#onlynumber").show();
						$("#vehicle_code").val(""); //text비우기
						return;
					}
					var id = "e" + $("#vehicle_code").val();
			    
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
				         
				         if(response.data == true){
				            $("#default-vehiclecode").hide();
				            $("#null-vehiclecode").hide();
				            $("#onlynumber").hide();
				            $("#overlap-vehiclecode").show();
				            $("#vehicle_code").val("");
				            $("#vehicle_code").focus();
				            return;
				         
				         } else if(id == "") {
				            $("#default-vehiclecode").hide();
				            $("#overlap-vehiclecode").hide();
				            $("#onlynumber").hide();
				            $("#null-vehiclecode").show();
				            $("#vehicle_code").focus();
				         }
				      },
				      error: function(xhr, error) {
				         console.error("error: " + error);
				      }
				   }); //ajax 마지막
				}); //$("#vehicle_code").on("change", function(e){ 의 마지막 
			}); //$(document).ready(function() 의 마지막
					
			

			function checkClosing(){ // 마감일 세팅 여부
				if($("#closingDate").val()=="true"){
					dialog("마감된 일자입니다. <br>저장되지 않았습니다", true);
				}
			}
	
			//// 등록,수정 같은 validation함수 insert()로 가능
			function insert(){
		   			if(!valid.nullCheck("vehicle_code", "차량 코드")) return false;
		   			if(!valid.numberCheck("vehicle_code", "차량 코드")) return false;
		   			if(!valid.nullCheck("classification", "차량 분류")) return false;
		   			if(!valid.nullCheck("staffNoId", "직급")) return false;
		   			if(!valid.nullCheck("ownerName", "차량 소유자")) return false;
		   			if(!valid.nullCheck("wideAddr", "주소")) return false;
		   			if(!valid.nullCheck("customerNo", "거래처")) return false;
		   			if(!valid.nullCheck("payDate", "매입일자")) return false;
		   			if(!valid.nullCheck("publicValue", "출시가")) return false;
		   			if(!valid.nullCheck("acqTax", "취득세")) return false;
		   			if(!valid.nullCheck("etcCost", "부대비용")) return false;
		   			if(!valid.nullCheck("deposit", "보증금")) return false;
		   			if(!valid.nullCheck("dueDate", "보증금 납부 예정일")) return false;
		   			if(!valid.nullCheck("feeDate", "월 사용료 납부 예정일")) return false;
		   			if(!valid.numberCheck("feeDate", "월 사용료 납부 예정일")) return false;	
		   			if(!valid.radioCheck("taxKind", "세금 종류")) return false;
	
		   			return true;
		        	}
			
			function update(){
	   			if(!valid.nullCheck("vehicle_code", "차량 코드")) return false;
	   			if(!valid.nullCheck("classification", "차량 분류")) return false;
	   			if(!valid.nullCheck("staffNoId", "직급")) return false;
	   			if(!valid.nullCheck("ownerName", "차량 소유자")) return false;
	   			if(!valid.nullCheck("wideAddr", "주소")) return false;
	   			if(!valid.nullCheck("customerNo", "거래처")) return false;
	   			if(!valid.nullCheck("payDate", "매입일자")) return false;
	   			if(!valid.nullCheck("publicValue", "출시가")) return false;
	   			if(!valid.nullCheck("acqTax", "취득세")) return false;
	   			if(!valid.nullCheck("etcCost", "부대비용")) return false;
	   			if(!valid.nullCheck("deposit", "보증금")) return false;
	   			if(!valid.nullCheck("dueDate", "보증금 납부 예정일")) return false;
	   			if(!valid.nullCheck("feeDate", "월 사용료 납부 예정일")) return false;
	   			if(!valid.numberCheck("feeDate", "월 사용료 납부 예정일")) return false;	
	   			if(!valid.radioCheck("taxKind", "세금 종류")) return false;

	   			return true;
	        	}
			
				//valid2
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
		        				$("#"+id).focus();
		        				return false;
		        			} else {
		        				return true;
		        			}
		        		}
		        
		        }
		        
			//valid3 dialog
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
									location.href="${pageContext.request.contextPath }/08/41";
								} else {
									$( this ).dialog( "close" ); 
								}
							}
						}
					]
				});
	    	} // valid dialog마지막
					
		
	
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
		
		//금액에 콤마 추가하기
		 function addCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); //string으로 변환시키면서 3자리수마다 ,붙여주기
		}
	
		//.keyup() - 키 입력 후 발생되는 이벤트 콤마가 추가되면서 나옴
		//console.log("값이 뭔가요?" + $(this).val());
		$("input[name=publicValue]").on('keyup', function(event){
			// $(this).val(addCommas($(this).val().replace(/[^0-9]/g,""))); //$(this).val()의 값의 콤마를 제거하고 다시 addCommas
			//console.log("값이 뭔가요?" + $(this).val()); //이거가 그냥 ,안붙는거
			//console.log("값이 뭔가요222?" + $(this).val().replace(/[^0-9]/g,""));
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		}); 
		
		$("input[name=acqTax]").on('keyup', function(event){
			 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		}); 
		
		$("input[name=etcCost]").on('keyup', function(event){
			 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		}); 
		
		$("input[name=deposit]").on('keyup', function(event){
			 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		}); 
		
		$("input[name=monthlyFee]").on('keyup', function(event){
			 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		}); 
		
		//input창에 값을 등록버튼 눌러서 보낼때는 ,를 빼서 보내야 하는것은 맞는데 이유는 데이터베이스 안에서는 int형으로 들어가야되서 
		$("#input-form").submit(function(event) {
		
		$("input[name=publicValue]").val($("input[name=publicValue]").val().replace(/[^0-9]/g,""));
			
		$("input[name=acqTax]").val($("input[name=acqTax]").val().replace(/[^0-9]/g,""));
		
		$("input[name=etcCost]").val($("input[name=etcCost]").val().replace(/[^0-9]/g,""));
		
		$("input[name=deposit]").val($("input[name=deposit]").val().replace(/[^0-9]/g,""));
		
		$("input[name=monthlyFee]").val($("input[name=monthlyFee]").val().replace(/[^0-9]/g,""));
		
		});
	}); //datepicker 함수 마지막


//엔터키 막기
document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
      $(this).next('.inputs').focus();
      event.preventDefault();
  }
}, true);



//차량 분류 변경시 이벤트 select Box
$(function() {
	
	
	$('#sectionNo').change(
		function() { 
	      var classification = $('#sectionNo option:selected').attr('vehiclecode'); //1000CC
	      console.log(classification);
	      $('#classification').val(classification); //val안에 classification안에 넣어야 한다.
	      
	      
		  	switch (classification){
		      case "1000CC" :
		    	  monthlyFee=1000000;
		          break;
		      case "1500CC" :
		    	  monthlyFee=1500000;
		  	    break;
		      case "2000CC" :
		    	  monthlyFee=2000000;
		          break;
		      case "2500CC" :
		    	  monthlyFee=2500000;
		          break;
		      case "3000CC" :
		    	  monthlyFee=3000000;
		      	break;
		  	}
	      
			function addCommas(x) {
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	      //월사용료 자동 입력 1000CC -> 1,000,000
	      monthlyFee = addCommas(monthlyFee);
	      $('#monthlyFee').val(monthlyFee);
	     
	     
		});
});

//거래처 코드 변경시 이벤트 select Box
$('#form-field-customerCode').change(function() {
	var customerCode = $('#form-field-customerCode option:selected').attr('customerCode');
	console.log(customerCode)
	$('#customerNo').val(customerCode);
	
	var managerName = $('#form-field-customerCode option:selected').attr('managerName');
	$('#customerManager').val(managerName); 
	

});


//직급 코드 변경시 이벤트 select Box
/* $('#staffNoId').change(function() {
	var staffCode = $('#staffNoId option:selected').attr('staffNo');
	$('#staffNoId').val(staffCode);

}); */


//사용개월 수 계산 함수
function calcMonth(index, item) {
	var payDate = $(item).text(); //매입날짜
	
	var today = new Date();	
	var ddd = today.getDate();
	var dd = "0"
	var mmm = (today.getMonth() + 1); //January is 0!	
	var mm = "0";
	var yyyy = new String(today.getFullYear());
	
	if(mmm < 10 ){ mm = mm + new String(mmm); } else { mm = mmm; }
	
	if(ddd < 10 ){ dd = dd + new String(ddd); } else { dd = ddd; }
	
	var currentDate  = yyyy + mm + dd;
	
	var payDateString  =  new Date(payDate.substr(0,4),payDate.substr(5,2),payDate.substr(8,2)); //매입일자 20191201
	var currentDateString  =  new Date(currentDate.substr(0,4),currentDate.substr(4,2),currentDate.substr(6,2)); //현재날짜 20191213
	
	var interval =  currentDateString - payDateString;
	var day   =  1000*60*60*24;
	var month  =  day*30;
	var year  =  month*12;
	var usingMonthCnt = parseInt(interval/month); //기간 사용 개월수
	
	$(item).parent().find(".using-month").text(usingMonthCnt);
};

//수정할때 select box 오류 수정하는 함수 1번
function updateSection(sectionCode){
	var options = document.getElementById("sectionNo");
	for(var i=0; i<options.length; ++i ){
		if(options[i].value == sectionCode){
			options[i].selected = "selected";
			$("#sectionNo_chosen").find("span")[0].innerHTML = options[i].innerHTML;
		}
	}
} 


function setMonth() {
	$('tr .pay-date').each(calcMonth)
};

$("#insert").click(function() {
	if(!insert()){
		return;
	}		
	$("#input-form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert");
	$("#input-form").attr("method","post");
	$("#input-form").submit();
});

$("#modify").click(function() {
	if(!update()){
		return;
	}		
	$("#input-form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update");
	$("#input-form").attr("method","post");
	$("#input-form").submit();

}); 

$("#delete").click(function() {
	  
	$("#input-form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
	$("#input-form").attr("method","post");
	$("#input-form").submit();
   	alert("삭제");
}); 

$("#search").click(function() {
	
	$("#input-form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add");
	$("#input-form").attr("method","GET");
	$("#input-form").submit();
	alert("조회");
})



//버튼 구현
$(function(){
	
	//버튼 막기 모달창이 바로 사라져버림 방지
	$('button').on('click', function(e) {
		e.preventDefault();
	}) 

 	 setMonth();
	 $(".chosen-select").chosen(); //대분류코드 + 거래처코드 + 직급  class=chosen-select ( select box있는 경우 )
});

// 테이블의 Row 클릭시 값 가져오기
$(document).on('click', '#sample-table-1 tr', function(event) {	
	$("#nabbu").hide();
	$("#walsa").hide();
	$("#segumBtn").show();

	
	var str = ""
	var tdArr = new Array();	// 배열 선언
	
	// 현재 클릭된 Row(<tr>)
	var tr = $(this); 
	var td = tr.children();

	var vehicleNo = td.eq(1).text();
	$("input[name=id]").val(vehicleNo);
	$("#vehicleNo").val(vehicleNo); //납부 Pop - up 에 차량코드 넣기.
	
	var carSectionNo = updateSection(td.eq(2).text());
	//var carSectionNo = td.eq(2).text();
	//$('#form_field_section_chosen').find('span').text(carSectionNo);
	
	var carSectionName = td.eq(3).text();
    $("input[name=classification]").val(carSectionName);
 
  // 직급
  var staffName = td.eq(4).text();   
  var staffNo='';
  
	switch (staffName){
  case "사원" :
  	staffNo=1;
      break;
  case "대리" :
  	staffNo=2;
	    break;
  case "과장" :
  	staffNo=3;
      break;
  case "차장" :
  	staffNo=4;
      break;
  case "부장" :
  	staffNo=5;
  	break;
  case "이사" :
  	staffNo=6;
  	break;
  case "상무" :
  	staffNo=7;
  	break;
  case "전무" :
  	staffNo=8;
  	break;
	}

	//선택된 직급에 대한 staffNo값을 value값으로 변경 
	$('#staffNoId').val(staffNo).trigger('chosen:updated');  

	var ownerName = td.eq(5).text();
  	$("input[name=ownerName]").val(ownerName);
  
  	var wideAddress = td.eq(6).text();
  	$("input[name=wideAddress]").val(td.eq(6).text());
	
	var cityAddress = td.eq(7).text();
  	$("input[name=cityAddress]").val(cityAddress);
  
  	var detailAddress = td.eq(8).text()
  	$("input[name=detailAddress]").val(detailAddress); 
  
  	var customerName = td.eq(10).text();
  	$('#form_field_customerCode_chosen').find('span').text(customerName);
  
  	var customerCode = td.eq(9).text();
  	$("input[name=customerNo]").val(customerCode);
  
  	var managerName = td.eq(11).text();
  	$("input[name=managerName]").val(managerName);
  
  	var payDate = td.eq(12).text(); //매입일자
  	$("input[name=payDate]").val(payDate);
  
  	var publicValue = td.eq(13).text();
  	$("input[name=publicValue]").val(publicValue);
  
  	var acqTax = td.eq(14).text();
  	$("input[name=acqTax]").val(acqTax);
  
  	var etcCost = td.eq(15).text();
  	$("input[name=etcCost]").val(etcCost);
  
  	var deposit = td.eq(16).text();
  	$("input[name=deposit]").val(deposit);
  	$("#depositPop").val(deposit); //보증금 납부버튼에 관련된 jquery
  
  	var dueDate = td.eq(17).text(); // 납부예정일
  	$("#dueDate").val(dueDate); //보증금 납부 예정일에 들어감"input[name=dueDate]대신에 id준 경우
  	$("#bonapil-input").val(dueDate); //납부 버튼에 보증금 예정 납부일이 input에 넣어짐
	//$("#walnapil-input").val(walnapil); //납부 버튼에 월사용료 예정 납부일이 input에 넣어짐
  
  	var MonthFee= td.eq(18).text();
  	$("#monthlyFee").val(MonthFee);
  	$("#monthlyFeePop").val(MonthFee); //월사용료 납부버튼에 관련된 jquery
  
  	var feeDate = td.eq(19).text();
  	$("#feeDate").val(feeDate);
  
  	var taxkind = td.eq(20).text()
  	
  	if(taxkind == "과세"){
	   $("#tax").prop('checked', true);
	}
	else if(taxkind == "영세"){
	   $("#zeroTax").prop('checked', true);
	}
  	var taxbillNo = td.eq(24).text();
  	$("#taxbillNo").val(taxbillNo);
  
  
	if(taxbillNo == "" ){
		console.log("세금계산서 번호 없으면 버튼 보여주기.")
		$("#insert").hide(); //등록 버튼 가리기
		$("#modify").show(); //수정 버튼 보여주기
		$("#delete").show(); //삭제 버튼 가리기
		$("#search").show(); //조회 버튼 가리기
		$("#clear").show(); //초기화 버튼 가리기

	}else {
		console.log("세금계산서 번호 있으면 버튼 가리기.");
		$("#insert").hide(); //등록 버튼 가리기
		$("#modify").hide(); //수정 버튼 보여주기
		$("#delete").show(); //삭제 버튼 가리기
		$("#search").hide(); //조회 버튼 가리기
		$("#clear").show(); //초기화 버튼 가리기
	} 
  
  $("#cusNo").val(customerCode); // 납부할때 거래처번호를 넘겨줘야 한다.

  
		  //보증금 + 월사용료
		  $.ajax({
				url: "${pageContext.request.contextPath }/08/41/taxinfo",
				contentType : "application/json; charset=utf-8",
				type: "GET",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: {id : vehicleNo},
				success: function(response){
					
					lastnapil = response.lastnapbuDate;
						
					if(lastnapil== null ){
						console.log("보증금 낸적이 없다.")
						$("#nabbu").show(); //납부 버튼 보여주기
		              return false;
				
					}else {
						console.log("보증금 낸적이 있다.");
						$("#nabbu").hide(); //납부 버튼 숨기기
						$("#walsa").show(); //월사용료 납부버튼 보이기
						var wal = Number(lastnapil.substr(5,2))+1; //wal.length가 안됨. wal이 number타입이기떄문
						var walString =  String(wal); //wal을 String으로 바꿔줌
					
					
						//달이 13일이 될 경우 다시 1월로 변경
					 	if(walString == 13)
						{
							walString = "1";
							
						} 
						//달이 한자리 수일때 0을 붙여줘서 01월 의 형식으로 출력되야 하므로
						if(walString.length==1){
							walString = "0" + walString;
							console.log("walnapil : "+ yyyy +"-"+ walString +"-"+ $("#feeDate").val());
							var walnapil = yyyy +"-"+ walString +"-"+ $("#feeDate").val();
							$("#walnapil-input").val(walnapil); 
						}else{ //달이 11,12월일때까지는 그대로 출력해야 하므로
							var walnapil = yyyy +"-"+ walString +"-"+ $("#feeDate").val();
							$("#walnapil-input").val(walnapil); 
						
						}
					
					
						var today = new Date();	
						var mmm = (today.getMonth() + 1); //January is 0!	
						var mm = "0";
						
						
						if(mmm < 10 ){
							mm = mm + new String(mmm);
			
						}else {
							mm = mmm;
						}
					
						var currentMonth  = mm;
						console.log("현재달" + currentMonth);
						console.log("월사용료 예정일 달" + walString);
						//현재달 1월과 월사용료 예정일 1월 이 같기 때문에 $("#walsa").show();
						if(walString == currentMonth){
							console.log("월사용료 = 현재달이라서 월사용료 납부버튼 보이기");
							$("#walsa").show();
						}
						//현재달 12월과 월사용료 예정일 1월이 다르기 때문에 $("#walsa").hide();
						else{
							console.log("월사용료 != 현재달이라서 월사용료 납부버튼 숨기기");
							//$("#walsa").hide();
						}
					}
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			}); //보증금 + 월사용료 ajax
		
		  
			var realPayDate = td.eq(23).text(); //실제로 납부한 날짜
		  console.log("realPayDate" + realPayDate);
		  
		
			//사용 개월  
			var payDate  =  td.eq(12).text();
			
			var today = new Date();	
			var ddd = today.getDate();
			var dd = "0"
			var mmm = (today.getMonth() + 1); //January is 0!	
			var mm = "0";
			var yyyy = new String(today.getFullYear());
			
			
			if(mmm < 10 ){
				mm = mm + new String(mmm);
		
			}else {
				mm = mmm;
			}
			
			if(ddd < 10 ){
				dd = dd + new String(ddd);
		
			}else {
				dd = ddd;
			}
			
			var currentDate  = yyyy + mm + dd;
			
			var payDateString  =  new Date(payDate.substr(0,4),payDate.substr(5,2),payDate.substr(8,2)); //매입일자 20191201
			var currentDateString  =  new Date(currentDate.substr(0,4),currentDate.substr(4,2),currentDate.substr(6,2)); //현재날짜 20191213
			
			var interval =  currentDateString - payDateString;
			var day   =  1000*60*60*24;
			var month  =  day*30;
			var year  =  month*12;
			
			
			var usingMonthCnt = parseInt(interval/month);  //기간 사용 개월수
			
			
			var monthlyFee = $('input[name=monthlyFee]').val().replace(/,/g, "");
			
			function addCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			$("input[name=usingMonth]").val(usingMonthCnt); //input의 name
		  	$("#all-monthly-fee").val(addCommas(monthlyFee*usingMonthCnt)); // 월 사용료 총 납부액

		  
		}); // 테이블의 Row 클릭시 값 가져오기 $(document).on('click', '#sample-table-1 tr', function(event) {	

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



		//보증금, 월사용료 관련 납부버튼
		$(function() {
			$("#dialog-message").dialog({
				autoOpen : false
			});
			$("#segumList").dialog({
				autoOpen : false
			});
		
			//보증금 납부버튼 클릭했을시
			$("#nabbu").on( "click", function() {
				$("#monthlyFeePop").hide();
				$(".monthfee").hide();
				$("#walnapil-label").hide();
				$("#walnapil-input").hide();
				$("#depositPop").show();
				$(".deposits").show();
				$("#bonapil-label").show();
				$("#bonapil-input").show();
				
				//보증금에 대한 납부 버튼
				$("#gubun").val("보증금");
				$("#dialog-message").dialog('open');
				$("#dialog-message").dialog	({
					title: "세금계산서정보",
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
				    		$("#nabbu").hide();
				          	$(this).dialog('close');
				          	$('#tbody-bankList tr').remove();
				        }
				    }
				});
			});
			
			//월사용료 납부버튼 클릭했을시
			$("#walsa").on( "click", function() {
				$("#monthlyFeePop").show();
				$(".monthfee").show();
				$("#walnapil-label").show();
				$("#walnapil-input").show();
				$("#depositPop").hide();
				$(".deposits").hide();
				$("#bonapil-label").hide();
				$("#bonapil-input").hide();
				
			
				$("#gubun").val("월사용료");
				$("#dialog-message").dialog('open');
				$("#dialog-message").dialog	({
					title: "세금계산서정보",
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
				    		$("#walsa").hide();
				          	$(this).dialog('close');
				           	$('#tbody-bankList tr').remove();
				        }
			    }
			});
		});
			
		//세금계산서 리스트 출력 ajax
			$("#segumBtn").on( "click", function() {
				
				$("#tbody-segumList").find("tr").remove();
				
				var id =  $("input[name=id]").val(); //차량코드 id값 받아와야지 세금계산서 출력 가능
				
				$.ajax({
					url: "${pageContext.request.contextPath }/08/41/taxinfo",
					contentType : "application/json; charset=utf-8",
					type: "GET",
					dataType: "json", 
					data: {id : id},
					success: function(response){
						console.log(response.taxlist);
						data = response.taxlist;
				 		for(let k in data) {
				 			$("#tbody-segumList").append("<tr>" +
				                         "<td class='center'>" + data[k].vehicleNo + "</td>" +
				                         "<td class='center'>" + data[k].pay + "</td>" +
				                         "<td class='center'>" + data[k].paymentDate + "</td>" +
				                         "<td class='center'>" + data[k].dueDate + "</td>" +
				                         "<td class='center'>" + data[k].taxbillNoPoP + "</td>" +
				                         "<td class='center'>" + data[k].voucherNo + "</td>" +
				                         "<td class='center'>" + data[k].gubun + "</td>" +
				                         "</tr>");
				 		} 
						
					},
					error: function(xhr, error){
						console.error("error : " + error);
					}
				});
		
				//세금계산서 정보 모달
				$("#segumList").dialog('open');
				$("#segumList").dialog	({
					title: "세금계산서정보",
					title_html: true,
				   	resizable: false,
				    height: 700,
				    width: 600,
				    modal: true,
				    close: function() {
				    	$('#tbody-sseList tr').remove();
				    },
				    buttons: {
				    "닫기" : function() {
				          	$(this).dialog('close');
				          	$('#tbody-sseList tr').remove();
				        }
				    }
				}); //$("#segumList").dialog	({ 의 마지막
			});	//$("#segumBtn").on( "click", function() { 의 마지막
		}); //보증금, 월사용료 관련 납부버튼의 마지막

		
</script>

</body>
</html>