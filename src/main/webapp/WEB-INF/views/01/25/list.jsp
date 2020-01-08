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
	
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
}

.cl-date-picker {
	width: 150px;
}

.form-horizontal .control-label {
	text-align: left
}

html, body {
	height: 100%;
}

.main-container {
	height: calc(100% - 45px);
	overflow-x: hidden;
}

.main-content {
	overflow: auto;
}

.page-content {
	min-width: 1280px;
}

@media screen and (max-width: 920px) {
	.main-container {
		height: calc(100% - 84px);
	}
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
	var nochecked = false;
	$(function() {
		var a;
		$("#btn-create").click(function(){
			a = "create";
		});
		$("#btn-read").click(function(){
			a = "read";
			$("input[name=balance]").val(0); 
			$("input[name=depositLimit]").val(0);
			$("input[name=profit]").val(0);
		});
		$("#btn-update").click(function(){
			a = "update";
		});
		$("#btn-delete").click(function(){
			a = "delete";
		});
		$("#btn-reset").click(function(){
			$("#depositNo").attr("readonly",false);
			$("#btn-check-no").show();
			$("#img-checkno").hide();
			$("#btn-create").show();
		});
		
		$("#input-form").submit(function(event) {
	        event.preventDefault();
	        
	        $("input[name=balance]").val($("input[name=balance]").val().replace(/[^0-9]/g,""));
	        $("input[name=depositLimit]").val($("input[name=depositLimit]").val().replace(/[^0-9]/g,""));
	        
	        
	        
			var queryString = $("form[name=input-form]").serializeArray();
			
			if("${param.page}") {
				queryString.push({name: 'page', value: "${param.page}"});
			}
			
			if(a == "create") {
				// 유효성 검사를 만족하지 못하면 모달을 띄운다.
				if(nochecked==false){

					openErrorModal("DUPLICATE CHECK ERROR","계좌번호 중복검사는 필수입니다.",'#no');
					$("#btn-check-no").show();
					return;
				}
				if(!InsertValidation()){
					openErrorModal(errortitle,validationMessage,errorfield);
					return;
				}
				
				$.ajax({
				    url: "${pageContext.request.contextPath}/${menuInfo.mainMenuCode}/${menuInfo.subMenuCode}/create",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.fail) {
				    		openErrorModal("FAIL","다시 입력해주세요.");
				    	}
				    	if(dataResult.success) {
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		openErrorModal("CREATE SUCCESS","계좌 생성이 완료되었습니다.");
				    		
				    		removeTable();
				    		var bankList = dataResult.bankList;
				    		createNewTable(bankList);
				    		
				    		$('#pagination ul').remove();
				    		createNewPage(dataResult, a);
				    		$('#pagination').show();
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
				    		openErrorModal("READ SUCCESS","계좌 검색이 완료되었습니다.");
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
				// 유효성 검사를 만족하지 못하면 모달을 띄운다.
				if(!InsertValidation()){
					openErrorModal(errortitle,validationMessage,errorfield);
					return;
				}
				
				$.ajax({
				    url: "${pageContext.request.contextPath}/01/25/update",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.success) {
				    		openErrorModal("UPDATE SUCCESS","계좌 수정이 완료되었습니다.");
				    		removeTable();
				    		
				    		var bankList = dataResult.bankList;
				    		createNewTable(bankList);
				    	}
				    	if(dataResult.fail) {
				    		openErrorModal("FAIL","다시 입력해주세요.");
				    	}
				    	
				    	$('#pagination ul').remove();
			    		createNewPage(dataResult, a);
			    		$('#pagination').show();
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
				    		openErrorModal("DELETE SUCCESS","계좌 삭제가 완료되었습니다.");
				    		removeTable();
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		var bankList = dataResult.bankList;
				    		createNewTable(bankList);
				    	}
				    	
				    	$('#pagination ul').remove();
			    		createNewPage(dataResult, a);
			    		$('#pagination').show();
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
			        "<td>" + bankList[bankdeposit].depositNo + "</td>" +
			        "<td>" + bankList[bankdeposit].bankCode + "</td>" +
			        "<td>" + bankList[bankdeposit].depositHost + "</td>" +
			        "<td>" + bankList[bankdeposit].makeDate + "</td>" +
			        "<td>" + bankList[bankdeposit].enDate + "</td>" +
			        "<td style ='text-align:right'>" + addCommas(bankList[bankdeposit].balance) + "</td>" +	
			        "<td style ='text-align:right'>" + addCommas(bankList[bankdeposit].depositLimit) + "</td>" +
			        "<td style ='text-align:right'>" + bankList[bankdeposit].profit + "</td>" +
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
		

		$("input[name=balance]").on('keyup', function(event) {
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
		});

		$("input[name=depositLimit]").on('keyup', function(event) {
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
		});

		$(document.body).delegate('#simple-table-1 tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();

			$("input[name=depositNo]").val(td.eq(0).text());
			$("input[name=depositOld]").val(td.eq(0).text());
			$("input[name=bankCode]").val(td.eq(1).text());
			$("input[name=depositHost]").val(td.eq(2).text());
			$("input[name=makeDate]").val(td.eq(3).text());
			$("input[name=enDate]").val(td.eq(4).text());
			$("input[name=balance]").val(td.eq(5).text());
			$("input[name=depositLimit]").val(td.eq(6).text());
			$("input[name=profit]").val(td.eq(7).text());
			$("input[name=bankName]").val(td.eq(8).text());
			$("input[name=bankLocation]").val(td.eq(9).text());
			$("input[name=banker]").val(td.eq(10).text());
			$("input[name=bankPhoneCall]").val(td.eq(11).text());

			$("input[name=depositNo]").prop("readonly", true);
			$("#btn-check-no").hide();
			$("#img-checkno").hide();
			$("input[name=bankName]").prop("readonly", true);
			$("input[name='bankLocation']").prop("readonly", true);
			$("input[name='banker']").prop("readonly", true);
			$("input[name='bankPhoneCall']").prop("readonly", true);
			$("#btn-create").hide();
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
			
			$("#btn-create").hide();
		}

		$(document.body).delegate('#selectAll', 'click', function() {
			if (this.checked) {
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
		$("#a-dialog-bankcode")
				.click(
						function(event) {
							event.preventDefault();
							$("#tbody-bankList").find("tr").remove();

							var bankcodeVal = $("#input-dialog-bankcode").val();
							console.log(bankcodeVal);
							// ajax 통신
							$
									.ajax({
										url : "${pageContext.request.contextPath }/api/selectone/getbankcode?bankcode="
												+ bankcodeVal,
										contentType : "application/json; charset=utf-8",
										type : "get",
										dataType : "json", // JSON 형식으로 받을거다!! (MIME type)
										data : "",
										statusCode : {
											404 : function() {
												alert("page not found");
											}
										},
										success : function(response) {
											$("#input-dialog-bankcode").val('');
											$("#tbody-bankList")
													.append(
															"<tr>"
																	+ "<td class='center'>"
																	+ response.data.code
																	+ "</td>"
																	+ "<td class='center'>"
																	+ response.data.name
																	+ "</td>"
																	+ "<td class='center'>"
																	+ response.data.store
																	+ "</td>"
																	+ "<td style='visibility:hidden;position:absolute;'>"
																	+ response.data.mgr
																	+ "</td>"
																	+ "<td style='visibility:hidden;position:absolute;'>"
																	+ response.data.mgrPhone
																	+ "</td>"
																	+ "</tr>");
										},
										error : function(xhr, error) {
											console.error("error : " + error);
										}
									});
						});

		// 은행명 검색 : 은행목록 리스트로 가져오기
		$('#dialog-message-table')
				.on(
						'click',
						'#a-dialog-bankname',
						function(event) {
							event.preventDefault();
							$("#tbody-bankList").find("tr").remove();

							var banknameVal = $("#input-dialog-bankname").val();
							console.log(banknameVal);
							// ajax 통신
							$
									.ajax({
										url : "${pageContext.request.contextPath }/api/selectone/getbankname?banknameVal="
												+ banknameVal,
										contentType : "application/json; charset=utf-8",
										type : "get",
										dataType : "json", // JSON 형식으로 받을거다!! (MIME type)
										data : "",
										statusCode : {
											404 : function() {
												alert("page not found");
											}
										},
										success : function(data) {
											$("#input-dialog-bankname").val('');
											$
													.each(
															data,
															function(index,
																	item) {
																$(
																		"#tbody-bankList")
																		.append(
																				"<tr>"
																						+ "<td class='center'>"
																						+ item.code
																						+ "</td>"
																						+ "<td class='center'>"
																						+ item.name
																						+ "</td>"
																						+ "<td class='center'>"
																						+ item.store
																						+ "</td>"
																						+ "<td style='visibility:hidden;position:absolute;'>"
																						+ item.mgr
																						+ "</td>"
																						+ "<td style='visibility:hidden;position:absolute;'>"
																						+ item.mgrPhone
																						+ "</td>"
																						+ "</tr>");
															})
										},
										error : function(xhr, error) {
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
	

	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	

	var validationMessage = '';
	var errortitle = '';
	var errorfield = '';

	function openErrorModal(title, message, errorfield) {
		$('#staticBackdropLabel').html(title);
		$('#staticBackdropBody').text(message);

		console.log($('#staticBackdropLabel').text());
		console.log($('#staticBackdropBody').text());

		$("#staticBackdrop").dialog({
			resizable : false,
			modal : true,
			title : title,
			buttons : [ {
				text : "OK",
				"class" : "btn btn-danger btn-mini",
				click : function() {
					$(this).dialog('close');
					$('#staticBackdropBody').text('');
					$(errorfield).focus();
				}

			} ]
		});

		$("#staticBackdrop").dialog('open');//모달을 띄운다
	}

	//insert Validation

	function InsertValidation() {
		let depositNo = $('#depositNo').val();
		let depositHost = $('#depositHost').val();
		let makeDate = $('#makeDate').val();
		let enDate = $('#enDate').val();
		let balance = $('#balance').val();
		let depositLimit = $('#depositLimit').val();
		let profit = $('#profit').val();
		let bankCode = $('#bankCode').val();

		//계좌번호 Valid
		if ('' === depositNo) {
			errortitle = 'DEPOSIT_NO ERROR';
			validationMessage = '계좌번호는\r\n필수입력항목입니다.';
			errorfield = '#depositNo';
			return false;
		}
		//예금주 Valid
		if ('' === depositHost) {
			errortitle = 'DEPOSIT_HOST ERROR';
			validationMessage = '예금주는\r\n필수입력항목입니다.';
			errorfield = '#depositHost';
			return false;
		}

		//기간 Valid
		if ('' === makeDate) {
			errortitle = 'makeDate ERROR';
			validationMessage = '개설일자는\r\n필수입력항목입니다.';
			errorfield = '#validityMM';
			return false;
		}
		if ('' === enDate) {
			errortitle = 'enDate ERROR';
			validationMessage = '만기일자는\r\n필수입력항목입니다.';
			errorfield = '#validityYY';
			return false;
		}

		//balance Valid
		if ('' === balance) {
			errortitle = 'balance ERROR';
			validationMessage = '잔액은\r\n필수입력항목입니다.';
			errorfield = '#user';
			return false;
		}
		//depositLimit  Valid
		if ('' === depositLimit) {
			errortitle = 'depositLimit  ERROR';
			validationMessage = '예금한도는\r\n필수입력항목입니다.';
			errorfield = '#issuer ';
			return false;
		}
		//profit  Valid
		if ('' === profit) {
			errortitle = 'profit  ERROR';
			validationMessage = '이율은\r\n필수입력항목입니다.';
			errorfield = '#issuer ';
			return false;
		}
		//bankCode Valid
		if ('' === bankCode) {
			errortitle = 'bankCode  ERROR';
			validationMessage = '은행코드, 개설지점, 은행담당자, 은행전화번호는\r\n필수입력항목입니다. \r\n 팝업창을 통해 입력해주세요';
			errorfield = '#depositNo ';
			return false;
		}

		return true;
	}

	//숫자, del, - 키만 동작하도록한다.
	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode;
		var _value = event.srcElement.value;

		if ((event.keyCode < 48) || (event.keyCode > 57)) {//1~0
			if (event.keyCode != 46) {//delete
				return false;
			}
		}
		if (event.keyCode != 109) {//delete
			return false;
		}
		if (event.keyCode != 189) {//delete
			return false;
		}
		return true;

	}

	//숫자와 delete 키만 동작하도록한다.
	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode;
		var _value = event.srcElement.value;

		if ((event.keyCode < 48) || (event.keyCode > 57)) {//1~0
			if (event.keyCode != 46) {//delete
				return false;
			}
		}	
		return true;

	}

	//한글입력 방지
	function delHangle(evt) {
		var objTarger = evt.srcElement || evt.target;
		var val = event.srcElement.value;
		if (/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(val)) {
			objTarger.value = null;
		}
	}

	function createNewPage(dataResult, a) {
		var inputString = "<ul>";

		// 앞
		if (dataResult.pagination.prev != 0) {
			inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="
					+ (dataResult.pagination.startPage - 1)
					+ "'><i class='icon-double-angle-left'></i></a></li>";
		} else {
			inputString += "<li class='disabled'><a href='#'><i class='icon-double-angle-left'></i></a></li>";
		}

		// 중간
		for (var pg = dataResult.pagination.startPage; pg <= dataResult.pagination.endPage; pg++) {
			if (dataResult.pagination.page == pg) {
				inputString += "<li class='active'><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="
						+ pg + "'>" + pg + "</a></li>";
			} else {
				inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="
						+ pg + "'>" + pg + "</a></li>";
			}
		}

		// 뒤        
		if (dataResult.pagination.next != 0) {
			inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="
					+ (dataResult.pagination.endPage + 1)
					+ "'><i class='icon-double-angle-right'></i></a></li>";
		} else {
			inputString += "<li class='disabled'><a href='#'><i class='icon-double-angle-right'></i></a></li>";
		}

		inputString += "</ul>";
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
				title : "은행정보",
				title_html : true,
				resizable : false,
				height : 500,
				width : 400,
				modal : true,
				close : function() {
					$('#tbody-bankList tr').remove();
				},
				buttons : {
					"닫기" : function() {
						$(this).dialog('close');
						$('#tbody-bankList tr').remove();
					}
				}
			});
		});
		
		
		//사업자등록번호 중복체크
		$("#depositNo").change(function(){
			$("#btn-check-no").show();
			$("#img-checkno").hide();
			nochecked = false;
		});	
		
		$("#btn-check-no").click(function(){
			
			var depositNo = $("#depositNo").val();
			
			//계좌번호 Valid
			if ('' === depositNo) {
				errortitle = 'DEPOSIT_NO ERROR';
				validationMessage = '계좌번호는\r\n필수입력항목입니다.';
				errorfield = '#depositNo';
				openErrorModal(errortitle,validationMessage,errorfield);
				return;
			}
			
			// 중복체크
			$.ajax({
				url: "${pageContext.servletContext.contextPath }/01/25/checkno?depositNo=" + depositNo,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json",
				data: "",
				success: function(response){
					console.log(response);
					if(response.result){
						nochecked = true;
						openErrorModal("DUPLICATE CHECK COMPLETE","중복 검사가 완료되었습니다.");
						$("#btn-check-no").hide();
						$("#img-checkno").show();
						return;
					}
					else {
						nochecked = true;
						$("#btn-check-no").show();
						$("#img-checkno").hide();
						openErrorModal('DUPLICATE DEPOSIT',"중복된 계좌입니다.");
						return;
					}
				},
				error:function(xhr,error) {
					console.err("error" + error);
				}
			});
		});

	});
</script>


</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">계좌 관리</h1>
				</div>
				<!-- /.page-header -->

				<!-- PAGE CONTENT BEGINS -->
				<!-- PAGE CONTENT BEGINS -->

				<form class="form-horizontal" id="input-form" name="input-form"
					method="post">
					<div class="row-fluid">
						<div class="span7">
							<div class="tabbable">

								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align=left">계 좌 번 호</label>

									<div class="controls">
										<input type="text" id="depositNo" name="depositNo"
											placeholder="계좌 번호"  /> <input type="hidden"
											name="depositOld" />
											
										<input id="btn-check-no" type="button" value="중복확인">
										<img id="img-checkno" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">	
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">예 금 주</label>

									<div class="controls">
										<input type="text" id="depositHost" name="depositHost"
											placeholder="예금주 (이름)" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">개 설 일 자</label>

									<div class="controls">
										<div class="input-append">
											<input type="text" id="makeDate" name="makeDate"
												class="cl-date-picker" /> <span class="add-on"> <i
												class="icon-calendar"></i>
											</span>
										</div>
										&nbsp; &nbsp; 만 기 일 자 &nbsp;
										<div class="input-append">
											<input type="text" id="enDate" name="enDate"
												class="cl-date-picker" /> <span class="add-on"> <i
												class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">잔 액 </label>

									<div class="controls">
										<input type="text" id="balance" name="balance"
											placeholder="잔액" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">이 율 </label>

									<div class="controls">
										<input type="text" id="profit" placeholder="이율(%)"
											name="profit" /> &nbsp; &nbsp; 예금 한도 &nbsp; <input
											type="text" id="depositLimit" name="depositLimit"
											placeholder="예금한도(만원)" />
									</div>
								</div>

							</div>
							<!-- /tabbable -->
						</div>
						<!-- /span -->

						<!-- 4조에서 데이터 가져오는 부분 -->
						<div class="span5">
							<div class="control-group">
								<label class="control-label" for="form-field-1">은 행 명 </label>
								<div class="controls">
								<div class="input-append">
									<a href="#"	id="a-bankinfo-dialog">  <input type="text"
											class="bankCode" name="bankCode" />
										<span class="add-on">
											<i class="icon-search icon-on-right bigger-110"></i>
										</span>
									</a>
								</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은 행 코 드 </label>
								<div class="controls">
									<input type="text" id="form-field-1" name="bankName"
										placeholder="은행코드" readonly />
								</div>
							</div>

							<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
							<div id="dialog-message" title="은행코드" hidden="hidden">
								<table id="dialog-message-table">
									<tr>
										<td><label>은행코드</label>
										<div class="input-append">
										 <input type="text" class="input-dialog-bank"
											id="input-dialog-bankcode" style="width: 100px;" /> <a
											href="#" id="a-dialog-bankcode">
											<span class="add-on">
											<i class="icon-search icon-on-right bigger-110"></i>
											</span>
										</a>
										</div>
										</td>
										<td><label>은행명</label> 
										<div class="input-append">
										<input type="text" class="input-dialog-bank"
											id="input-dialog-bankname" style="width: 100px;" /> <a
											href="#" id="a-dialog-bankname">
											<span class="add-on">
											<i class="icon-search icon-on-right bigger-110"></i>
											</span>
										</a>
										</div>
										</td>
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
								<label class="control-label" for="form-field-1">개 설 지 점 </label>
								<div class="controls">
									<input type="text" id="bankLocation" name="bankLocation"
										placeholder="개설 지점" readonly/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은 행 담 당 자 </label>
								<div class="controls">
									<input type="text" id="banker" name="banker"
										placeholder="은행 담당자" readonly/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은 행 전 화 번 호 </label>
								<div class="controls">
									<input type="text" id="bankPhoneCall" name="bankPhoneCall"
										placeholder="은행 전화번호" readonly/>
								</div>
							</div>
						</div>
						<!-- /.span -->
					</div>
					<!-- /row -->
					
					<!-- Validation Modal Start -->
					<div id="staticBackdrop" class="hide">
						<br>
						<pre id="staticBackdropBody" class="bolder grey"
							style="text-align: center; background-color: white; border-color: white">
									</pre>
					</div>


					<!-- buttons -->
					<div class="row-fluid">
						<div class="span12">
							<div class="hr hr-18 dotted"></div>
							<button type="submit" class="btn btn-info btn"
								id="btn-read" name="btn-read">조회</button>
							<button type="submit" class="btn btn-danger btn"
								id="btn-delete" name="btn-delete">삭제</button>
							<button type="submit" class="btn btn-warning btn"
								id="btn-update" name="btn-update">수정</button>
							<button type="submit" class="btn btn-primary btn" id="btn-create"
								name="btn-create">입력</button>
							<button type="reset" class="btn btn-default btn" id="btn-reset"
								name="btn-reset">초기화</button>
							<div class="hr hr-18 dotted"></div>
						</div>
						<!-- /.span -->
					</div>
					<!-- /.row-fluid -->

					<!-- Tables -->
					<div class="row-fluid">
						<div class="span12" style="overflow:auto;">
							<table id="simple-table-1"
								class="table table-striped table-bordered table-hover" style="min-width:2000px;margin-bottom:0;width:auto">
								<thead>
									<tr>
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
											<td>${vo.depositNo }</td>
											<td>${vo.bankCode }</td>
											<td>${vo.depositHost }</td>
											<td>${vo.makeDate}</td>
											<td>${vo.enDate}</td>
											<td style ="text-align:right"><fmt:formatNumber value="${vo.balance}" pattern="#,###"  /></td>
											<td style ="text-align:right"><fmt:formatNumber value="${vo.depositLimit }" pattern="#,###"  /></td>
											<td style ="text-align:right">${vo.profit}</td>
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
