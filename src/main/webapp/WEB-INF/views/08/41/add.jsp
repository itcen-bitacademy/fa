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
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">차량관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							
							<div class="span6"><!-- 차변 -->
								<div class="control-group">
									<label class="control-label" for="form-field-1">차량 코드</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="id" placeholder="9자로 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">대분류 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-section" name="sectionNo" data-placeholder="전체">
											<c:forEach items="${sectionList }" var="sectionVo">
												<option vehiclecode="${sectionVo.classification}" value="${sectionVo.code }">${sectionVo.code }</option>
											</c:forEach>
										</select>
										<!-- <input readonly type="text" class="span6" id="form-input-readonly"  value="코드를 지정하면 대분류명이 등록됩니다"> -->
									<!-- 	<input readonly type="text" class="span6" id="classification"  value="코드를 지정하면 대분류명이 등록됩니다"> -->
									  <input readonly type="text" class="span6" id="classification" name="classification" value="1000CC" placeholder="코드를 지정하면 대분류명이 등록됩니다">
									</div>
								</div>
								
								<div class="control-group">
		                           <label class="control-label" for="form-field-1">주소(광역)</label>
		                           <div class="controls">
		                              <input class="span2" onclick="execDaumPostcode()" class="btn-primary box" type="button" value="주소 찾기">
		                              <input class="span4" readonly type="text" id="wideAddr" name="wideAddress" placeholder="주소를 선택하면 입력됩니다.">
		                              <input style="width:230px"class="span5" readonly type="text" id="cityAddr" name="cityAddress" placeholder="주소를 선택하면 입력됩니다.">
		                           </div>
		                        </div>
								
						<%-- 		<div class="control-group">
									<label class="control-label" for="form-field-select-1">주소(읍/면/동)</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="localAddr" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
									</div>
								</div> --%>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">거래처 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-customerCode" name="customerName" data-placeholder="전체">
											<c:forEach items="${customerList }" var="customerVo">
												<option managerName="${customerVo.managerName }" customerCode="${customerVo.no }"  value="${customerVo.no }">${customerVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="customerNo" name="customerNo" value="거래처명을 지정하면 코드가 등록됩니다">
									</div>
								</div>
								
								
								<div class="control-group">
									<div style="float:left;width:50%">											
										<label class="control-label" for="form-field-1">매입일자</label>
										<div class="controls">
											<input class="cl-date-picker" style="width:150px" type="text" id="form-field-1" name="payDate" placeholder=""/> <i class="icon-calendar"></i>
										</div>
									</div>	
									<div style="float:left;width:50%">											
										<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">출시가</label>
										<input style="width:200px" type="text" id="form-field-1" name="publicValue" placeholder="금액을 입력하세요"/>
									</div>	
								</div>
                       		
								<div class="control-group">
									<label class="control-label" for="form-field-1">부대비용</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="etcCost" placeholder="금액을 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">보증금</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="deposit" placeholder="금액을 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">월 사용료</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="monthlyFee" placeholder="금액을 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
								<div style="float:left;width:50%">											
									<label class="control-label" for="form-field-1">사용 개월</label>
									<div class="controls">
										<input readonly type="text" class="span6" id="usingMonth" name="usingMonth" value="최대 60개월">
									</div>
								</div>	
								<div style="float:left;width:50%">											
									<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">월 사용료 납부금액</label>
									<input readonly type="text" class="span6" id="form-input-readonly" value="월 누적금액">
								</div>
							</div>	
                       	</div>
					
							
						<div class="span6"><!-- 대변 -->
							
								
			
								<div class="control-group" style="margin-top:50px">
									<div style="float:left;width:50%">											
										<label class="control-label" for="form-field-1">직급</label>
											<div class="controls" style="width:90%">
												<select class="chosen-select" id="form-field-classification" name="staffNo" data-placeholder="전체">
												<!-- <select class="chosen-select-1" id="form-field-select-1" name="staffName" data-placeholder="전체"> -->
													<c:forEach items="${jikNameList}" var="StaffVo">
														<option value="${StaffVo.no }">${StaffVo.staffName }</option>
													</c:forEach>
												</select>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:80px; margin-right:10px;" class="control-label" for="form-field-1">사용자</label>
											<input type="text" id="form-field-1" name="ownerName" placeholder="차량 사용자를 입력하세요"/>
										</div>	
								</div>
								
						
								<div class="control-group">
		                           <label class="control-label" for="form-field-1">상세주소</label>
		                           <div class="controls">
		                              <input type="text" id="detailAddr" name="detailAddress" placeholder="상세주소를 입력하세요"/>
		                           </div>
		                        </div>
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 담당자</label>
									<div class="controls">
										<input type="text" id="customerManager" name="managerName" placeholder="이름을 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<div style="float:left;width:50%">											
										<label class="control-label" for="form-field-1">등록세</label>
										<div class="controls" style="width:90%">
											<input type="text" id="form-field-1" name="regTax" placeholder="금액을 입력하세요"/>
										</div>
									</div>	
									<div style="float:left;width:50%">											
										<label style="width:80px; margin-right:10px;" class="control-label" for="form-field-1">취득세</label>
										<input type="text" id="form-field-1" name="acqTax" placeholder="금액을 입력하세요"/>
									</div>	
								</div>
								
								
							<!-- 	<div class="control-group">
									<label class="control-label" for="form-field-1">세금계산서 번호</label>
									<div class="controls">
										<input type="text" class="span7" id="form-field-1" name="taxbillNo" placeholder="12자로 입력하세요"/>
									</div>
								</div> 
								-->
								
								<div class="control-group">
									<div style="float:left;width:50%">											
										<label class="control-label" for="form-field-1">보증금 납부일자</label>
										<div class="controls" style="width:90%">
											<input class="cl-date-picker" type="text" style="width:150px" id="depositDate" name="depositDate" placeholder=""/>	
										<i class="icon-calendar"></i>
										</div>
									</div>	
									<div style="float:left;">											
										<button class="btn btn-default btn-small" id="nabbu" style="float:right;margin-right:20px;" type="reset">납부</button>
									</div>	
								</div>
								
								
								
								<div class="control-group">
									<div style="float:left;width:50%">	
										<label class="control-label" for="form-field-1">월 사용료 납부일</label>
										<div class="controls">
											<input type="text" class="span10" id="feeDate" name="feeDate" placeholder="일자 2자리를 입력하세요"/>
										</div>
									</div>
									<div style="float:left;">											
										<button class="btn btn-default btn-small" id="walsa" style="float:right;margin-right:20px;" type="reset">납부</button>
									</div>	
								</div>
								
									<div class="control-group">
										<div style="float:left;width:50%" >											
											<label class="control-label" for="form-field-1" >구분</label>
											<div class="controls">
												<input type="radio" name="taxKind" id="tax" value="과세">과세
												<input type="radio" name="taxKind" id="zeroTax" value="영세">영세
											</div>
										</div>	
									</div>
									<div class="control-group">
										<div class="controls">
											<button class="btn btn-default btn-small" id="segumBtn">세금계산서보기</button>
										</div>
									</div>
							</div><!-- 대변 span -->
							
							
							<div class="row-fluid">
								<div class="span12">
								<div class="hr hr-18 dotted"></div>
								<div class="controls" style="margin-left: 0px;">
									<div class="controls" style="margin-left: 0px;">
										   <button type="submit" class="btn btn-primary btn-small" id="insert" style="float:left; margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">등록</button>
			                               <button type="submit" class="btn btn-warning btn-small" id="modify" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
			                               <button class="btn btn-danger btn-small" id="delete" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode}/delete">삭제</button>
			                               <button class="btn btn-info btn-small" id="search" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">조회</button>
			                               <button class="btn btn-default btn-small" id="clear" style="float:left;margin-right:20px;" type="reset">초기화</button>
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
								<div>
									<table id="sample-table-1" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
													<label>
														<input type="checkbox" name="checkAll" id="th_checkAll" class="ace" onclick="checkAll();"/>
														<span class="lbl"></span>
													</label>
												</th>
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
												<th>등록세(원)</th>
												<th>취득세(원)</th>
												<th>부대비용(원)</th>
												<th>세금계산서번호</th>
												<th>보증금(원)</th>
												<th>보증금 납부일자</th>
												<th>월 사용료(원)</th>
												<th>월 사용료 납부일</th>
												<th>과세/영세</th>
												<th>사용개월</th>
												<th>월 사용료 납부금액</th>
												<!-- <th>작성자</th>
												<th>작성일자</th> -->
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${list }" var = "VehicleVo" varStatus="status">
											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" name="checkRow" value="${content.IDX}"  />
														<span class="lbl"></span>
													</label>
												</td>

											 	<td>${status.count }</td> 
												<td class="vehicle-id">${VehicleVo.id}</td>
												<td>${VehicleVo.sectionNo}</td>
												<td>${VehicleVo.classification}</td>
												<td>${VehicleVo.staffName}</td>
												<td>${VehicleVo.ownerName}</td>
												<td>${VehicleVo.wideAddress}</td>
												<td>${VehicleVo.cityAddress}</td>
												<td>${VehicleVo.detailAddress}</td>
												<td>${VehicleVo.customerNo}</td>
												<td>${VehicleVo.customerName}</td>
												<td>${VehicleVo.managerName}</td>
												<td class="pay-date">${VehicleVo.payDate}</td>
												<td><fmt:formatNumber value="${VehicleVo.publicValue}" pattern="#,###"></fmt:formatNumber></td>
												<td><fmt:formatNumber value="${VehicleVo.regTax}" pattern="#,###"></fmt:formatNumber></td>
												<td><fmt:formatNumber value="${VehicleVo.acqTax}" pattern="#,###"></fmt:formatNumber></td>
												<td><fmt:formatNumber value="${VehicleVo.etcCost}" pattern="#,###"></fmt:formatNumber></td>
												<td><button type="button" class="myBtn">세금계산서번호</button></td>
												<td><fmt:formatNumber value="${VehicleVo.deposit}" pattern="#,###"></fmt:formatNumber></td>
												<td>${VehicleVo.depositDate}</td>
												<td class="monthly-fee"><fmt:formatNumber value="${VehicleVo.monthlyFee}" pattern="#,###"></fmt:formatNumber></td>
												<td>${VehicleVo.feeDate}</td>
												<td>${VehicleVo.taxKind}</td>
												<td class="using-month"></td>
												<td class="month-cost"></td>
										
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
							<div id="dialog-message" title="세금계산서번호" hidden="hidden">
															<table id ="dialog-message-table" align="center">
																<tr>
																	<td>
																	<form action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/segum" method="POST">
																		<label>세금계산서번호</label>
																		<input type="text"  id="input-dialog-bankname" name="taxbillNo" placeholder="세금계산서번호"/>
																		<label>차량코드</label>
																		<input readonly type="text" id="vehicleNo" name="vehicleNo" value="차량코드">
																		<label>납부일</label>
																		<input readonly type="text" id="paymentDate" name="paymentDate" value="납부일">
																		<label class="deposits">보증금</label>
																		<input readonly type="text" class="deposits" name="deposit" value="보증금">
																		<label class="monthfee">월 사용료</label>
																		<input readonly type="text" class="monthfee" name="monthlyFee" value="월 사용료">
																		<input type="hidden" id="cusNo" name="cusNo" value="">
																		<input type="hidden" id="gubun" name="gubun" value="">
																		<button class="btn btn-info btn-small" id="segum" style="float:right;margin-left:10px;">입력</button>
																	</form>				
																	</td>
																</tr>
															</table>
														<!-- 차량코드, 납부일, 세금계산서 번호 데이터 리스트 -->
														<!-- <table id="modal-bank-table" class="table  table-bordered table-hover">
															<thead>
																<tr>
																	<th class="vehicle-code">차량코드</th>
																	<th class="pay-day">납부일</th>
																	<th class="center">세금계산서번호</th>
																</tr>
																<tr>
																	<td>c</td>
																	<td>s</td>
																	<td>t</td>
																</tr>
																
															</thead>
															<tbody id="tbody-bankList">
															</tbody>
														</table> -->
												</div>
												
										<div id="segumList" title="차량 세금계산서" hidden="hidden">
														<!-- 차량코드, 납부일, 세금계산서 번호 데이터 리스트 -->
														<table id="segum-table" class="table  table-bordered table-hover">
															<thead>
																<tr>
																	<th class="vehicle-code">차량코드</th>
																	<th class="pay-day">납부일</th>
																	<th class="pay-day">가격</th>
																	<th class="center">세금계산서번호</th>
																	<th class="center">전표번호</th>
																	<th class="center">구분</th>
																</tr>
																<tr>
																	<td>c</td>
																	<td>s</td>
																	<td>t</td>
																	<td>t</td>
																	<td>t</td>
																	<td>t</td>
																</tr>
																
															</thead>
															<tbody id="tbody-segumList">
															</tbody>
														</table>
												</div>
								
										<div class="pagination">
											<ul>
												<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
												<li class="active"><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">5</a></li>
												<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
											</ul>
										</div>
								</div>					
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

