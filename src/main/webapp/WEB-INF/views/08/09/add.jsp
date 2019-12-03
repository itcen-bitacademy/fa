<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

</head>
<body class="skin-3">
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
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							<div class="span6"><!-- 차변 -->
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">토지 코드1</label>
									<div class="controls">
											<input type="text" id="land_code" name="id" placeholder="9자를 입력하세요"/>
										<input readonly type="text" class="span6" style="border:none" placeholder="ex)2019년12월03일 191203001">
									</div>									
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">대분류 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-section" name="classification" data-placeholder="전체">
											<c:forEach items="${sectionList }" var="sectionVo">
												<option landcode="${sectionVo.code }" value="${sectionVo.classification }">${sectionVo.classification }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="code" name="sectionNo" value="001" placeholder="대분류명을 선택하면 코드값이 입력됩니다.">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">주소(광역)</label>
									<div class="controls">
										<select class="chosen-select" id="wideAddr" name="wideAddress" data-placeholder="광역 선택">
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">주소(읍/면/동)</label>
									<div class="controls">
										<select class="chosen-select" id="localAddr" name="localAddress" data-placeholder="읍/면/동 선택">
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">거래처 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-customerCode" name="customerNo" data-placeholder="선택">
											<c:forEach items="${listMainMenu }" var="customerVo">
												<option value="${customerVo.no }">${customerVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="customerName" name="customerName" value="코드를 지정하면 거래처명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label class="control-label" for="id-date-picker-1">매입일자</label>
									<div class="controls" style="width:90%">
										<input readonly class="cl-date-picker" id="id-date-picker-1" name="payDate"  type="text" >
										<div class="input-append">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
										</div>	
										<div style="float:left;margin-left:10px">											
											<label style="width:60px; margin-left:15px; margin-right:10px;" class="control-label" for="form-field-1">공시지가</label>
											<input style="width:190px;" type="text" id="publicValue" name="publicValue" placeholder="금액을 입력하세요"/>
										</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">
											<label class="control-label" for="form-field-1">등록세</label>
											<div class="controls">
												<input type="text" id="regTax" name="regTax" placeholder="금액을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">취득세</label>
											<input type="text" id="acqTax" name="acqTax" placeholder="금액을 입력하세요"/>
										</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label class="control-label" for="form-field-1">토지소유자</label>
											<div class="controls">
												<input type="text" id="ownerName" name="ownerName" placeholder="이름을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">합병코드</label>
											<input type="text" id="combineNo" name="combineNo" placeholder="합병코드번호를 입력하세요"/>
										</div>
								</div>
							</div><!-- 차변 span -->
							<div class="span6"><!-- 대변 -->
								<div class="control-group" style="margin-top:50px;">
									<label class="control-label" >평수</label>
									<div class="controls">
										<input type="text" id="area" name="landArea" placeholder="숫자만 입력해주세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">주소(시/군/구)</label>
									<div class="controls">
										<select class="chosen-select" id="cityAddr" name="cityAddress" data-placeholder="시/군/구 선택">
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">상세주소</label>
									<div class="controls">
										<input type="text" class="span7" id="detailAddr" name="detailAddress" placeholder="상세주소를 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">담당자</label>
									<div class="controls">
										<input readonly type="text" id="form-input-readonly" id="customerManager" name="customerManager" value="담당자자동입력"/>
									</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label class="control-label" for="form-field-1">취득금액</label>
											<div class="controls">
												<input type="text" id="acqPrice" name="acqPrice" placeholder="금액을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">기타비용</label>
											<input type="text" id="etcCost" name="etcCost" placeholder="금액을 입력하세요"/>
										</div>	
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">세금계산서번호</label>
									<div class="controls">
										<input type="text" class="span7" id="taxbillNo" name="taxbillNo">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-2">구분</label>
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
							 	   <button class="btn btn-primary btn-small" id="insert" style="float:left; margin-right:20px;"  formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">등록</button>
	                               <button class="btn btn-warning btn-small" id="modify" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
	                               <button class="btn btn-danger btn-small" id="delete" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
	                               <button class="btn btn-info btn-small" id="search" style="float:left;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search">조회</button>
	                               <button class="btn btn-default btn-small" id="clear" style="float:left;margin-right:20px;" type="reset">취소</button>
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
									<th>주소(읍/면/동)</th>
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
									<th>등록세(원)</th>
									<th>취득세(원)</th>
									<th>합병코드</th>
									<th>세금계산서번호</th>
									<th>구분</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>

							<tbody>
								<!-- <tr id="clickme"> -->
								
									<!-- <td class="center">
										<label>
											<input type="checkbox" class="ace" name="checkRow">
											<span class="lbl"></span>
										</label>
									</td> -->
								<%-- <c:forEach items='${landList}' var='land' varStatus="status">
										<tr>
												<td>${status.count}</td>
												<td>${land.id }</td>
												<td>${land.sectionNo}</td>
												<td>${land.sectionName}</td>
												<td>${land.wideAddress}</td>
												<td>${land.cityAddress}</td>
												<td>${land.localAddress}</td>
												<td>${land.detailAddress}</td>
												<td>${land.landArea}</td>
												<td>${land.ownerName}</td>
												<td>${land.customerNo}</td>
												<td>매입거래처명</td>
												<td>거래처담당자</td>
												<td>${land.payDate}</td>
												<td>${land.publicValue}</td>
												<td>${land.acqPrice}</td>
												<td>${land.etcCost}</td>
												<td>${land.regTax}</td>
												<td>${land.acqTax}</td>
												<td>${land.combinNo}</td>
												<td>${land.taxbillNo}</td>
												<td>${land.taxKind}</td>
												<td>${land.insertUserid}</td>
												<td>${land.insertDay}</td>
										</tr>  
									</c:forEach> --%>	
 					
									<!-- <td>1</td>
									<td>2019004001</td>
									<td>004</td>
									<td>논</td>
									<td>서울특별시</td>
									<td>강남구</td>
									<td>테헤란로</td>
									<td>119-2</td>
									<td>40</td>
									<td>아이티센</td>
									<td>매입거래처코드</td>
									<td>매입거래처명</td>
									<td>거래처담당자</td>
									<td>2019-12-01</td>
									<td>100,000,000</td>
									<td>400,000,000</td>
									<td>50,000,000</td>
									<td>20,000,000</td>
									<td>20,000,000</td>
									<td></td>
									<td>세금계산서번호</td>
									<td>과세</td>
									<td>정의돈</td>
									<td>2019-11-29</td>
								</tr> -->
								
									<c:forEach items='${landList}' var='land' varStatus="status">
										<tr class="clickme">
											<td>${status.count}</td>
											<td>${land.id }</td>
											<td>${land.sectionNo}</td>
											<td>${land.sectionName}</td>
											<td>${land.wideAddress}</td>
											<td>${land.cityAddress}</td>
											<td>${land.localAddress}</td>
											<td>${land.detailAddress}</td>
											<td>${land.landArea}</td>
											<td>${land.ownerName}</td>
											<td>${land.customerNo}</td>
											<td>매입거래처명</td>
											<td>거래처담당자</td>
											<td>${land.payDate}</td>
											<td>${land.publicValue}</td>
											<td>${land.acqPrice}</td>
											<td>${land.etcCost}</td>
											<td>${land.regTax}</td>
											<td>${land.acqTax}</td>
											<td>${land.combineNo}</td>
											<td>${land.taxbillNo}</td>
											<td>${land.taxKind}</td>
											<td>${land.insertUserid}</td>
											<td>${land.insertDay}</td>
										</tr>
									</c:forEach>




								
							</tbody>
						</table>
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
<%-- <script src="${pageContext.request.contextPath }/assets/js/08/09.js"></script> --%>
<script>

//select Box 
$(function(){
	$(".chosen-select").chosen(); 
});


//체크박스 전체 클릭
function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
}


