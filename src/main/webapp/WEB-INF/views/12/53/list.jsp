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
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/jquery-ui-1.10.3.full.min.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
		.chosen-search {
			display: none;
		}
		
		.number{
    		text-align:right;
    	}
		
		.form-horizontal .control-label {
            text-align: left
        }
        
        html,body{
         	height:100%;
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
</style>
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">매출세금계산서</h1>
					<input type="hidden" value="${flag }" id="flag">
					<input type="hidden" value="${dataflag }" id="dataflag">
				</div>
				<!-- /.page-header -->
				
				<div class="row-fluid">
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
					<!-- head  -->
					
					<div class="span12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row-fluid">
								<div class="form-horizontal">
									<div class="span6">
										<label class="control-label" for="form-field-1">매 출 일 자</label>
										<div class="row-fluid input-append span2">												
												<input class="cl-date-picker" id="sales-date" name="sales-date" type="text" data-date-format="yyyy-mm-dd"> 
												<span class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
									</div>

									<div class="span6">
										<label class="control-label" for="form-field-1">매 출 번 호 </label>
										<div class="controls">
											<input class="span5" type="text" id="sales-no" name="sales-no">
											<button class="btn btn-small btn-info" type="submit" id="searchbtn">조회</button>
										</div>
									</div>
								</div>
						</div>
						
						<!-- Line -->
						<div class="hr hr-18 dotted"></div>
					</div>
					<div id="dialog-confirm" class="hide">
						<p id="dialog-txt" class="bolder grey">
						</p>
					</div>
					</form>
				</div>
					<!-- head end  -->
					
					<!-- middle  -->
				<form class="form-horizontal" id="insert-form" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
					<div class="row-fluid">
						<div class="span12">
								<div class="form-horizontal">
								<div class="control-group">
									<div class="span6">
										<label class="control-label span2" for="form-field-1">거래처코드</label>
										<div class="controls">
											<input class="span5" type="text" readonly id="customerName" placeholder="거래처명" name="customerName" value="${list[0].customerName }"> 
											<input class="span5" type="text" readonly id="customerCode" placeholder="거래처코드" name="customerCode" value="${list[0].customerCode }">
											<input class="span5" type="hidden" readonly id="sales_date" name="salesDate" value="${list[0].salesDate }">
										</div>
									</div>
		
									<div class="span6">
										<label class="control-label span6" for="ceo">대표자</label>
										<div class="controls">
											<input class="span5" type="text" placeholder="대표자명" readonly id="ceo" name="ceo" value="${list[0].ceo }">
										</div>
									</div>
								</div>
								</div>
								<div class="form-horizontal">
									<div class="span6">
									<div class="control-group">
			                              <label class="control-label form-field-1">주소</label>
				                              <div class="controls">
				                                 <input class="span2" type="text" id="zipCode" placeholder="우편번호" name="zipCode" readonly value="${list[0].zipCode }">
				                                 <input class="span6" type="text" id="address" placeholder="주소" name="address" readonly value="${list[0].address }">
				                                 <input class="span9" type="text" style="margin-top: 5px" id="detailAddress" placeholder="상세주소" name="detailAddress" readonly value="${list[0].detailAddress }">
				                              </div>
			                           </div>
									</div>

									<div class="span6">
										<div class="span5">
											<label class="control-label span1" for="form-field-1">담당자</label>
											<div class="controls">
												<input class="span12" type="text" id="managerName" placeholder="담당자명" name="managerName" readonly value="${list[0].managerName }">
											</div>
										</div>
										<div class="span7">
											<label class="control-label span1" for="form-field-1" style="padding-left: 110px;">메일</label>
											<div class="controls">
												<input class="span12"  type="text" id="managerEmail" name="managerEmail" placeholder="담당자 메일" readonly value="${list[0].managerEmail }">
											</div>
										</div>
									</div>
									</div>
								</div>

								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">수량합계</label>
											<div class="controls">
												<input class="number span6" type="text" id="totalQuantity" value="0" name="totalQuantity" readonly>
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span6" for="form-field-1">공급가액합계</label>
											<div class="controls">
												<input class="number span5" type="text" id="totalSupplyValue" value="0" name="totalSupplyValue" readonly>
											</div>
										</div>
									</div>
								</div>

								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">세금계산서번호</label>
											<div class="controls">
												<input class="span6" type="text" id="taxbillNo" name="taxbillNo" readonly value="${list[0].taxbillNo }">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span6" for="form-field-1">부가세합계</label>
											<div class="controls">
												<input class="number span5" type="text" id="totaltaxValue" name="totalTaxValue" value="0" readonly>
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-horizontal">
									<div class="control-group">
									
										<div class="span6">
											<label class="control-label span2" for="form-field-1">세금계산서발행일</label>
											<div class="controls">
												<input class="span9" type="text" id="write_date" placeholder="발행일" name="writeDate" value="${list[0].writeDate }" readonly>
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span2" for="form-field-1">영세</label>
												<div class="span4">
														<select class="chosen-select" id="tax_type" name="taxType" data-placeholder="영세/비영세">
															<option value="tax">yes</option>
															<option value="zero">no</option>
														</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label" for="form-field-1">입금계좌번호</label>
											<div class="controls">
											<input class="span9" type="text" readonly id="depositNo" placeholder="계좌번호" name="depositNo" value="${list[0].depositNo }">
										</div>
											
										</div>
	
										<div class="span6">
												<label class="control-label" for="form-field-1">출고일자</label>
												<div class="controls">
													<input class="span8" type="text" readonly id="releaseDate" placeholder="출고일자" name="releaseDate" value="${list[0].releaseDate }">
										</div>
										</div>
									</div>
								</div>
								
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span6">
													<label class="control-label form-field-1">예금주</label>
													<div class="controls">
													<input type="text" id="banker" name="depositHost" readonly placeholder="예금주" value="${list[0].depositHost }">
													</div>
											</div>

											<div class="span6">
													<label class="control-label form-field-1">은행</label>
													<div class="controls">
														<input class="span2" type="text" id="bankName" placeholder="은행명" name="bankName" readonly value="${list[0].bankName }">
														<input class="span6" type="text" id="bankCode" placeholder="은행코드" name="bankCode" readonly value="${list[0].bankCode }">
													</div>
											</div>
										</div>
									</div>
									<div class="form-horizontal">
									<div class="span6">
										<div class="control-group">
											<label class="control-label form-field-1">비고</label>
										<div class="controls">
											<input class="span9" type="text" id="voucher_Use" name="voucherUse" value="${list[0].voucherUse }"> 
										</div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group">
											<label class="control-label form-field-1">매출번호</label>
										<div class="controls">
											<input class="span8" type="text" id="salesNo" placeholder="매출" name="salesNo" value="${list[0].salesNo}" readonly>
										</div>
										</div>
									</div>
									</div>
									
								<!-- PAGE CONTENT ENDS -->
								<!-- /.span -->
							<!-- /.row-fluid -->
					</div>
					<div class="hr hr-18 dotted"></div>
					<div class="span6">
						<div id="sample-table-2_length" class="dataTables_length">
									<button class="btn btn-info btn-small" type="submit">발행</button>
									<button class="btn btn-default btn-small">발행취소</button>
									<button class="btn btn-warning btn-small" type="button" id="btnModify" onclick="update()">발행수정</button>
						</div>
					</div>
					<!-- /.page-content -->
				</form>
				
				<div class="row-fluid">
				<div class="span12">
					<div class="hr hr-18 dotted"></div>
					<!-- PAGE CONTENT BEGINS -->
					
					<div class="row-fluid">
						<div class="span12">
							<table id="item-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>번 호</th>
										<th>품목코드</th>
										<th>품 목 명</th>
										<th>수량</th>
										<th>공급가액</th>
										<th>부가세</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${list}" var="list" varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td>${list.itemCode}</td>
										<td>${list.itemName}</td>
										<td><input id="quantity${status.index+1 }" readonly value="${list.quantity}" style="text-align: right;"></td>
										<td><input id="supplyValue${status.index+1 }" readonly value="${list.supplyValue}" style="text-align: right;"></td>
										<td><input id="taxValue${status.index+1 }" readonly value="${list.taxValue}" style="text-align: right;"></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div><!-- /span -->
					</div><!-- /row -->				
					<!-- PAGE CONTENT ENDS --><!-- /.span -->
				</div>
			</div>
				</div>
				<!-- /.main-content -->
			</div>
		</div>
	
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<!-- basic scripts -->
	<script src="${pageContext.request.contextPath }/assets/ace/js/jquery-ui-1.10.3.full.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	
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
			
			$(".chosen-select").chosen();
			
			checkFlag();
			createtaxbillNo();
			dataEmptyCheck();
		})
		
		function dataEmptyCheck() {
			if($('#dataflag').val()=="true"){
				dialog("발생되지 않은 매출 입니다.", true);
			}
		}
		
		function showTime(){
			
			var currentDate = new Date();

			var msg = currentDate.getFullYear()+ "-" + (currentDate.getMonth()+1) + "-" +
			currentDate.getDate() + " " + currentDate.getHours() + ":" + currentDate.getMinutes() +":"+
			currentDate.getSeconds();
			
			$("#write_date").val(msg);
		}
		
		function checkFlag(){
            if($("#flag").val()=="true"){
            	sumData.addQuantity();
            	sumData.addSupplyValue();
            	sumData.addTaxValue();
            }
        }
		
		var sumData = {
				
        	addQuantity: function(){
        		var sum = 0;
        		
        		for(var i=1; i<=document.getElementById("item-table").rows.length-1; i++){
        			
        			sum = sum + Number($("#quantity"+i).val());
        			console.log(sum);
        			$("#totalQuantity").val(sum);
        		}
        	},
        	
        	addSupplyValue: function(){
				var sum = 0;
				
				for(var i=1; i<=document.getElementById("item-table").rows.length-1; i++){
					sum = sum + Number($("#quantity"+i).val())*Number($("#supplyValue"+i).val());
					$("#totalSupplyValue").val(sum);
				}
			},
			
			addTaxValue: function(){
        		var sum = 0;
        		
        		for(var i=1; i<=document.getElementById("item-table").rows.length-1; i++){
        			sum = sum + Number($("#quantity"+i).val())*Number($("#taxValue"+i).val());
        			$("#totaltaxValue").val(sum);
        		}
        	}
        }
		
		function update(){
			var code = $("#salesNo").val();
			alert($("#taxbillNo").val());
			
			if($("#taxbillNo").val().trim() == ""){
				alert("세금계산서가 발행을 먼저 해주세요.");
				console.log($("#taxbillNo").val() + "null");
			}
			
			if($("#taxbillNo").val().trim() != ""){
				console.log($("#taxbillNo").val() + "not null");
				/* 				if($("#write_date").val() != null){ */
					var url = "${pageContext.request.contextPath }/12/53/update/"+code;
					if($("#flag").val() == "true"&&code!=""){
						$("#insert-form").attr("action",url).submit();
					}
				/* } */
			}
		}
		
		// 세금계산서 번호 자동생성 함수
		function createtaxbillNo(){ 
	       	var taxbill = "";   // 전체 번호를 저장할 변수
			var taxbillNo = "";	// ex) 20191223 - 년도 + 월 + 일
			var middleNo = "";	// ex) 42 - ERP - 6자리 난수
			var lastNo = "";	// ex) 8자리 난수
			
	       	var date = new Date();
	  	 	var year = date.getFullYear().toString(); // 년
	  	 	var month = (date.getMonth()+1).toString();	 // 월	
	  		var day = date.getDate().toString(); // 일
	  		
	  		if (month.length < 2) month = "0" + month; // 한자리 월 0
	  	 	if (day.length < 2) day = "0" + day; // 한자리 일 0
	  	 	
	  	 	taxbillNo = year + month + day;	// ex)20191223
	  	    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  	 	
	  		// 스펠링 난수
	  	    for( var i=0; i < 7; i++ ){ 
	  	    	middleNo += possible.charAt(Math.floor(Math.random() * possible.length)); // 난수
	  	    }
	  		
	  		for( var i=0; i < 9; i++ ){
	  			lastNo += possible.charAt(Math.floor(Math.random() * possible.length)); // 난수
	  		}
	  		
	  	    if($("#taxbillNo").val() == ''){ // 조회한 경우가 아닐때 생성된 매출번호 set
	  	    	taxbill = taxbillNo + 42 + middleNo + lastNo;
	  	    	$("#taxbillNo").val(taxbill);		  	        
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
</body>
</html>