<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
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
									  <input readonly type="text" class="span6" id="classification" name="classification" value="001" placeholder="코드를 지정하면 대분류명이 등록됩니다">
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">주소(광역)</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="wideAddr" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">주소(읍/면/동)</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="localAddr" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">거래처 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="customerNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="customerVo">
												<option value="${customerVo.no }">${customerVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="form-input-readonly" value="코드를 지정하면 거래처명이 등록됩니다">
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
										<input readonly type="text" class="span6" id="form-input-readonly" value="최대 60개월">
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
												<select class="chosen-select-1" name="staffNo" data-placeholder="전체">
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
									<label class="control-label" for="form-field-select-1">주소(시/군/구)</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="cityAddr" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">주소(상세)</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="detailAddr" placeholder="주소를 상세히 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 담당자</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="customerManager" placeholder="이름을 입력하세요"/>
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
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">세금계산서 번호</label>
									<div class="controls">
										<input type="text" class="span7" id="form-field-1" name="taxbillNo" placeholder="12자로 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">보증금 납부일자</label>
									<div class="controls">
										<input class="cl-date-picker" type="text" style="width:150px" id="form-field-1" name="depositDate" placeholder=""/>	
										<i class="icon-calendar"></i>
									</div>
								</div>
								
								<div class="control-group">
									<div style="float:left;width:50%">	
										<label class="control-label" for="form-field-1">사용료 납부일</label>
										<div class="controls">
											<input type="text" class="span10" id="form-field-1" name="feeDate" placeholder="일자 2자리를 입력하세요"/>
										</div>
									</div>
									<div style="float:left;width:50%" >											
										<label class="control-label" for="form-field-1" >구분</label>
										<div class="controls">
											<input type="radio" name="taxKind" value="과세">과세
											<input type="radio" name="taxKind" value="영세">영세
										</div>
									</div>	
								</div>
								
							</div><!-- 대변 span -->
							
							
							<div class="row-fluid">
								<div class="span12">
								<div class="hr hr-18 dotted"></div>
								<div class="controls" style="margin-left: 0px;">
									<div class="controls" style="margin-left: 0px;">
										   <button type="submit" class="btn btn-primary btn-small" id="insert" style="float:left; margin-right:20px;">등록</button>
			                               <button type="submit" class="btn btn-warning btn-small" id="modify" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
			                               <button class="btn btn-danger btn-small" id="delete" style="float:left;margin-right:20px;">삭제</button>
			                               <button class="btn btn-info btn-small" id="search" style="float:left;margin-right:20px;"formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search">조회</button>
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
												<th>소유자</th>
												<th>주소(광역)</th>
												<th>주소(기초)</th>
												<th>주소(지번)</th>
												<th>주소(상세)</th>
												<th>매입일자</th>
												<th>매입거래처코드</th>
												<th>매입거래처담당자</th>
												<th>출시가(원)</th>
												<th>등록세(원)</th>
												<th>취득세(원)</th>
												<th>부대비용(원)</th>
												<th>보증금(원)</th>
												<th>월 사용료(원)</th>
												<th>보증금 납부일자</th>
												<th>사용료 납부일</th>
												<th>과세/영세</th>
												<th>사용개월</th>
												<th>세금계산서번호</th>
												<th>작성자</th>
												<th>작성일자</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${list }" var = "VehicleVo" varStatus="status">
										
											<tr id="ㄷ">
												<td class="center">
													<label>
														<input type="checkbox" class="ace" name="checkRow" value="${content.IDX}"  />
														<span class="lbl"></span>
													</label>
												</td>

											 	<td>${status.count }</td> 
												<td>${VehicleVo.id}</td>
												<td>${VehicleVo.sectionNo}</td>
												<td>${VehicleVo.classification}</td>
												<td>${VehicleVo.staffName}</td>
												<td>${VehicleVo.ownerName}</td>
												<td>주소(광역)</td>
												<td>주소(기초)</td>
												<td>주소(지번)</td>
												<td>주소(상세)</td>
												<td>${VehicleVo.payDate}</td>
												<td>매입거래처코드</td>
												<td>매입거래처담당자</td>
												<td>${VehicleVo.publicValue}</td>
												<td>${VehicleVo.regTax}</td>
												<td>${VehicleVo.acqTax}</td>
												<td>${VehicleVo.etcCost}</td>
												<td>${VehicleVo.deposit}</td>
												<td>${VehicleVo.monthlyFee}</td>
												<td>${VehicleVo.depositDate}</td>
												<td>${VehicleVo.feeDate}</td>
												<td>${VehicleVo.taxKind}</td>
												<td>사용개월</td>
												<td>세금계산서번호</td>
												<td>작성자</td>
												<td>작성일자</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
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
<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>

<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
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
	
<script>
function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
}
</script>

<script>
function deleteAction(){
	var checkRow = "";
	 $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow = checkRow + $(this).val()+"," ;
		  });
	 checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
	 
	  if(checkRow == ''){
	    alert("삭제할 대상을 선택하세요.");
	    return false;
	  }
	  console.log("### checkRow => {}"+checkRow);
}
</script>


<script>
/* //대분류코드 select box 변경시 이벤트
$('#form-field-section').change(
	function() { 
      var sectionCode = $('#form-field-section option:selected').val(); //1000CC
      alert("첫번째" + sectionCode)
      var classification = $('#classification').val(); //1000cc
      alert("두번째" + classification)
}); */

$('#form-field-section').change(
		function() { 
	      var classification = $('#form-field-section option:selected').attr('vehiclecode'); //1000CC
	    
	     $('#classification').val(classification); //val안에 classification안에 넣어야 한다.
	   
	});
</script>

<script>
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
   }); 
});
</script>
</body>
</html>