<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<style>
.chosen-search {
	display: none;
}
</style>

<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<link
	href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<script
	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

<script>
	$(function() {
		var a;
		$("#btn-create").click(function(){
			a = "create";
		});
		$("#btn-read").click(function(){
			a = "read";
		});
		$("#btn-update").click(function(){
			a = "update";
		});
		$("#btn-delete").click(function(){
			a = "delete";
		});
		
		$("#input-form").submit(function(event) {
	        event.preventDefault();
			if($("input[name=balance]").val() == "") {
				$("input[name=balance]").val(0);		
			}
			if($("input[name=depositLimit]").val() == "") {
				$("input[name=depositLimit]").val(0);			
			}
			if($("input[name=profit]").val() == "") {
				$("input[name=profit]").val(0);
			}
			var queryString = $("form[name=input-form]").serializeArray();
			
			if("${param.page}") {
				queryString.push({name: 'page', value: "${param.page}"});
			}
			
			if(a == "create") {
				$.ajax({
				    url: "${pageContext.request.contextPath}/${menuInfo.mainMenuCode}/${menuInfo.subMenuCode}/create",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.fail) {
				    		alert("다시 입력해주세요.");
				    	}
				    	if(dataResult.success) {
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		alert("계좌 생성이 완료되었습니다."); 
				    		
				    		removeTable();
				    		var bankList = dataResult.bankList;
				    		createNewTable(bankList);
				    		
				    		$('#pagination ul').remove();
				    		${'dataResult.pagination.page' };
				    		createNewPage(dataResult, a);
				    	}
				    },
				    error: function( err ){
				    	
				    }
				 })
			} else if(a == "read") {
				$.ajax({
				    url: "${pageContext.request.contextPath}/01/25/read",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.success) {
				    		alert("계좌 검색이 완료되었습니다."); 
				    		removeTable();
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		var bankList = dataResult.bankList;
				    		settingInput(bankList);
				    		createNewTable(bankList);
				    		$('#pagination').hide();
				    	}
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			} else if(a == "update") {
				$.ajax({
				    url: "${pageContext.request.contextPath}/01/25/update",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.success) {
				    		alert("계좌 수정이 완료되었습니다."); 
				    		removeTable();
				    		
				    		var bankList = dataResult.bankList;
				    		createNewTable(bankList);
				    	}
				    	if(dataResult.fail) {
				    		alert("다시 입력해주세요.");
				    	}
				    	
				    	$('#pagination ul').remove();
			    		createNewPage(dataResult, a);
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			} else if(a == "delete") {
				$.ajax({
				    url: "${pageContext.request.contextPath}/01/25/delete",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.success) {
				    		alert("계좌 삭제가 완료되었습니다."); 
				    		removeTable();
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		var bankList = dataResult.bankList;
				    		createNewTable(bankList);
				    	}
				    	
				    	$('#pagination ul').remove();
			    		createNewPage(dataResult, a);
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			} else {
				alert("장비를 정지합니다");
			}
			
		});
		
		$.fn.datepicker.dates['ko'] = {
			days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
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

		function removeTable(){
			  // 원래 테이블 제거
			  $(".origin-tbody").remove();
			  // ajax로 추가했던 테이블 제거
			  $(".new-tbody").remove();
		}
		function createNewTable(bankList){
			  var $newTbody = $("<tbody class='new-tbody'>")
			  $("#simple-table-1").append($newTbody)
				
			  for(let bankdeposit in bankList){
				  $newTbody.append(
				   	"<tr>" +
			        "<td class='center'><label class='pos-rel'> <input name='RowCheck' type='checkbox' class='ace' /><span class='lbl'></span></label></td>" +
			        "<td>" + bankList[bankdeposit].depositNo + "</td>" +
			        "<td>" + bankList[bankdeposit].bankCode + "</td>" +
			        "<td>" + bankList[bankdeposit].depositHost + "</td>" +
			        "<td>" + bankList[bankdeposit].makeDate + "</td>" +
			        "<td>" + bankList[bankdeposit].enDate + "</td>" +
			        "<td>" + bankList[bankdeposit].balance + "</td>" +	
			        "<td>" + bankList[bankdeposit].depositLimit + "</td>" +
			        "<td>" + bankList[bankdeposit].profit + "</td>" +
			        "<td>" + bankList[bankdeposit].bankName + "</td>" +
			        "<td>" + bankList[bankdeposit].bankLocation + "</td>" +
			        "<td>" + bankList[bankdeposit].banker + "</td>" +
			        "<td>" + bankList[bankdeposit].bankPhoneCall + "</td>" +
			        "<td>" + bankList[bankdeposit].insertUserId + "</td>" +
			        "<td>" + bankList[bankdeposit].insertDay + "</td>" +
			        "<td>" + bankList[bankdeposit].updateUserId + "</td>" +
			        "<td>" + bankList[bankdeposit].updateDay + "</td>" +
			        "</tr>");
			  }
			  $newTbody.append("</tbody>");
			  $(".chosen-select").chosen();
		}
		
		$(document.body).delegate('#simple-table-1 tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			
			$("input[name=depositNo]").val(td.eq(1).text());
			$("input[name=depositOld]").val(td.eq(1).text());
			$("input[name=bankCode]").val(td.eq(2).text());
			$("input[name=depositHost]").val(td.eq(3).text());
			$("input[name=makeDate]").val(td.eq(4).text());
			$("input[name=enDate]").val(td.eq(5).text());
			$("input[name=balance]").val(td.eq(6).text());
			$("input[name=depositLimit]").val(td.eq(7).text());
			$("input[name=profit]").val(td.eq(8).text());	
			$("input[name=bankName]").val(td.eq(9).text());
			$("input[name=bankLocation]").val(td.eq(10).text());
			$("input[name=banker]").val(td.eq(11).text());
			$("input[name=bankPhoneCall]").val(td.eq(12).text());
			
			$("input[name=bankName]").prop("readonly", true);
			$("input[name='bankLocation']").prop("readonly", true);
			$("input[name='banker']").prop("readonly", true);
			$("input[name='bankPhoneCall']").prop("readonly", true);  
		});
		
		function settingInput(bankList) {
			$("input[name=depositNo]").val(bankList[0].depositNo);
			$("input[name=depositOld]").val(bankList[0].depositNo);
			$("input[name=bankCode]").val(bankList[0].bankCode);
			$("input[name=depositHost]").val(bankList[0].depositHost);
			$("input[name=makeDate]").val(bankList[0].makeDate);
			$("input[name=enDate]").val(bankList[0].enDate);
			$("input[name=balance]").val(bankList[0].balance);
			$("input[name=depositLimit]").val(bankList[0].depositLimit);
			$("input[name=profit]").val(bankList[0].profit);	
			$("input[name=bankName]").val(bankList[0].bankName);
			$("input[name=bankLocation]").val(bankList[0].bankLocation);
			$("input[name=banker]").val(bankList[0].banker);
			$("input[name=bankPhoneCall]").val(bankList[0].bankPhoneCall);
			
			$("input[name=bankName]").prop("readonly", true);
			$("input[name='bankLocation']").prop("readonly", true);
			$("input[name='banker']").prop("readonly", true);
			$("input[name='bankPhoneCall']").prop("readonly", true);  
		}
		
		$(document.body).delegate('#selectAll', 'click', function() {
			if(this.checked) {
		        // Iterate each checkbox
		        $(':checkbox').each(function() {
		            this.checked = true;                        
		        });
		    } else {
		        $(':checkbox').each(function() {
		            this.checked = false;                       
		        });
		    }
		});
		
		$(".chosen-select").chosen();
		
		
		// 4조 - 은행코드 검색
		$("#a-dialog-bankcode").click(function(event){
			event.preventDefault();
			$("#tbody-bankList").find("tr").remove();
			
			var bankcodeVal = $("#input-dialog-bankcode").val();
			console.log(bankcodeVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getbankcode?bankcodeVal=" + bankcodeVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(response){
					$("#input-dialog-bankcode").val('');
					$("#tbody-bankList").append("<tr>" +
							"<td class='center'>" + item.code + "</td>" +
					        "<td class='center'>" + item.name + "</td>" +
					        "<td class='center'>" + item.store + "</td>" +
					        "<td style='visibility:hidden;position:absolute;'>" + item.mgr + "</td>" +
					        "<td style='visibility:hidden;position:absolute;'>" + item.mgrPhone + "</td>" +
					        "</tr>");
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// 은행명 검색 : 은행목록 리스트로 가져오기
		$('#dialog-message-table').on('click', '#a-dialog-bankname', function(event) {
			event.preventDefault();
			$("#tbody-bankList").find("tr").remove();
			
			var banknameVal = $("#input-dialog-bankname").val();
			console.log(banknameVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getbankname?banknameVal=" + banknameVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(data){
					$("#input-dialog-bankname").val('');
					 $.each(data,function(index, item){
			                $("#tbody-bankList").append("<tr>" +
			                		"<td class='center'>" + item.code + "</td>" +
							        "<td class='center'>" + item.name + "</td>" +
							        "<td class='center'>" + item.store + "</td>" +
							        "<td style='visibility:hidden;position:absolute;'>" + item.mgr + "</td>" +
							        "<td style='visibility:hidden;position:absolute;'>" + item.mgrPhone + "</td>" +
							        "</tr>");
			         })
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 form에 추가
		$(document.body).delegate('#tbody-bankList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=bankCode]").val(td.eq(0).text());
			$("input[name=bankName]").val(td.eq(1).text());
			$("input[name=bankLocation]").val(td.eq(2).text());
			$("input[name=banker]").val(td.eq(3).text());
			$("input[name=bankPhoneCall]").val(td.eq(4).text());
			$("#dialog-message").dialog('close');
		});
		
	});
	
	function createNewPage(dataResult, a){
		var inputString = "<ul>";
		
		console.log('${dataResult.pagination.page }');
        
        if('${dataResult.pagination.prev }') {
        		inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }'><i class='icon-double-angle-left'></i></a></li>";
        } else {
        		inputString += "<li class='disabled'><a href='#'><i class='icon-double-angle-left'></i></a></li>";
        }
        
        if(a == "create" || a == "delete") {
        	inputString +=	"<li class='active'><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+1+"'>"+1+"</a></li>";
			for(var pg = 2; pg < 5; pg++) {
				inputString += 	"<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+pg+"'>"+pg+"</a></li>";
        	}
    	} else {
        	for(var pg = "${dataResult.pagination.startPage }"; pg <= "${dataResult.pagination.endPage }"; pg++) {
        		if("${dataResult.pagination.page }" == pg){
            		inputString +=	"<li class='active'><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+1+"'>"+1+"</a></li>";
        		} else {
	        		inputString += 	"<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+pg+"'>"+pg+"</a></li>";
	        	}
        	}
        }
	            
        if ('${dataResult.pagination.next }') {
        		inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage - 1 }'><i class='icon-double-angle-right'></i></a></li>";
        } else {
        		inputString += "<li class='disabled'><a href='#'><i class='icon-double-angle-right'></i></a></li>";
        }
        inputString += "</ul>";
        alert(inputString);
        $("#pagination").append(inputString);
        
   };
	
	// Popup
	$(function() {
		$("#dialog-message").dialog({
			autoOpen : false
		});

		$("#a-bankinfo-dialog").click(function() {
			$("#dialog-message").dialog('open');
			$("#dialog-message").dialog({
				title: "은행정보",
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
			          	$(this).dialog('close');
			          	$('#tbody-bankList tr').remove();
			        }
			    }
			});
		});

	});
	  
	
</script>

<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">



				<div class="page-header position-relative">
					<h1 class="pull-left">계좌 관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->

				<!-- PAGE CONTENT BEGINS -->
				<!-- PAGE CONTENT BEGINS -->

				<form class="form-horizontal" id="input-form" name="input-form"
					method="post">
					<div class="row-fluid">
						<div class="span6">
							<div class="tabbable">

								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="depositNo"
											placeholder="계좌 번호" /> <input type="hidden"
											name="depositOld" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">예 금 주</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="depositHost"
											placeholder="예금주 (이름)" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">개설 일자</label>

									<div class="controls">
										<div class="input-append">
											<input type="text" id="datepicker" name="makeDate"
												class="cl-date-picker" /> <span class="add-on"> <i
												class="icon-calendar"></i>
											</span>
										</div>
										&nbsp; &nbsp; 만기 일자 &nbsp;
										<div class="input-append">
											<input type="text" id="datepicker" name="enDate"
												class="cl-date-picker" /> <span class="add-on"> <i
												class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">잔액 </label>

									<div class="controls">
										<input type="text" id="form-field-1" name="balance"
											placeholder="잔액" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">이 율 </label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="이율(%)"
											name="profit" /> &nbsp; &nbsp; 예금 한도 &nbsp; <input
											type="text" id="form-field-1" name="depositLimit"
											placeholder="예금한도(만원)" />
									</div>
								</div>

							</div>
							<!-- /tabbable -->
						</div>
						<!-- /span -->

						<!-- 4조에서 데이터 가져오는 부분 -->
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행 코드 </label>
								<div class="controls">

									<span class="btn btn-small btn-info"> <a href="#"
										id="a-bankinfo-dialog"> <i
											class="icon-search nav-search-icon"></i> <input type="text"
											class="search-input-width-first" name="bankCode" />
									</a>
									</span> <input type="text" id="form-field-1" name="bankName"
										placeholder="" />

								</div>
							</div>

							<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
							<div id="dialog-message" title="은행코드" hidden="hidden">
								<table id="dialog-message-table">
									<tr>
										<td><label>은행코드</label> <input type="text"
											id="input-dialog-bankcode" style="width: 100px;" /> <a
											href="#" id="a-dialog-bankcode"> <span
												class="btn btn-small btn-info" style="margin-bottom: 10px;">
													<i class="icon-search nav-search-icon"></i>
											</span>
										</a></td>
										<td><label>은행명</label> <input type="text"
											id="input-dialog-bankname" style="width: 100px;" /> <a
											href="#" id="a-dialog-bankname"> <span
												class="btn btn-small btn-info" style="margin-bottom: 10px;">
													<i class="icon-search nav-search-icon"></i>
											</span>
										</a></td>
									</tr>
								</table>
								<!-- 은행코드 및 은행명 데이터 리스트 -->
								<table id="modal-bank-table"
									class="table  table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">은행코드</th>
											<th class="center">은행명</th>
											<th class="center">지점명</th>
										</tr>
									</thead>
									<tbody id="tbody-bankList">
									</tbody>
								</table>
							</div>
							<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->

							<div class="control-group">
								<label class="control-label" for="form-field-1">개설 지점 </label>
								<div class="controls">
									<input type="text" id="form-field-2" name="bankLocation"
										placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행담당자 </label>
								<div class="controls">
									<input type="text" id="form-field-2" name="banker"
										placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행전화번호 </label>
								<div class="controls">
									<input type="text" id="form-field-2" name="bankPhoneCall"
										placeholder="Username" />
								</div>
							</div>
						</div>
						<!-- /.span -->
					</div>
					<!-- /row -->


					<!-- buttons -->
					<div class="row-fluid">
						<div class="span12">
							<div class="hr hr-18 dotted"></div>
							<button type="submit" class="btn btn-info btn"
								formaction="${pageContext.request.contextPath}/01/25/read"
								id="btn-read" name="btn-read">조회</button>
							<button type="submit" class="btn btn-danger btn"
								formaction="${pageContext.request.contextPath}/01/25/delete"
								id="btn-delete" name="btn-delete">삭제</button>
							<button type="submit" class="btn btn-warning btn"
								formaction="${pageContext.request.contextPath}/01/25/update"
								id="btn-update" name="btn-update">수정</button>
							<button type="submit" class="btn btn-primary btn" id="btn-create"
								name="btn-create">입력</button>
							<button type="reset" class="btn btn-default btn">취소</button>
							<div class="hr hr-18 dotted"></div>
						</div>
						<!-- /.span -->
					</div>
					<!-- /.row-fluid -->

					<!-- Tables -->
					<div class="row-fluid">
						<div class="span12">
							<table id="simple-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace" id="selectAll" /> <span class="lbl"></span>
										</label></th>
										<th>계좌번호</th>
										<th>은행번호</th>
										<th>예금주</th>
										<th>개설일자</th>
										<th>만기일자</th>
										<th>잔액</th>
										<th>예금한도(만원)</th>
										<th>이율(%)</th>
										<th>은행</th>
										<th>개설지점</th>
										<th>담당자</th>
										<th>은행전화번호</th>
										<th>입력담당자</th>
										<th>입력일자</th>
										<th>수정담당자</th>
										<th>수정일자</th>
									</tr>
								</thead>

								<tbody class="origin-tbody">

									<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" /> <span class="lbl"></span>
											</label></td>

											<td>${vo.depositNo }</td>
											<td>${vo.bankCode }</td>
											<td>${vo.depositHost }</td>
											<td>${vo.makeDate}</td>
											<td>${vo.enDate}</td>
											<td>${vo.balance}</td>
											<td>${vo.depositLimit }</td>
											<td>${vo.profit}</td>
											<td>${vo.bankName }</td>
											<td>${vo.bankLocation }</td>
											<td>${vo.banker }</td>
											<td>${vo.bankPhoneCall }</td>
											<td>${vo.insertUserId }</td>
											<td>${vo.insertDay }</td>
											<td>${vo.updateUserId }</td>
											<td>${vo.updateDay }</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
						<!-- /span -->
					</div>
				</form>
				<!-- /form -->

				<!-- /row -->
				<div class="pagination" id = "pagination">
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
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }"><i
										class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i
										class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<!-- /.page-content -->
		</div>	<!-- /.main-content -->
	</div>	<!-- /.main-container -->




	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>