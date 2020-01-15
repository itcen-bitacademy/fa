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
<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
        html,body{
             height:100%;
             overflow-x: hidden;
      	}
      	
      	.main-container{
         	height:calc(100% - 45px);
         	overflow-x: hidden;
      	}
      
      	.main-content{
         	overflow:auto;
      	}
      	
      	.page-content{
         	min-width:1280px;
      	}
      	
      	@media screen and (max-width: 920px) {
	         	.main-container{
            	height:calc(100% - 84px);
         		}
	 	}
      	
      	.form-horizontal .control-label {
	    text-align: left;
		}
</style>

	<script>
	$(function() {
		// $(function()){ 이 중복될 경우 아래 코드 하나만 사용
		$(".chosen-select").chosen();
		
		$(".td-hide").hide();
		
		// 입금계좌번호 팝업
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
	    
		// 입금계좌번호 팝업 클릭시
		$('#dialog-message-table').on('click', '#a-dialog-depositNo', function(event) {
			 event.preventDefault();
			 $("#tbody-bankaccountList").find("tr").remove();
			 
			 var depositNo = $("#input-dialog-depositNo").val();
			 
			 // ajax 통신
			 $.ajax({
			    url: "${pageContext.request.contextPath }/api/deposit/gets?depositNo=" + depositNo,
			    contentType : "application/json; charset=utf-8",
			    type: "get",
			    dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
			    data : "",
			    statusCode: {
			        404: function() {
			          alert("page not found");
			        }
			    },
			    success: function(data){
			  	  if(data.success) {
			  	  	$("#input-dialog-depositNo").val('');
			  	  	var baccountList = data.bankAccountList;
			  	  	console.log(data.bankAccountList);
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
		
		// 체크박스 전체선택
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
			});
		});
		
		// 사업자번호로 조회 select
		$("#btn_select").click(function(){
			$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list");
			document.getElementById('form-customer').submit();
			
	        return false;
		});
		
		// 삭제 delete 
		$("#btn_delete").click(function(){
	        var checkedArr = [];
	        $("#customer-table input[type=checkbox]:checked").each(function(i) {
	        	checkedArr.push($(this).closest("td").next().text());
		    });
	        
	        $.ajax({
				url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
				type: "post",
				data: {
		            checkNoArr: checkedArr
		        },
		        success: function(response) {
		        	location.href = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list";
				},
				error: function(xhr, error) {
					console.error("error:"+error);
				}
			});	
		});
		
		// 수정 update
		$("#btn_update").click(function(){
			$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update");
			if($("#no").val() == $("#preNo").val()){
				checkValid();			
			}else{
				checkNo();
				checkValid();
			}
	        return false;
		});
		
		// 입력 insert
		$("#btn_insert").click(function(){
			//event.preventDefault();

			$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert");
			
			if(document.getElementById("check_ok").style.display=='none' && $("#no").val()!=""){
				dialog("사업자번호 중복체크 해주세요.");
			}else{
				checkValid();
			}
	        
			return false;
		});
		
		// 초기화
		$("#btn_cancel").click(function(){
			// 입력버튼 활성화
			$("#btn_insert").prop("disabled", false);
			$("#check_no").show();
			
			$("#form-customer input[type=text]").val("");
		});
		
		
		// table-tr 클릭시 input에 데이터 뿌리기	
		$("#customer-table tr").click(function(){ 	
			// 입력버튼 비활성화
			$("#btn_insert").prop("disabled", true);
			$("#check_no").hide();
			
			var str = ""
			var tdArr = new Array();	// 배열 선언
			
			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();
			
			$("#no").val(td.eq(1).text());					//사업자번호
			$("#preNo").val(td.eq(1).text());				//사업자번호
			$("#bsname").val(td.eq(2).text());				//상호
			$("#ceo").val(td.eq(3).text());					//대표자
			$("#corporationNo").val(td.eq(4).text());		//법인번호
			$("#zipCode").val(td.eq(5).text());				//우편번호
			$("#address").val(td.eq(6).text());				//도로명주소
			$("#detailAddress").val(td.eq(7).text());		//상세주소
			$("#phone").val(td.eq(9).text());				//전화번호
			$("#conditions").val(td.eq(10).text());			//업태
			$("#item").val(td.eq(11).text());				//종목
			$("#openDate").val(td.eq(12).text());			//개설일자
			$("#jurisdictionOffice").val(td.eq(13).text());	//관할사무소
			$("#managerName").val(td.eq(14).text());		//거래처담당자성명
			$("#managerEmail").val(td.eq(15).text());		//담당자이메일
			$("#depositNo").val(td.eq(16).text());			//계좌번호
			$("#depositHost").val(td.eq(17).text());		//예금주
			$("#bankCode").val(td.eq(18).text());			//은행코드
			$("#bankName").val(td.eq(19).text());			//은행명
			
		});
		
		// 사업자번호 중복체크
		$("#check_no").click(function(){
			checkNo();
		});
		
		function checkNo(){
			$.ajax({
				url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/checkNo?no="+$("#no").val(),
				type: "get",
				dataType: "json",
				contentType:"application/json;charset=UTF-8",
				success: function(response) {
					if(response.result == "fail") {
						console.error(response.message);
						return;
					}
					if(response.data == true) {
						dialog("중복된 사업자번호 입니다.");
						$("#no").val("");
						$("#no").focus();
						$("#check_ok").hide();
						return;
					} else {
						if(!valid.nullCheck("no", "사업자번호")) return;
						$("#check_ok").show();
					}
				},
				error: function(xhr, error) {
					console.error("error:"+error);
				}
			});
		}
		
		$("#no").on("change", function(){
			$("#check_ok").hide();
		});
		
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
			
			var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			var email = $("#managerEmail").val();
			if (!re.test(email)) {
				dialog("이메일 형식이 틀립니다.");
				$("#managerEmail").focus();
				return;
			}
			
			$("#form-customer").submit();
			return;
		}
	});
	
	////핵심소스
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
								location.href="${pageContext.request.contextPath }/02/35";
							} else {
								$( this ).dialog( "close" ); 
							}
						}
					}
				]
			});
	}
	</script>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete : function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
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
                 	// 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                    document.getElementById("detailAddress").value = "";
                }
            }).open();
   		}
	</script>
	

