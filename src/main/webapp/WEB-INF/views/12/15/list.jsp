<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
	div#invalid {display: none;}
	.form-horizontal .control-label {
	    text-align: left
	}
</style>
</head>

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$(".td-hide").hide();
		$("th").attr("class", "center");
		/* $('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
			});
				
		}); */
		
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

		$('.cl-date-picker').datepicker({
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		$("#btn-add").on("click", function(){
			console.log($("input[type=email]").attr("aria-invalid"));
			return;
			$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add");
			
			if(document.getElementById("check_ok").style.display=='none' && $("#no").val()!=""){
				dialog("사업자번호 중복체크 해주세요.");
				return;
			}
			
			checkValid();
		});
		
		$("#btn-select").on("click", function(){
			//$(".input-validation").attr("required", false);
			location.href = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?no="+$("#no").val();
		});
		
		$("#btn-update").on("click", function(){
			$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/modify");
			var flag = true;
			
			if($("#no").val() != $("#preNo").val()) {
				flag = checkNo("update");
			}
			
			if(flag) {
				checkValid();
			}
			
		});
		
		$("#btn-clear").on("click", function(){
			$('#form-customer')[0].reset();
			$("#check_no").show();
			//$('#form-customer input').val("");
		});
		
		
		$("#btn-delete").on("click", function(){
			var checkArr = [];
			$("#customer-table input[type=checkbox]:checked").each(function(i) {
		        checkArr.push($(this).closest("td").next().text());
		    });
			if(checkArr.length == 0) {
				dialog("삭제할 거래처를 선택해주세요.");
				return;
			}
			
			location.href = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete?checkNoArr=" + checkArr;
			/*
			$.ajax({
				url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
				type: "post",
				data: {
		            checkNoArr: checkArr
		        },
		        success: function(response) {
		        	location.href = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list";
				},
				error: function(xhr, error) {
					console.error("error:"+error);
				}
			});
			*/
		});
		
		// 사업자번호 중복체크
		$("#check_no").on("click", function(){
			checkNo();
		});
		
		$("#no").on("keyup", function(){
			$("#check_ok").hide();
		});
		
		$("#customer-table tr.rows").on("click", function(event){
			if (event.target.type == 'checkbox') return;

			$("#check_no").hide();
			
			var td = $(this).children();
			var no = td.eq(1).text();
			var name = td.eq(2).text();
			var ceo = td.eq(3).text();
			var corporationNo = td.eq(4).text();
			var addressAll = td.eq(5).text();
			var zipCode =  td.eq(6).text();
			//addressAll.substring(addressAll.indexOf("(")+1, addressAll.indexOf(")"));
			var address = td.eq(7).text();
			//addressAll.substring(0, addressAll.indexOf("(")-1);
			var detailAddress = td.eq(8).text(); 
			//addressAll.substring(addressAll.indexOf(")")+2);
			var phone = td.eq(9).text();
			var conditions = td.eq(10).text();
			var item = td.eq(11).text();
			var openDate = td.eq(12).text();
			var jurisdictionOffice = td.eq(13).text();
			var managerName = td.eq(14).text();
			var managerEmail = td.eq(15).text();
			var depositNo = td.eq(16).text();
			var depositHost = td.eq(17).text();
			var bankCode = td.eq(18).text();
			var bankName = td.eq(19).text();
			
			$("#no").val(no);
			$("#preNo").val(no);
			$("#name").val(name);
			$("#ceo").val(ceo);
			$("#corporationNo").val(corporationNo);
			$("#zipCode").val(zipCode);
			$("#address").val(address);
			$("#detailAddress").val(detailAddress);
			$("#phone").val(phone);
			$("#conditions").val(conditions);
			$("#item").val(item);
			$("#openDate").val(openDate);
			$("#jurisdictionOffice").val(jurisdictionOffice);
			$("#managerName").val(managerName);
			$("#managerEmail").val(managerEmail);
			$("#depositNo").val(depositNo);
			$("#depositHost").val(depositHost);
			$("#bankCode").val(bankCode);
			$("#bankName").val(bankName);
		});
		
	    $('#dialog-message-table').on('click', '#a-dialog-depositNo', function(event) {
	       event.preventDefault();
	       $("#tbody-bankaccountList").find("tr").remove();
	       
	       var depositNo = $("#input-dialog-depositNo").val();
	       console.log(depositNo);
	       // ajax 통신
	       $.ajax({
	          url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/gets?depositNo=" + depositNo,
	          contentType : "application/json; charset=utf-8",
	          type: "get",
	          dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
	          data : "",
	          statusCode: {
	              404: function() {
	                alert("page not found");
	              }
	          },
	          success: function(result){
	        	  if(result.success) {
	        		$("#input-dialog-depositNo").val('');
	        	  	var baccountList = result.bankAccountList;
	        	  	console.log(result.bankAccountList);
	        	  	for(let a in baccountList) {
	        	  		$("#tbody-bankaccountList").append("<tr>" +
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
	    });
    
	    // 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 form에 추가
	    $(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
	       var tr = $(this);
	       var td = tr.children();
	       $("input[name=depositNo]").val(td.eq(0).text());
	       $("input[name=depositHost]").val(td.eq(1).text());
	       $("input[name=bankCode]").val(td.eq(2).text());
	       $("input[name=bankName]").val(td.eq(3).text());
	       $("#dialog-message").dialog('close');
	   	});
	    
	});	
	
	$(function() {
	      $("#dialog-message").dialog({
	         autoOpen : false
	      });
	
	      $("#a-bankaccountinfo-dialog").click(function() {
	         $("#dialog-message").dialog('open');
	         $("#dialog-message").dialog({
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
	      });
	});
	
	
	function checkNo(formAction) {
		var flag = false;
		
		$.ajax({
			url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/checkNo?no="+$("#no").val(),
			type: "get",
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success: function(response) {
				console.log(response.data);
				if(response.result == "fail") {
					console.error(response.message);
					return;
				}
				if(response.data == true) {
					dialog("중복된 사업자번호 입니다.");
					$("#no").focus();
					$("#check_ok").hide();
					flag = false;
				} else if(formAction != "update") {
					$("#check_ok").show();
					flag = true;
				}
			},
			error: function(xhr, error) {
				console.error("error:"+error);
			}
		});
		return flag;
	}
	
	// 유효성 검사
	function checkValid() {
		if(!valid.nullCheck("no", "사업자번호")) return;
		if(!valid.numberCheck("no", "사업자번호")) return;
		
		if(!valid.nullCheck("bsname", "상호")) return;
		
		if(!valid.numberCheck("corporationNo", "법인번호")) return;
		
		if(!valid.nullCheck("phone", "전화번호")) return;
		if(!valid.numberCheck("phone", "전화번호")) return;
		
		if(!valid.nullCheck("managerName", "담당자명")) return;
		if(!valid.nullCheck("managerEmail", "메일")) return;
		
		$("#form-customer").submit();
		return;
	}
	
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
                document.getElementById("detailAddress").value = "";
            }
        }).open();
    }
	
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
		numberCheck: function(id, msg){  // 숫자 체크
			if(!($("#"+id).val()) == "" && !$.isNumeric($("#"+id).val())){        	
       			dialog(msg+" 은(는) 숫자만 입력 가능합니다.");
       			$("#"+id).focus();
       			return false;
       		} else {
       			return true;
       		}
       	}
	}
	
	// 유효성 검사시에 발생되는 Dialog - 화면
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
							location.href="${pageContext.request.contextPath }/12/53";
						} else {
							$( this ).dialog( "close" ); 
						}
					}
				}
			]
		});
    }
