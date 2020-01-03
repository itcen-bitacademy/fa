<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 다음 주소 팝업창 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	/*주소검색 api*/
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; 
	            var extraAddr = ''; 
	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else {
	                addr = data.jibunAddress;
	            }
	            if(data.userSelectedType === 'R'){
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            
	            } else {
	                document.getElementById("address").value = '';
	            }
	
	            document.getElementById("address").value = addr;
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	};
</script>

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

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
		$("#btn-reset").click(function(){
			$("#no").attr("readonly",false);
			$("#corporationNo").attr("readonly",false);
			$("#btn-check-no").show();
			$("#img-checkno").hide();
			
		});
		
		$("#inputform").submit(function(event) {
	        event.preventDefault();
			var queryString = $("form[name=inputform]").serializeArray();
			if("${param.page}") {
				queryString.push({name: 'page', value: "${param.page}"});
			}
			
			if(a == "create") {
				// 유효성 검사를 만족하지 못하면 모달을 띄운다.
				if(nochecked==false){

					openErrorModal("DUPLICATE CHECK ERROR","사업자등록번호 중복검사는 필수입니다.",'#no');
					$("#btn-check-no").show();
					return;
				}
				else{
					if(!InsertValidation()){
						openErrorModal(errortitle,validationMessage,errorfield);
						return;
					}
				}
				
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/create",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(result){
				    	if(result.fail) {
				    		//alert("다시 입력해주세요.");
				    		openErrorModal("CREATE FAIL","거래처 등록에 실패하였습니다. \r\n 다시입력해주세요.");
				    	}
				    	if(result.success) {
				    		$('#inputform').each(function(){
				    		    this.reset();
				    		});
				    		openErrorModal("CREATE SUCCESS","거래처 등록에 성공하였습니다.");
							$("#btn-check-no").show();
							$("#img-checkno").hide();
				    		//alert("거래처 등록이 완료되었습니다."); 
				    		
				    		removeTable();
				    		var customerList = result.customerList;
				    		createNewTable(customerList);
				    		
				    		$('#pagination ul').remove();
				    		createNewPage(result, a);
				    		
				    		$('#pagination').show();
				    	}
						
				    },
				    error: function( err ){
				    	
				    }
				 })
			} else if(a == "read") {
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/read",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(result){
				    	if(result.success) {
				    		openErrorModal("READ SUCCESS","거래처 조회가 완료되었습니다.");
							$("#btn-check-no").show();
				    		//alert("거래처 조회가 완료되었습니다."); 
				    		removeTable();
				    		$('#inputform').each(function(){
				    		    this.reset();
				    		});
				    		
				    		var customerList = result.customerList;
				    		createNewTable(customerList);
				    		//settingInput(customerList);
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
				var customername = document.getElementById("name").value;
				
				// 수정확인창을 띄운다.
				openDeleteModal('UPDATE CHECK', customername+"에 대한 \r\n수정된 정보를 반영하시겠습니까?");
				
				// 수정확인창 - 취소 버튼을 누르면 수정 X
				$("#deletecancel").click(function(){
					openErrorModal("UPDATE_CANCEL","거래처 수정이 취소 되었습니다.");
					console.log("cancel");
					return;
				});
				$("#deleteok").click(function(){
				
					$.ajax({
					    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
					    type: "POST",
					    data: queryString,
					    dataType: "json",
					    success: function(result){
					    	if(result.success) {
	
								openErrorModal("UPDATE SUCCESS","거래처 수정이 완료되었습니다.");
								$("#btn-check-no").show();
					    		//alert("거래처 수정이 완료되었습니다."); 
					    		removeTable();
					    		
					    		var customerList = result.customerList;
					    		createNewTable(customerList);
					    	}
					    	if(result.fail) {
					    		alert("다시 입력해주세요.");
					    	}
					    	
					    	$('#pagination ul').remove();
				    		createNewPage(result, a);
					    	$('#pagination').show();
					    },
					    error: function( err ){
					      	console.log(err)
					    }
					 })

				});
			} else if(a == "delete") {
				// 유효성 검사를 만족하지 못하면 모달을 띄운다.
				if(!DeleteValidation()){
					openErrorModal(errortitle,validationMessage,errorfield);
					return;
				}
				var customername = document.getElementById("name").value;
				
				// 삭제확인창을 띄운다.
				openDeleteModal('DELETE CHECK',customername+"에 대한\r\n 거래처정보를 삭제하시겠습니까?");
				
				// 삭제확인창 - 취소 버튼을 누르면 삭제 X
				$("#deletecancel").click(function(){
					openErrorModal("DELETE_CANCEL","거래처 삭제가 취소 되었습니다.");
					console.log("cancel");
					return;
				});
				
				// 삭제확인창 - 확인 버튼을 누르면 삭제O
				$("#deleteok").click(function(){
					console.log("deleteok");
					$.ajax({
					    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
					    type: "POST",
					    data: queryString,
					    dataType: "json",
					    success: function(result){
					    	if(result.success) {
					    		//alert("거래처 삭제가 완료되었습니다."); 
								openErrorModal("DELETE SUCCESS","거래처 삭제가 완료되었습니다.");
								$("#btn-check-no").show();
					    		removeTable();
					    		$('#inputform').each(function(){
					    		    this.reset();
					    		});
					    		
					    		var customerList = result.customerList;
					    		createNewTable(customerList);
					    	}
					    	
					    	$('#pagination ul').remove();
				    		createNewPage(result, a);
				    		$('#pagination').show();
					    },
					    error: function( err ){
					      	console.log(err)
					    }
					 })
				});
				
			} else {

	    		openErrorModal("UNKNOWN ERROR","알수없는 에러입니다 \r\n 다시 시도해주세요.");
				//alert("예외사항 발생");
			}
		
	});

	function removeTable(){
		  // 원래 테이블 제거
		  $(".origin-tbody").remove();
		  // ajax로 추가했던 테이블 제거
		  $(".new-tbody").remove();
	}
	
	function createNewTable(customerList){
		  var $newTbody = $("<tbody class='new-tbody'>")
		  $("#simple-table-1").append($newTbody)
			
		  for(let customer in customerList){
			  $newTbody.append(
			   	"<tr>" +
		        "<td>" + customerList[customer].no + "</td>" +
		        "<td>" + customerList[customer].name + "</td>" +
		        "<td>" + customerList[customer].ceo + "</td>" +
		        "<td>" + customerList[customer].address + "/" + customerList[customer].detailAddress + "</td>" +
		        "<td>" + customerList[customer].conditions + "/" + customerList[customer].item + "</td>" +
		        "<td>" + customerList[customer].assetsFlag + "</td>" +
		        "<td>" + customerList[customer].jurisdictionOffice + "</td>" +	
		        "<td>" + customerList[customer].phone + "</td>" +
		        "<td>" + customerList[customer].managerName + "</td>" +
		        "<td>" + customerList[customer].managerEmail + "</td>" +
		        "<td>" + customerList[customer].bankCode + "</td>" +
		        "<td>" + customerList[customer].bankName + "</td>" +
		        "<td>" + customerList[customer].depositNo + "</td>" +
		        "<td>" + customerList[customer].depositHost + "</td>" +
		        "<td>" + customerList[customer].insertDay + "</td>" +
		        "<td>" + customerList[customer].insertUserid + "</td>" +
		        "<td>" + customerList[customer].updateDay + "</td>" +
		        "<td>" + customerList[customer].updateUserid + "</td>" +
		        "</tr>");
		  }
		  $newTbody.append("</tbody>");
		  $(".chosen-select").chosen();
	}
	
	
	$(document.body).delegate('#simple-table-1 tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		//사업자 등록번호와 법인번호 => - 를 제거한다.
		var customerNo = td.eq(0).text();
		var noArray=customerNo.split('-');
		//법인번호
		if (noArray[2] !=null){
			$("input[name=corporationNo]").val(noArray[0]+noArray[1]+noArray[2]);
		} else if (noArray[2]==null){
			$("input[name=corporationNo]").val(noArray[0]);
		}
		//사업자등록번호
		if (noArray[2] !=null){
			$("input[name=no]").val(noArray[0]+noArray[1]+noArray[2]);
		} else if (noArray[2]==null){
			$("input[name=no]").val(noArray[0]);  
		}
		
		//거래처 번호 => - 를 제거한다.
		var customerPhone = td.eq(7).text();
		var phoneArray=customerPhone.split('-');
		
		if (phoneArray[2] !=null){
			$("input[name=phone]").val(phoneArray[0]+phoneArray[1]+phoneArray[2]);
		} else if (phoneArray[2]==null){
			$("input[name=phone]").val(phoneArray[0]+phoneArray[1]);
		}
		
		//거래처 주소를 '/'를 기준으로 끊어 주소와 상세주소로 구분한다.
		var customerAddr = td.eq(3).text();
		var addrArray=customerAddr.split('/');

		$("input[name=address]").val(addrArray[0]);//주소
		$("input[name=detailAddress]").val(addrArray[1]);//상세주소
		
		// '/'를기준으로 끊어 업태와 종목을 구분한다.
		var customerConIt = td.eq(4).text();
		var conitArray=customerConIt.split('/');
		
		$("input[name=conditions]").val(conitArray[0]);//업태
		$("input[name=item]").val(conitArray[1]);//업종
		
		//거래처명
		$("input[name=name]").val(td.eq(1).text());
		
		//대표자명
		$("input[name=ceo]").val(td.eq(2).text());
		
		//관할영업소
		$("input[name=jurisdictionOffice]").val(td.eq(6).text());
		
		//담당자 이메일
		$("input[name=managerEmail]").val(td.eq(9).text());
		
		//은행명
		$("input[name=bankName]").val(td.eq(11).text());
		
		//은행코드
		$("input[name=bankCode]").val(td.eq(10).text());
		
		//계좌번호
		$("input[name=depositNo]").val(td.eq(12).text());
		
		//거래처 담당자명
		$("input[name=managerName]").val(td.eq(8).text());
		
		//예금주
		$("input[name=depositHost]").val(td.eq(13).text());
		
		
		$("input[name=address]").prop("readonly", true);
		$("input[name=depositNo]").prop("readonly", true);
		$("input[name='bankCode']").prop("readonly", true);
		$("input[name='bankName']").prop("readonly", true);
		$("input[name='depositHost']").prop("readonly", true);
		
		//assets_flag(자산 거래처 종류) 값에 따라  radio 박스의 체크 상태가 변화한다.
		var td5 = td.eq(5).text();
		if(td5 == "토지"){
		$('input:radio[name=assetsFlag]:input[value="a"]').prop("checked", true);
		} else if (td5 =="건물"){
		$('input:radio[name=assetsFlag]:input[value="b"]').prop("checked", true);
		} else if (td5 =="차량"){
		$('input:radio[name=assetsFlag]:input[value="c"]').prop("checked", true);
		} else if (td5 =="무형자산"){
		$('input:radio[name=assetsFlag]:input[value="d"]').prop("checked", true);
		}
		
		//PK인 사업자 등록번호의  input box가 readonly 상태로 바뀌어 수정불가한 상태가 된다.
		$("#no").attr("readonly",true);

		$("#btn-check-no").hide();
		$("#img-checkno").hide();
	});
	
	function settingInput(customerList) {
		//var customerNo = td.eq(1).text();
		//var noArray=customerNo.split('-');
		//법인번호
		//if (noArray[2] !=null){
	//		$("input[name=corporationNo]").val(noArray[0]+noArray[1]+noArray[2]);
	//	} else if (noArray[2]==null){
	//		$("input[name=corporationNo]").val(noArray[0]);
	//	}
	//	$("input[name=name]").val(td.eq(2).text());
		
	
		$("input[name=no]").val(customerList[0].no);
		$("input[name=name]").val(customerList[0].name);
		$("input[name=ceo]").val(customerList[0].ceo);
		$("input[name=address]").val(customerList[0].address);
		$("input[name=conditions]").val(customerList[0].conditions);
		$("input[name=item]").val(customerList[0].item);
		$("input[name=corporationNo]").val(customerList[0].corporationNo);
		$("input[name=jurisdictionOffice]").val(customerList[0].jurisdictionOffice);
		$("input[name=phone]").val(customerList[0].phone);	
		$("input[name=managerEmail]").val(customerList[0].managerEmail);
		$("input[name=bankName]").val(customerList[0].bankName);
		$("input[name=bankCode]").val(customerList[0].bankCode);
		$("input[name=depositNo]").val(customerList[0].depositNo);
		$("input[name=managerName]").val(customerList[0].managerName);
		$("input[name=depositHost]").val(customerList[0].depositHost);
		$("input[name=depositNo]").prop("readonly", true);
		$("input[name=address]").prop("readonly", true);
		$("input[name='bankCode']").prop("readonly", true);
		$("input[name='bankName']").prop("readonly", true);
		$("input[name='depositHost']").prop("readonly", true);  
	}
	

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
	
	
    $('#dialog-message-table').on('click', '#a-dialog-depositNo', function(event) {
       event.preventDefault();
       $("#tbody-bankaccountList").find("tr").remove();
       
       var depositNo = $("#input-dialog-depositNo").val();
       
       // ajax 통신
       $.ajax({
          url: "${pageContext.request.contextPath }/01/25/gets?depositNo=" + depositNo,
          contentType : "application/json; charset=utf-8",
          type: "get",
          dataType: "json",
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
    
    // 은행리스트에서 row를 선택면 해당하는 form 에 반영된다.
    $(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
       var tr = $(this);
       var td = tr.children();
       //계좌번호
       $("input[name=depositNo]").val(td.eq(0).text());
       
       //예금주
       $("input[name=depositHost]").val(td.eq(1).text());
       
       //은행코드
       $("input[name=bankCode]").val(td.eq(2).text());
       
       //은행명
       $("input[name=bankName]").val(td.eq(3).text());
       $("#dialog-message").dialog('close');
    });
	
	$(".chosen-select").chosen();
	
	function createNewPage(result, a){
		var inputString = "<ul>";
        if(result.pagination.prev) {
        		inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+(result.pagination.startPage - 1)+"'><i class='icon-double-angle-left'></i></a></li>";
        } else {
        		inputString += "<li class='disabled'><a><i class='icon-double-angle-left'></i></a></li>";
        }
        
        
        for(var pg = result.pagination.startPage; pg <= result.pagination.endPage; pg++) {
        	if(result.pagination.page == pg){
           		inputString +=	"<li class='active'><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+pg+"'>"+pg+"</a></li>";
        	} else {
	       		inputString += 	"<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+pg+"'>"+pg+"</a></li>";
	       	}
        }
              
        if (result.pagination.next) {
        		inputString += "<li><a href='${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page="+(result.pagination.endPage + 1) +"'><i class='icon-double-angle-right'></i></a></li>";
        } else {
        		inputString += "<li class='disabled'><a><i class='icon-double-angle-right'></i></a></li>";
        }
        inputString += "</ul>";
        $("#pagination").append(inputString);
        
   };
});
</script>

<script type="text/javascript">
	var validationMessage ='';
	var errortitle='';
	var errorfield ='';
	var nochecked = false;
	
	function openErrorModal(title, message,errorfield) {
		$('#staticBackdropLabel').html(title);
		$('#staticBackdropBody').text(message);
		
		console.log($('#staticBackdropLabel').text());
		console.log($('#staticBackdropBody').text());
	
		$( "#staticBackdrop" ).dialog({
			resizable: false,
			modal: true,
			title: title,
			buttons: [
				{
					text: "OK",
					"class" : "btn btn-danger btn-mini",
					click: function() {
						$(this).dialog('close');
			          	$('#staticBackdropBody').text('');
						$(errorfield).focus();
					}
				}
			]
		});
	
		$("#staticBackdrop").dialog('open');//모달을 띄운다
	}

	//사업자등록번호 Valid
	function noValid(no){
			if('' === no){
				errortitle = 'CUSTOMER_NO ERROR';	
				validationMessage = '사업자등록번호는 반드시 입력해야합니다.';
				errorfield='#no';
				return false;
			}
			if(no.length<10 || no.length >10){
				errortitle = 'CUSTOMER_NO ERROR';
				validationMessage = '사업자등록번호는 10자리를 입력하셔야 합니다';
				errorfield='#no';
				return false;
			}
			return true;
		}
	
	//insert Validation
	function InsertValidation(){
		let name =$('#name').val();//상호명
		let ceo =$('#ceo').val();//대표자
		let address =$('#address').val();//종목
		let conditions =$('#conditions').val();//종목
		let item =$('#item').val();//업태
		let corporationNo=$('#corporationNo').val();//법인번호
		let phone=$('#phone').val();//거래처전화번호
		let assetsFlag=$('#assetsFlag').val();//종류
		let managerName=$('#managerName').val();//담당자 성명
		let managerEmail=$('#managerEmail').val();//이메일
		let bankCode=$('#bankCode').val();//은행코드
		let bankName=$('#bankName').val();//은행명
		let depositNo=$('#depositNo').val();//계좌번호
		let depositHost=$('#depositHost').val();//예금주
		
		//사업자등록번호 Valid
		//if('' === no){
		//	errortitle = 'CUSTOEMR_NO ERROR';
		//	validationMessage = '사업자 등록번호는\r\n필수입력항목입니다.';
		//	errorfield='#no';
		//	return false;
		//}
		//if(no.length<10 || no.length >10){
		//	errortitle = 'CUSTOEMR_NO ERROR';
		//	validationMessage = '사업자등록번호는\r\n10자리를 입력하셔야 합니다.';
		//	errorfield='#no';
		//	return false;
		//}
		
		//상호명 Valid
		if(''=== name){
			errortitle = 'CUSTOMER_NAME ERROR';
			validationMessage = '상호명은 필수입력항목입니다.';
			errorfield='#name';
			return false;
			
		}
		if(name.length > 20){
			errortitle = 'CUSTOMER_NAME ERROR';
			validationMessage = '상호명은\r\n20자 이하로 입력하셔야 합니다.';
			errorfield='#name';
			return false;
		}
		
		//대표자 Valid
		if(''=== ceo){
			errortitle = 'CUSTOMER_CEO ERROR';
			validationMessage = '대표자는 필수입력항목입니다.';
			errorfield='#ceo';
			return false;
			
		}
		if(ceo.length > 6){
			errortitle = 'CUSTOMER_CEO ERROR';
			validationMessage = '대표자는\r\n6자 이하로 입력하셔야 합니다.';
			errorfield='#ceo';
			return false;
		}
		
		//주소 Valid
		if(''=== address){
			errortitle = 'CUSTOMER_ADDRESS ERROR';
			validationMessage = '주소는 필수입력항목입니다.\r\n 팝업창을 통해 입력해주세요.';
			errorfield='#address';
			return false;
		}
		
		//업태 Valid
		if(''=== conditions){
			errortitle = 'CUSTOMER_CONDITIONS ERROR';
			validationMessage = '업태는 필수입력항목입니다.';
			errorfield='#conditions';
			console.log(conditions.length);
			return false;
		}
		if(conditions.length > 10){
			errortitle = 'CUSTOMER_CONDITIONS ERROR';
			validationMessage = '업태는\r\n10자 이하로 입력하셔야 합니다.';
			errorfield='#conditions';
			return false;
		}
		
		//종목 Valid
		if(''=== item){
			errortitle = 'CUSTOMER_ITEM ERROR';
			validationMessage = '종목은 필수입력항목입니다.';
			errorfield='#item';
			return false;
		}
		if(item.length > 10){
			errortitle = 'CUSTOMER_ITEM ERROR';
			validationMessage = '종목은\r\n10자 이하로 입력하셔야 합니다.';
			errorfield='#item';
			return false;
		}
		
		//법인번호 Valid
		if(''=== corporationNo){
			errortitle = 'CUSTOMER_CORPORATIONNO ERROR';
			validationMessage = '법인번호는 필수입력항목입니다.';
			errorfield='#corporationNo';
			return false;
		}
		if(corporationNo.length<10 || corporationNo.length >10){
			errortitle = 'CUSTOEMR_CORPORATIONNO ERROR';
			validationMessage = '법인번호는\r\n10자리를 입력하셔야 합니다.';
			errorfield='#corporationNo';
			return false;
		}
		
		//자산플래그 Valid
		if($(':radio[name=assetsFlag]:checked').length < 1){
			errortitle = 'CUSTOMER_ASSETSFLAG ERROR';
			validationMessage = '자산 종류는 필수입력항목입니다.';
			errorfield='#assetsFlag';
			return false;
		}
		
		//거래처 전화번호 Valid (11자)
		if(''=== phone){
			errortitle = 'CUSTOMER_PHONE ERROR';
			validationMessage = '거래처 전화번호는\r\n필수입력항목입니다.';
			errorfield='#phone';
			return false;
		}
		if(phone.length > 11){
			errortitle = 'CUSTOMER_PHONE ERROR';
			validationMessage = '거래처 전화번호는\r\n11자리 이하로 입력하셔야 합니다.';
			errorfield='#phone';
			return false;
		}
		
		//Email Valid
		if(''=== managerEmail){
			errortitle = 'CUSTOMER_Email ERROR';
			validationMessage = '이메일은 필수입력항목입니다.';
			errorfield='#managerEmail';
			return false;
		}
		//정규식에 따른 email 형식검사
		var re=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var email = document.getElementById('managerEmail').value;
		if (email = !re.test(email)) {
			errortitle = 'CUSTOMER_Email ERROR';
			validationMessage = '이메일 형식에 맞게 입력해주세요.\r\n 예)example@test.com';
			errorfield='#managerEmail';
			return false;
			} 
		
		//계좌번호, 은행코드, 은행명, 예금주 Valid (팝업창으로 유도)
		if(''=== depositNo){
			errortitle = 'CUSTOMER_DEPOSITNO ERROR';
			validationMessage = '계좌번호, 은행코드, 은행명, 예금주\r\n는 필수입력항목입니다. \r\n 팝업창을 통해 입력해주세요.';
			errorfield='#depositNo';
			return false;
		}
		
		//거래처 담당자 성명 Valid
		if(''=== managerName){
			errortitle = 'CUSTOMER_MANAGERNAME ERROR';
			validationMessage = '거래처 담당자 성명은\r\n필수입력항목입니다.';
			errorfield='#managerName';
			return false;
		}
		if(ceo.managerName > 6){
			errortitle = 'CUSTOMER_MANAGERNAME ERROR';
			validationMessage = '거래처 담당자 성명은\r\n6자 이하로 입력하셔야 합니다.';
			errorfield='#managerName';
			return false;
		}
	
		return true;
	}
	
	//delete Validation
	function DeleteValidation(){
		let no =$('#no').val();//사업자등록번호
		let name =$('#name').val();//상호명
		let ceo =$('#ceo').val();//대표자
		let address =$('#address').val();//종목
		let conditions =$('#conditions').val();//종목
		let item =$('#item').val();//업태
		let corporationNo=$('#corporationNo').val();//법인번호
		let phone=$('#phone').val();//거래처전화번호
		let assetsFlag=$('#assetsFlag').val();//종류
		let managerName=$('#managerName').val();//담당자 성명
		let managerEmail=$('#managerEmail').val();//이메일
		let bankCode=$('#bankCode').val();//은행코드
		let bankName=$('#bankName').val();//은행명
		let depositNo=$('#depositNo').val();//계좌번호
		let depositHost=$('#depositHost').val();//예금주
		
		//사업자등록번호 Valid
		if('' === no){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#no';
			return false;
		}
		
		//상호명 Valid
		if(''=== name){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#name';
			return false;
			
		}
		
		//대표자 Valid
		if(''=== ceo){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#ceo';
			return false;
			
		}
		
		//주소 Valid
		if(''=== address){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#address';
			return false;
		}
		
		//업태 Valid
		if(''=== conditions){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#conditions';
			console.log(conditions.length);
			return false;
		}
		
		//종목 Valid
		if(''=== item){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#item';
			return false;
		}
		
		//법인번호 Valid
		if(''=== corporationNo){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#corporationNo';
			return false;
		}
		
		//자산플래그 Valid
		if($(':radio[name=assetsFlag]:checked').length < 1){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#assetsFlag';
			return false;
		}
		
		//거래처 전화번호 Valid (11자)
		if(''=== phone){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#phone';
			return false;
		}
		
		//Email Valid
		if(''=== managerEmail){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#managerEmail';
			return false;
		}
		
		//계좌번호, 은행코드, 은행명, 예금주 Valid (팝업창으로 유도)
		if(''=== depositNo){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#depositNo';
			return false;
		}
		
		//거래처 담당자 성명 Valid
		if(''=== managerName){
			errortitle = 'DELETE ERROR';
			validationMessage = '삭제할 거래처를 선택해주세요';
			errorfield='#managerName';
			return false;
		}
	
		return true;
	}
	
	//사업자등록번호, 법인번호, 전화번호에서 숫자와 delete 키만 동작하도록한다.
	function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    var _value = event.srcElement.value;
	
	    if((event.keyCode < 48) || (event.keyCode > 57)){//1~0
	        if(event.keyCode != 46){//delete
	             return false;
	        } 
	     }
	    return true;
	    
	}
	
	//사업자등록번호, 법인번호, 전화번호에서 한글이 입력 되었을시 지운다.
	function delHangle(evt){
	    var objTarger = evt.srcElement || evt.target;
	    var val = event.srcElement.value;
	    if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(val)){
	        objTarger.value = null;
	    	}
	    }
	
	//삭제확인모달창 띄우기
	var Deletecheckmessage ='';
	var deletetitle='';
	
	function openDeleteModal(title, message) {
		$('#staticBackdropLabel').html(title);
		$('#staticBackdropBody').text(message);
		
		console.log($('#staticBackdropLabel').text());
		console.log($('#staticBackdropBody').text());
	
		$( "#staticBackdrop" ).dialog({
			resizable: false,
			modal: true,
			title: title,
			buttons: [
				{
					text: "확인",
					"class" : "btn btn-danger btn-mini",
					"name" : "deleteok",
					"id" : "deleteok",
					click: function() {
						$(this).dialog('close');
					}
				},
				{
					text: "취소",
					"class" : "btn btn-inverse btn-mini",
					"name" : "deletecancel",
					"id" : "deletecancel",
					click: function() {
						$(this).dialog('close');
					}
				}
				
			]
		});
	
		$("#staticBackdrop").dialog('open');//모달을 띄운다
	}
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
					<h1 class="pull-left">거래처 관리</h1>
				</div>
				
				<!-- /.page-header -->
				<div class="row-fluid">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="inputform" name="inputform" method="post">
						<div class="row-fluid">
							<div class="span6">
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										사업자등록번호:&nbsp;
									</label>
									<div class="input-append">
									
									<input type="text" id="no" name="no" placeholder="사업자등록번호" class="col-xs-10 col-sm-5" maxlength="10" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/>
									
									
									<input id="btn-check-no" type="button" value="중복확인">
										<img id="img-checkno" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상호명:
									<input type="text" id="name" name="name" placeholder="상호명" maxlength="20" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										대표자:&nbsp;
									</label>
									<input type="text" id="ceo" name="ceo" placeholder="대표자" maxlength="6" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										주소:&nbsp;
									</label>
									<div class="input-append">
										<a href="#"onclick="execDaumPostcode()">
											<input type="text" class="search-input-width-first" id="address" name="address" readonly/>
											<span class="add-on">
				                            <i class="icon-search icon-on-right bigger-110"></i>
				                            </span>
				                    	</a>
									</div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;상세주소:
									<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" class="col-xs-10 col-sm-5"/>
								</div>

								<br/>

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										업태:&nbsp;
									</label>
									<input type="text" id="conditions" name="conditions" maxlength="10" placeholder="업태" class="col-xs-10 col-sm-5" />
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										종목:&nbsp;
									</label>
									<input type="text" id="item" name="item" placeholder="종목" maxlength="10" class="col-xs-10 col-sm-5" />
								</div>

								<br/>
								
								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										법인번호:&nbsp;
									</label>
									<input type="text" id="corporationNo" name="corporationNo" maxlength="10" placeholder="법인번호" class="col-xs-10 col-sm-5" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/>
								</div>
								
								<div class="form-group" >
									<label class="control-label" for="form-field-1">
										종류:&nbsp;&nbsp;
									</label> 
									<input name="assetsFlag" id="assetsFlag" type="radio" hidden="토지" class="ace" value="a" /> 
									<span class="lbl">토지</span> 
									&nbsp;
									<input name="assetsFlag" id="assetsFlag" type="radio" hidden="건물" class="ace" value="b" />
									<span class="lbl">건물</span> 
									&nbsp;
									<input name="assetsFlag" id="assetsFlag" type="radio" hidden="차량" class="ace" value="c" />
									<span class="lbl">차량</span> 
									&nbsp;
									<input name="assetsFlag" id="assetsFlag" type="radio" hidden="무형자산" class="ace" value="d" />
									<span class="lbl">무형자산</span>
								</div>
								
							</div><!-- /span6 -->

							<div class="span6">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										관할 영업소:&nbsp;
									</label>
									<input type="text" id="jurisdictionOffice" name="jurisdictionOffice" placeholder="관할 영업소" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										거래처 전화번호:&nbsp;
									</label>
									<input type="text" id="phone" name="phone" maxlength="11" placeholder="거래처 전화번호" class="col-xs-10 col-sm-5" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)" />
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										E-mail:&nbsp;
									</label>
									<input type="text" id="managerEmail" name="managerEmail" placeholder="E-mail" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group">
								
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										계좌번호:&nbsp;
									</label>
									<div class="input-append">
										<a href="#" id="a-bankaccountinfo-dialog" class="a-customerinfo-dialog">
											<input type="text" class="search-input-width-first" name="depositNo" id="depositNo" readonly/>
											<span class="add-on">
					                        	<i class="icon-search icon-on-right bigger-110"></i>
					                        </span>
					                    </a>
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;은행코드:
									<input type="text" id="bankCode" name="bankCode" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>

								<br/>

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
									은행명:&nbsp;
									</label>
									<input type="text" id="bankName" name="bankName" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										예금주:&nbsp;
									</label>
									<input type="text" id="depositHost" name="depositHost" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>

			
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
								<div id="dialog-message" title="계좌" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td>
												<label>계좌번호</label>
												<div class="input-append">
													<input type="text" id="input-dialog-depositNo" style="width: 100px;" />
													<a href="#" id="a-dialog-depositNo">
														<span class="add-on">
														<i class="icon-search icon-on-right bigger-110"></i>
														</span>
													</a>
												</div>
											</td>
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

								<br/>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										거래처 담당자 성명:&nbsp;
									</label>
									<input type="text" id="managerName" name="managerName" placeholder="거래처 담당자" class="col-xs-10 col-sm-5" maxlength="6"/>
								</div>
							</div><!-- ./span6 -->
						</div>
						<div class="hr hr-18 dotted"></div>
							<!-- span -->
						<div class="row-fluid">
							<div class="span8">
							<button class="btn btn-info btn-small" id="btn-read">조회</button>
							<button class="btn btn-danger btn-small" id="btn-delete">삭제</button>
							<button class="btn btn-warning btn-small" id="btn-update">수정</button>
							<button class="btn btn-primary btn-small" id="btn-create">입력</button>
							<button class="btn btn-default btn-small" id="btn-reset" type = "reset">초기화</button>
							</div>	<!-- /.span -->
						
						</div>
						<div class="hr hr-18 dotted"></div>
					
						</form>

						<div class="row-fluid">
							<div class="span12">
								<div style="width: 100%; overflow-x: auto">
									<table id="simple-table-1" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>사업자등록번호</th>
												<th>상호</th>
												<th>대표자</th>
												<th>주소/상세주소</th>
												<th>업태/종목</th>
												<th>종류</th>
												<th>관할영업소</th>
												<th>거래처 전화번호</th>
												<th>거래처 담당자 성명</th>
												<th>e-mail</th>
												<th>은행코드</th>
												<th>은행명</th>
												<th>계좌번호</th>
												<th>예금주</th>
												<th>입력일자</th>
												<th>입력담당자</th>
												<th>수정일자</th>
												<th>수정담당자</th>
											</tr>
										</thead>
										
										<tbody class = "origin-tbody">
											<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
												<tr>
													<td>${vo.no }</td>
													<td>${vo.name }</td>
													<td>${vo.ceo }</td>
													<td>${vo.address }/${vo.detailAddress }</td>
													<td>${vo.conditions }/${vo.item }</td>
													<td>${vo.assetsFlag }</td>
													<td>${vo.jurisdictionOffice }</td>
													<td>${vo.phone }</td>
													<td>${vo.managerName }</td>
													<td>${vo.managerEmail }</td>
													<td>${vo.bankCode }</td>
													<td>${vo.bankName }</td><!-- 은행명 -->
													<td>${vo.depositNo }</td>
													<td>${vo.depositHost }</td><!-- 예금주 -->
													<td>${vo.insertDay }</td>
													<td>${vo.insertUserid }</td>
													<td>${vo.updateDay }</td>
													<td>${vo.updateUserid }</td>
												</tr>
											</c:forEach>
										</tbody>
	
									</table>
								</div>
								<!-- /span -->
							</div>
						</div>
					</div>


				<!-- /row -->
				<!-- PAGE CONTENT ENDS -->
				<!-- PAGE CONTENT ENDS -->
				</div>
			<!-- /.col -->
			</div>
			<!-- /.row -->
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
								<li class="disabled"><a><i
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
								<li class="disabled"><a><i
										class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				
				<!-- Validation Modal Start -->
				<div id="staticBackdrop" class="hide">
					<br>
					<pre id="staticBackdropBody" class="bolder grey" style="text-align: center; background-color: white; border-color: white" >
					</pre>
				</div>
				<!-- Validation Modal End -->
			</div>
		
	<!-- /.page-content -->
	
	<!-- basic scripts -->
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</body>
	<script type="text/javascript">
	//사업자등록번호 중복체크
	$("#no").change(function(){
		$("#btn-check-no").show();
		$("#img-checkno").hide();
		nochecked = false;
	});	
	
	$("#btn-check-no").click(function(){
		
		var no = $("#no").val();
		if(!noValid(no)){
			openErrorModal(errortitle,validationMessage,errorfield);
			return;
		}
		
		
	// 사업자등록번호 중복체크
	$.ajax({
		url: "${pageContext.servletContext.contextPath }/01/27/checkno?no=" + no,
		contentType : "application/json; charset=utf-8",
		type: "get",
		dataType: "json",
		data: "",
		success: function(response){
			console.log(response);
			if(response.result == "fail"){
				console.error(response.message);
				return;
			}
			
			if(response.data == null){
				nochecked = true;
				$("#btn-check-no").hide();
				$("#img-checkno").show();
				//$("#no").attr("readonly",true);
				setTimeout(function(){
					openDeleteModal('AUTOCOMPLETE CORPNO',"법인번호에 자동반영하시겠습니까?");
					$("#deleteok").click(function(){
						var customerno = document.getElementById("no").value;
						$("input[name=corporationNo]").val(customerno);
						openErrorModal("AUTOCOMPLETE APPLY","법인번호에 반영되었습니다.");
						$("#corporationNo").attr("readonly",true);
						return;
					});
					$("#deletecancel").click(function(){
						openErrorModal("AUTOCOMPLETE CANCEL","법인번호를 수동으로 입력해주시기바랍니다.");
						$("#corporationNo").attr("readonly",false);
						return;
					});
					
				},600);
// 				if($("#no").prop('readonly',true)){
// 					$("#no").click(function(){
// 						openDeleteModal("MODIFY_CUSTOMERNO","사업자등록번호를 다시 입력하시겠습니까?");
// 						$("#deleteok").click(function(){
// 							//var customerno = document.getElementById("no").value;
// 							//$("input[name=corporationNo]").val(customerno);
// 							openErrorModal("MODIFY ALLOW","사업자등록번호를 수정해주세요");
// 							$("#no").attr("readonly",false);
// 							$("#btn-check-no").show();
// 							$("#img-checkno").hide();
// 							return;
// 						});
// 						$("#deletecancel").click(function(){
// 							openErrorModal("MODIFY CANCEL","사업자등록번호 수정이 취소되었습니다.");
// 							$("#no").attr("readonly",true);
// 							return;
// 						});
// 						return;
// 						});
					
// 				}
				return;
			}else if(response.data.deleteFlag == "Y"){
				$("#no").val("");
				openErrorModal('DELETED CUSTOMER_NO ERROR',"삭제된 사업자등록번호입니다.",'#no');
			}else{
				$("#no").val("");
				openErrorModal('DUPLICATED CUSTOMER_NO ERROR',"이미 존재하는 사업자등록번호입니다.",'#no');
			}
			
			},
			error:function(xhr,error) {
				console.err("error" + error);
			}
		});
	});
	
	
	</script>
</html>