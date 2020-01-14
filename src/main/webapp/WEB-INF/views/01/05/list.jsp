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
	
<c:import url="/WEB-INF/views/common/head.jsp" />		<!-- 위치로 인해 css가 안먹을수 있다. -->

<style>
.chosen-search {
	display: none;
}

.validity {
	width: 35px;
}

.name {
	width: 80px;
}

.search-input-width-first {
	width: 150px;
}

.bankcode {
	width: 200px;
}

.bankname {
	width: 200px;
}

.limit {
	width: 100px;
}

.limitation {
	width: 100px;
	text-align: right;
}

.form-horizontal .control-label {
	text-align: left
}

html, body {
	height: 100%;
	overflow-x: hidden;
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


</head>

<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">




				<div class="page-header position-relative">
					<h1 class="pull-left">카드 관리</h1>
				</div>


				<form class="form-horizontal" id="input-form" name="input-form"
					method="post">
					<div class="row-fluid">
						<div class="span7">
							<div class="tabbable">
								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 번호</label>

									<div class="controls">
										<div class="input-append">
											
											<input type="text" class="validity" id="cardNo1" name="cardNo" maxlength=4 onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/> 
										</div>
										-
										
										<div class="input-append">
											<input type="text" class="validity" id="cardNo2" name="cardNo"  maxlength=4 onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/>
										</div>
										-
										<div class="input-append">
											<input type="text" class="validity" id="cardNo3" name="cardNo" maxlength=4  onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)" />
										</div>
										-
										<div class="input-append">
											<input type="text" class="validity" id="cardNo4" name="cardNo" maxlength=4  onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)" />
										</div>
										<div class="input-append">
											<input id="btn-check-no" type="button" value="중복확인">
											<img id="img-checkno" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
										</div>
									</div>
									
									
									
									<input type="hidden" name="cardNoOld" />
									
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">사용자</label>

									<div class="controls">
										<input type="text" id="user" name="user" class="name" maxlength=6
											placeholder="사용자" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 발급자
									</label>

									<div class="controls">
										<input type="text" id="issuer" name="issuer" class="name" maxlength=6
											placeholder="카드발급자" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호 </label>
									<div class="controls">

										
										<div class="input-append">
											<a href="#" id="a-bankaccountinfo-dialog"
												class="a-customerinfo-dialog"> <input type="text"
												class="search-input-width-first" name="depositNo" id="depositNo"
												placeholder="계좌번호" readonly /> <span class="add-on">
													<i class="icon-search icon-on-right bigger-110"></i>

											</span>
											</a>
										</div>
										&nbsp; &nbsp;
										<input type="text" id="depositHost" name="depositHost"
											placeholder="예금주" readonly/>
										
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">은행 </label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" id="bankCode"  name = "bankCode" value="" placeholder="은행코드" readonly /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" id="bankName"  name ="bankName" value="" placeholder="은행명" readonly />
										</div>
									</div>
								</div>

			
								






								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 한도(만원)
									</label>

									<div class="controls">
										<input type="text" id="limitation" name="limitation" class="limitation" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"
											placeholder="한도" value=""  />
									</div>
								</div>
								
								
								
							</div>
						</div>

						<div class="span5">
							<div class="control-group">
								<div>
									<label class="control-label" for="form-field-1">유효기간 </label> 
									<div class="controls">
										<div class="input-append">
									
											<input type="text" class="validity" id="validityMM" name="validity" placeholder="MM" maxlength=2 /> 
										</div>
										/ 
										
										<div class="input-append">
											<input type="text" class="validity" id="validityYY" name="validity" placeholder="YY" maxlength=2 />
										</div>
									</div>
								</div>
								
							</div>
							
							<div class="control-group">
								<div>
									<label class="control-label" for="form-field-1">CVC </label> 
									<div class="controls">
									<input type="text" class="validity" id="cvc" name="cvc" maxlength=3 placeholder="CVC" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/>
									</div>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-1">교통카드 유무 </label> 
								<div class="controls">
									<input name="transportation" type="radio" class="ace" value="true"     /> 
									<span class="lbl"> Yes</span> 
									
									<input name="transportation" type="radio" class="ace" value="false"  />
									<span class="lbl"> No</span>
								</div>
							</div>
					
							<div class="control-group">
								<label class="control-label" for="form-field-1">해외사용 여부</label> 
								<div class="controls">
										<input name="abroad" type="radio" class="ace" value="true"   /> 
										<span class="lbl"> Yes</span> 
										
										<input name="abroad" type="radio" class="ace" value="false"  /> 
										<span class="lbl">No</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">비밀번호 </label>

								<div class="controls">
									<input type="password" id="password" name="password" class="limit" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"
										placeholder="비밀번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">카드사 </label>

								<div class="controls">
									<input type="text" id="company" name="company" class="bankname"
										placeholder="카드사" />
								</div>
							</div>


						</div>
						<!-- /.span -->
					</div>
					<!-- /row -->
					<!-- /.row-fluid -->

					<div class="hr hr-18 dotted"></div>
					<!-- buttons -->
					<div class="row-fluid">
						<div class="span8">
						
							<button class="btn btn-info btn-small" id="btn-read">조회</button>
							<button class="btn btn-danger btn-small" id="btn-delete">삭제</button>
							<button class="btn btn-warning btn-small" id="btn-update">수정</button>
							<button class="btn btn-primary btn-small" id="btn-create">입력</button>
							<button class="btn btn-default btn-small" id="btn-reset" onclick= "location.reload()">초기화</button> 
						</div>

					</div>
					<div class="hr hr-18 dotted"></div>
				</form>

				<!-- Tables -->
				<div class="row-fluid">
					<div class="span12" style="overflow: auto;">
						<table id="simple-table-1"
							class="table  table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
							<thead>
								<tr>
									<th>카드번호</th>
									<th>유효기간</th>
									<th>CVC</th>
									<th>사용자</th>
									<th>카드발급자</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>비밀번호</th>
									<th>은행코드</th>
									<th>은행명</th>
									<th>카드사</th>
									<th>카드한도(만원)</th>
									<th>교통카드 유무</th>
									<th>해외사용 여부</th>
									<th>입력일자</th>
									<th>입력담당자</th>
									<th>수정일자</th>
									<th>수정담당자</th>

								</tr>
							</thead>

							<tbody id="tbodylist" class="origin-tbody" >

								<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
									<tr>
									
										<td>${vo.cardNo }</td>
										<td>${vo.validity }</td>
										<td>${vo.cvc}</td>
										<td>${vo.user}</td>
										<td>${vo.issuer}</td>
										<td>${vo.depositNo }</td>
										<td>${vo.depositHost}</td>
										<td>${vo.password }</td>
										<td>${vo.bankCode }</td>
										<td>${vo.bankName }</td>
										<td>${vo.company }</td>
										<td style="text-align: right;"><fmt:formatNumber value="${vo.limitation }" pattern="#,###"  /></td>
										<td>${vo.transportation }</td>
										<td>${vo.abroad }</td>
										<td>${vo.insertDay }</td>
										<td>${vo.insertUserId }</td>
										<td>${vo.updateDay }</td>
										<td>${vo.updateUserId }</td>

									</tr>

								</c:forEach>

							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>
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

			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

	<!-- 팝업창 -->
	<div id="dialog-message" title="계좌" hidden="hidden">
		<table id="dialog-message-table">
			<tr>
				<td><label>계좌번호</label>

					<div class="input-append">
						<input type="text" id="input-dialog-depositNo"
							style="width: 100px;" onkeypress="if( event.keyCode==13 ){enter();}" /> <a href="#" id="a-dialog-depositNo">
							<span class="add-on"> <i
								class="icon-search icon-on-right bigger-110"></i></span>
						</a>
					</div></td>
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

	<!-- Validation Modal Start -->
	<div id="staticBackdrop" class="hide">
		<br>
		<pre id="staticBackdropBody" class="bolder grey"
			style="text-align: center; background-color: white; border-color: white">
					</pre>
	</div>
	<!-- Validation Modal End -->
