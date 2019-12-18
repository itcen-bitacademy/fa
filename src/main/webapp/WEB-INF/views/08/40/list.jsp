<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<style>
 .form-horizontal .control-label {
    text-align: left
 }
 
 .acqPrice {
    text-align: right
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
					<h1 class="pull-left">토지현황조회</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->

							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">

								<!-- 차변 -->
								<div class="span6">
								
									<div class="control-group">
										<label class="control-label" for="form-field-1">건물코드</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="id"
													placeholder="10자로 입력하세요" />
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">대분류</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-section" name="sectionName" data-placeholder="대분류">
											<option value=""></option>
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.code }" value="${sectionVo.classification}">${sectionVo.classification}</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" id="code" name="sectionNo" placeholder="대분류명을 지정하면 코드가 입력됩니다">
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소</label>
										<div class="controls">
											<input class="span2" onclick="execDaumPostcode()" 
												class="btn-primary box" type="button" value="주소 찾기">
											<input class="span4" readonly type="text" id="wideAddress"
												name="wideAddress" placeholder="주소를 선택하면 입력됩니다."> 
											<input style="width: 230px" class="span5" readonly type="text"
												id="cityAddress" name="cityAddress"
												placeholder="주소를 선택하면 입력됩니다.">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="form-field-select-1">거래처</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-customer" data-placeholder="거래처" name="customerName">
												<option value=""></option>
												<c:forEach items="${customerList }" var="customerVo">
													<option customerNo="${customerVo.no}" managerName="${customerVo.managerName }" value="${customerVo.name }">${customerVo.name }</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" name="customerNo" id="customerNo" placeholder="거래처명을 지정하면 코드가 입력됩니다">
										</div>
									</div>

									
									
									<div class="control-group">
										<label class="control-label">취득금액</label>
										<div class="controls">
											<input type="text" class="acqPrice" name="acqPrice" placeholder="금액을 입력하세요" /> 
												<input style="border-style: none;" type="text" " placeholder="입력된 금액이하로 검색됩니다." />
										</div>
									</div>
								</div>
								<!-- 좌측 -->

								<!-- 우측 -->
								<div class="span6">
								
									<div class="control-group">
										<label class="control-label" for="id-date-range-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											<input class="span5" type="text" name="payDate" id="id-date-range-picker-1" placeholder="날짜 범위를 지정하세요">
										</div>
									</div>		
									<div class="control-group">
										<label class="control-label">평수</label>
										<div class="controls">
											<input type="text" id="area" name="area"
												placeholder="숫자만 입력하세요" /> <input
												style="border-style: none;" type="text" placeholder="입력된 숫자이하로 검색됩니다." />
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-1">상세주소</label>
										<div class="controls">
											<input type="text" id="detailAddress" name="detailAddress" class="span8"
												placeholder="상세주소를 입력하세요" />
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-1">거래처 담당자</label>
										<div class="controls" id="form-input-customer">
											<input readonly type="text" name="managerName" id="managerName" placeholder="담당자" />
										</div>
									</div>
									
									<span style="line-height:550%"><br></span>
									
									<div class="control-group" style="margin-bottom:0px;">
										<div class="span3" style="float: right;">
											<c:choose>
												<c:when test='${vo.flag eq ""}'>
													<input type="checkbox" name="flag" id="flag" class="ace" value="" checked="checked">
												</c:when>
												<c:otherwise>
													<input type="checkbox" name="flag" id="flag" class="ace" value="" >
												</c:otherwise>
											</c:choose>
											<span class="lbl">삭제포함</span>
											<button class="btn btn-info btn-small"
												style="float: right; margin-right: 20px;" type="submit" name="search"
												formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
										</div>
									</div>
								</div>
								<!-- 우측 span -->
							</form>
							<!-- 구분선 -->
						</div><!-- 나누기 위한 row-fluid -->
						<div class="hr hr-18 dotted"></div>
						<div>
							<p>총 ${dataResult.pagination.totalCnt }건</p>
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>건물코드</th>
										<th>건물대분류코드</th>
										<th>건물분류명</th>
										<th>평수</th>
										<th>층수(지상)</th>
										<th>층수(지하)</th>
										<th>주소(광역)</th>
										<th>주소(시/군/구)</th>
										<th>주소(상세)</th>
										<th>용도</th>
										<th>주 구조</th>
										<th>매입거래처코드</th>
										<th>매입거래처명</th>
										<th>세금계산서번호</th>
										<th>건물소유자</th>
										<th>매입일자</th>
										<th>공시지가(원)</th>
										<th>취득금액(원)</th>
										<th>기타비용(원)</th>
										<th>등록세(원)</th>
										<th>세금계산서번호</th>
										<th>합병코드</th>
										<th>구분</th>
										<th>삭제여부</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
									<tr class="table-row">
										<td>${vo.id }</td>
										<td>${vo.sectionNo }</td>
										<td>${vo.sectionName }</td>
										<td>${vo.area }</td>
										<td>${vo.floor }</td>
										<td>${vo.basement }</td>
										<td>${vo.wideAddress }</td>
										<td>${vo.cityAddress }</td>
										<td>${vo.detailAddress }</td>
										<td>${vo.purpose }</td>
										<td>${vo.material }</td>
										<td>${vo.customerNo }</td>
										<td>${vo.customerName }</td>
										<td>${vo.managerName }</td>
										<td>${vo.ownerName }</td>
										<td>${vo.payDate }</td>
										<td style="text-align : right"><fmt:formatNumber value="${vo.publicValue }" pattern="#,###"></fmt:formatNumber></td>
										<td style="text-align : right"><fmt:formatNumber value="${vo.acqPrice }" pattern="#,###"></fmt:formatNumber></td>
										<td style="text-align : right"><fmt:formatNumber value="${vo.etcCost }" pattern="#,###"></fmt:formatNumber></td>
										<td style="text-align : right"><fmt:formatNumber value="${vo.acqTax }" pattern="#,###"></fmt:formatNumber></td>
										<td>${vo.combineNo }</td>
										<td>${vo.taxbillNo }</td>
										<td>${vo.taxKind }</td>
										<td>${vo.flag }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>							
						</div>
						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.span -->
				</div>
				<!-- /.row-fluid -->
			</div>
			<!-- /.page-content -->
			
			<!-- 페이징 row-fluid -->
			<div class="row-fluid">
			<!-- 페이징 -->
			<div class="pagination">
				<ul>
					<c:choose>
						<c:when test="${dataResult.pagination.prev }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode } ${uri }&page=${dataResult.pagination.startPage - 1 }">
								<i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${pg }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${pg}">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${dataResult.pagination.endPage + 1 }">
							<i class="icon-double-angle-right"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#">
							<i class="icon-double-angle-right"></i></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div><!-- 페이징 -->
			</div><!-- 페이징 row-fluid -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();
			$('#id-date-range-picker-1').daterangepicker({
				format: 'YYYY-MM-DD',
				separator: '~'
			}).prev().on(ace.click_event, function(){
				$(this).next().focus();
			});
		});
		
		//date range picker
		
	</script>
	
	<script>
	//주소
	function execDaumPostcode() {
        new daum.Postcode({
           oncomplete : function(data) {
              var fullRoadAddr = data.roadAddress;
              console.log(data)
              $("#wideAddress").val(data.sido);
              $("#cityAddress").val(data.sigungu); 
              $("#detailAddress").val(data.roadname + " ");
              $("#detailAddress").focus();
           }
        }).open();
     }
	
	</script>
	
	<script>
	
	//select box 선택 시 값 등록
	
	//대분류
	$('#form-field-section').change(function() {
  		var code = $('#form-field-section option:selected').attr('sectionList'); // ${sectionVo.code}
 		$('#code').val(code); 
	});
	
	//거래처-담당자
	$('#form-field-customer').change(function() {
  		var customerno = $('#form-field-customer option:selected').attr('customerNo'); // ${customerVo.no}
  		$('#customerNo').val(customerno);
  		var managername = $('#form-field-customer option:selected').attr('managerName'); // ${customerVo.manager_name}
 		$('#managerName').val(managername);
	});
	
	
	</script>
</body>
</html>