</script>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매출거래처 관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span12">
							<form:form id="form-customer" modelAttribute="customerVo" class="form-horizontal" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add" method="post">
								<div class="span6">
									<div class="control-group">
										<label class="control-label form-field-1">사업자번호</label>
										<div class="controls">
											<form:input path="no"/>
											<!-- <input type="text" class="input-validation" id="no" name="no" required> -->
											<input class="span6" type="hidden" id="preNo" name="preNo">
											<input id="check_no" style="height:28px" data-checkid="" type="button" value="중복확인">
											<i id="check_ok" class="icon-ok bigger-150 blue" style="display:none;"></i>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">대표자</label>
										<div class="controls">
											<input type="text" id="ceo" name="ceo">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">주소</label>
										<div class="controls">
											<div class="input-append">
												<input onclick="execDaumPostcode()" style="height:28px; margin-right: 2px" type="button" value="주소찾기">
												<input class="span3" type="text" id="zipCode" readonly name="zipCode" style="margin-right: 2px">
					                            <input class="span7" type="text" id="address" readonly name="address">
					                            <!--  
												<span class="add-on" onclick="execDaumPostcode()">
						                        	<a href="#" class="a-customerinfo-dialog">
						                        		<i class="icon-search nav-search-icon"></i>
						                        	</a>
					                            </span>
					                            -->
			                                </div>
											<input class="span8" type="text" id="detailAddress" name="detailAddress" style="margin-top: 5px; width: 436px;">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">업태</label>
										<div class="controls">
											<input type="text" id="conditions" name="conditions">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">개설일자</label>
										<div class="row-fluid input-append span2">
											<input class="cl-date-picker" type="text" id="openDate" readonly data-date-format="yyyy-mm-dd" name="openDate">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">담당자명</label>
										<div class="controls">
											<form:input path="managerName" />
											<!-- <input type="text" class="input-validation" id="managerName" name="managerName" required> -->
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label form-field-1">입금계좌번호</label>
										<div class="controls">
											<div class="input-append">
												<input class="span10" type="text" id="depositNo" readonly name="depositNo">
												<span class="add-on">
					                                <a href="#" id="a-bankaccountinfo-dialog" class="a-customerinfo-dialog">
					                                	<i class="icon-search icon-on-right bigger-110"></i>
					                                </a>
				                                </span>
											</div>
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<label class="control-label form-field-1">상호</label>
										<div class="controls">
											<form:input path="name" />
											<!-- <input class="span7" class="input-validation" type="text" id="name" name="name" required> -->
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">법인번호</label>
										<div class="controls">
											<input class="span5" type="text" id="corporationNo" name="corporationNo">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">전화번호</label>
										<div class="controls">
											<form:input path="phone"/>
											<!-- <input class="span5 input-validation" type="text" id="phone" name="phone"> -->
										</div>
									</div>
									<div class="control-group">
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">종목</label>
										<div class="controls">
											<input type="text" id="item" name="item">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">관할사무소</label>
										<div class="controls">
											<input type="text" id="jurisdictionOffice" name="jurisdictionOffice">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">메일</label>
										<div class="controls">
											<!-- <form:input path="managerEmail"/> -->
											<input class="span7" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" aria-invalid="true" type="email" id="managerEmail" name="managerEmail">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">예금주</label>
										<div class="controls">
											<input type="text" id="depositHost" readonly name="depositHost">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">은행</label>
										<div class="controls">
											<input class="span2" type="text" id="bankCode" readonly name="bankCode">
											<input class="span6" type="text" id="bankName" readonly name="bankName">
										</div>
									</div>
								</div>
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
								<div id="dialog-message" title="계좌" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>계좌번호</label> <input type="text"
												id="input-dialog-depositNo" style="width: 100px;" /> <a
												href="#" id="a-dialog-depositNo"> <span
													class="btn btn-small btn-info" style="margin-bottom: 10px;">
														<i class="icon-search nav-search-icon"></i>
												</span>
											</a></td>
										</tr>
									</table>
									<!-- 은행코드 및 은행명 데이터 리스트 -->
									<table id="modal-deposit-table"
										class="table  table-bordered table-hover">
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
								</div>
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
								<div id="dialog-confirm" class="hide">
									<p id="dialog-txt" class="bolder grey">
									</p>
								</div>
							</form:form>
						</div>
					</div>
					
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12" style="overflow-x: scroll;">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper table-responsive" style="width:3000px;" role="grid">
								<div class="hr hr-18 dotted"></div>
								<div class="row-fluid" style="background-color:white">
									<div id="sample-table-2_length" class="dataTables_length">
										<button id="btn-add" class="btn btn-primary btn-small">입력</button>
										<button id="btn-update" class="btn btn-warning btn-small">수정</button>
										<button id="btn-delete" class="btn btn-danger btn-small">삭제</button>
										<button id="btn-select" class="btn btn-info btn-small">조회</button>
										<button id="btn-clear" class="btn btn-default btn-small">초기화</button>
									</div>
								</div>
								<div class="hr hr-18 dotted"></div>
								<table id="customer-table" class="table table-striped table-bordered table-hover" aria-describedby="sample-table-2_info">
									<thead>
										<tr role="row">
											<th class="center">
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
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<c:forEach items="${customerList }" var="customer">
											<tr class="rows">
												<c:choose>
													<c:when test="${customer.deleteFlag eq '' }">
														<td class="center">
														<label>
															<input type="checkbox" class="ace">
															<span class="lbl"></span>
														</label>
														</td>					
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>
												
												<td class="center">${customer.no }</td>
												<td>${customer.name }</td>
												<td>${customer.ceo }</td>
												<td>${customer.corporationNo }</td>
												<td>${customer.addressAll }</td>
												<td class="td-hide">${customer.zipCode }</td>
												<td class="td-hide">${customer.address }</td>
												<td class="td-hide">${customer.detailAddress }</td>
												<td>${customer.phone }</td>
												<td>${customer.conditions }</td>
												<td>${customer.item }</td>
												<td>${customer.openDate }</td>
												<td>${customer.jurisdictionOffice }</td>
												<td>${customer.managerName }</td>
												<td>${customer.managerEmail }</td>
												<td>${customer.depositNo }</td>
												<td>${customer.depositHost }</td>
												<td>${customer.bankCode }</td>
												<td>${customer.bankName }</td>
												<td>${customer.insertDay }</td>
												<td>${customer.insertUserid }</td>
												<td>${customer.updateDay }</td>
												<td>${customer.updateUserid }</td>
												<td>${customer.deleteFlag }</td>
												
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
					
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>