$(document).ready(function(){
	$("#nabbu").hide();
	$("#walsa").hide();
	$("#segumBtn").hide();
});
$(function(){
	$(".chosen-select").chosen(); 
});
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
});


$(function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
});

/* //대분류코드 select box 변경시 이벤트
$('#form-field-section').change(
	function() { 
      var sectionCode = $('#form-field-section option:selected').val(); //1000CC
      alert("첫번째" + sectionCode)
      var classification = $('#classification').val(); //1000cc
      alert("두번째" + classification)
}); */
$(function() {
$('#form-field-section').change(
		function() { 
	      var classification = $('#form-field-section option:selected').attr('vehiclecode'); //1000CC
	    
	     $('#classification').val(classification); //val안에 classification안에 넣어야 한다.
		});
});

$('#form-field-customerCode').change(function() {
	var customerCode = $('#form-field-customerCode option:selected').attr('customerCode');
	console.log(customerCode)
	$('#customerNo').val(customerCode);
	
	var managerName = $('#form-field-customerCode option:selected').attr('managerName');
	$('#customerManager').val(managerName); 
	

});

function calcMonth(index, item) {
	var payDate = $(item).text();
	
	var today = new Date();	
	var ddd = today.getDate();
	var dd = "0"
	var mmm = (today.getMonth() + 1); //January is 0!	
	var mm = "0";
	var yyyy = new String(today.getFullYear());
	
	if(mmm < 10 ){ mm = mm + new String(mmm); } else { mm = mmm; }
	
	if(ddd < 10 ){ dd = dd + new String(ddd); } else { dd = ddd; }
	
	var currentDate  = yyyy + mm + dd;
	
	var date1  =  new Date(payDate.substr(0,4),payDate.substr(5,2),payDate.substr(8,2));
	var date2  =  new Date(currentDate.substr(0,4),currentDate.substr(4,2),currentDate.substr(6,2));
	
	console.log("date1 : " + date1);
	console.log("date2 : " + date2);
	
	var interval =  date2 - date1;
	var day   =  1000*60*60*24;
	var month  =  day*30;
	var year  =  month*12;
	
	$(item).parent().find(".using-month").text(parseInt(interval/month));
/* 	$(item).parent().find(".month-cost").text((parseInt(interval/month))*(td.eq(22).text()));
	console.log((parseInt(interval/month))*(td.eq(22).text()));  */
};

