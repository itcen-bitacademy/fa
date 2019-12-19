<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">

				<div class="page-header position-relative">
					<h1 class="pull-left">토지현황조회</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
								<div class="span6">
									<!-- 차변 -->

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">토지코드</label>
											<div class="controls"> 
												<input type="text" id="id" name="id" placeholder="토지코드를 입력해주세요" />
											</div>
										</div>
										<div style="float: left; width: 50%;">
											<label  style="margin-right: 20px;" class="control-label" for="form-field-1">토지대분류명</label> 
											<select class="chosen-select" id="classification" name="sectionName" data-placeholder="선택">
											<c:forEach items="${sectionList2 }" var="sectionVo">
												<option></option>
												<option value="${sectionVo.classification }">${sectionVo.classification }</option>
											</c:forEach>
											</select>
										</div>
									</div>

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label style="text-align:left;" class="control-label" for="form-field-1">매입거래처명</label>
											<div class="controls">
												<input type="text" id="customerName" name="customerName"
													placeholder="" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">거래처담당자명</label>
											<div class="controls">
												<input type="text" id="customerManager" name="managerName" placeholder="" />
											</div>
										</div>
									</div>
									
									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">조회</label>
											<div class="controls">
												<input class="span2" onclick="execDaumPostcode()" class="btn-primary box" type="button" value="주소 찾기">
												<input class="span4" readonly type="text" id="wideAddr" name="wideAddress" value="" placeholder="주소를 선택하면 입력됩니다.">
												<input style="width:230px"class="span5" readonly type="text" id="cityAddr" name="cityAddress" value=""  placeholder="주소를 선택하면 입력됩니다.">
											</div>
									</div>


									

								</div>
								<!-- 차변 span -->
								<div class="row-fluid">
								<div class="span6">
									<!-- 대변 -->
									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="id-date-range-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
											<input class="span5" type="text" name="payDate" id="payDate">
										</div>
									</div>

									<div class="control-group">
										<label style="text-align:left;" class="control-label">평수</label>
										<div class="controls">
											<input type="text" id="area" name="landArea" placeholder="숫자만 입력해주세요" /> 
												<input readonly style="border-style: none;" type="text" id="area" name="landArea" placeholder="입력된 숫자이하로 검색됩니다." />
										</div>
									</div>
									
									<div class="control-group">
										<label style="text-align:left;" class="control-label">취득금액</label>
										<div class="controls">
											<input type="text" id="acqPrice" name="acqPrice"placeholder="숫자만 입력해주세요" /> 
											<input readonly style="border-style: none;" type="text" placeholder="입력된 금액이하로 검색됩니다." />
										</div>
									</div>
									

								</div>
									<input type="hidden" name="searchGubun" value="조회">
									<div class="control-group">
										<div class="controls">
											<div class="span3" style="float:right;width:120px">
												<button class="btn btn-info btn-small" id="searchBtn" style="float:right;margin-right:20px;">조회</button>
											</div>
											<div class="span2" style="float:right">
												<label style="float:right">
													<input name="flag" type="checkbox" class="ace">
														<span class="lbl"> 삭제포함</span>
												</label>
											</div>
										</div>
									</div>
								
								</div>
								<!-- 대변 span -->
							</form>
						</div>
						<div class="hr hr-18 dotted"></div>
						<!-- 차변 대변 나누기 위한 row-fluid -->
						<br>
						<br>
						<p>총 건수 : ${dataResult.pagination.totalCnt } </p>
						<div class="row-fluid">
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>

										<th>No</th>
										<th>토지코드</th>
										<th>토지대분류코드</th>
										<th>토지분류명</th>
										<th>주소(광역)</th>
										<th>주소(시/군/구)</th>
										<th>주소(상세)</th>
										<th>평수</th>
										<th>토지소유자명</th>
										<th>매입거래처코드</th>
										<th>매입거래처명</th>
										<th>거래처담당자</th>
										<th>매입일자</th>
										<th>공시지가(원)</th>
										<th>취득금액(원)</th>
										<th>기타비용(원)</th>
										<th>취득세(원)</th>
										<th>합병코드</th>
										<th>세금계산서번호</th>
										<th>삭제여부</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items='${dataResult.datas }' var="sl" varStatus="status">
										<tr>
											<td>${(page-1)*11 + status.count}</td>
											<td>${sl.id }</td>
											<td>${sl.sectionNo }</td>
											<td>${sl.sectionName }</td>
											<td>${sl.wideAddress }</td>
											<td>${sl.cityAddress }</td>
											<td>${sl.detailAddress }</td>
											<td>${sl.landArea }</td>
											<td>${sl.ownerName }</td>
											<td>${sl.customerNo }</td>
											<td>${sl.customerName }</td>
											<td>${sl.managerName }</td>
											<td>${sl.payDate }</td>
											<td><fmt:formatNumber value="${sl.publicValue }" pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${sl.acqPrice }" pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${sl.etcCost }" pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${sl.acqTax }" pattern="#,###"></fmt:formatNumber></td>
											<td>${sl.combineNo }</td>
											<td>${sl.taxbillNo }</td>
											<c:choose>
												<c:when test="${sl.flag eq 's'}"><td>작성</td></c:when>
												<c:when test="${sl.flag eq 'o'}"><td>수정됨</td></c:when>
												<c:when test="${sl.flag eq 'd'}"><td>삭제됨</td></c:when>
											</c:choose>
											 <%--
											 <td>${sl.combineNo }</td>
											 <td>${sl.insertUserid }</td>
											<td>${sl.insertDay }</td>
											
											--%>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<!-- PAGE CONTENT ENDS -->
						<div class="row-fluid">
							<div class="pagination">
								<ul>
									<c:choose>
										<c:when test="${dataResult.pagination.prev }">
											<li><a
												href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
													<i class="icon-double-angle-left"></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="#"><i
													class="icon-double-angle-left"></i></a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${dataResult.pagination.startPage }"
										end="${dataResult.pagination.endPage }" var="pg">
										<c:choose>
											<c:when test="${pg eq dataResult.pagination.page }">
												<li class="active"><a
													href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${dataResult.pagination.next }">
											<li><a
												href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }">
													<i class="icon-double-angle-right"></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="#"> <i
													class="icon-double-angle-right"></i></a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<!-- 페이징 -->
						</div>
					</div>
					<!-- /.span -->
				</div>
				<!-- /.row-fluid -->



			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<input type="hidden" value="" name="" id="startDate">
	<input type="hidden" value="" name="" id="endDate">
	<!-- /.main-container -->
	<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
});

