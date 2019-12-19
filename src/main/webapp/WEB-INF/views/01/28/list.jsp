<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<style>
.chosen-search {
	display: none;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>
<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".chosen-select").chosen();
	})
</script>

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
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
		})
	</script>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">거래처 현황조회 [28]</h1>
				
			</div><!-- /.page-header -->
			<div class="row-fluid"> <!-- 검색조건 start -->
					<form class="form-horizontal; center" name="searchOption" ><!--  -->
					거래처 구분 : &nbsp;
						<select class="chosen-select"
							id="customerDiv" name="customerDiv" 
							data-placeholder="선택" style="width:100px;">
							 <option value="All">전체</option>
							 <option value="Purchase">매입 거래처</option>
							 <option value="Sales">매출 거래처</option>
							 <option value="Assets">자산 거래처</option>
							 <option value="Bank">은행</option>
						</select>
						<script type="text/javascript">
						var customerDiv = "${param.customerDiv}";
						$("#customerDiv").val(customerDiv);
						</script>
						
						
						&nbsp; &nbsp;&nbsp;&nbsp;조회 기간 :&nbsp;
						<div class="input-append">
							<input type="text" id="datepicker1" name="datepicker1" class="cl-date-picker"  style="width:100px"/>
							
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
						<script type="text/javascript">
						var datepicker1 = "${param.datepicker1}";
						$("#datepicker1").val(datepicker1);
						</script>
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" name="datepicker2" class="cl-date-picker" style="width:100px"/>
								<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
						<script type="text/javascript">
						var datepicker2 = "${param.datepicker2}";
						$("#datepicker2").val(datepicker2);
						</script>
						
						
						&nbsp; &nbsp;&nbsp; &nbsp;사업자등록번호 :&nbsp; 
						<input type="text" id="no" name="no" placeholder="ex)000-00-00000" size=4 style="width:150px" style="width:100px;"/>
						<script type="text/javascript">
						var no = "${param.no}";
						$("#no").val(no);
						</script>
						
						&nbsp; &nbsp;&nbsp; &nbsp;삭제여부 : &nbsp;
						
						<select class="chosen-select"
							id="deleteFlag" name="deleteFlag" 
							data-placeholder="선택" style="width:70px;">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
						<script type="text/javascript">
						var deleteFlag = "${param.deleteFlag}";
						$("#deleteFlag").val(deleteFlag);
						</script>
						
						&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-small btn-info" type="submit" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
					</form>
					
					<div class="hr hr-18 dotted"></div>
				
				<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 거래처 ${dataResult.pagination.totalCnt } 건</p>
				
					</div>
				<div class="row-fluid">
						<div class="span12">

							<table id="customer" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">거래처 구분</th>
										<th class="center">사업자등록번호</th>
										<th class="center">상호</th>
										<th class="center">대표자</th>
										<th class="center">주소</th>
										<th class="center">업태/종목</th>
										<th class="center">관할영업소</th>
										<th class="center">거래처 전화번호</th>
										<th class="center">거래처 담당자 성명</th>
										<th class="center">e-mail</th>
										<th class="center">계좌번호</th>
										<th class="center">예금주</th>
										<th class="center">입력일자</th>
										<th class="center">입력담당자</th>
										<th class="center">수정일자</th>
										<th class="center">수정담당자</th>
									</tr>
								</thead>
								
								<tbody>
								
										<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
											<tr>
												<td>${vo.customerDiv }</td>
												<td>${vo.no }</td>
												<td>${vo.name }</td>
												<td>${vo.ceo }</td>
												<td>${vo.address } ${vo.detailAddress }</td>
												<td>${vo.conditions }/${vo.item }</td>
												<td>${vo.jurisdictionOffice }</td>
												<td>${vo.phone }</td>
												<td>${vo.managerName }</td>
												<td>${vo.managerEmail }</td>
												<td>${vo.depositNo }</td>
												<td>${vo.depositHost }</td>
												<td>${vo.insertDay }</td>
												<td>${vo.insertUserid }</td>
												<td>${vo.updateDay }</td>
												<td>${vo.updateUserid }</td>
											</tr>
									</c:forEach>
								 		
									</tbody>
							</table>
						</div>
					</div>
	<div class="pagination">
		<ul>
			<c:choose>
			<c:when test="${dataResult.pagination.prev }">
				<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?customerDiv=${param.customerDiv }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }&no=${param.no }&daleteFlag=${param.deleteFlag }&page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
			</c:otherwise>
			</c:choose>
			<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
			<c:choose>
			<c:when test="${pg eq dataResult.pagination.page }">

				<li class="active"><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?customerDiv=${param.customerDiv }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }&no=${param.no }&daleteFlag=${param.deleteFlag }&page=${pg }">${pg }</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?customerDiv=${param.customerDiv }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }&no=${param.no }&daleteFlag=${param.deleteFlag }&page=${pg }">${pg }</a></li>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${dataResult.pagination.next }">
				<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?customerDiv=${param.customerDiv }&datepicker1=${param.datepicker1 }&datepicker2=${param.datepicker2 }&no=${param.no }&daleteFlag=${param.deleteFlag }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
			</c:otherwise>
			</c:choose>
				</ul>
			</div>
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>