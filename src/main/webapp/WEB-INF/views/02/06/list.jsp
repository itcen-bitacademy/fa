<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
}
</style>

</head>
<body class="skin-3" style="min-width:1500px">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매입 관리</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }"></a>
			</div><!-- /.page-header -->
			
			<div class="row-fluid">
				<div class="span12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
						
							<form class="form-horizontal" method="post" action="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }" id="form1">
								<div class="span4">
									<div class="control-group">
											<label class="control-label" for="form-field-1" style="text-align:initial;">매입일자</label>
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
											<label class="control-label" for="form-field-1" style="text-align:initial;">거래처코드</label>
												<div class=" controls" id="customerListDiv">
												<select class="chosen-select span1" id="customerCode" name="customerCode" onchange="setData.customer();">
													<c:forEach items='${customerList }' var='vo' varStatus='status'>
														<option value="${vo.no }" >${vo.no }</option>
													</c:forEach>
												</select>
												</div>
									</div>
							
									<div class="control-group">
											<label class="control-label" for="form-field-1" style="text-align:initial;">거래처담당자</label>
											<div class="controls">
												<input class="input-small" type="text" id="purchaseManager" placeholder="" readonly name="purchaseManager">
											</div>
									</div>
									 
									<div class="control-group">
											<label class="control-label" for="form-field-1" style="text-align:initial;">세금계산서번호</label>
		
											<div class="controls">
												<input type="text" id="taxbillNo" placeholder="" name="taxbillNo">
												
											</div>
											<div class="controls">
												<label class="span3">
													<input id="taxType1" name="taxType" type="radio" class="ace" value="tax" checked="checked">
													<span class="lbl"> 과세</span>
												</label>
												<label class="span4">
													<input id="taxType2" name="taxType" type="radio" class="ace" value="zero">
													<span class="lbl"> 비과세</span>
												</label>
											</div>
									</div>
								</div>
							
								<div class="span4">
									<div class="control-group">
											<label class="control-label" for="form-field-1" style="text-align:initial;">매입번호</label>
											<div class="controls">
												<input class="input-middle" type="text" id="no" placeholder="" name="no">
											</div>
									</div>
								
									<div class="control-group">
											<label class="control-label" for="form-field-1" style="text-align:initial;">거래처명</label>
											<div class="controls">
												<input type="text" id="customerName" name="customerName" placeholder="" readonly>
											</div>
									</div>
									
									<div class="control-group">
											<label class="control-label" for="form-field-1" style="text-align:initial;">입고일자</label>
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
										<label class="control-label" for="form-field-1" style="text-align:initial;">출고일자</label>
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
								
								
								<div class="span12" style = "margin:0;">
									<div class="hr hr-18 dotted"></div>
									<button class="btn btn-info btn-small" type="submit" id="search" style="float:left;margin-right:20px;">조회</button>
									<button class="btn btn-danger btn-small" type="submit" id="delete" style="float:left;margin-right:20px;">삭제</button>
									<button class="btn btn-info btn-small" type="button" id="update" onclick="modify()">수정</button>
									<button class="btn btn-primary btn-small" type="button" id="input" style="float:left;margin-right:20px;" onclick="insert();">입력</button>
									<button class="btn btn-default btn-small" id="addRow" style="float:left;margin-right:20px;" type="button" onclick="add_row();">행추가</button>
									<button class="btn btn-default btn-small" id="deleteRow" style="float:left;margin-right:20px;" type="button" onclick="delete_row();">행삭제</button>				
									
								</div>
								
								<div class="span12" style = "margin:0;">
									<div class="hr hr-18 dotted"></div>
								</div>
								
								<input type="hidden" id="rowCnt" name="rowCnt" value="1">
								<table id="item-table" class="table table-striped table-bordered table-hover">
									<tr>
										<!-- <th class="center">
											<label>
												<input type="checkbox" class="ace">
												<span class="lbl"></span>
											</label>
										</th> -->
										<th class="left">순번</th>
										<th class="left">품목코드</th>
										<th class="left">품목명</th>
										<th class="left">수량</th>
										<th class="left">공급가액</th>
										<th class="left">부가세</th>
									</tr>
									
									<tr>
										<!-- <td class="center">
											<label>
												<input type="checkbox" class="ace" value="1" name='check' id="check1">
												<span class="lbl"></span>
											</label>
										</td> -->
										<td class="left"><input class="input-mini" style="text-align:right;" type="number" id="number1" placeholder="" name="number" readonly value="1"></td>								
										
										<td class="left">
											<select class="chosen-select span1" id="itemCode1" name="itemCode" onchange="setData.item(this.id);">
											<c:forEach items='${itemList }' var='vo' varStatus='status'>
												<option value="${vo.no }">${vo.no }</option>
											</c:forEach>
											</select>
										</td>
										<td class="left"><input class="input-large" type="text" id="itemName1" placeholder="" name="itemName" readonly value=""></td>								
										<td class="left"><input class="input-mini" style="text-align:right;" type="text" id="quantity1" placeholder="" name="quantity" ></td>
										<td class="left"><input class="input-medium" style="text-align:right;" type="text" id="supplyValue1" placeholder="" name="supplyValue" readonly></td>
										<td class="left"><input class="input-medium" style="text-align:right;" type="text" id="taxValue1" placeholder="" name="taxValue" readonly ></td>															
									</tr>	
															
								</table>
								<input type="hidden" value="${closingDate }" name="closingDate" id="closingDate">
								<input type="hidden" value='${prePurchaseDate }' name="prePurchaseDate" id="prePurchaseDate">
								<input type="hidden" value='${preNo }' name="preNo" id="preNo">
								<input type="hidden" value='${preNumber }' name="preNumber" id="preNumber">
								<div id="dialog-confirm" class="hide">
									<p id="dialog-txt" class="bolder grey">
									</p>
								</div>
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
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

	<script>
	
	function modify(){
		var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update";
			if(!valid.nullCheck("purchaseDate", "매입 일자")) return;
			if(!valid.nullCheck("customerCode", "거래처 코드")) return; 
			if(!valid.nullCheck("receiptDate", "입고 일자")) return;
			if(!valid.nullCheck("releaseDate", "출고 일자")) return;
			if(!valid.nullCheck("number1", "매입 순번")) return;
			if(!valid.nullCheck("itemCode1", "품목 코드")) return;
			if(!valid.numberCheck("quantity1", "품목 수량")) return;
			if(!valid.numberCheck("supplyValue1", "공급가액")) return;
			if(!valid.numberCheck("taxValue1", "부가세")) return;
					
			$("form").attr("action",url).submit();
    	}
	
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
        		dialog("마감일자가 지난 매입입니다.",false);
        		return;
        	} 
        }
		
		// 행 추가
		function add_row() {
			var table = document.getElementById("item-table");
			 var row = table.insertRow(table.rows.length); // 하단에 추가
				var cnt = ((table.rows.length)/2)+0.5;
				        $("#item-table").append(
				            		"<tr>" +
				      		        /* "<td class='center'><label> <input type='checkbox' class='ace' value='"+cnt+"' name='check'  id='check"+cnt+"'> <span class='lbl'></span> </label></td>" + */
				      		        "<td class='left'><input class='input-mini' style='text-align:right;' type='number' id='number"+cnt+"' placeholder='' name='number' readonly value='"+cnt+"'></td>" +
				      		        "<td class='left'> <select class='chosen-select span1' id='itemCode"+cnt+"' name='itemCode' onchange='setData.item(this.id);'>"+
				      		        
					      		      "<c:forEach items='${itemList }' var='vo' varStatus='status'>" +
				      		      		"<option value='" + '${vo.no }' + "'> " + '${vo.no }' + "</option>" + 
				            			"</c:forEach>"+
				      		      		
									"</select></td>" + 
				      		        "<td class='left'><input class='input-large' type='text' id='itemName"+cnt+"' name='itemName' placeholder='' readonly value=''></td>" +
				      		        "<td class='left'><input class='input-mini' style='text-align:right;' type='text' id='quantity"+cnt+"' name='quantity' placeholder=''  ></td>" +
				      		        "<td class='left'><input class='input-medium' style='text-align:right;' type='text' id='supplyValue"+cnt+"' name='supplyValue' placeholder='' readonly></td>" +
				      			    "<td class='left'><input class='input-medium' style='text-align:right;' type='text' id='taxValue"+cnt+"' name='taxValue' placeholder='' readonly></td>" +
				      		       "</tr>"
				      	);
				        
				        document.getElementById("rowCnt").value = cnt;
				        $(".chosen-select").chosen();
			 }
		
		
       // 행 삭제
       function delete_row() {
            var table = document.getElementById('item-table');
            if (table.rows.length < 3) {
                return;
            } else {
                table.deleteRow(table.rows.length-1); // 하단부터 삭제
            }
        }
		 
        // 셀렉트박스 선택시 해당하는 정보값 세팅
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
		        		if(selectid.length < 10){
		        			var rownum = selectid.substring(selectid.length-1, selectid.length);
		        		} else {
		        			var rownum = selectid.substring(selectid.length-2, selectid.length);
		        		}
		        		
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
		 // 페이지 로드시 실행하는 함수
		 $(window).load(function(){
			 checkClosing();
			 createPurchaseNo();
			 indexButtonSet();
		 });
		
		// 버튼 클릭 이벤트
		jQuery(function($) {
		$("#delete").click(function() {
			$("form").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
		});
		});
		
		
		
		// 조회시 셀렉트박스 값 고정 
		 function updateCustomerCode(customer){
			 var options = document.getElementById("customerCode");
				for(var i=0 ; i < options.length; ++i){
					if(options[i].value == customer){
						options[i].selected = "selected";
						$("#customerCode_chosen").find("span")[0].innerHTML = options[i].innerHTML;
					}
				}
		 }
		 
		 function updateItemCode(item,cnt){
					 var options = document.getElementById("itemCode"+cnt);
						for(var i=0 ; i < options.length; ++i){
							if(options[i].value == item){
								options[i].selected = "selected";
								$("#itemCode"+ cnt+"_chosen").find("span")[0].innerHTML = options[i].innerHTML;
							}
						}
		 }
		 
	
		 
		 $(function() {
				var $search = $("#search");
				$search.click(function(event) {
					
					var vo = {purchaseDate : $("#purchaseDate").val(), no : $("#no").val(), number : $("#number1").val() };

					event.preventDefault();
					
					if(!valid.nullCheck("purchaseDate", "매입 일자")) return;
					if(!valid.nullCheck("no", "매입 번호")) return;
					
					// ajax 통신
					$.ajax({
						url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
						type: "post",
						dataType: 'json',
						contentType: 'application/json;charset=utf-8',
						data: JSON.stringify(vo),
						success: function(result) {
							if(result.length == 0){
								dialog("검색 결과가 없습니다.",false);
							}else{
								//$("#form1").reset();
								var table = document.getElementById("item-table");
								var cnt = table.rows.length;
								if(result.length == 1){
									//$("#form1").html();
									for(var i = 0; i < cnt-2; i++){
										delete_row();
									}
									
									$("#purchaseDate").val(result[0].purchaseDate);
									updateCustomerCode(result[0].customerCode);
									$("#purchaseManager").val(result[0].purchaseManager);
									$("#customerName").val(result[0].customerName);
									$("#receiptDate").val(result[0].receiptDate);
									$("#releaseDate").val(result[0].releaseDate);
									$("#number1").val(result[0].number);
									updateItemCode(result[0].itemCode, result.length);
									$("#itemName1").val(result[0].itemName);
									$("#quantity1").val(result[0].quantity);
									$("#supplyValue1").val(result[0].supplyValue);
									$("#taxValue1").val(result[0].taxValue);
									if (result[0].taxbillNo == null) {
										$("#taxbillNo").val('');	
									} else {
										$("#taxbillNo").val(result[0].taxbillNo);
									}
									
									if(result[0].taxType == 'tax'){
										$("#taxType1").val(result[0].taxType).attr("checked", true);
									} else{
										$("#taxType2").val(result[0].taxType).attr("checked", true);
									} 
									$("#no").val(result[0].no);
									
									if(result.taxbillNo == null){
										taxbillButtonSet();
									}if(result.taxbillNo != null && result.voucherNo != null) {
										deleteButtonSet();
									} 
								} else {
									var cnt = table.rows.length;
									for(var v = 0; v < cnt-2; v++){
										delete_row();
									}
									$("#no").val(result[0].no);
									$("#purchaseDate").val(result[0].purchaseDate);
									updateCustomerCode(result[0].customerCode);
									$("#purchaseManager").val(result[0].purchaseManager);
									$("#customerName").val(result[0].customerName);
									$("#receiptDate").val(result[0].receiptDate);
									$("#releaseDate").val(result[0].releaseDate);
									if(result[0].taxType == 'tax'){
										$("#taxType1").val(result[0].taxType).attr("checked", true);
									} else{
										$("#taxType2").val(result[0].taxType).attr("checked", true);
									} 
									if (result[0].taxbillNo == null) {
										$("#taxbillNo").val('');	
									} else {
										$("#taxbillNo").val(result[0].taxbillNo);
									}
									for(var i = 1; i <= result.length; i++){
										
										add_row();
										$("#number"+i).val(result[i-1].number);
										updateItemCode(result[i-1].itemCode,i);
										$("#itemName"+i).val(result[i-1].itemName);
										$("#quantity"+i).val(result[i-1].quantity);
										$("#supplyValue"+i).val(result[i-1].supplyValue);
										$("#taxValue"+i).val(result[i-1].taxValue);
									}
									if(result.taxbillNo == null){
										taxbillButtonSet();
									}if(result.taxbillNo != null && result.voucherNo != null) {
										deleteButtonSet();
									} 
									delete_row();
								}
									/* $("#no").val(result[0].no);
									$("#purchaseDate").val(result[0].purchaseDate);
									updateCustomerCode(result[0].customerCode);
									$("#purchaseManager").val(result[0].purchaseManager);
									$("#customerName").val(result[0].customerName);
									$("#receiptDate").val(result[0].receiptDate);
									$("#releaseDate").val(result[0].releaseDate);
									if(result[0].taxType == 'tax'){
										$("#taxType1").val(result[0].taxType).attr("checked", true);
									} else{
										$("#taxType2").val(result[0].taxType).attr("checked", true);
									} 
									if (result[0].taxbillNo == null) {
										$("#taxbillNo").val('');	
									} else {
										$("#taxbillNo").val(result[0].taxbillNo);
									}
									
									for(var i = 1; i <= result.length; i++){
										add_row();
										$("#number"+i).val(result[i-1].number);
										updateItemCode(result[i-1].itemCode,i);
										$("#itemName"+i).val(result[i-1].itemName);
										$("#quantity"+i).val(result[i-1].quantity);
										$("#supplyValue"+i).val(result[i-1].supplyValue);
										$("#taxValue"+i).val(result[i-1].taxValue);
									}
									if(result.taxbillNo == null){
										taxbillButtonSet();
									}if(result.taxbillNo != null && result.voucherNo != null) {
										deleteButtonSet();
									} 
									delete_row(); */
								
							}
							
							$(".chosen-select").chosen();
						},
						error: function(xhr, error){
							alert("?");
						}
					});
				});
		});
		 
		/*  function createSearchForm(result){
			 $("#form1").remove();
			 
		 }
		  */
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
			
		
			
			function insert(){
		   			if(!valid.nullCheck("purchaseDate", "매입 일자")) return;
		   			if(!valid.nullCheck("customerCode", "거래처 코드")) return; // 거래처 코드 널 체크
		   			if(!valid.nullCheck("receiptDate", "입고 일자")) return;
		   			if(!valid.nullCheck("releaseDate", "출고 일자")) return;
		   			var tableSize = ($("#item-table tr").length/2)+0.5
		   			if( tableSize > 1){
		   				for(var i=1; i<=tableSize; i++){
			   				if(!valid.nullCheck("number"+i, "매입 순번")) return;
			   				if(!valid.nullCheck("itemCode"+i, "품목 코드")) return;
			   				if(!valid.numberCheck("quantity"+i, "품목 수량")) return;
			   				if(!valid.numberCheck("supplyValue"+i, "공급가액")) return;
			   				if(!valid.numberCheck("taxValue"+i, "부가세")) return;
			   			}
			   			
		   			} else {
		   				if(!valid.nullCheck("number1", "매입 순번")) return;
		   				if(!valid.nullCheck("itemCode1", "품목 코드")) return;
		   				if(!valid.numberCheck("quantity1", "품목 수량")) return;
		   				if(!valid.numberCheck("supplyValue1", "공급가액")) return;
		   				if(!valid.numberCheck("taxValue1", "부가세")) return;
		   			}
		   					
		   			$("#form1").submit();
		        	}
			
			
			

			//// 핵심소스
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

			 // 핵심소스
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
										location.href="${pageContext.request.contextPath }/02/06";
									} else {
										$( this ).dialog( "close" ); 
									}
								}
							}
						]
					});
			    }
			
	</script>
</body>
</html>