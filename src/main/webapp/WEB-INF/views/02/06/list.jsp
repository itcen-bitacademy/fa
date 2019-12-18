<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
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
				<h1 class="pull-left">매입 관리</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
						
							<form class="form-horizontal" method="post" action="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">
							<div class="span4">
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">매 입 일 자</label>
									<div class="controls">
									<div class="input-append">
										<input class="cl-date-picker1 input-small" id="purchaseDate" type="text" data-date-format="yyyy-mm-dd" name="purchaseDate" value="">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									</div>
							</div>
						
							<div class="control-group">
									<label class="control-label" for="form-field-1">거래처코드</label>
										<div class=" controls">
										<select class="chosen-select span1" id="customerCode" name="customerCode" onchange="setData.customer();">
										<c:forEach items='${customerList }' var='vo' varStatus='status'>
											<option value="${vo.no }">${vo.no }</option>
										</c:forEach>
										</select>
										</div>
							</div>
					
							<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 담당자</label>
									<div class="controls">
										<input class="input-small" type="text" id="purchaseManager" placeholder="" readonly name="purchaseManager">
									</div>
							</div>
							 
							<div class="control-group">
									<label class="control-label" for="form-field-1">세금계산서번호</label>

									<div class="controls">
										<input type="text" id="taxbillNo" placeholder="" name="taxbillNo">
										
									</div>
									<div class="controls">
									<label class="span3">
										<input id="taxType1" name="taxType" type="radio" class="ace" value="tax">
										<span class="lbl"> 과세</span>
									</label>
									<label class="span3">
										<input id="taxType2" name="taxType" type="radio" class="ace" value="zero">
										<span class="lbl"> 비과세</span>
									</label>
									</div>
							</div>
							</div>
							
							<div class="span4">
							<div class="control-group">
									<label class="control-label" for="form-field-1">매 입 번 호</label>
									<div class="controls">
										<input type="hidden" id="checkNo" value="${saleslist[0].salesNo }">
										<input class="input-middle" type="text" id="no" placeholder="" name="no">
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">거 래 처 명</label>
									<div class="controls">
										<input type="text" id="customerName" name="customerName" placeholder="" readonly>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">입 고 일 자</label>
									<div class="controls">
									<div class="input-append">
										<input class="cl-date-picker2 input-small" id="receiptDate" type="text" data-date-format="yyyy-mm-dd" name="receiptDate" value="">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									</div>
							</div>
							
							<div class="control-group">
									<label class="control-label" for="form-field-1">출 고 일 자</label>
									<div class="controls">
									<div class="input-append">
										<input class="cl-date-picker3 input-small" id="releaseDate" type="text" data-date-format="yyyy-mm-dd" name="releaseDate" value="">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									</div>
							</div>
							</div>
							
							<div class="span12">
							<div class="hr hr-18 dotted"></div>
								<button class="btn btn-info btn-small" type="submit" id="search" style="float:left;margin-right:20px;margin-bottom:20px;">조회</button>
								<button class="btn btn-danger btn-small" type="submit" id="delete" style="float:left;margin-right:20px;margin-bottom:20px;">삭제</button>
								<button class="btn btn-warning btn-small" type="submit" id="update" style="float:left;margin-right:20px;margin-bottom:20px;">수정</button>
								<button class="btn btn-primary btn-small" type="submit" id="input" style="float:left;margin-right:20px;margin-bottom:20px;">입력</button>
								<button class="btn btn-default btn-small" id="addRow" style="float:left;margin-right:20px;margin-bottom:20px;" type="button" onclick="add_row();">행추가</button>
								<button class="btn btn-default btn-small" id="deleteRow" style="float:left;margin-right:20px;margin-bottom:20px;" type="button" onclick="delete_row();">행삭제</button>				
								<!-- <button class="btn btn-default btn-small" type="submit" id="voucher" style="float:left;margin-right:20px;margin-bottom:20px;">전표 발행</button> -->
							</div>
							
							<input type="hidden" id="rowCnt" name="rowCnt" value="1">
							<table id="item-table" class="table table-striped table-bordered table-hover">							
						
									<tr>
										<th class="left">
											<label>
												<input type="checkbox" class="ace">
												<span class="lbl"></span>
											</label>
										</th>
										<th class="left">순번</th>
										<th class="left">품목코드</th>
										<th class="left">품목명</th>
										<th class="left">수량</th>
										<th class="left">공급가액</th>
										<th class="left">부가세</th>
									</tr>
								
								<tr>
								<td class="left">
								<label>
								<input type="checkbox" class="ace" value="1" name='check' id="check1">
								<span class="lbl"></span>
								</label>
								</td>
								<td class="left"><input class="input-mini" style="text-align:right;" type="number" id="number1" placeholder="" name="number"></td>								
								
								<td class="left">
									<select class="chosen-select span1" id="itemCode1" name="itemCode" onchange="setData.item(this.id);">
									<c:forEach items='${itemList }' var='vo' varStatus='status'>
										<option value="${vo.no }">${vo.no }</option>
									</c:forEach>
									</select>
								</td>
								<td class="left"><input class="input-large" type="text" id="itemName1" placeholder="" name="itemName" readonly value=""></td>								
								<td class="left"><input class="input-mini" style="text-align:right;" type="text" id="quantity1" placeholder="" name="quantity" value="0"></td>
								<td class="left"><input class="input-medium" style="text-align:right;" type="text" id="supplyValue1" placeholder="" name="supplyValue" value="0" readonly></td>
								<td class="left"><input class="input-medium" style="text-align:right;" type="text" id="taxValue1" placeholder="" name="taxValue" value="0" readonly ></td>															
								</tr>	
														
							</table>
							<input type="hidden" value="${closingDate }" name="closingDate" id="closingDate">
							</form>
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
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
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
	
			$('.cl-date-picker1').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$('.cl-date-picker2').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$('.cl-date-picker3').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$(".chosen-select").chosen();
			
			
		})
		
		 function checkClosing(){ // 마감일 세팅 여부
        	if($("#closingDate").val()=="true"){
        		alert("마감일자가 지난 매입입니다.");
        	} 
        }
		
		function add_row() {
			var table = document.getElementById("item-table");
			 var row = table.insertRow(table.rows.length); // 하단에 추가
				var cnt = ((table.rows.length)/2)+0.5;
				        $("#item-table").append(
				            		"<tr>" +
				      		        "<td class='left'><label> <input type='checkbox' class='ace' value='"+cnt+"' name='check'  id='check"+cnt+"'> <span class='lbl'></span> </label></td>" +
				      		        "<td class='left'><input class='input-mini' style='text-align:right;' type='number' id='number"+cnt+"' placeholder='' name='number'></td>" +
				      		        "<td class='left'> <select class='chosen-select span1' id='itemCode"+cnt+"' name='itemCode' onchange='setData.item(this.id);'>"+
				      		        
					      		      "<c:forEach items='${itemList }' var='vo' varStatus='status'>" +
				      		      		"<option value='" + '${vo.no }' + "'> " + '${vo.no }' + "</option>" + 
				            			"</c:forEach>"+
				      		      		
									"</select></td>" + 
				      		        "<td class='left'><input class='input-large' type='text' id='itemName"+cnt+"' name='itemName' placeholder='' readonly value=''></td>" +
				      		        "<td class='left'><input class='input-mini' style='text-align:right;' type='text' id='quantity"+cnt+"' name='quantity' placeholder=''  value='0'></td>" +
				      		        "<td class='left'><input class='input-medium' style='text-align:right;' type='text' id='supplyValue"+cnt+"' name='supplyValue' placeholder='' value='0'readonly></td>" +
				      			    "<td class='left'><input class='input-medium' style='text-align:right;' type='text' id='taxValue"+cnt+"' name='taxValue' placeholder='' value='0'readonly></td>" +
				      		       "</tr>"
				      	);
				        
				        document.getElementById("rowCnt").value = cnt;
				        $(".chosen-select").chosen();
				        
				        
			 }
		
		/* function delete_row() {
            var table = document.getElementById('item-table');
            var check = document.getElementsByName('check');
            console.log(check);
            for(var i=0 ; i<check.length ; i++){
	            if (check[i].checked==true) {
	            	console.log($('input:checkbox[name='+check[i]+']:checked').val());
	            	table.deleteRow($('input:checkbox[name='+check[i]+']:checked').val());
	            } 
            }
        }   */       
       function delete_row() {
            var table = document.getElementById('item-table');
            if (table.rows.length < 3) {
                return;
            } else {
                table.deleteRow(table.rows.length-1); // 하단부터 삭제
            }
        }
		 
		 var setData = {
		        	customer: function(){
		        		var code = $("#customerCode").val();
		        		<c:forEach items="${customerList }" var="item" varStatus="status">
		        			if(code=="${item.no }"){
		        				$("#purchaseManager").val("${item.managerName}");
		        				$("#customerName").val("${item.name}");
		        			}
		                </c:forEach>                
		        	},
		        	item : function(selectid){
		        		var rownum = selectid.substring(selectid.length-1, selectid.length);
		        		
		        		var code = $("#"+selectid).val();
		        		<c:forEach items="${itemList }" var="item" varStatus="status">
			    			if(code=="${item.no }"){
			    				$("#itemName"+rownum).val("${item.name}");
			    				$("#supplyValue"+rownum).val("${item.price}");
			    				$("#taxValue"+rownum).val(Math.round("${item.price}"*0.1));
			    			}
		            	</c:forEach>  
		        	}
		        }
		 $(window).load(function(){
			 checkClosing();
			 createPurchaseNo();
			 indexButtonSet();		 
		 });
		
		
		jQuery(function($) {
		$("#delete").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
		});
		
		$("#update").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update");
		});
		
		$("#input").click(function() {
			 $("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/input");
		});
		
		$("#voucher").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/voucher");
		});
		});
		 
		 $(function() {
				var $search = $("#search");
				$search.click(function(event) {
					
					var vo = {purchaseDate : $("#purchaseDate").val(), no : $("#no").val(), number : $("#number1").val() };
					console.log(vo);
					event.preventDefault();
					
					// ajax 통신
					$.ajax({
						url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
						type: "post",
						dataType: 'json',
						contentType: 'application/json;charset=utf-8',
						data: JSON.stringify(vo),
						success: function(result) {
							$("#purchaseDate").val(result.purchaseDate);
							$(".chosen-single span").text(result.customerCode);
							$("#purchaseManager").val(result.purchaseManager);
							$("#customerName").val(result.customerName);
							$("#receiptDate").val(result.receiptDate);
							$("#releaseDate").val(result.releaseDate);
							$("#number").val(result.number);
							$("#itemCode1_chosen a span").text(result.itemCode);
							$("#itemName1").val(result.itemName);
							$("#quantity1").val(result.quantity);
							$("#supplyValue1").val(result.supplyValue);
							$("#taxValue1").val(result.taxValue);
							if (result.taxbillNo == null) {
								$("#taxbillNo").val('');	
							} else {
								$("#taxbillNo").val(result.taxbillNo);
							}
							
							if(result.taxType == 'tax'){
								$("#taxType1").val(result.taxType).attr("checked", true);
							} else{
								$("#taxType2").val(result.taxType).attr("checked", true);
							} 
							$("#no").val(result.no);
							
							if(result.taxbillNo == null){
								taxbillButtonSet();
							}if(result.taxbillNo != null && result.voucherNo != null) {
								deleteButtonSet();
							} 
							$(".chosen-select").chosen();
						},
						error: function(xhr, error){
							if($("#purchaseDate").val() == '' ||  $("#no").val() == '' || $("#number1").val() == '' ){
								alert("매입일자, 매입번호, 순번을 정확히 입력해 주세요.");
							}
						}
					});
				});
		});
		 
		 function createPurchaseNo(){ // 매출번호 랜덤 생성
		       	var no = "";
		       	var date = new Date();
		  	 	var year = date.getFullYear().toString(); // 년
		  	 	var month = (date.getMonth()+1).toString();	 // 월	
		  		var day = date.getDate().toString(); // 일
		  		if (month.length < 2) month = "0" + month; // 한자리 월 0
		  	 	if (day.length < 2) day = "0" + day; // 한자리 일 0
		  	 	no = "b"+year + month + day;
		  	    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		  	    for( var i=0; i < 3; i++ ) // 스펠링 난수
		  	    	no += possible.charAt(Math.floor(Math.random() * possible.length)); // 스펠링 난수
		  	    $("#no").val(no);
			  	$("#checkNo").val(no);
		  	   /*  if($("#flag").val()==''){ // 조회한 경우가 아닐때 생성된 매출번호 set
		  	    	$("#no").val(no);
			  	    $("#checkNo").val(no);    
		  	    } */
	        }
		 
			// 첫화면 버튼 세팅
			function indexButtonSet() {
				$('#update').hide()
				$('#delete').hide()
				$('#input').show()
				$('#search').show()
				$('#addRow').show()
				$('#deleteRow').show()
			}
			// 세금계산서가 등록되지 않는 매입 버튼 세팅
			function taxbillButtonSet() {
				$('#update').show()
				$('#delete').show()
				$('#input').hide()
				$('#search').show()
				$('#addRow').hide()
				$('#deleteRow').hide()
			}
			// 세금계산서가 등록된 매입 버튼 세팅
			function deleteButtonSet() {
				$('#update').hide()
				$('#delete').show()
				$('#input').hide()
				$('#search').show()
				$('#addRow').hide()
				$('#deleteRow').hide()
			}
	</script>
</body>
</html>