function setMonth() {
	$('tr .pay-date').each(calcMonth)
	//$('tr .monthly-fee').each(calcMonth)
};

/* //여기서 월 사용료 납부 금액
function calcMonthCost(index, item) {

	
	$(item).parent().find(".month-cost").text(parseInt(interval/month)*);
}; 

function setMonth() {
	$('tr .pay-date').each(calcMonth)
};
*/

//버튼 구현
$(function(){
   $("#insert").click(function() {
      alert("등록");
   });
   
   $("#modify").click(function() {
      alert("수정");
   }); 
   
   $("#delete").click(function() {
      alert("삭제");
   }); 
   
   $("#search").click(function() {
      alert("조회");
   })
   
   setMonth();
});


 // 테이블의 Row 클릭시 값 가져오기
$("#sample-table-1 tr").click(function(){

	var str = ""
	var tdArr = new Array();	// 배열 선언
	
	// 현재 클릭된 Row(<tr>)
	var tr = $(this); 
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.

	
	//console.log("배열에 담긴 값 : "+tdArr);
	
	//td.eq(index)를 통해 값을 가져올 수도 있다.
	var vehicleNo = $("input[name=id]").val(td.eq(2).text());
	$("#vehicleNo").val(td.eq(2).text()); //차량코드 납부버튼에 관련된 jquery
	$('#form-field-section').val(td.eq(3).text()).trigger('chosen:updated');
    $("input[name=classification]").val(td.eq(4).text());
    //$('#form_field_classification_chosen').find('span').text(td.eq(5).text());
    
    // 직급
    var staff='';
    
	switch (td.eq(5).text()){
    case '사원' :
    	staff=1;
        break;
    case '대리' :
    	staff=2;
	    break;
    case '과장' :
    	staff=3;
        break;
    case '차장' :
    	staff=4;
        break;
    case '부장' :
    	staff=5;
    	break;
    case '이사' :
    	staff=6;
    	break;
    case '상무' :
    	staff=7;
    	break;
    case '전무' :
    	staff=8;
    	break;
	}

	$('#form-field-classification').val(staff).trigger('chosen:updated');
    $("input[name=ownerName]").val(td.eq(6).text());
  	$("input[name=wideAddress]").val(td.eq(7).text());
    $("input[name=cityAddress]").val(td.eq(8).text());
    $("input[name=detailAddress]").val(td.eq(9).text()); 
    $('#form_field_customerCode_chosen').find('span').text(td.eq(11).text())
    $("input[name=customerNo]").val(td.eq(10).text());
    $("input[name=managerName]").val(td.eq(12).text());
    $("input[name=payDate]").val(td.eq(13).text());
    $("input[name=publicValue]").val(td.eq(14).text().replace(/,/g, ""));
    $("input[name=regTax]").val(td.eq(15).text().replace(/,/g, ""));
    $("input[name=acqTax]").val(td.eq(16).text().replace(/,/g, ""));
    $("input[name=etcCost]").val(td.eq(17).text().replace(/,/g, ""));
   // $("input[name=taxbillNo]").val(td.eq(19).text());
    $("input[name=deposit]").val(td.eq(19).text().replace(/,/g, "")); 
    $("#deposits").val(td.eq(19).text()); //보증금 납부버튼에 관련된 jquery
    $("#cusNo").val(td.eq(10).text());
    $("input[name=depositDate]").val(td.eq(20).text());
    $("#paymentDate").val(td.eq(20).text()); //보증금 납부일 납부버튼에 관련된 jquery
    $("input[name=monthlyFee]").val(td.eq(21).text().replace(/,/g, ""));
    $("#monthfee").val(td.eq(21).text()); //월 사용료 납부일 납부버튼에 관련된 jquery
    $("input[name=feeDate]").val(td.eq(22).text());
    
    
    var today = new Date();	
	var ddd = today.getDate();
	var dd = "0"
	var mmm = (today.getMonth() + 1); //January is 0!	
	var mm = "0";
	var yyyy = new String(today.getFullYear());
	
	if(mmm < 10 ){ mm = mm + new String(mmm); } else { mm = mmm; }
	
	if(ddd < 10 ){ dd = dd + new String(ddd); } else { dd = ddd; }
	
	var currentDate  = yyyy + mm + dd;
	
	// 보증금 날짜 비교하기 
	var depositDate = $("#depositDate").val();
	depositDate = depositDate.replace(/-/g, "");
	console.log("C " + currentDate)
	console.log("D " + depositDate)
	
	if(depositDate < currentDate || depositDate == currentDate){
		$("#nabbu").show();
	}else{
		$("#nabbu").hide();
	}
	
	// 월사용료 날짜 비교하기위해서. 현재날짜 + 월사용료 일수 가져오기
	var walsaDate  = yyyy + mm + $("#feeDate").val();
	
	console.log(walsaDate);
	
	if(walsaDate < currentDate || walsaDate == currentDate){
		$("#walsa").show();
	}else{
		$("#walsa").hide();
	}
$(function() {
		$("#segumList").dialog({
			autoOpen : false
		});
		
	$("#segumBtn").show();
    $("#segumBtn").on( "click", function() {
		$("#gubun").val("월사용료");
	/*  console.log("eeeee" + $(this).parent().find(".vehicle-id").text());*/
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
		});
	});
});
    
    

	//사용 개월  
	var payDate  =  td.eq(20).text();
	
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
	
