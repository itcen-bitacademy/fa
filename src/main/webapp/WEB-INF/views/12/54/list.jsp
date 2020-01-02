<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
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
<body class="skin-3" style="min-width:1500px">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
			<div class="page-header position-relative">
				<h1 class="pull-left">매출세금계산서 현황조회</h1>
			</div><!-- /.page-header -->
			
			<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
						
					<form class="form-horizontal" method="post" id="searchForm" action="${pageContext.request.contextPath }/12/54">
						<div class="span12">
						<div class="row-fluid">
									<div class="form-horizontal">
										<div class="span6">
											<label class="control-label" for="form-field-date">작 성 일 자</label>
												<div class="controls">
													<input class="span4 cl-date-picker" id="sales-date" name="startDate" type="text" data-date-format="yyyy-mm-dd" value="${search.startDate }"> 
														<span class="add-on"><i class="icon-calendar"></i>
													</span>
													&nbsp; ~ &nbsp;															
													<input class="span4 cl-date-picker" id="sales-date" name="endDate" type="text" data-date-format="yyyy-mm-dd" value="${search.endDate }"> 
													<span class="add-on"><i class="icon-calendar"></i>
													</span>
												</div>
										</div>
									<div class="span6">
										<div class="controls"></div>
									</div>
							</div>
						</div>
						<br>
						</div>
				
						<div class="row-fluid">
							<div class="span12">
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span6">
												<label class="control-label" for="form-field-select-1">거래처</label>
												<div class="controls">
													<select class="span3 chosen-select" id="customerCode" name="customerCode" data-placeholder="거래처">
														<option value="">거래처항목</option>
															<c:forEach items="${customerlist }" var="clist">
																<c:choose>
																	<c:when test="${clist.customerCode eq search.customerCode }">
																		<option value="${clist.customerCode }" selected>${clist.customerCode } [${clist.customerName }]</option>
																	</c:when>
																
																	<c:otherwise>
																			<option value="${clist.customerCode }">${clist.customerCode } [${clist.customerName }]</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									</div>
									
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span6">
												<label class="control-label" for="form-field-1">세금계산서 번호</label>
												<div class="controls">
													<select class="span3 chosen-select" id="taxbillNo" name="taxbillNo" data-placeholder="세금계산서">
															<option value="">없음</option>
															<c:forEach items="${taxlist }" var="tlist">
																<c:choose>
																	<c:when test="${tlist.taxbillNo eq search.taxbillNo }">
																		<option value="${tlist.taxbillNo }" selected>${tlist.taxbillNo } [${tlist.salesNo }]</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${tlist.taxbillNo }">${tlist.taxbillNo } [${tlist.salesNo }]</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
													</select>
											</div>
										</div>
									</div>
									</div>
									
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span6">
												<label class="control-label" for="form-field-1">품목명</label>
													<div class="controls">
													<select class="span3 chosen-select" id="itemName" name="itemName" data-placeholder="품목명">
														<option value="">없음</option>
														<c:forEach items="${itemlist }" var="ilist">
															<c:choose>
																<c:when test="${ilist.itemName eq search.itemName }">
																	<option value="${ilist.itemName }" selected>${ilist.itemName }</option>	
																</c:when>
																<c:otherwise>
																	<option value="${ilist.itemName }">${ilist.itemName }</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									</div>
									<div class="hr hr-18 dotted"></div>
									<div class="form-horizontal">
										<div class="control-group">
											<div class="span10">	
												<div class="control">
														<span class="lbl">&nbsp;정렬순서&nbsp;&nbsp;&nbsp;</span>
														
														<span class="lbl">&nbsp;최근순&nbsp;</span>
														<input name="orderData" type="radio" class="ace" value="tst.write_date" checked="checked">
																													
														<span class="lbl">&nbsp;공급가액 순&nbsp;&nbsp;</span>
														<c:if test="${order eq 'tst.total_supply_value' }">	
															<input name="orderData" type="radio" class="ace" value="tst.total_supply_value" checked="checked">
														</c:if>
														<c:if test="${order ne 'tst.total_supply_value' }">
															<input name="orderData" type="radio" class="ace" value="tst.total_supply_value">
														</c:if>
															
														<span class="lbl">&nbsp;품목명 순&nbsp;&nbsp;</span>
														<c:if test="${order eq 'tbs.item_name' }">
															<input name="orderData" type="radio" class="ace" value="tbs.item_name" checked="checked">
														</c:if>
														<c:if test="${order ne 'tbs.item_name' }">
																<input name="orderData" type="radio" class="ace" value="tbs.item_name">
														</c:if>
														
														<span class="lbl">&nbsp;거래처명 순&nbsp;&nbsp;</span>
														<c:if test="${order eq 'tst.customer_name' }">
																<input name="orderData" type="radio" class="ace" value="tst.customer_name" checked="checked">
														</c:if>
														<c:if test="${order ne 'tst.customer_name' }">
																<input name="orderData" type="radio" class="ace" value="tst.customer_name">
														</c:if>
															
														<span class="lbl">&nbsp;과세구분&nbsp;&nbsp;</span>
														<select class="chosen-select" id="zero" name="taxType" data-placeholder="영세/비영세">
															<option value="tax">yes</option>
															<option value="no">no</option>
														</select>
														
														<button class="btn btn-small btn-info" type="submit">조회</button>
											</div>
										</div>
									</div>
								</div>
						<div class="hr hr-18 dotted"></div>
						<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">세금계산서 발행 ${resultlist.pagination.totalCnt } 건</p>
	                    <select class="span6" name="viewCount" id="viewCount" style="width:80px;float:right;margin-bottom:5px;" onchange="view()">
	                    	<c:choose>
	                             <c:when test="${viewCount == 10 }">
	                                 <option value="10" selected style="display:none">10</option>
	                             </c:when>
	                             <c:when test="${viewCount == 20 }">
	                                 <option value="20" selected style="display:none">20</option>
	                             </c:when>
	                             <c:when test="${viewCount == 30 }">
	                                 <option value="30" selected style="display:none">30</option>
	                             </c:when>
	                         </c:choose>
	                         <option value="10">10</option>
		                     <option value="30">30</option>
		                     <option value="50">50</option>
	                    </select>
						</form> 
						<div class="row-fluid">
						<div class="span12" style="overflow: auto;">
							<table class="table table-striped table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
								<thead>
									<tr>
										<th>번 호</th>
										<th>세금계산서번호</th>
										<th>세금계산서일자</th>
										<th>매출번호</th>
										<th>매출일자</th>
										<th>거래처명</th>
										<th>거래처코드</th>
										<th>품목명</th>
										<th>대표자명</th>
										<th>담당자명</th>
										<th>은행명</th>
										<th>계좌번호</th>
										<th>예금주</th>
										<th>총 공급가액</th>
										<th>총 세액</th>
										<th>비고</th>
										<th>과세유형</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${resultlist.datas }" var = "rlist" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>${rlist.taxbillNo }</td>
										<td>${rlist.writeDate }</td>
										<td>${rlist.salesNo }</td>
										<td>${rlist.salesDate }</td>
										<td>${rlist.customerName }</td>
										<td>${rlist.customerCode }</td>
										<td>${rlist.itemName }</td>
										<td>${rlist.ceo }</td>
										<td>${rlist.managerName }</td>
										<td>${rlist.bankName }</td>
										<td>${rlist.depositNo }</td>
										<td>${rlist.depositHost }</td>
										<td class="number"><fmt:formatNumber value="${rlist.totalSupplyValue }" pattern="#,###"></fmt:formatNumber></td>
                                    	<td class="number"><fmt:formatNumber value="${rlist.totalTaxValue }" pattern="#,###"></fmt:formatNumber></td>
										<td>${rlist.voucherUse }</td>
										<td>${rlist.taxType }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<input type="hidden" value="${search.searchFlag }" name="searchFlag" id="searchFlag">
                        	<input type="hidden" value="${search.startDate }" name="" id="startDate">
                        	<input type="hidden" value="${search.endDate }" name="" id="endDate">
							<input type="hidden" value="${pg }" name="" id="currentPage">
						</div><!-- /span -->
					</div><!-- /row -->
					<div class="row-fluid">
						<div class="pagination">
						<ul>
	                        <c:choose>
	                            <c:when test="${resultlist.pagination.prev }">
	                                <li><a href="javascript:movePage(${resultlist.pagination.startPage - 1 });"><i class="icon-double-angle-left"></i></a></li>
	                            </c:when>
	                            <c:otherwise>
	                                <li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
	                            </c:otherwise>
	                        </c:choose>
	                        <c:forEach begin="${resultlist.pagination.startPage }" end="${resultlist.pagination.endPage }" var="pg">
	                            <c:choose>
	                                <c:when test="${pg eq resultlist.pagination.page }">
	                                    <li class="active"><a href="javascript:movePage(${pg });">${pg }</a></li>
	                                </c:when>
	                                <c:otherwise>
	                                    <li><a href="javascript:movePage(${pg });">${pg }</a></li>
	                                </c:otherwise>
	                            </c:choose>
	                        </c:forEach>
	                        <c:choose>
	                            <c:when test="${resultlist.pagination.next }">
	                                <li><a href="javascript:movePage(${resultlist.pagination.endPage + 1 });"><i class="icon-double-angle-right"></i></a></li>
	                            </c:when>
	                            <c:otherwise>
	                                <li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
	                            </c:otherwise>
	                        </c:choose>
                        </ul>
						</div>
					</div>
					</div>
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
		</div><!-- /.page-content -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<!-- basic scripts -->
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
		$(function() {
			$(".chosen-select").chosen();
		})
		
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
	
			$('.cl-ym-date-picker').datepicker({
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
		})
		
		function view(){
        	var url = "${pageContext.request.contextPath }/12/54/1";
        	$("#searchForm").attr("action", url).submit();
        }
		
		// 페이지 이동 가능하게 하는 Javascript
		function movePage(page) { // POST 페이지 이동 (검색 조건 있음)
            var searchFlag = $("#searchFlag").val();
            var url = "${pageContext.request.contextPath }/12/54/" + page;
            if (searchFlag == "true") {
                $("#searchForm").attr("action", url).submit();
            } else {
                location.href = url;
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