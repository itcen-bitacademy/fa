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
<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">




				<div class="page-header position-relative">
					<h1 class="pull-left">매입거래처현황조회</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">

						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" id="form-customer" method="post">
							<div class="span12">
								<div class="control-group">
									<label class="control-label" for="customer">거래처</label>
									<div class="controls">
										<input type="text" name="firstNo" style="width: 150px;">
										<input type="text" name="firstName" readonly style="width: 200px;">
										<a href="#" id="a-firstCustomerInfo-dialog">
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span></a> ~ 
										<input type="text" name="secondNo" style="width: 150px;">
										<input type="text" name="secondname" readonly style="width: 200px;">
										<a href="#" id="a-secondCustomerInfo-dialog">
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span></a>
									</div>
								</div>
							</div>
							
							
								<!-- 매입거래처 사업자번호, 상호명 Modal pop-up : start -->
								<div id="dialog-message" title="매입거래처" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td>
											<select id="searchOption" style="width:160px;">
													<option value="no">사업자번호</option>
													<option value="name">상호명</option>
											</select>
											
											<input type="text" id="input-dialog-customerNo" style="width: 100px;" /> 
											<a href="#" id="a-dialog-customerNo"> 
											<span class="btn btn-small btn-info" style="margin-bottom: 10px;">
											<i class="icon-search nav-search-icon"></i>
											</span>
											</a></td>
										</tr>
									</table>
									<!-- 은행코드 및 은행명 데이터 리스트 -->
									<table id="modal-customer-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">사업자번호</th>
												<th class="center">상호명</th>
											</tr>
										</thead>
										<tbody id="tbody-customerList">
											
										</tbody>
									</table>
								</div>
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
								
								

							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="item">종목</label>
									<div class="controls">
										<input type="text" id="item" name="item" style="width: 150px;">
									</div>
								</div>
							
								<div class="control-group">
									<label class="control-label" for="deleteFlag">삭제포함여부</label>

									<div class="controls">
										<input id="deleteFlag" name="deleteFlag" type="radio" class="ace" value="N" checked="checked">
										<span class="lbl">미포함</span>
										<input name="deleteFlag" type="radio" class="ace" value="Y">
										<span class="lbl">포함</span>
									</div>
								</div>
							</div>
						
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="insert_date">입력일자</label>
										<div class="controls">
											<div class="row-fluid input-append">
											<input class="cl-date-picker" id="id-date-picker-1" name="insertDay" type="text" style="width: 135px;" data-date-format="yyyy-mm-dd" />
												<span class="add-on">
												<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="manager_name">거래처 담당자</label>
									<div class="controls">
										<input type="text" name="managerName" style="width: 150px;">
									</div>
								</div>
							</div>
						</form>
						
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<div class="hr hr-18 dotted"></div>
											<button id="btn_select" class="btn btn-info btn-small" style="float:left; margin-left:20px;">조회</button><br>
										<div class="hr hr-18 dotted"></div>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span12">
									<table id="customer-table" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
				                                 <th>사업자번호</th>
				                                 <th>상호</th>
				                                 <th>대표자</th>
				                                 <th>법인번호</th>
				                                 <th>주소</th>
				                                 <th>전화번호</th>
				                                 <th>업태</th>
				                                 <th>종목</th>
				                                 <th>개설일자</th>
				                                 <th>관할사무소</th>
				                                 <th>거래처담당자성명</th>
				                                 <th>담당자이메일</th>
				                                 <th>계좌번호</th>
				                                 <th>예금주</th>
				                                 <th>은행코드</th>
				                                 <th>은행명</th>
				                                 <th>입력일자</th>
				                                 <th>입력담당자ID</th>
				                                 <th>수정일자</th>
				                                 <th>수정담당자ID</th>
				                                 <th>삭제여부</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${customerVo }" var="customerVo" varStatus="status">
												<tr>
													<td>${customerVo.no }</td>
													<td>${customerVo.name }</td>
													<td>${customerVo.ceo }</td>
													<td>${customerVo.corporationNo }</td>
													<td>${customerVo.address }</td>
													<td>${customerVo.phone }</td>
													<td>${customerVo.conditions }</td>
													<td>${customerVo.item }</td>
													<td>${customerVo.openDate }</td>
													<td>${customerVo.jurisdictionOffice }</td>
													<td>${customerVo.managerName }</td>
													<td>${customerVo.managerEmail }</td>
													<td>${customerVo.depositNo }</td>
													<td>${customerVo.depositHost }</td>
													<td>${customerVo.bankCode }</td>
													<td>${customerVo.bankName }</td>
													<td>${customerVo.insertDay }</td>
													<td>${customerVo.insertUserid }</td>
													<td>${customerVo.updateDay }</td>
													<td>${customerVo.updateUserid }</td>
													<td>${customerVo.deleteFlag }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						
						
						
						
						<%-- 페이징 --%>
						<div class="pagination">
							<ul>
								<c:choose>
								<c:when test="${dataResult.pagination.prev }">
									<li><a href="${pageContext.servletContext.contextPath }/02/36/list?page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
								</c:choose>
								<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
								<c:choose>
								<c:when test="${pg eq dataResult.pagination.page }">
									<li class="active"><a href="${pageContext.servletContext.contextPath }/02/36/list?page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.servletContext.contextPath }/02/36/list?page=${pg }">${pg }</a></li>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${dataResult.pagination.next }">
									<li><a href="${pageContext.servletContext.contextPath }/02/36/list?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
								</c:choose>
									</ul>
								</div>

						<!-- PAGE CONTENT ENDS -->
						
					</div>
					<!-- /.span -->
				</div>
				<!-- /.row-fluid -->



			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
	<script>
	var tf;
	
	$(function() {
		// $(function()){ 이 중복될 경우 아래 코드 하나만 사용
		$(".chosen-select").chosen();
		
		// 매입거래처 팝업
		$("#dialog-message").dialog({
		       autoOpen : false
		});
		
	    $("#a-firstCustomerInfo-dialog, #a-secondCustomerInfo-dialog").click(function() {
	       tf = $(this).prev();
	       $("#dialog-message").dialog({
	          title: "매입거래처 정보",
	          title_html: true,
	             resizable: false,
	           height: 500,
	           width: 400,
	           modal: true,
	           close: function() {
	              $('#tbody-customerList tr').remove();
	           },
	           buttons: {
	           "닫기" : function() {
	                    $(this).dialog('close');
	                    $('#tbody-customerList tr').remove();
	               }
	           }
	       });
	       $("#dialog-message").dialog('open');
	    });
	    
		// 매입거래처 팝업 클릭시
		$('#dialog-message-table').on('click', '#a-dialog-customerNo', function(event, ui) {
			event.preventDefault();
			 $("#tbody-customerList").find("tr").remove();
			 
			 var searchOption = $("#searchOption").val();
			 var searchValue = $("#input-dialog-customerNo").val();
			 
			 // ajax 통신
			 $.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/gets?"+searchOption+"="+searchValue,
			    contentType : "application/json; charset=utf-8",
			    type: "get",
			    dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
			    data : "",
			    statusCode: {
			        404: function() {
			          alert("page not found");
			        }
			    },
			    success: function(data){
			  	  if(data.success) {
			  	  	$("#input-dialog-customerNo").val('');
			  	  	var customerList = data.customerList;
			  	  	console.log(data.customerList);
			  	  	for(let c in customerList) {
			  	  		$("#tbody-customerList").append("<tr>" +
			                    "<td class='center'>" + customerList[c].no + "</td>" +
			                    "<td class='center'>" + customerList[c].name + "</td>" +
			                    "</tr>");
			
			  	  	}
			  	  }
			    },
			    error: function(xhr, error){
			       console.error("error : " + error);
			    }
			});
		});
			
		// 매입거래처 리스트(customerList)에서 row를 선택하면 row의 해당 데이터 form에 추가
		$(document.body).delegate('#tbody-customerList tr', 'click', function() {
		 var tr = $(this);
		 var td = tr.children();
		 
		 $(tf).val(td.eq(1).text());
		 $(tf).prev().val(td.eq(0).text());
		 $("#dialog-message").dialog('close');
		});
		
		//조회
		$("#btn_select").click(function(){
			$("#form-customer").attr("action", "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list");
			document.getElementById('form-customer').submit();
			
	        return false;
		});
	});
	
	</script>
	
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
		})
	</script>
</body>
</html>