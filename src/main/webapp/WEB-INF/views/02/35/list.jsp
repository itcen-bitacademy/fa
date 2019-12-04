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
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">




				<div class="page-header position-relative">
					<h1 class="pull-left">매입거래처관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">

						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" id="form-customer" method="post">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="no">사업자번호</label>
									<div class="controls">
										<input type="text" id="no" name="no" style="width: 200px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="ceo">대표자</label>
									<div class="controls">
										<input type="text" id="ceo" name="ceo" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="address">주소</label>
									<div class="controls">
										<input type="text" id="zipCode" name="zipCode" readonly style="width: 60px;"> 
										<input type="text" id="address" name="address" readonly style="width: 200px;"> 
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon" onclick="execDaumPostcode()"></i></span>
										<br>
										<br> 
										<input type="text" id="detailAddress" name="detailAddress" style="width: 330px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="conditions">업태</label>
									<div class="controls">
										<input type="text" id="conditions" name="conditions" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="openDate">개설일자</label>
										<div class="controls">
											<div class="row-fluid input-append">
											<input class="cl-date-picker" id="openDate" name="openDate" type="text" style="width: 135px;" data-date-format="yyyy-mm-dd" />
												<span class="add-on">
												<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="managerName">담당자명</label>
									<div class="controls">
										<input type="text" id="managerName" name="managerName" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="depositNo">입금계좌번호</label>
									<div class="controls">
										<input type="text" id="depositNo" name="depositNo" style="width: 200px;"> 
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
									</div>
								</div>
							</div>

							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="name">상호</label>
									<div class="controls">
										<input type="text" id="bsname" name="name" style="width: 250px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="corporationNo">법인번호</label>
									<div class="controls">
										<input type="text" id="corporationNo" name="corporationNo" style="width: 200px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="phone">전화번호</label>
									<div class="controls">
										<input type="text" id="phone" name="phone" style="width: 200px;">
										<br>
										<br> 
										<input type="text" id="" style="visibility: hidden;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="item">종목</label>
									<div class="controls">
										<input type="text" id="item" name="item" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="jurisdictionOffice">관할사무소</label>
									<div class="controls">
										<input type="text" id="jurisdictionOffice" name="jurisdictionOffice" style="width: 200px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="managerEmail">메일</label>
									<div class="controls">
										<input type="text" id="managerEmail" name="managerEmail" style="width: 250px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="depositHost">예금주</label>
									<div class="controls">
										<input type="text" id="depositHost" name="depositHost" readonly style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="Bank">은행</label>
									<div class="controls">
										<input type="text" id="bankCode" name="bankCode" readonly style="width: 80px;"> 
										<input type="text" id="bankName" name="bankName" readonly style="width: 150px;">
									</div>
								</div>
							</div>
						</form>
						
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<div class="hr hr-18 dotted"></div>
											<button id="btn_select" class="btn btn-info btn-small" style="float:left; margin-left:20px;">조회</button>
											<button id="btn_delete" class="btn btn-danger btn-small" style="float:left; margin-left:20px;">삭제</button>
											<button id="btn_update" class="btn btn-warning btn-small" style="float:left; margin-left:20px;">수정</button>
											<button id="btn_insert" class="btn btn-primary btn-small" style="float:left; margin-left:20px;">입력</button>
											<button id="btn_cancel" class="btn btn-default btn-small" style="float:left; margin-left:20px;">취소</button><br>
										<div class="hr hr-18 dotted"></div>
									</div>
								</div>
							</div>
							
							<div class="row-fluid">
								<div class="span12">
									<table id="customer-table" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
				                                    <label>
				                                       <input type="checkbox" class="ace">
				                                       <span class="lbl"></span>
				                                    </label>
				                                 </th>
				                                 <th>사업자번호</th>
				                                 <th>상호</th>
				                                 <th>대표자</th>
				                                 <th>법인번호</th>
				                                 <th>주소</th>
				                                 <th>전화번호</th>
				                                 <th>업태</th>
				                                 <th>종목</th>
				                                 <th>개설일자</th>
				                                 <th>관할사무소</th>
				                                 <th>거래처담당자성명</th>
				                                 <th>담당자이메일</th>
				                                 <th>계좌번호</th>
				                                 <th>예금주</th>
				                                 <th>은행코드</th>
				                                 <th>은행명</th>
				                                 <th>입력일자</th>
				                                 <th>입력담당자ID</th>
				                                 <th>수정일자</th>
				                                 <th>수정담당자ID</th>
				                                 <th>삭제여부</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${customerVo }" var="customerVo" varStatus="status">
												<tr id="${customerVo.no }" >
													<td class="center">
														<label>
															<input type="checkbox" class="ace">
															<span class="lbl"></span>
														</label>
													</td>
													<td>${customerVo.no }</td>
													<td>${customerVo.name }</td>
													<td>${customerVo.ceo }</td>
													<td>${customerVo.corporationNo }</td>
													<td>${customerVo.address }</td>
													<td>${customerVo.phone }</td>
													<td>${customerVo.conditions }</td>
													<td>${customerVo.item }</td>
													<td>${customerVo.openDate }</td>
													<td>${customerVo.jurisdictionOffice }</td>
													<td>${customerVo.managerName }</td>
													<td>${customerVo.managerEmail }</td>
													<td>${customerVo.depositNo }</td>
													<td>${customerVo.depositHost }</td>
													<td>은행코드</td>
													<td>은행명</td>
													<td>${customerVo.insertDay }</td>
													<td>${customerVo.insertUserid }</td>
													<td>${customerVo.updateDay }</td>
													<td>${customerVo.updateUserid }</td>
													<td>${customerVo.deleteFlag }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						

						<!-- PAGE CONTENT ENDS -->

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
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
	<script>
	$(function() {
		// $(function()){ 이 중복될 경우 아래 코드 하나만 사용
		$(".chosen-select").chosen();
	});
	
	// 사업자번호로 조회 select
	$("#btn_select").click(function(){
		alert($("#no").val()+'번호로 조회');
/* 		console.log($("#no").val());
		var no = $("#no").val(); */
		$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list");
		document.getElementById('form-customer').submit();
		
        return false;
	});
	
	// 삭제 delete 
	$("#btn_delete").click(function(){
		alert('삭제');
		
		$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
		document.getElementById('form-customer').submit();
        return false;
	});
	
	// 수정 update
	$("#btn_update").click(function(){
		alert('수정');
		$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update");
		document.getElementById('form-customer').submit();
        return false;
	});
	
	// 입력 insert
	$("#btn_insert").click(function(){
		alert('입력');
		$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert");
		document.getElementById('form-customer').submit();
        return false;
	});
	
	// 취소 cancel
	$("#btn_cancel").click(function(){
		alert('초기화');
		$("#no").val('');					//사업자번호
		$("#bsname").val('');				//상호
		$("#ceo").val('');					//대표자
		$("#corporationNo").val('');		//법인번호
		$("#address").val('');				//주소
		$("#phone").val('');				//전화번호
		$("#conditions").val('');			//업태
		$("#item").val('');					//종목
		$("#openDate").val('');				//개설일자
		$("#jurisdictionOffice").val('');	//관할사무소
		$("#managerName").val('');			//거래처담당자성명
		$("#managerEmail").val('');			//담당자이메일
		$("#depositNo").val('');			//계좌번호
		$("#depositHost").val('');			//예금주
		$("#bankCode").val('');				//은행코드
		$("#bankName").val('');				//은행명
	});
	
	
	// table-tr 클릭시 input에 데이터 뿌리기	
	$("#customer-table tr").click(function(){ 	

		var str = ""
		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		var address = td.eq(5).text();
		$("#no").val(td.eq(1).text());					//사업자번호
		$("#bsname").val(td.eq(2).text());				//상호
		$("#ceo").val(td.eq(3).text());					//대표자
		$("#corporationNo").val(td.eq(4).text());		//법인번호
		$("#zipCode").val(address.substr(0,5));			//우편번호
		$("#address").val(address.substr(6, address.indexOf(")")));	//도로명주소
		$("#detailAddress").val(address.substr(address.indexOf(")")+1, address.length));		//상세주소
		$("#phone").val(td.eq(6).text());				//전화번호
		$("#conditions").val(td.eq(7).text());			//업태
		$("#item").val(td.eq(8).text());				//종목
		$("#openDate").val(td.eq(9).text());			//개설일자
		$("#jurisdictionOffice").val(td.eq(10).text());	//관할사무소
		$("#managerName").val(td.eq(11).text());		//거래처담당자성명
		$("#managerEmail").val(td.eq(12).text());		//담당자이메일
		$("#depositNo").val(td.eq(13).text());			//계좌번호
		$("#depositHost").val(td.eq(14).text());		//예금주
		$("#bankCode").val(td.eq(15).text());			//은행코드
		$("#bankName").val(td.eq(16).text());			//은행명
		
	});
	
	// 사업자번호 중복체크
	$(function(){
		$.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/check',
            data: {
                "no" : $('#no').val()
            },
            success: function(data){
                if($.trim(data) == 0){
                    $('#checkMsg').html('<p style="color:blue">사용가능</p>');
                }
                else{
                    $('#checkMsg').html('<p style="color:red">사용불가능</p>');
                }
            }
        });
	});
	
	</script>
	
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
	
	
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function execDaumPostcode() {
            new daum.Postcode(
                    {
                        oncomplete : function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                            alert(fullRoadAddr);
                            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                    && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                    && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                            if (fullRoadAddr !== '') {
                                fullRoadAddr += extraRoadAddr;
                            }
 
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('zipCode').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('address').value = fullRoadAddr;
                            document.getElementById('detailAddress').value = data.jibunAddress;
 
                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                            if (data.autoRoadAddress) {
                                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                                var expRoadAddr = data.autoRoadAddress
                                        + extraRoadAddr;
                                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                        + expRoadAddr + ')';
 
                            } else if (data.autoJibunAddress) {
                                var expJibunAddr = data.autoJibunAddress;
                                document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                        + expJibunAddr + ')';
 
                            } else {
                                document.getElementById('guide').innerHTML = '';
                            }
                        }
                    }).open();
   		     }
	</script>
</body>
</html>