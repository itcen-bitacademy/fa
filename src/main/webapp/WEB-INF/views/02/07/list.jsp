<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
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
				<h1 class="pull-left">매입현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<form class="form-horizontal" method="post" action="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="form-field-1">매 입 번 호</label>
										<div class="controls">
											<input class="input-small" type="text" id="no" name="no" placeholder="" value="">										
										</div>
									</div>
							
									<div class="control-group">
										<label class="control-label" for="form-field-1">거 래 처 코 드</label>
										<div class="controls">
											<input class="input-small" type="text" id="customerCode" name="customerCode" placeholder=""  value="">
										</div>
									</div>
							
									<div class="control-group">
										<label class="control-label" for="form-field-1">품 목 코 드</label>
										<div class="controls">
											<input class="input-small" type="text" id="itemCode" name="itemCode" placeholder=""  value="">										
										</div>
									</div>
								
									<div class="control-group">
										<label class="control-label" for="form-field-1">삭제여부</label>
										<div class="controls">
											<select class="chosen-select span1" id="deleteFlag" name="deleteFlag">
												<option value="Y">Y</option>
												<option value="N" selected="selected">N</option>
											</select>
										</div>
									</div>
							
									<div class="control-group">
										<label class="control-label" for="form-field-1">정렬기준</label>
										<div class="controls">
											<select class="chosen-select span1" id="orderStd" name="orderStd">
											<option value="purchase_date" selected="selected">매입일자</option>
											<option value="item_code">품목코드</option>
											<option value="customer_name">거래처명</option>
											<option value="item_name">품목명</option>
											</select>
											<span>
												<button class="btn btn-small" type="submit" id="search">조회</button>
												<button class="btn btn-info btn-small" type="reset" id="reset">초기화</button>
											</span>
										</div>
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label" for="form-field-1">매 입 일 자</label>
										<div class="controls">
											<div class="input-append">
												<input class="cl-date-picker1 input-small" id="startDate" name="startDate" type="text" data-date-format="yyyy-mm-dd"  value="">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>	
											</div>
												~
											<div class="input-append">
												<input class="cl-date-picker1 input-small" id="endDate" name="endDate" type="text" data-date-format="yyyy-mm-dd"  value="">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
								
															
									<div class="control-group">
										<label class="control-label" for="form-field-1">거 래 처 명</label>
	
										<div class="controls">
											<input type="text" id="customerName" name="customerName" placeholder=""  value="">
										</div>
									</div>
								
									<div class="control-group">
										<label class="control-label" for="form-field-1">품 목 명</label>
	
										<div class="controls">
											<input type="text" id="itemName" name="itemName" placeholder=""  value="">
										</div>
									</div>
								</div>
								
								<div id="dialog-confirm" class="hide">
									<p id="dialog-txt" class="bolder grey">
									</p>
								</div>
							</form>
							
							<div class="row-fluid">
								<div class="span12" >
									<label id="purchaseitem_allcount">총 ${total }건</label>
									<table id="searchList" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">매입일자</th>
												<th class="center">매입번호</th>
												<th class="center">매입순번</th>
												<th class="center">거래처코드</th>
												<th class="center">거래처명</th>
												<th class="center">담당자</th>
												<th class="center">품목코드</th>
												<th class="center">품목명</th>
												<th class="center">입고일자</th>
												<th class="center">출고일자</th>
												<th class="center">수량</th>
												<th class="center">공급가액</th>
												<th class="center">부가세</th>
												<th class="center">과세 여부</th>
												<th class="center">세금계산서번호</th>
											</tr>
										</thead>
										
										<tbody id="searchListBody">
											<c:forEach items='${result }' var='vo' varStatus='status'>
												<tr>
													<td class="center">${vo.purchaseDate }</td>
													<td class="center">${vo.no }</td>
													<td class="center">${vo.number }</td>
													<td class="center">${vo.customerCode }</td>
													<td class="center">${vo.customerName }</td>
													<td class="center">${vo.purchaseManager }</td>
													<td class="center">${vo.itemCode }</td>
													<td class="center">${vo.itemName }</td>
													<td class="center">${vo.receiptDate }</td>
													<td class="center">${vo.releaseDate }</td>
													<td style="text-align:right"><fmt:formatNumber value="${vo.quantity }" pattern="#,###"/></td>
													<td style="text-align:right"><fmt:formatNumber value="${vo.supplyValue }" pattern="#,###"/></td>
													<td style="text-align:right"><fmt:formatNumber value="${vo.taxValue }" pattern="#,###"/></td>
													<td class="center">${vo.taxType }</td>
													<td class="center">${vo.taxbillNo }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row-fluid">
								<div class="pagination" id = "paginationList">
									<ul id="pagination">
									<c:choose>
										<c:when test="${ curPage > 5 }">
											<li><a class="page_go" id="gotoPrev"><i class="icon-double-angle-left"></i></a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a><i class="icon-double-angle-left"></i></a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="i" begin="${ blockStartNum }"
										end="${ blockLastNum }">
										<c:choose>
											<c:when test="${ i > lastPage }">
												<li class="disabled"><a>${ i }</a></li>
											</c:when>
											<c:when test="${ i == curPage }">
												<li class="active"><a href="javascript:void(0);">${ i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a class="page_go" href="javascript:void(0);">${ i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
										
									<c:choose>
										<c:when test="${ lastPage > blockLastNum }">
											<li><a class="page_go" href="javascript:void(0);" id="gotoNext"><i class="icon-double-angle-right"></i></a></li>
										</c:when>
										
										<c:otherwise>
											<li class="disabled"><a><i class="icon-double-angle-right"></i></a></li>
										</c:otherwise>
									</c:choose>
									</ul>
								</div>
							</div>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.span -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
	var blockStartNum = "${blockStartNum}";
	var blockLastNum = "${blockLastNum}";
	var lastPage = parseInt("${lastPage }");
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
			titleFormat: "yyyy MM", 
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
			
			$(".chosen-select").chosen();
		})
		
		function reset() {
		location.reload(true);
	};
		
	 
		var searchFlag = true;
		$("#search").click(function(event) {
			event.preventDefault();
			
			if(($("#startDate").val() != null && $("#startDate").val().length !== 0) || ($("#endDate").val() != null && $("#endDate").val().length !== 0)) {
				if(($("#startDate").val() != null && $("#startDate").val().length !== 0) && ($("#endDate").val() != null && $("#endDate").val().length !== 0)) {
					if($("#startDate").val() > $("#endDate").val()) {
						dialog("날짜를 정확히 입력해 주세요.", false);
						return;
					}
				} else {
					dialog("날짜를 정확히 입력해 주세요.", false);
					return;
				}
			}
			
		
			
			var vo = {startDate : $("#startDate").val(), endDate : $("#endDate").val(), no : $("#no").val(), customerCode : $("#customerCode").val(), customerName : $("#customerName").val(),
					  itemCode : $("#itemCode").val(),itemName : $("#itemName").val(), deleteFlag : $("#deleteFlag").val(), orderStd : $("#orderStd").val()};
			
			var page_num = 1;
			blockStartNum = 1;
			blockLastNum = 5;
			
			 $.ajax({
			        url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
			        type : 'post',
			        dataType : 'json',
			        contentType: 'application/json;charset=utf-8',
					data: JSON.stringify(vo),
			        success : function(result){
						createTable(result);
						lastPage = result[0].lastPage;
						updatePagination(page_num, blockStartNum, blockLastNum, lastPage);
						searchFlag = false;
			        },
			        error : function(error){
			        	dialog("조회된 데이터가 없습니다.", false);
						return;
			        }
			});
		});
		function numberFormat(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function createTable(result){
			$("#searchListBody").remove();
			$("#purchaseitem_allcount").text("총 " + result[0].pageCount +"건");
			if(result[0].pageCount != 0) {
				$newTbody = $("<tbody id='searchListBody'></tbody>")
				$("#searchList").append($newTbody)
				for(var i in result) {
					$newTbody.append(
							"<tr>" +
				            "<td class='center'>" + isEmpty(result[i].purchaseDate) + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].no)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].number)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].customerCode)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].customerName)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].purchaseManager)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].itemCode) + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].itemName)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].receiptDate)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].releaseDate)  + "</td>" +
				            "<td style='text-align:right'>" + isEmpty(numberFormat(result[i].quantity)) + "</td>" +
				            "<td style='text-align:right'>" + isEmpty(numberFormat(result[i].supplyValue)) + "</td>" +
				            "<td style='text-align:right'>" + isEmpty(numberFormat(result[i].taxValue)) + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].taxType)  + "</td>" +
				            "<td class='center'>" + isEmpty(result[i].taxbillNo)  + "</td>" +
				            "</tr>");
				}
			}
		}
		
		function isEmpty(value) {
			if(value == null || value.length === 0) {
				return "";
			} else {
				return value;
			}
		}
		
		$("body").on("click",".page_go",function(e) {
			
			if($(this).text() == null){
				var page_num = 1;
			} else{
				var page_num = $(this).text();
			}
			
			var page_num = $(this).text();
			
			var id = $(this).attr('id');
			
			if(id == "gotoNext") {
				console.log(blockLastNum);
				page_num = parseInt(blockLastNum) + 1;
				blockLastNum = parseInt(blockLastNum) + 5;
				blockStartNum = parseInt(blockStartNum) + 5;
			} else if(id == "gotoPrev"){
				page_num = parseInt(blockStartNum) - 1;
				blockStartNum = parseInt(blockStartNum) - 5;
				blockLastNum = parseInt(blockLastNum) - 5;
			}
			
			var vo = {startDate : $("#startDate").val(), endDate : $("#endDate").val(), no : $("#no").val(), customerCode : $("#customerCode").val(), customerName : $("#customerName").val(),
					  itemCode : $("#itemCode").val(),itemName : $("#itemName").val(), deleteFlag : $("#deleteFlag").val(), orderStd : $("#orderStd").val(), 
					  page : page_num, searchFlag : searchFlag};
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
				type:"post",
				dataType:"json",
				contentType: 'application/json;charset=utf-8',
				data:JSON.stringify(vo),
				success:function(result) {
					createTable(result);
					lastPage = result[0].lastPage;
					updatePagination(page_num, blockStartNum, blockLastNum, lastPage);
				}, error:function(error) {
				}
			});
		});
		
		function updatePagination(curPage, blockStartNum, blockLastNum, lastPage) {
			$("#pagination").remove();
			$newUl = $("<ul id='pagination'></ul>");
			$("#paginationList").append($newUl);
			if(curPage > 5) {
				$newUl.append("<li><a class='page_go' id='gotoPrev'><i class='icon-double-angle-left'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			}
			for(var li = blockStartNum; li <= blockLastNum; li++) {
				if(li > lastPage) {
					$newUl.append(
						"<li class='disabled'><a>"+li+"</a></li>"
					);
				} else if(li == curPage) {
					$newUl.append(
						"<li class='active'><a href='javascript:void(0);'>"+ li + "</a></li>"
					);
				} else {
					$newUl.append(
							"<li><a class='page_go' href='javascript:void(0);'>" + li + "</a></li>"
						);
				}
			}
			if(lastPage > blockLastNum) {
				$newUl.append("<li><a class='page_go' href='javascript:void(0);' id='gotoNext'><i class='icon-double-angle-right'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a><i class='icon-double-angle-right'></i></a></li>");
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
								$( this ).dialog("close"); 
								location.href="${pageContext.request.contextPath }/02/07";
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