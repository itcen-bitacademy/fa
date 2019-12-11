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
										</select>
										<span>
											<button class="btn btn-small" type="submit" id="search">조회</button>
										</span>
									</div>
							</div>
							</div>
							
							<div class="span4">
							<div class="control-group">
									<label class="control-label" for="form-field-1">매 입 일 자</label>
									<div class="controls">
										<input class="cl-date-picker1 input-small" id="purchaseDate" name="purchaseDate" type="text" data-date-format="yyyy-mm-dd"  value="">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>										
									<span>
									<!-- 	~
									</span>
									<input class="cl-date-picker2 input-small" id="purchaseDate1" name="purchaseDate" type="text" data-date-format="yyyy-mm-dd">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span> -->
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
							</form>
							
							<table id="searchList" class="table table-striped table-bordered table-hover">
								<thead>
								<tr>총 매입 건수</tr>
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
											<td class="center">${vo.quantity }</td>
											<td class="center">${vo.supplyValue }</td>
											<td class="center">${vo.taxValue }</td>
											<td class="center">${vo.taxbillNo }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="pagination">
								<ul>
								<c:choose>
									<c:when test="${ curPage > 5 }">
										<li><a class="page_go" href="javascript:void(0);" id="gotoPrev"><i class="icon-double-angle-left"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
									</c:otherwise>
								</c:choose>
									<c:forEach var="i" begin="${ blockStartNum }"
										end="${ blockLastNum }">
										<c:choose>
											<c:when test="${ i > lastPage }">
												<li class="disabled"><a href="#">${ i }</a></li>
											</c:when>
											<c:when test="${ i == curPage }">
												<li class="selected"><a class="page_go" href="javascript:void(0);">${ i }</a></li>
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
										<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
									</c:otherwise>
								</c:choose>
								</ul>
							</div>
						<%-- <div class="pagination">
						<ul>
							<c:set var="page_count" value="${fn:length(result)}"></c:set>
							
							<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
							<c:forEach var="pur_size" begin="1" end="${((page_count-1)/11)+1 }" step="1">
								<li><a class="page_go" href="javascript:void(0);">${pur_size }</a></li>
							</c:forEach>
							
							<!-- <li class="active"><a href="#">1</a></li> -->
							<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
						</ul>
					</div>  --%>
							
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
			
			$(".chosen-select").chosen();
		})
		
		var searchFlag = true;
		$("#search").click(function(event) {
			var vo = {purchaseDate : $("#purchaseDate").val(), no : $("#no").val(), customerCode : $("#customerCode").val(), customerName : $("#customerName").val(),
					  itemCode : $("#itemCode").val(),itemName : $("#itemName").val(), deleteFlag : $("#deleteFlag").val(), orderStd : $("#orderStd").val()};
			console.log(vo);
			event.preventDefault();
			
			 $.ajax({
			        url : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
			        type : 'post',
			        dataType : 'json',
			        contentType: 'application/json;charset=utf-8',
					data: JSON.stringify(vo),
			        success : function(result){
			        	console.log(result);
						createTable(result);
						searchFlag = false;
			        },
			        error : function(){
			            alert("error");
			        }
			});
		});
		
		function createTable(result){
			$("#searchListBody").remove();
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
			            "<td class='center'>" + isEmpty(result[i].quantity) + "</td>" +
			            "<td class='center'>" + isEmpty(result[i].supplyValue)  + "</td>" +
			            "<td class='center'>" + isEmpty(result[i].taxValue)  + "</td>" +
			            "<td class='center'>" + isEmpty(result[i].taxbillNo)  + "</td>" +
			            "</tr>");
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
			var page_num = $(this).text();
			console.log("now " +page_num);
			
			var id = $(this).attr('id');
		    //alert(id);
			
			if(id == "gotoNext") {
				page_num = "${blockLastNum +1}";
				console.log("next " + page_num);
			} else if(id == "gotoPrev"){
				page_num = "${blockStartNum - 1}";
				console.log("prev " +page_num);
			}
			
			var vo = {purchaseDate : $("#purchaseDate").val(), no : $("#no").val(), customerCode : $("#customerCode").val(), customerName : $("#customerName").val(),
					  itemCode : $("#itemCode").val(),itemName : $("#itemName").val(), deleteFlag : $("#deleteFlag").val(), orderStd : $("#orderStd").val(), 
					  page : page_num, searchFlag : searchFlag};
			console.log(vo);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
				type:"post",
				dataType:"json",
				contentType: 'application/json;charset=utf-8',
				data:JSON.stringify(vo),
				success:function(result) {
					createTable(result);
				}, error:function(error) {
				}
			});
		});
	</script>
</body>
</html>