$(function() {
	$("#payDate").daterangepicker({
		format : 'YYYY-MM-DD'

		
	}).prev().on(ace.click_event, function() {
		$(this).next().focus();
	});
	
});

function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//금액에 3자리마다 , 넣기
$(function() {
	$("#acqPrice").on('keyup', function(event){
		 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});
});



//주소
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullRoadAddr = data.roadAddress;
			console.log(data)
			$("#wideAddr").val(data.sido);
			$("#cityAddr").val(data.sigungu); 
			$("#detailAddr").val(data.roadname + " ");
			$("#detailAddr").focus();
		}
	}).open();
};

//조회버튼  EV
/* $(function() {
	var theDiv = $("#searchLandList");
	
	$("#searchBtn").click(function() {
		var id = $("#id").val();  // 토지코드
		var landKind = $("#classification").val();          //토지분류
		var payDate = $("#payDate").val();   				// 매일일자
		var customerName = $("#customerName").val();        //거래처명
		var customerManager = $("#customerManager").val();  // 거래처매니저명
		var area = parseInt($("#area").val());        				//평수
		var wideAddr = $("#wideAddr").val();				//광역시
		var cityAddr = $("#cityAddr").val();				//시군구
		var acqPrice = parseFloat($("#acqPrice").val());				//취득금액
		console.log(typeof(area) + " " + typeof(acqPrice));
		alert("asdfasd");
//조회 테이블 Ajax
			$.ajax({
				      url : "fa/08/10/search",
				      type : "post",
				      dataType : "json",
				      data : {"id":id, "sectionName":landKind, "payDate":payDate, "customerName":customerName, "managerName":customerManager, "landArea":area, "wideAddress":wideAddr, "cityAddress":cityAddr, "acqPrice":acqPrice},
				      success: function(response){
				    	  
				    	  
				         if(response.result == "fail"){
				            console.error(response.message);
				            return;
				         }
				         
				      }
			});
	});
}); */

</script>
</body>
</html>