</body>
<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<link
	href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script>

//숫자와 delete 키만 동작하도록한다.
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

//한글입력 방지
function delHangle(evt){
    var objTarger = evt.srcElement || evt.target;
    var val = event.srcElement.value;
    if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(val)){
        objTarger.value = null;
    	}
    }
function enter(){
	$("#a-dialog-depositNo").click();
}
$(function() {
	var a;
	var nochecked = false;
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
		a = "reset";
		$("input[name=cardNo]").attr("readonly",false);
		$("#btn-check-no").show();
		$("#img-checkno").hide();
		
	});
	
	
	$("#input-form").submit(function(event) {
        event.preventDefault();
       
    	$("input[name=limitation]").val($("input[name=limitation]").val().replace(/[^0-9]/g,""));
		console.log($("input[name=limitation]").val());
        var queryString = $("form[name=input-form]").serializeArray();
		
		if("${param.page}") {
			queryString.push({name: 'page', value: "${param.page}"});
		}
		if(a == "create") {
			if(nochecked==false){
				openErrorModal("DUPLICATE CHECK ERROR","사업자등록번호 중복검사는 필수입니다.",'#no');
				$("#btn-check-no").show();
				return;
			}
			// 유효성 검사를 만족하지 못하면 모달을 띄운다.
			if(!InsertValidation()){
				openErrorModal(errortitle,validationMessage,errorfield);
				return;
			}
			$.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/create",
			    type: "POST",
			    data: queryString,
			    dataType: "json",
			    success: function(result){
			    	if(result.fail) {
			    		alert("다시 입력해주세요.");
			    	}
			    	if(result.success) {
			    		$('#input-form').each(function(){
			    		    this.reset();
			    		});
			    		
			    		openErrorModal("CREATE SUCCESS","카드 등록에 성공하였습니다.");
			    		$("#btn-check-no").show();
						$("#img-checkno").hide();
			    		
			    		removeTable();
			    		var cardList = result.cardList;
			    		createNewTable(cardList);
			    		
				    	$('#pagination ul').remove();
				    	createNewPage(result, a);
				    	
				    	$('#pagination').show();
			    	}
			    },
			    error: function( err ){
			    	
			    }
			 })
		} else if(a == "read") {
			//카드번호 전부 입력후 조회가능하게
			if(!DeleteValidation()){
				openErrorModal(errortitle,validationMessage,errorfield);
				return;
			}
			$.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/read",
			    type: "POST",
			    data: queryString,
			    dataType: "json",
			    success: function(dataResult){
			    	if(dataResult.success) {
			    		openErrorModal("CREATE SUCCESS","카드 검색에 성공하였습니다.");
			    		removeTable();
			    		$('#input-form').each(function(){
			    		    this.reset();
			    		});

			    		var cardList = dataResult.cardList;
			    		createNewTable(cardList);
			    		settingInput(cardList);
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
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
			    type: "POST",
			    data: queryString,
			    dataType: "json",
			    success: function(dataResult){
			    	if(dataResult.success) {
			    		openErrorModal("CREATE SUCCESS","카드 수정에 성공하였습니다.");
			    		removeTable();
			    	
			    		var cardList = dataResult.cardList;
			    		createNewTable(cardList);
			    	}
			    	if(dataResult.fail) {
			    		alert("다시 입력해주세요.");
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
			// 유효성 검사를 만족하지 못하면 모달을 띄운다.
			if(!DeleteValidation()){
				openErrorModal(errortitle,validationMessage,errorfield);
				return;
			}
			
			var cardNo1 =$('#cardNo1').val();
			var cardNo2 =$('#cardNo2').val();
			var cardNo3 =$('#cardNo3').val();
			var cardNo4 =$('#cardNo4').val();
			
			// 삭제확인창을 띄운다.
			openDeleteModal('DELETE CHECK', cardNo1+"-"+cardNo2+"-"+cardNo3+"-"+cardNo4+"에 대한\r\n 카드 정보를 삭제하시겠습니까?");
			
			// 삭제확인창 - 취소 버튼을 누르면 삭제 X
			$("#deletecancel").click(function(){
				openErrorModal("DELETE_CANCEL SUCCESS","카드 삭제가 취소 되었습니다.");
				console.log("cancel");
				return;
			});
			
			// 삭제확인창 - 확인 버튼을 누르면 삭제O
			$("#deleteok").click(function(){
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(dataResult){
				    	if(dataResult.success) {
				    		openErrorModal("CREATE SUCCESS","카드 삭제에 성공하였습니다.");
				    		removeTable();
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		$("input[name=cardNo]").attr("readonly",false);

				    		$("#btn-check-no").show();
				    		$("#btn-create").show();
				    		
				    		var cardList = dataResult.cardList;
				    		createNewTable(cardList);
				    	}
				    	
				    	$('#pagination ul').remove();
			    		createNewPage(dataResult, a);
			    		$('#pagination').show();
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			});
		}
		else {
			
		}
		
	});
	

	function removeTable(){
		  // 원래 테이블 제거
		  $(".origin-tbody").remove();
		  // ajax로 추가했던 테이블 제거
		  $(".new-tbody").remove();
	}
	function createNewTable(cardList){
		  var $newTbody = $("<tbody id='tbodylist' class='new-tbody'>");
		  
		  $("#simple-table-1").append($newTbody);
		  
		  
		  for(let card in cardList){
			  $newTbody.append(
				"<tr>" +
				"<td>" + cardList[card].cardNo + "</td>" +
				"<td>" + cardList[card].validity+ "</td>" +
				"<td>" + cardList[card].cvc+ "</td>" +
				"<td>" + cardList[card].user+ "</td>" +	
				"<td>" + cardList[card].issuer+ "</td>" +
				"<td>" + cardList[card].depositNo+ "</td>" +
				"<td>" + cardList[card].depositHost+ "</td>" +
				"<td>" + cardList[card].password+ "</td>" +
		        "<td>" + cardList[card].bankCode+ "</td>" +
		        "<td>" + cardList[card].bankName+ "</td>" +
		        "<td>" + cardList[card].company+ "</td>" +
		        "<td style='text-align: right;'>" + addCommas(cardList[card].limitation)+ "</td>" +
		        "<td>" + cardList[card].transportation+ "</td>" +
		        "<td>" + cardList[card].abroad+ "</td>" +
		        "<td>" + cardList[card].insertDay + "</td>" +
		        "<td>" + cardList[card].insertUserId + "</td>" +
		        "<td>" + cardList[card].updateDay + "</td>" +
		        "<td>" + cardList[card].updateUserId + "</td>" +
		        "</tr>");
			  
		  }
		  $newTbody.append("</tbody>");
		  $(".chosen-select").chosen();
	}
	
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
		

	
	
	$(document.body).delegate('#tbodylist tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		
		var cardNo1 = td.eq(0).text().substring(0,4);
		var cardNo2 = td.eq(0).text().substring(5,9);
		var cardNo3 = td.eq(0).text().substring(10,14);
		var cardNo4 = td.eq(0).text().substring(15,20);
			
		$("input[id=cardNo1]").val(cardNo1);
		$("input[id=cardNo2]").val(cardNo2);
		$("input[id=cardNo3]").val(cardNo3);
		$("input[id=cardNo4]").val(cardNo4);
		
		
		$("input[name=cardNoOld]").val(td.eq(0).text());
		
		var month= td.eq(1).text().substring(0,2);			//MM YY가 두자로 고정되어야 한다.
		var year= td.eq(1).text().substring(3,5);
		$("input[id=validityMM]").val(month);
		$("input[id=validityYY]").val(year);
		$("input[name=cvc]").val(td.eq(2).text());
		$("input[name=user]").val(td.eq(3).text());
		$("input[name=issuer]").val(td.eq(4).text());
		$("input[name=depositNo]").val(td.eq(5).text());
		$("input[name=depositHost]").val(td.eq(6).text());
		$("input[name=password]").val(td.eq(7).text());	
		$("input[name=bankCode]").val(td.eq(8).text());
		$("input[name=bankName]").val(td.eq(9).text());
		$("input[name=company]").val(td.eq(10).text());
		$("input[name=limitation]").val(td.eq(11).text());
		var td12 = td.eq(12).text();
		var td13 = td.eq(13).text();
		$('input:radio[name=transportation]:input[value=' + td12 + ']').prop("checked", true);
		$('input:radio[name=abroad]:input[value=' + td13 + ']').prop("checked", true);
		
		$("input[name=cardNo]").attr("readonly",true);

		$("#btn-check-no").hide();
		$("#img-checkno").hide();
		$("#btn-create").hide();
		
	});
	

	function settingInput(cardList) {
		var tr = $(".new-tbody tr");	
		var td = tr.children();
		
		
		var cardNo1 = td.eq(0).text().substring(0,4);
		var cardNo2 = td.eq(0).text().substring(5,9);
		var cardNo3 = td.eq(0).text().substring(10,14);
		var cardNo4 = td.eq(0).text().substring(15,20);
			
		$("input[id=cardNo1]").val(cardNo1);
		$("input[id=cardNo2]").val(cardNo2);
		$("input[id=cardNo3]").val(cardNo3);
		$("input[id=cardNo4]").val(cardNo4);
		
		
		$("input[name=cardNoOld]").val(td.eq(0).text());
		
		var month= td.eq(1).text().substring(0,2);			//MM YY가 두자로 고정되어야 한다.
		var year= td.eq(1).text().substring(3,5);
		$("input[id=validityMM]").val(month);
		$("input[id=validityYY]").val(year);
		$("input[name=cvc]").val(td.eq(2).text());
		$("input[name=user]").val(td.eq(3).text());
		$("input[name=issuer]").val(td.eq(4).text());
		$("input[name=depositNo]").val(td.eq(5).text());
		$("input[name=depositHost]").val(td.eq(6).text());
		$("input[name=password]").val(td.eq(7).text());	
		$("input[name=bankCode]").val(td.eq(8).text());
		$("input[name=bankName]").val(td.eq(9).text());
		$("input[name=company]").val(td.eq(10).text());
		$("input[name=limitation]").val(td.eq(11).text());
		var td12 = td.eq(12).text();
		var td13 = td.eq(13).text();
		$('input:radio[name=transportation]:input[value=' + td12 + ']').prop("checked", true);
		$('input:radio[name=abroad]:input[value=' + td13 + ']').prop("checked", true);
		
		
		$("input[name=cardNo]").attr("readonly",true);
		$("#btn-check-no").hide();
		$("#img-checkno").hide();
		$("#btn-create").hide();
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
    

    function addCommas(x) {
         return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    
    $("input[name=limitation]").on('keyup', function(event){
    	 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
    });
    
    
	
	$(".chosen-select").chosen();
	
	var validationMessage ='';
	var errortitle='';
	var errorfield ='';
	
	
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
	
	//insert Validation
	function InsertValidation(){
		let cardNo1 =$('#cardNo1').val();
		let cardNo2 =$('#cardNo2').val();
		let cardNo3 =$('#cardNo3').val();
		let cardNo4 =$('#cardNo4').val();
		let validityMM =$('#validityMM').val();
		let validityYY =$('#validityYY').val();
		let cvc =$('#cvc').val();
		let user =$('#user').val();
		let issuer =$('#issuer').val();
		let depositNo =$('#depositNo').val();
		let depositHost=$('#depositHost').val();
		let password=$('#password').val();
		let bankCode=$('#bankCode').val();
		let bankName=$('#bankName').val();
		let company=$('#company').val();
		let limitation=$('#limitation').val();
		let transportation=$('#transportation').val();
		let abroad=$('#abroad').val();
		
		
		//카드번호 Valid
		if('' === cardNo1){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo1';
			return false;
		}
		if(cardNo1.length<4 || cardNo1.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo1';
			return false;
		}
		if('' === cardNo2){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo2';
			return false;
		}
		if(cardNo2.length<4 || cardNo2.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo2';
			return false;
		}
		if('' === cardNo3){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo3';
			return false;
		}
		if(cardNo3.length<4 || cardNo3.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo3';
			return false;
		}
		if('' === cardNo4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo4';
			return false;
		}
		if(cardNo4.length<4 || cardNo4.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo4';
			return false;
		}
		
		//카드번호 Valid
		if('' === validityMM){
			errortitle = 'validity ERROR';
			validationMessage = '유효기간은\r\n필수입력항목입니다.';
			errorfield='#validityMM';
			return false;
		}
		if(validityMM.length<2 || validityMM.length >2){
			errortitle = 'validity ERROR';
			validationMessage = '유효기간은\r\월은 2자리를 입력하셔야 합니다.';
			errorfield='#validityMM';
			return false;
		}
		if(validityMM>12 || validityMM<1){
			errortitle = 'validity ERROR';
			validationMessage = '유효기간의\r\n월입력이 잘못되었습니다.';
			errorfield='#validityMM';
			return false;
		}
		
		if('' === validityYY){
			errortitle = 'validity ERROR';
			validationMessage = '유효기간은\r\n필수입력항목입니다.';
			errorfield='#validityYY';
			return false;
		}
		if(validityYY.length<2 || validityYY.length >2){
			errortitle = 'validity ERROR';
			validationMessage = '유효기간은\r\n년은 2자리를 입력하셔야 합니다.';
			errorfield='#validityYY';
			return false;
		}
		if(validityYY<0){
			errortitle = 'validity ERROR';
			validationMessage = '유효기간의\r\n년입력이 잘못되었습니다.';
			errorfield='#validityYY';
			return false;
		}
		//user Valid
		if('' === user){
			errortitle = 'user ERROR';
			validationMessage = '사용자는\r\n필수입력항목입니다.';
			errorfield='#user';
			return false;
		}
		
		//cvc Valid
		if('' === cvc){
			errortitle = 'cvc ERROR';
			validationMessage = 'cvc는\r\n필수입력항목입니다.';
			errorfield='#cvc';
			return false;
		}
		if(cvc.length<3 || cvc.length >3){
			errortitle = 'cvc ERROR';
			validationMessage = 'cvc는\r\3자리를 입력하셔야 합니다.';
			errorfield='#cvc';
			return false;
		}
		
		
		//issuer  Valid
		if('' === issuer ){
			errortitle = 'issuer  ERROR';
			validationMessage = '발급자는\r\n필수입력항목입니다.';
			errorfield='#issuer ';
			return false;
		}
		
		//transportation Valid
		if($(':radio[name=transportation]:checked').length < 1){
			errortitle = 'transportation ERROR';
			validationMessage = '교통카드 유무는\r\n필수입력항목입니다.';
			errorfield='#transportation';
			return false;
		}
		
		//depositNo  Valid
		if('' === depositNo ){
			errortitle = 'depositNo  ERROR';
			validationMessage = '계좌번호, 예금주, 은행코드 은행명은\r\n필수입력항목입니다. \r\n 팝업창을 통해 입력해주세요';
			errorfield='#depositNo ';
			return false;
		}
		
		//abroad= Valid
		if($(':radio[name=abroad]:checked').length < 1){
			errortitle = 'abroad ERROR';
			validationMessage = '해외사용 여부는\r\n필수입력항목입니다.';
			errorfield='#abroad';
			return false;
		}
		//password Valid
		if('' === password){
			errortitle = 'password ERROR';
			validationMessage = '비밀번호는\r\n필수입력항목입니다.';
			errorfield='#password';
			return false;
		}
		if(password.length<4){
			errortitle = 'password ERROR';
			validationMessage = '비밀번호는\r\4자리를 이상 입력하셔야 합니다.';
			errorfield='#password';
			return false;
		}

		//limitation Valid
		if('' === limitation){
			errortitle = 'limitation ERROR';
			validationMessage = '한도는\r\n필수입력항목입니다.';
			errorfield='#limitation';
			return false;
		}
		//company Valid
		if('' === company){
			errortitle = 'company ERROR';
			validationMessage = '카드사는\r\n필수입력항목입니다.';
			errorfield='#company';
			return false;
		}
		
		
		
		
		
		return true;
	}
	
	function DeleteValidation(){
		let cardNo1 =$('#cardNo1').val();
		let cardNo2 =$('#cardNo2').val();
		let cardNo3 =$('#cardNo3').val();
		let cardNo4 =$('#cardNo4').val();
		
	
		//카드번호 Valid
		if('' === cardNo1){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo1';
			return false;
		}
		if(cardNo1.length<4 || cardNo1.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo1';
			return false;
		}
		if('' === cardNo2){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo2';
			return false;
		}
		if(cardNo2.length<4 || cardNo2.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo2';
			return false;
		}
		if('' === cardNo3){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo3';
			return false;
		}
		if(cardNo3.length<4 || cardNo3.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo3';
			return false;
		}
		if('' === cardNo4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n필수입력항목입니다.';
			errorfield='#cardNo4';
			return false;
		}
		if(cardNo4.length<4 || cardNo4.length >4){
			errortitle = 'CARD_NO ERROR';
			validationMessage = '카드번호는\r\n16자리를 입력하셔야 합니다.';
			errorfield='#cardNo4';
			return false;
		}
	
		return true;
	}
	
	
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
	

	//사업자등록번호 중복체크
	$("#cardNo1").change(function(){
		$("#btn-check-no").show();
		$("#img-checkno").hide();
		nochecked = false;
	});	
	$("#cardNo2").change(function(){
		$("#btn-check-no").show();
		$("#img-checkno").hide();
		nochecked = false;
	});	
	$("#cardNo3").change(function(){
		$("#btn-check-no").show();
		$("#img-checkno").hide();
		nochecked = false;
	});	
	$("#cardNo4").change(function(){
		$("#btn-check-no").show();
		$("#img-checkno").hide();
		nochecked = false;
	});	
	$("#btn-check-no").click(function(){
		
		if(!DeleteValidation()){
			openErrorModal(errortitle,validationMessage,errorfield);
			return;
		}
		

		var cardNo1 = $("#cardNo1").val();
		var cardNo2 = $("#cardNo2").val();
		var cardNo3 = $("#cardNo3").val();
		var cardNo4 = $("#cardNo4").val();
		
		var cardNo = cardNo1 + "-" + cardNo2 + "-" + cardNo3 + "-" +cardNo4
		
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/01/05/check?cardNo=" + cardNo,
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
					
					return;
				}else{
					openErrorModal('DUPLICATED CARD_NO ERROR',"이미 존재하는 카드번호입니다.",'#no');
				}
				
				},
				error:function(xhr,error) {
					console.err("error" + error);
				}
			});
	});
})

	
	
	</script>

</html>