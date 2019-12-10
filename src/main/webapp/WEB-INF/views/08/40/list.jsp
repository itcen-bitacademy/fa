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
										<label class="control-label" for="form-field-select-1">대분류코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-section" name="sectionNo">
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.classification}" value="${sectionVo.code }">${sectionVo.code }</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" id="classification" name="sectionName" placeholder="코드를 지정하면 대분류명이 입력됩니다">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="form-field-select-1">거래처코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-customer" name="customerNo">
												<c:forEach items="${customerList }" var="customerVo">
													<option customerName="${customerVo.name}" managerName="${customerVo.managerName }" value="${customerVo.no }">${customerVo.no }</option>
												</c:forEach>
											</select> 
											<input readonly type="text" class="span6" name="customerName" id="customerName" placeholder="코드를 지정하면 거래처명이 입력됩니다">
										</div>
									</div>

									<div class="control-group">
										<div style="float: left;">
											<label class="control-label" for="form-field-1">주소</label>
											<div class="controls">
												<select style="width: 155px;" class="chosen-select"
													id="form-field-select-1" name="sectionNo"
													data-placeholder="광역">
													<c:forEach items="${listMainMenu }" var="sectionVo">
														<option value="${sectionVo.no }">${sectionVo.name }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div style="float: left; margin-left: 10px" class="controls">
											<select style="width: 155px;" class="chosen-select"
												id="form-field-select-1" name="sectionNo"
												data-placeholder="시/군/구">
												<c:forEach items="${listMainMenu }" var="sectionVo">
													<option value="${sectionVo.no }">${sectionVo.name }</option>
												</c:forEach>
											</select>
										</div>
										<div style="float: left; margin-left: 10px" class="controls">
											<input type="text" id="form-field-1" name="detailAddress" style="width: 290px;" placeholder="상세주소를 입력하세요" />
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">취득금액</label>
										<div class="controls">
											<input type="text" id="acqPrice" name="acqPrice"
												placeholder="금액을 입력하세요" /> <input
												style="border-style: none;" type="text" " placeholder="입력된 금액이하로 검색됩니다." />
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
											<input class="span5" type="text" name="payDate" id="id-date-range-picker-1"
											placeholder="날짜 범위를 지정하세요">
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
										<label class="control-label" for="form-field-1">거래처 담당자</label>
										<div class="controls" id="form-input-customer">
											<input readonly type="text" name="managerName" id="managerName" placeholder="담당자" />
										</div>
									</div>
									<span style="line-height:550%"><br></span>
									
									<div class="control-group" style="margin-bottom:0px;">
										<div class="span3" style="float: right;">
												<input name="checkDel" type="checkbox" class="ace">
												<span class="lbl">삭제포함</span>
											<button class="btn btn-info btn-small"
												style="float: right; margin-right: 20px;"
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
										<th>취득세(원)</th>
										<th>세금계산서번호</th>
										<th>합병코드</th>
										<th>구분</th>
										<th>작성자</th>
										<th>작성일</th>
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
										<td><fmt:formatNumber value="${vo.publicValue }" pattern="#,###"></fmt:formatNumber></td>
										<td><fmt:formatNumber value="${vo.acqPrice }" pattern="#,###"></fmt:formatNumber></td>
										<td><fmt:formatNumber value="${vo.etcCost }" pattern="#,###"></fmt:formatNumber></td>
										<td><fmt:formatNumber value="${vo.acqTax }" pattern="#,###"></fmt:formatNumber></td>
										<td>${vo.combineNo }</td>
										<td>${vo.taxbillNo }</td>
										<td>${vo.taxKind }</td>
										<td>${vo.insertUserid }</td>
										<td>${vo.insertDay }</td>
										<td></td>
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
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${dataResult.pagination.startPage - 1 }">
								<i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${pg }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${pg}">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${dataResult.pagination.endPage + 1 }">
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
	<script>
		$(function() {
			$(".chosen-select").chosen();
			$('#id-date-range-picker-1').daterangepicker({
				format : 'YYYY-MM-DD'
			}).prev().on(ace.click_event, function(){
				$(this).next().focus();
			});
		});
	</script>
	<script>
	$(function(){
		$(".chosen-select").chosen(); 
	});
	
	//select box 선택 시 값 등록
	$('#form-field-section').change(function() {
  		var classification = $('#form-field-section option:selected').attr('sectionList'); // ${sectionVo.classification}
 		$('#classification').val(classification); 
	});
	
	$('#form-field-customer').change(function() {
  		var customername = $('#form-field-customer option:selected').attr('customerName'); // ${customerVo.name}
  		$('#customerName').val(customername);
 		var managername = $('#form-field-customer option:selected').attr('managerName'); // ${customerVo.manager_name}
 		$('#managerName').val(managername);
	});
	
	
	$(function() {
		//한행 클릭 >> 건물코드 가져오기
		   $(".table-row").click(function() {
		      var str = ""
		      var tdArr = new Array();   // 배열 선언
		      
		      // 현재 클릭된 Row(<tr>)
		      var tr = $(this);
		      var td = tr.children();
		      
		      $("input[name=id]").val(td.eq(0).text());
		      //sectionNo 에 대한 값(classification)을 select box에 표시
		      $('#form-field-section').val(td.eq(1).text()).trigger('chosen:updated'); 
		      $("input[name=sectionName]").val(td.eq(2).text()); 
		      $("input[name=area]").val(td.eq(3).text());
		      $("input[name=wideAddress]").val(td.eq(6).text());
		      $("input[name=cityAddress]").val(td.eq(7).text());
		      $("input[name=detailAddress]").val(td.eq(8).text());
		      //customerNo 에 대한 값(name)을 select box에 표시
		      $('#form-field-customer').val(td.eq(11).text()).trigger('chosen:updated'); 
		      $("input[name=customerName]").val(td.eq(12).text());
		      $("input[name=managerName]").val(td.eq(13).text());
		      $("input[name=payDate]").val(td.eq(15).text());
		      $("input[name=acqPrice]").val(td.eq(17).text().replace(/,/g, ""));
		      
			});
	});
	</script>
</body>
</html>