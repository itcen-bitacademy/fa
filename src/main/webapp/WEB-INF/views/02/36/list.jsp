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
<style>
        html,body{
             	height:100%;
             	overflow-x: hidden;
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
      	
      	@media screen and (max-width: 920px) {
	         	.main-container{
            	height:calc(100% - 84px);
         		}
	 	}
      	
      	.form-horizontal .control-label {
	    text-align: left;
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
					<h1 class="pull-left">매입거래처현황조회</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">

						<!-- PAGE CONTENT BEGINS -->
						<div class="row-fluid">
						<div class="span12">
						<form class="form-horizontal" id="form-customer" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
							<div class="span12">
								<div class="control-group">
									<label class="control-label" for="customer">거래처</label>
									<div class="controls">
										<input type="text" id="preNo" name="preNo" readonly style="width: 150px;" value="${inputCustomer.preNo }">
										<div class="input-append">
										<input type="text" id="preName" name="preName" readonly style="width: 200px;" value="${inputCustomer.preName }">
										<span class="add-on">
										<a href="#" id="a-firstCustomerInfo-dialog">
										<i class="icon-search icon-on-right bigger-110"></i></a></span></div> ~
										<input type="text" id="no" name="no" readonly style="width: 150px;" value="${inputCustomer.no }">
										<div class="input-append">
											<input type="text" id="name" name="name" readonly style="width: 200px;" value="${inputCustomer.name }">
											<span class="add-on">
											<a href="#" id="a-secondCustomerInfo-dialog">
												<i class="icon-search icon-on-right bigger-110"></i>
											</a>
											</span>
										</div>
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
											<div class="input-append">
												<input type="text" id="input-dialog-customerNo" style="width: 100px;" /> 
													<span class="add-on">
														<a href="#" id="a-dialog-customerNo"> 
																<i class="icon-search icon-on-right bigger-110"></i>
														</a>
													</span>
											</div>
											</td>
										</tr>
									</table>
									<!-- 사업자번호 및 상호명 데이터 리스트 -->
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
								<!-- 매입거래처 사업자번호, 상호명 Modal pop-up : end -->
								
								

							<div class="span4" style="margin:0 0 0 0">
		                        <div class="control-group">
		                           <label class="control-label" for="item">종목</label>
		                           <div class="controls">
		                              <input type="text" id="item" name="item" style="width: 150px;" value="${inputCustomer.item }">
		                           </div>
		                        </div>
		                     
		                        <div class="control-group">
		                           <label class="control-label" for="delete_flag">삭제포함여부</label>
		
		                           <div class="controls">
		                           		<c:choose>
		                           			<c:when test="${inputCustomer.deleteFlag == 'N'}">
			                           			<input id="deleteFlag" name="deleteFlag" type="radio" class="ace" value="N" checked="checked">
				                                <span class="lbl">미포함</span>
				                                <input id="deleteFlag" name="deleteFlag" type="radio" class="ace" value="Y">
				                                <span class="lbl">포함</span>
		                           			</c:when>
		                           			<c:otherwise>
			                           			<input id="deleteFlag" name="deleteFlag" type="radio" class="ace" value="N">
				                                <span class="lbl">미포함</span>
				                                <input id="deleteFlag" name="deleteFlag" type="radio" class="ace" value="Y" checked="checked">
				                                <span class="lbl">포함</span>
		                           			</c:otherwise>
		                           		</c:choose>
		                              
		                           </div>
		                        </div>
		                     </div>
						
							<div class="span6">
		                        <div class="control-group">
		                           <label class="control-label" for="insert_date">입력일자</label>
		                              <div class="controls">
		                                 <div class="row-fluid input-append">
		                                 <input class="cl-date-picker" id="insertDay" name="insertDay" type="text" style="width: 135px;" data-date-format="yyyy-mm-dd" readonly value="${inputCustomer.insertDay }"/>
		                                    <span class="add-on">
		                                    <i class="icon-calendar"></i>
		                                    </span>
		                                 </div>
		                              </div>
		                        </div>
		                        
		                        <div class="control-group">
		                           <label class="control-label" for="manager_name">거래처 담당자</label>
		                           <div class="controls">
		                              <input type="text" name="managerName" id="managerName" style="width: 150px;" value="${inputCustomer.managerName }">
		                              <input type="hidden" name="page" value="1">
		                           </div>
		                        </div>
		                     </div>
						
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<div class="hr hr-18 dotted"></div>
											<button id="btn_select" class="btn btn-info btn-small" style="float:left;">조회</button>
											<button id="btn_cancel" class="btn btn-default btn-small" type="button" style="float:left; margin-left:5px;">초기화</button>
									</div>
										<div class="hr hr-18 dotted"></div>
								</div>
							</div>
						</form>
						</div>
								<p class="span6" style="margin:-30px 0 0 0;font-size:0.9rem">총 ${dataResult.pagination.totalCnt } 건</p>
						</div>
							
							<div class="row-fluid">
								<div class="span12" style="overflow-x: scroll;">
									<table id="customer-table" class="table table-striped table-bordered table-hover" style="width:3000px;">
										<thead>
											<tr>
				                                 <th class="center">사업자번호</th>
				                                 <th class="center">상호</th>
				                                 <th class="center">대표자</th>
				                                 <th class="center">법인번호</th>
				                                 <th class="center">주소</th>
				                                 <th class="center">전화번호</th>
				                                 <th class="center">업태</th>
				                                 <th class="center">종목</th>
				                                 <th class="center">개설일자</th>
				                                 <th class="center">관할사무소</th>
				                                 <th class="center">거래처담당자성명</th>
				                                 <th class="center">담당자이메일</th>
				                                 <th class="center">계좌번호</th>
				                                 <th class="center">예금주</th>
				                                 <th class="center">은행코드</th>
				                                 <th class="center">은행명</th>
				                                 <th class="center">입력일자</th>
				                                 <th class="center">입력담당자ID</th>
				                                 <th class="center">수정일자</th>
				                                 <th class="center">수정담당자ID</th>
				                                 <th class="center">삭제여부</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${customerVo }" var="customerVo" varStatus="status">
												<tr>
													<td class="center">${customerVo.no }</td>
													<td class="left">${customerVo.name }</td>
													<td class="left">${customerVo.ceo }</td>
													<td class="left">${customerVo.corporationNo }</td>
													<td class="left">${customerVo.address }</td>
													<td class="left">${customerVo.phone }</td>
													<td class="left">${customerVo.conditions }</td>
													<td class="left">${customerVo.item }</td>
													<td class="center">${customerVo.openDate }</td>
													<td class="left">${customerVo.jurisdictionOffice }</td>
													<td class="left">${customerVo.managerName }</td>
													<td class="left">${customerVo.managerEmail }</td>
													<td class="left">${customerVo.depositNo }</td>
													<td class="left">${customerVo.depositHost }</td>
													<td class="center">${customerVo.bankCode }</td>
													<td class="center">${customerVo.bankName }</td>
													<td class="center">${customerVo.insertDay }</td>
													<td class="center">${customerVo.insertUserid }</td>
													<td class="center">${customerVo.updateDay }</td>
													<td class="center">${customerVo.updateUserid }</td>
													<td class="center">${customerVo.deleteFlag }</td>
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
									<li value="${dataResult.pagination.startPage - 1 }"><a href="#"><i class="icon-double-angle-left"></i></a></li>								
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>
								
							
							<c:forEach var="pageNum" begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }">
								<c:choose>
									<c:when test="${pageNum eq  dataResult.pagination.page}">
										<li class="active" value="${pageNum }"><a href="#">${pageNum }</a></li>		
									</c:when>
									<c:otherwise>
										<li value="${pageNum }"><a href="#">${pageNum }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li value="${dataResult.pagination.endPage + 1 }"><a href="#"><i class="icon-double-angle-right"></i></a></li>								
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
		
		// 페이징
		$(".pagination li a").on("click", function(event){
			event.preventDefault();
			if($(this).parent().attr("class") == "disabled"){
				return;
			}
			$("#form-customer input[name=page]").val($(this).parent().val());
			$("#form-customer").submit();
		});
		
		// 매입거래처 팝업
		$("#dialog-message").dialog({
		       autoOpen : false
		});
		
	    $("#a-firstCustomerInfo-dialog, #a-secondCustomerInfo-dialog").click(function() {
	       tf = $(this).parent().prev();
	       
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
			  	  	
			  	  	for(let c in customerList) {
			  	  		$("#tbody-customerList").append("<tr>" +
			                    "<td class='center'>" + customerList[c].no + "</td>" +
			                    "<td class='left'>" + customerList[c].name + "</td>" +
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
		 $(tf).parent().prev().val(td.eq(0).text());
		 $("#dialog-message").dialog('close');
		});
		
		// 조회
		$("#btn_select").click(function(){
			document.getElementById('form-customer').submit();
		});
		
		// 초기화
		$("#btn_cancel").click(function(){
			$("#form-customer input[type=text]").val("");
			$("input:radio[name='deleteFlag']:radio[value='N']").prop('checked', true); // 삭제포함여부
		});
		
		// 삭제포함여부 클릭시
		$("input:radio[name=deleteFlag]").click(function()
	    {
			document.getElementById('form-customer').submit();
	    });
		
		// 검색 Form에서 엔터키 클릭시
		$('form input').keydown(function(e) {
	        if (e.keyCode == 13) {
	            $('form').submit();
	        }
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