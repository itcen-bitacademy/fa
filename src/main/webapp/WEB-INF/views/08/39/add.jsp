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
<c:import url="/WEB-INF/views/common/head.jsp" />
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
					<h1 class="pull-left">건물관리</h1>
				</div>
				<!-- /.page-header -->

				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->

							<!-- 좌측 -->
							<form class="form-horizontal" method="post">
								<div class="span6">
									<div class="control-group">
										<label class="control-label" for="form-field-1">건물 코드</label>
										<div class="controls">
											<input type="text" id="land_code" name="id" placeholder="10자로 입력하세요"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">대분류코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-section" name="sectionNo">
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.classification}" value="${sectionVo.code }">${sectionVo.code }</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" id="classification" name="sectionff" placeholder="코드를 지정하면 대분류명이 입력됩니다">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소(광역)</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1"
												name="wideAddress" data-placeholder="선택">
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소(읍/면/동)</label>
										<div class="controls">
											<select class="chosen-select" id="localAddress" name="localAddress" data-placeholder="선택">
											</select>
											<input type="text" id="form-field-1" name="detailAddress" style="width: 302px;" placeholder="상세주소를 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">거래처코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-customer" name="customerNo">
												<c:forEach items="${customerList }" var="customerVo">
													<option customerName="${customerVo.name}" managerName="${customerVo.managerName }" value="${customerVo.no }">${customerVo.no }</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" name="classification" id="customerName" placeholder="코드를 지정하면 거래처명이 입력됩니다">
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
												class="control-label" for="form-field-1">공시지가</label> <input
												type="text" id="form-field-1" name="publicValue"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">등록세</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="regTax"
													placeholder="금액을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">취득세</label> <input
												type="text" id="form-field-1" name="acqTax"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">합병코드</label>
										<div class="controls">
											<input type="text" id="combine_no" name="combineNo"
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
												<input style="width: 206px" type="text" id="form-field-1"
													name="area" placeholder="숫자만 입력하세요" />
											</div>
										</div>
										<div style="float: left">
											<label style="width: 60px; margin-right: 30px;"
												class="control-label" for="form-field-1">층수</label>
											<div style="width: 205px; margin-left:40px" class="controls">
												<input style="width: 50px" type="text" id="form-field-1"
													name="floor" placeholder="지상" /> <input
													style="width: 50px" type="text" id="form-field-1"
													name="basement" placeholder="지하" />
											</div>
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">용도</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="purpose" placeholder="내용을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">주 구조</label> 
												<input type="text" id="form-field-1" name="material" placeholder="내용을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소(시/군/구)</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1"
												name="cityAddress" data-placeholder="선택">
											</select>
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">담당자</label>
											<div class="controls" id="form-input-customer">
												<input readonly type="text" name="managerName" id="managerName" placeholder="담당자" />
											</div>
											
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">건물소유자</label> <input
												type="text" id="form-field-1" name="ownerName"
												placeholder="내용을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">취득금액</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="acqPrice"
													placeholder="금액을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">기타비용</label> <input
												type="text" id="form-field-1" name="etcCost"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">세금계산서번호</label>
										<div class="controls">
											<input type="text" class="span7" name="taxbillNo">
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
												<button class="btn btn-primary btn-small" id="add"
													style="float: left; margin-right: 20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/create">등록</button>
												<button class="btn btn-warning btn-small" id="update"
													style="float: left; margin-right: 20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
												<button class="btn btn-danger btn-small" id="delete"
													style="float: left; margin-right: 20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
												<button class="btn btn-info btn-small" id="search" 
													style="float: left; margin-right: 20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
												<button class="btn btn-default btn-small" id="reset"
													style="float: left; margin-right: 20px;" type="reset">취소</button>
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
							<th>주소(읍/면/동)</th>
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
							<th>취득세(원)</th>
							<th>합병코드</th>
							<th>세금계산서번호</th>
							<th>구분</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정자</th>
							<th>수정일</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${list }" var="vo" varStatus="status">
						<tr class="table-row" >
							<td>${vo.id }</td>
							<td>${vo.sectionNo }</td>
							<td>${vo.sectionName }</td>
							<td>${vo.area }</td>
							<td>${vo.floor }</td>
							<td>${vo.basement }</td>
							<td>${vo.wideAddress }</td>
							<td>${vo.cityAddress }</td>
							<td>${vo.localAddress }</td>
							<td>${vo.detailAddress }</td>
							<td>${vo.purpose }</td>
							<td>${vo.material }</td>
							<td>${vo.customerNo }</td>
							<td>${vo.customerName }</td>
							<td>${vo.managerName }</td>
							<td>${vo.ownerName }</td>
							<td>${vo.payDate }</td>
							<td>${vo.publicValue }</td>
							<td>${vo.acqPrice }</td>
							<td>${vo.etcCost }</td>
							<td>${vo.regTax }</td>
							<td>${vo.acqTax }</td>
							<td>${vo.combineNo }</td>
							<td>${vo.taxbillNo }</td>
							<td>${vo.taxKind }</td>
							<td>${vo.insertUserid }</td>
							<td>${vo.insertDay }</td>
							<td>${vo.updateUserid }</td>
							<td>${vo.updateDay }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
					
					</div><!-- (row-fluid) PAGE CONTENT ENDS -->
					
				</div><!-- /.span -->
				
				</div><!-- 좌,우측  row-fluid -->
				
			</div><!-- /.page-content -->
			
		</div><!-- /.main-content -->
		
	</div><!-- /.main-container -->
		
	
	
	