//클릭한 행 받아와서 text에 값넣어주기
$(function() {
	$(".clickme").click(function() {
		
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
		
		var id = td.eq(1).text();
		$('#land_code').val(id)
		
		var sectioncode = td.eq(2).text();
		$('#code').val(sectioncode)
		
		var section = td.eq(3).text();
		/* $('#sectionName').val(section) */
		$('#form_field_section_chosen').find('span').text(section)
		
		var wideAddress = td.eq(4).text();
		$('#wideAddr').val(wideAddress)
		
		var cityAddress = td.eq(5).text();
		$('#cityAddr').val(cityAddress)
		
		var localAddress = td.eq(6).text();
		$('#localAddr').val(localAddress)
		
		var detailAddress = td.eq(7).text();
		$('#detailAddr').val(detailAddress)
		
		var landarea = td.eq(8).text();
		$('#area').val(landarea)
		
		var ownerName = td.eq(9).text();
		$('#ownerName').val(ownerName)
		
		var customerCode = td.eq(10).text();
		$('#form-field-customerCode').val(customerCode)
		
		var customerName = td.eq(11).text();
		$('#customerName').val(customerName)
		
		var customerManager = td.eq(12).text();
		$('#customerManager').val(customerManager)
		
		var payDate = td.eq(13).text();
		$('#id-date-picker-1').val(payDate)
		
		var publicValue = td.eq(14).text();
		$('#publicValue').val(publicValue)
		
		var acqPrice = td.eq(15).text();
		$('#acqPrice').val(acqPrice)
		
		var etcCost = td.eq(16).text();
		$('#etcCost').val(etcCost)
		
		var regTax = td.eq(17).text();
		$('#regTax').val(regTax)
		
		var acqTax = td.eq(18).text();
		$('#acqTax').val(acqTax)
		
		var combineNo = td.eq(19).text();
		$('#combineNo').val(combineNo)
		
		var taxbillNo = td.eq(20).text();
		$('#taxbillNo').val(taxbillNo)
		
		var taxKind = td.eq(21).text();
		console.log(typeof(taxKind))
		console.log(taxKind)
		if(taxKind=="과세"){
			$("#tax").prop("checked", true)
		}else if(taxKind=="영세"){
			$("#zeroTax").prop("checked", true)
		}
		
		console.log("코드 : " + code);
	});
});

// 대분류코드 select box 변경시 이벤트
$('#form-field-section').change(function() {
		var sectionCode = $('#form-field-section option:selected').attr('landcode');
		var code = $('#code').val(sectionCode);
});

//거래처코드 select box 변경시 이벤트
/* $('#form-field-customerCode').change(function() {
		var customerNo = $('#form-field-customerCode option:selected').val();
		var code = $('#customerName').val(customerNo);
		alert(code)
}); */


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
		})
	</script>
</body>
</html>