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

.validity{
	width: 35px;
}

.name{
	width: 80px;
}

.search-input-width-first {
	width: 150px;
}

.bankcode{
	width: 200px;
}

.bankname{
	width: 200px;
}
.limit{
	width:100px;
}

.limitation{
	width:100px;
	text-align:right;
}
 .form-horizontal .control-label {
            text-align: left
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
						<div class="span6">
							<div class="tabbable">
								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 번호</label>

									<div class="controls">
										<div class="input-append">
											
											<input type="text" class="validity" id="cardNo1" name="cardNo" maxlength=4 /> 
										</div>
										-
										
										<div class="input-append">
											<input type="text" class="validity" id="cardNo2" name="cardNo"  maxlength=4 />
										</div>
										-
										<div class="input-append">
											<input type="text" class="validity" id="cardNo3" name="cardNo" maxlength=4  />
										</div>
										-
										<div class="input-append">
											<input type="text" class="validity" id="cardNo4" name="cardNo" maxlength=4  />
										</div>
									</div>
									
									
									<input type="hidden" name="cardNoOld" />
									
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">사용자</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="user" class="name" maxlength=6
											placeholder="사용자" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 발급자
									</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="issuer" class="name" maxlength=6
											placeholder="카드발급자" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호 </label>
									<div class="controls">

										
										<div class="input-append">
										 <a href="#" id="a-bankaccountinfo-dialog" class="a-customerinfo-dialog">
										<input type="text" class="search-input-width-first" name="depositNo" readonly/>
												<span class="add-on">
				                                   <i class="icon-search icon-on-right bigger-110"></i>
				                                  
				                                 </span>
				                                   </a>
										</div>
										&nbsp; &nbsp;
										<input type="text" id="form-field-1" name="depositHost"
											placeholder="예금주" readonly/>
										
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">은행 </label> 
									
									<div class="controls">
										<div class="input-append">
											<input type="text" name = "bankCode" value="" placeholder="은행코드" readonly /> 
										</div>
										&nbsp; &nbsp;
										<div class="input-append">
											<input type="text" name ="bankName" value="" placeholder="은행명" readonly />
										</div>
									</div>
								</div>

			
								<!-- 팝업창 -->
								<div id="dialog-message" title="계좌" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>계좌번호</label> <input type="text"
												id="input-dialog-depositNo" style="width: 100px;" /> 
												<a href="#" id="a-dialog-depositNo"> <span
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







								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 한도(만원)
									</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="limitation" class="limitation" 
											placeholder="한도" value="" />
									</div>
								</div>
								
								
								
							</div>
						</div>

						<div class="span6">
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
									<input type="text" class="validity" id="form-field-1" name="cvc" maxlength=3 placeholder="CVC" />
									</div>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-1">교통카드 유무 </label> 
								<div class="controls">
									<input name="transportation" type="radio" class="ace" value="true" checked  /> 
									<span class="lbl"> Yes</span> 
									
									<input name="transportation" type="radio" class="ace" value="false"  />
									<span class="lbl"> No</span>
								</div>
							</div>
					
							<div class="control-group">
								<label class="control-label" for="form-field-1">해외사용 여부</label> 
								<div class="controls">
										<input name="abroad" type="radio" class="ace" value="true" checked /> 
										<span class="lbl"> Yes</span> 
										
										<input name="abroad" type="radio" class="ace" value="false" /> 
										<span class="lbl">No</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">비밀번호 </label>

								<div class="controls">
									<input type="password" id="form-field-1" name="password" class="limit"
										placeholder="비밀번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">카드사 </label>

								<div class="controls">
									<input type="text" id="form-field-1" name="company" class="bankname"
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
							<button class="btn btn-default btn-small" id="btn-reset" onclick= "location.reload()">취소</button> 
						</div>

					</div>
					<div class="hr hr-18 dotted"></div>
					<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 카드 ${dataResult.pagination.totalCnt } 건</p>
				</form>

				<!-- Tables -->
				<div class="row-fluid">
					<div class="span12">
						<table id="simple-table-1"
							class="table table-striped table-bordered table-hover">
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

							<tbody class="origin-tbody" >

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
										<td><fmt:formatNumber value="${vo.limitation }" pattern="#,###"  /></td>
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
$(function() {
	var a;//이게뭐 지 ~~~~~~~~~~~~~~~~~~~~~
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
	$("#btn-delete").click(function(){
		a = "delete";
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
			    		
			    		alert("카드 생성이 완료되었습니다."); 
			    		
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
			$.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/read",
			    type: "POST",
			    data: queryString,
			    dataType: "json",
			    success: function(dataResult){
			    	if(dataResult.success) {
			    		alert("카드 검색이 완료되었습니다."); 
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
			$.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
			    type: "POST",
			    data: queryString,
			    dataType: "json",
			    success: function(dataResult){
			    	if(dataResult.success) {
			    		alert("카드 수정이 완료되었습니다."); 
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
			$.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
			    type: "POST",
			    data: queryString,
			    dataType: "json",
			    success: function(dataResult){
			    	if(dataResult.success) {
			    		alert("카드 삭제가 완료되었습니다."); 
			    		removeTable();
			    		$('#input-form').each(function(){
			    		    this.reset();
			    		});
			    		
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
		}
		else {
			alert("그외");
		}
		
	});
	

	function removeTable(){
		  // 원래 테이블 제거
		  $(".origin-tbody").remove();
		  // ajax로 추가했던 테이블 제거
		  $(".new-tbody").remove();
	}
	function createNewTable(cardList){
		  var $newTbody = $("<tbody class='new-tbody'>");
		  
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
		        "<td>" + addCommas(cardList[card].limitation)+ "</td>" +
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
		

	
	
	$(document.body).delegate('#simple-table-1 tr', 'click', function() {
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
})
 
		
		
</script>




</html>