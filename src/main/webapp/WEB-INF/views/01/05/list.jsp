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
	$("#btn-delete").click(function(){
		a = "delete";
	});

	
	$("#input-form").submit(function(event) {
        event.preventDefault();
		var queryString = $("form[name=input-form]").serialize();
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
			    		alert("계좌 생성이 완료되었습니다."); 
			    		$('#input-form').each(function(){
			    		    this.reset();
			    		});
			    		
			    		removeTable();
			    		var cardList = result.cardList;
			    		createNewTable(cardList);
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
			    		alert("계좌 검색이 완료되었습니다."); 
			    		removeTable();
			    		
			    		var cardList = result.cardList;
			    		createNewTable(cardList);
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
			    success: function(result){
			    	if(result.success) {
			    		alert("계좌 수정이 완료되었습니다."); 
			    		removeTable();
			    	
			    		var cardList = result.cardList;
			    		createNewTable(cardList);
			    	}
			    	if(result.fail) {
			    		alert("다시 입력해주세요.");
			    	}
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
			    success: function(result){
			    	if(result.success) {
			    		alert("계좌 삭제가 완료되었습니다."); 
			    		removeTable();
			    		$('#input-form').each(function(){
			    		    this.reset();
			    		});
			    		
			    		var cardList = result.cardList;
			    		createNewTable(cardList);
			    	}
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
		  var $newTbody = $("<tbody class='new-tbody'>")
		  $("#simple-table-1").append($newTbody)
			
		  for(let card in cardList){
			  $newTbody.append(
			   	"<tr>" +
		        "<td class='center'><label class='pos-rel'> <input name='RowCheck' type='checkbox' class='ace' /><span class='lbl'></span></label></td>" +
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
		        "<td>" + cardList[card].limitation+ "</td>" +
		        "<td>" + cardList[card].transportation+ "</td>" +
		        "<td>" + cardList[card].abroad+ "</td>" +
		        "<td>" + cardList[card].insertUserId + "</td>" +
		        "<td>" + cardList[card].insertDay + "</td>" +
		        "<td>" + cardList[card].updateUserId + "</td>" +
		        "<td>" + cardList[card].updateDay + "</td>" +
		        "</tr>");
			  
		  }
		  $newTbody.append("</tbody>");
		  $(".chosen-select").chosen();
	}
	
	
	
	$(document.body).delegate('#simple-table-1 tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		$("input[name=cardNo]").val(td.eq(1).text());
		$("input[name=cardNoOld]").val(td.eq(1).text());
		var month= td.eq(2).text().substring(0,2);			//MM YY가 두자로 고정되어야 한다.
		var year= td.eq(2).text().substring(3,5);
		$("input[name=validityMM]").val(month);
		$("input[name=validityYY]").val(year);
		$("input[name=cvc]").val(td.eq(3).text());
		$("input[name=user]").val(td.eq(4).text());
		$("input[name=issuer]").val(td.eq(5).text());
		$("input[name=depositNo]").val(td.eq(6).text());
		$("input[name=depositHost]").val(td.eq(7).text());
		$("input[name=password]").val(td.eq(8).text());	
		$("input[name=bankCode]").val(td.eq(9).text());
		$("input[name=bankName]").val(td.eq(10).text());
		$("input[name=company]").val(td.eq(11).text());
		$("input[name=limitation]").val(td.eq(12).text());
		$("input[name=transportation]").val(td.eq(13).text());
		$("input[name=abroad]").val(td.eq(14).text());
		
	});
	
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
})
	
		
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
										<input type="text" id="form-field-1" name="cardNo"
											placeholder="카드 번호" /> <input type="hidden" name="cardNoOld" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">사용자</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="user"
											placeholder="사용자" />
									</div>
								</div>


								<div class="control-group">
									<label class="control-label" for="form-field-1">카드 발급 자
									</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="issuer"
											placeholder="카드발급자" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호 </label>
									<input type="text" id="form-field-1" name="depositNo"
										placeholder="계좌번호" /> <input type="text" value="예금주" readonly />

								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">은행 </label> <input
										type="text" value="은행코드" readonly /> <input type="text"
										value="은행명" readonly />

								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">카드한도(만원)
									</label>

									<div class="controls">
										<input type="text" id="form-field-1" name="limitation"
											placeholder="한도" value="" />
									</div>
								</div>

							</div>
						</div>

						<div class="span6">
							<div class="control-group">
								<div>
									<label class="control-label" for="form-field-1">유효기간 </label> <input
										type="text" id="form-field-1" name="validityMM"
										placeholder="MM" /> / <input type="text" id="form-field-1"
										name="validityYY" placeholder="YY" />
								</div>
								<div>
									<label class="control-label" for="form-field-1">CVC </label> <input
										type="text" id="form-field-1" name="cvc" placeholder="CVC" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">교통카드 유무
								</label> <input name="transportation" type="radio" class="ace"
									value="true" checked /> <span class="lbl"> Yes</span> <input
									name="transportation" type="radio" class="ace" value="false" />
								<span class="lbl"> No</span>

							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">해외사용 여부
								</label> <input name="abroad" type="radio" class="ace" value="true"
									checked /> <span class="lbl"> Yes</span> <input name="abroad"
									type="radio" class="ace" value="false" /> <span class="lbl">
									No</span>

							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">비밀번호 </label>

								<div class="controls">
									<input type="text" id="form-field-1" name="password"
										placeholder="비밀번호" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">카드사 </label>

								<div class="controls">
									<input type="text" id="form-field-1" name="company"
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
							<button class="btn btn-default btn-small" id="btn-reset" 
								type = "reset">취소</button>
						</div>

					</div>
					<div class="hr hr-18 dotted"></div>
				
				</form>

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

							<tbody class="origin-tbody">

								<c:forEach items='${list }' var='vo' varStatus='status'>
									<tr>
										<td class="center"><label> <input type="checkbox"
												class="ace" /> <span class="lbl"></span>
										</label></td>

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
										<td>${vo.limitation }</td>
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
				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#"><i
								class="icon-double-angle-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
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
</html>