<!-- basic scripts -->

<c:import url="/WEB-INF/views/common/footer.jsp" />
	
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script>
$("input[name=id]").on("change", function() {
    var id = $("#id").val();
    
    $.ajax({
       url : $("#context-path").val()  + "/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/checkId?id=" + id,
       type : "get",
       dataType : "json",
       data : "",
       success: function(response){
          if(response.result == "fail"){
             console.error(response.message);
             return;
          }
          
          if(response.data == true){
             alert("사용중인 품목코드입니다");
             $("#id").val("");
             $("#id").focus();
             return;
          
          } else if(id == "") {
             alert("품목코드는 필수 입력 사항입니다");
             $("#id").focus();
          }
       },
       error: function(xhr, error) {
          console.error("error: " + error);
       }
    });
    
 });
</script>

<script>
	$(function(){
		$(".chosen-select").chosen(); 
	});
	
	//select box 선택 시 값 등록
	$('#form-field-section').change(function() {
  		var classification = $('#form-field-section option:selected').attr('sectionList'); // ${sectionVo.classification}
 		$('#classification').val(classification); 
	});
	
	$('#form-field-customer').change(function() {
  		var customername = $('#form-field-customer option:selected').attr('customerName'); // ${customerVo.name}
  		$('#customerName').val(customername);
 		var managername = $('#form-field-customer option:selected').attr('managerName'); // ${customerVo.manager_name}
 		$('#managerName').val(managername);
	});
	
	
	//관리화면
	$(function() {
		//한행 클릭 >> 건물코드 가져오기
		   $(".table-row").click(function() {
		      var str = ""
		      var tdArr = new Array();   // 배열 선언
		      
		      // 현재 클릭된 Row(<tr>)
		      var tr = $(this);
		      var td = tr.children();
		      
		      $("input[name=id]").val(td.eq(0).text());
		      //sectionNo 에 대한 값(classification)을 select box에 표시
		      $('#form-field-section').val(td.eq(1).text()).trigger('chosen:updated'); 
		      $("input[name=sectionName]").val(td.eq(2).text()); 
		      $("input[name=area]").val(td.eq(3).text());
		      $("input[name=floor]").val(td.eq(4).text());
		      $("input[name=basement]").val(td.eq(5).text());
		      $("input[name=wideAddress]").val(td.eq(6).text());
		      $("input[name=cityAddress]").val(td.eq(7).text());
		      $("input[name=localAddress]").val(td.eq(8).text());
		      $("input[name=detailAddress]").val(td.eq(9).text());
		      $("input[name=purpose]").val(td.eq(10).text());
		      $("input[name=material]").val(td.eq(11).text());
		      //customerNo 에 대한 값(name)을 select box에 표시
		      $('#form-field-customer').val(td.eq(12).text()).trigger('chosen:updated'); 
		      $("input[name=customerName]").val(td.eq(13).text());
		      $("input[name=managerName]").val(td.eq(14).text());
		      $("input[name=ownerName]").val(td.eq(15).text());
		      $("input[name=payDate]").val(td.eq(16).text());
		      $("input[name=publicValue]").val(td.eq(17).text());
		      $("input[name=acqPrice]").val(td.eq(18).text());
		      $("input[name=etcCost]").val(td.eq(19).text());
		      $("input[name=regTax]").val(td.eq(20).text());
		      $("input[name=acqTax]").val(td.eq(21).text());
		      $("input[name=combineNo]").val(td.eq(22).text());
		      $("input[name=taxbillNo]").val(td.eq(23).text());
				
		      // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		      /* td.each(function(i){
		         tdArr.push(td.eq(i).text());
		      });
		      
		      console.log("Array Stored Data : "+ tdArr);
		       */
		       
		    //radio button
		      if(td.eq(24).text() == "과세"){
		          $("input[id=tax]").prop('checked', true);
		      }
		      else if(td.eq(24).text() == "영세"){
		          $("input[id=zeroTax]").prop('checked', true);
		      } 
		      
			});
	});

	//버튼 구현
	$(function() {
		/*
		$("#insert").click(function() {
			alert("등록");
		});

		$("#modify").click(function() {
			alert("수정");
		});

		$("#search").click(function() {
			alert("조회");
		});
		*/
		
		$("#delete").click(function() {
		alert("삭제");
	});
	});
</script>

<!-- date picker -->
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
</body>
</html>