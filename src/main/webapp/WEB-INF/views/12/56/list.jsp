<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

<style>
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

	@media screen and (max-width: 920px) {
	         	.main-container{
            	height:calc(100% - 84px);
         		}
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
					<h1 class="pull-left">품목 대분류별 매입매출 현황</h1>
				</div><!-- /.page-header -->
				<form class="form-horizontal">
				<div class="row-fluid">
							<div class="span12">
									<div class="form-horizontal">
									
										<div class="span3">
													<label class="control-label" for="cl-ym-date-picker" style="text-align: left; width: 50px;"> 년 월</label>
													<div class="controls" style="margin-left: 50px;" >
														<div class="row-fluid input-append">
															<input class="span11 date-picker" id="datepicker" name="searchdate" type="text" data-date-format="yyyy-mm" value="${vo.searchdate }"style="text-align: left; width: 200px;" readOnly />
															<span class="add-on">
																<i class="icon-calendar"></i>
															</span>
														</div>													
													</div>
										</div>
										
										<div class="span3">
													<label class="control-label" for="form-field-select-2" style="text-align: left; width:80px;">대분류명</label>
													<div class="controls" style="margin-left: 80px;">
														<select class="chosen-select" id="gcategory" name="sectioncode" data-placeholder="대분류명 선택">
															<c:forEach items='${gcategory }' var='gcategory' varStatus='status'>
																<option value="${gcategory.code }">${gcategory.classification }</option>
															</c:forEach>
														</select>
													<!-- sectioncode 상태 유지  -->	
													<script type="text/javascript">
													var itemcode = "${param.sectioncode}";
													$("#gcategory").val(itemcode);
													</script>
													</div>
										</div>
										
										<div class="span3">
													<label class="control-label" for="form-field-select-2" style="text-align: left; width:50px;">품목명</label>
													<div class="controls" style="margin-left: 50px;">
														<select class="chosen-select" id="subcategory" name="itemcode" data-placeholder="품목명 선택">
															
														<c:forEach items='${subcategory }' var='scategory' varStatus='status'>
																<option value="${scategory.itemcode }">${scategory.itemname }</option>
															</c:forEach>
														</select>
													<!-- itemcode 상태 유지  -->	
													<script type="text/javascript">
													var subcategory = "${param.itemcode}";
													$("#subcategory").val(subcategory);
													</script>
													</div>
											</div>
										<div class="span2">
												<button class="btn btn-small btn-info" type="submit" style="margin-left: 10px;"
												formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
												<button class="btn btn-default btn-small" id="btn-reset" type = "reset">초기화</button>
										</div> 
									</div>
								</div>
							</div>
							</form>
								
							<div class="hr hr-18 dotted"></div>
							<p class="span6" style="margin:0 0 10px 0;font-size:0.9rem">품목대분류별 매입매출 현황 ${dataResult.pagination.totalCnt } 건</p>	
							
							<div class="row-fluid">
								<div class="span12" style="overflow: auto;">
									<table id="sample-table-1" class="table table-striped table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
										<thead>
										<tr>
											<th>대분류코드</th>
											<th>대분류명</th>
											<th>품목코드</th>
											<th>품목명</th>
											<th>입고수량</th>
											<th>입고공급가액</th>
											<th>입고부가세</th>
											<th>입고금액</th>
											<th>출고수량</th>
											<th>출고공급가액</th>
											<th>출고부가세</th>
											<th>출고금액</th>
											<th>재고수량</th>
											<th>재고공급가액</th>
											<th>재고부가세</th>
											<th>재고금액</th>
										</tr>
										</thead>
										<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
										<tr>
											<td>${vo.sectioncode }</td>
											<td>${vo.sectionname }</td>
											<td>${vo.itemcode }</td>
											<td>${vo.itemname }</td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.purchasemanagementquantity }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.purchasemanagementsupplyvalue }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.purchasemanagementtaxvalue }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.purchasemanagementtotalprice }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.salesquantity }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.salessupplyvalue }" pattern="#,###" />
											<td style="text-align: right;"><fmt:formatNumber value="${vo.salestaxvalue }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.salestotalprice }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.stockquantity }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.stocksupplyvalue }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.stocktaxvalue }" pattern="#,###" /></td>
											<td style="text-align: right;"><fmt:formatNumber value="${vo.stocktotalprice }" pattern="#,###" /></td>
										</tr>
										</c:forEach>
									</table>
								</div>
							
				<div class="pagination" id = "pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }
									&searchdate=${param.searchdate}&sectioncode=${param.sectioncode}&itemcode=${param.itemcode}">
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
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }
										&searchdate=${param.searchdate}&sectioncode=${param.sectioncode}&itemcode=${param.itemcode}">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}
										&searchdate=${param.searchdate}&sectioncode=${param.sectioncode}&itemcode=${param.itemcode}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }
									&searchdate=${param.searchdate}&sectioncode=${param.sectioncode}&itemcode=${param.itemcode}"><i
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
						
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
$(function() {
	// 데이트피커 한글설정
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

	// 년월 설정 데이트피커
	$('#datepicker').datepicker({
		maxViewMode: 4,
		minViewMode: 1,
		language: 'ko'
	}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	$(".chosen-select").chosen();
	
	//대분류명을 선택하였을 때 그에 맞는 품목명이 바뀌도록
	$("#gcategory").change(function(){
		$.ajax({
			url: "${pageContext.request.contextPath }/12/56/api?sectioncode="+$(this).val(),
			contentType : "application/json; charset=utf-8",
			type: "get",
			dataType: "json", 
			data: "",
			statusCode: {
			    404: function() {
			      alert("page not found");
			    }
			},
			success: function(response){
				console.log(response);
				$("#subcategory option").remove();
				var list= response.data;
					//선택하지 않았을 때 빈 값이 설정되도록
					$("#subcategory").append("<option value=null placeholder=전체 품목 선택></option>")	
					//대분류에 알맞는 품목리스트를 가져오도록
				for(let i in list){
					$("#subcategory").append("<option value='"+list[i].itemcode+"'>"+list[i].itemname+"</option>");
					$('#subcategory').trigger("chosen:updated");
					
				}
				var subcategory = "${param.subcategory}";
				$("#subcategory").val(subcategory);
			
			},
			error: function(xhr, error){
				console.error("error : " + error);
			}
		});
	});

	$("#btn-reset").click(function(){
		event.preventDefault();
		$("input[id=datepicker]").val("");
		$('#gcategory').val("").trigger('chosen:updated');
		$('#subcategory').val("").trigger('chosen:updated');
	});	
	
	function createoption(list){
		console.log(list);
	}
})

</script>

</html>