//	console.log("today : " + today);
//	console.log("mm : " + mm);
//	console.log("dd : " + dd);
	
//	console.log("input1 : " + input1);
//	console.log("input2 : " + input2);	
	 
	
	
	var date1  =  new Date(payDate.substr(0,4),payDate.substr(5,2),payDate.substr(8,2));
	var date2  =  new Date(currentDate.substr(0,4),currentDate.substr(4,2),currentDate.substr(6,2));
	
	console.log("date1 : " + date1);
	console.log("date2 : " + date2);
	
	var interval =  date2 - date1;
	var day   =  1000*60*60*24;
	var month  =  day*30;
	var year  =  month*12;
	
	//alert("기간 날짜수"+parseInt(interval/day));
	//alert("기간 개월수"+parseInt(interval/month));
	//alert("기간 년수"+parseInt(interval/year));
	
    $("input[name=usingMonth]").val(parseInt(interval/month)); //input의 name
    $('#tdUsingMonth').val(parseInt(interval/month));  // input의 ID 
     
    if(td.eq(23).text() == "과세"){
   	   $("input[id=tax]").prop('checked', true);
     }
    else if(td.eq(23).text() == "영세"){
   	   $("input[id=zeroTax]").prop('checked', true);
     } 
    
    
    
    
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


$(function() {
	$("#dialog-message").dialog({
		autoOpen : false
	});

	$("#nabbu").on( "click", function() {
			$(".monthfee").hide();
			$(".deposits").show();
			$("#gubun").val("보증금");
		/*  console.log("eeeee" + $(this).parent().find(".vehicle-id").text());*/
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
	
	$("#walsa").on( "click", function() {
		$(".monthfee").show();
		$(".deposits").hide();
		$("#gubun").val("월사용료");
	/*  console.log("eeeee" + $(this).parent().find(".vehicle-id").text());*/
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
});
</script>
</body>
</html>