</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">




				<div class="page-header position-relative">
					<h1 class="pull-left">매입거래처관리</h1>
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
										<input type="text" id="no" name="no" maxlength="11">
										<input class="span6" type="hidden" id="preNo" name="preNo">
                             			<input id="check_no" style="height:28px" data-checkid="" type="button" value="중복확인">
										<i id="check_ok" class="icon-ok bigger-150 blue" style="display:none;"></i>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="ceo">대표자</label>
									<div class="controls">
										<input type="text" id="ceo" name="ceo" maxlength="10">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="address">주소</label>
									<div class="controls">
										<div class="input-append">
											<input onclick="execDaumPostcode()" style="height:28px; margin-right: 2px" type="button" value="주소찾기">
											<input class="span3" type="text" id="zipCode" readonly name="zipCode" style="margin-right: 2px">
				                            <input class="span7" type="text" id="address" readonly name="address">
		                                </div>
										<input class="span8" type="text" id="detailAddress" name="detailAddress" maxlength="60" style="margin-top: 5px; width: 436px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="conditions">업태</label>
									<div class="controls">
										<input type="text" id="conditions" name="conditions" maxlength="10">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="openDate">개설일자</label>
										<div class="controls">
											<div class="row-fluid input-append">
											<input class="cl-date-picker" id="openDate" name="openDate" type="text" readonly data-date-format="yyyy-mm-dd" />
												<span class="add-on">
												<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="managerName">담당자명</label>
									<div class="controls">
										<input type="text" id="managerName" name="managerName" maxlength="10">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="depositNo">입금계좌번호</label>
									<div class="controls">
										<div class="input-append">
											<input type="text" id="depositNo" name="depositNo" readonly> 
											<span class="add-on">
											<a href="#" id="a-bankaccountinfo-dialog">
											<i class="icon-search icon-on-right bigger-110"></i></a></span>
										</div>
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
								
								

							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="name">상호</label>
									<div class="controls">
										<input type="text" id="bsname" name="name" maxlength="30">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="corporationNo">법인번호</label>
									<div class="controls">
										<input type="text" id="corporationNo" name="corporationNo" maxlength="15">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="phone">전화번호</label>
									<div class="controls">
										<input type="text" id="phone" name="phone" maxlength="15">
										<br>
										<br> 
										<input type="text" id="" style="visibility: hidden;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="item">종목</label>
									<div class="controls">
										<input type="text" id="item" name="item" maxlength="10">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="jurisdictionOffice">관할사무소</label>
									<div class="controls">
										<input type="text" id="jurisdictionOffice" name="jurisdictionOffice" maxlength="30">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="managerEmail">메일</label>
									<div class="controls">
										<input type="text" id="managerEmail" name="managerEmail" maxlength="50">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="depositHost">예금주</label>
									<div class="controls">
										<input type="text" id="depositHost" name="depositHost" readonly>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="Bank">은행</label>
									<div class="controls">
										<input type="text" id="bankCode" name="bankCode" readonly style="width: 80px;"> 
										<input type="text" id="bankName" name="bankName" readonly style="width: 110px;">
									</div>
								</div>
							</div>
						
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<div class="hr hr-18 dotted"></div>
											<button id="btn_insert" class="btn btn-primary btn-small" style="float:left;">입력</button>
											<button id="btn_update" class="btn btn-warning btn-small" style="float:left; margin-left:5px;">수정</button>
											<button id="btn_delete" class="btn btn-danger btn-small" style="float:left; margin-left:5px;">삭제</button>
											<button id="btn_select" class="btn btn-info btn-small" style="float:left; margin-left:5px;">조회</button>
											<button id="btn_cancel" class="btn btn-default btn-small" type="button" style="float:left; margin-left:5px;">초기화</button>
									</div>
									<div class="hr hr-18 dotted"></div>
								</div>
							</div>
						</form>
							
							<div class="row-fluid">
								<div class="span12" style="overflow-x: scroll;">
									<table id="customer-table" class="table table-striped table-bordered table-hover" style="width:3000px;">
										<thead>
											<tr>
												<th class="center">
				                                    <!-- <label>
				                                       <input type="checkbox" class="ace">
				                                       <span class="lbl"></span>
				                                    </label> -->
				                                 </th>
				                                 <th class="center">사업자번호</th>
				                                 <th class="center">상호</th>
				                                 <th class="center">대표자</th>
				                                 <th class="center">법인번호</th>
				                                 <th class="center">주소</th>
				                                 <th class="center">전화번호</th>
				                                 <th class="center">업태</th>
				                                 <th class="center">종목</th>
				                                 <th class="center">개설일자</th>
				                                 <th class="center">관할사무소</th>
				                                 <th class="center">거래처담당자성명</th>
				                                 <th class="center">담당자이메일</th>
				                                 <th class="center">계좌번호</th>
				                                 <th class="center">예금주</th>
				                                 <th class="center">은행코드</th>
				                                 <th class="center">은행명</th>
				                                 <th class="center">입력일자</th>
				                                 <th class="center">입력담당자ID</th>
				                                 <th class="center">수정일자</th>
				                                 <th class="center">수정담당자ID</th>
				                                 <th class="center">삭제여부</th>
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
													<td class="center">${customerVo.no }</td>
													<td class="left">${customerVo.name }</td>
													<td class="left">${customerVo.ceo }</td>
													<td class="left">${customerVo.corporationNo }</td>
													<td class="td-hide">${customerVo.zipCode }</td>
													<td class="td-hide">${customerVo.address }</td>
													<td class="td-hide">${customerVo.detailAddress }</td>
													<td class="left">${customerVo.fullAddress }</td>
													<td class="left">${customerVo.phone }</td>
													<td class="left">${customerVo.conditions }</td>
													<td class="left">${customerVo.item }</td>
													<td class="center">${customerVo.openDate }</td>
													<td class="left">${customerVo.jurisdictionOffice }</td>
													<td class="left">${customerVo.managerName }</td>
													<td class="left">${customerVo.managerEmail }</td>
													<td class="left">${customerVo.depositNo }</td>
													<td class="left">${customerVo.depositHost }</td>
													<td class="center">${customerVo.bankCode }</td>
													<td class="center">${customerVo.bankName }</td>
													<td class="center">${customerVo.insertDay }</td>
													<td class="center">${customerVo.insertUserid }</td>
													<td class="center">${customerVo.updateDay }</td>
													<td class="center">${customerVo.updateUserid }</td>
													<td class="center">${customerVo.deleteFlag }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div id="dialog-confirm" class="hide">
								<p id="dialog-txt" class="bolder grey">
								</p>
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