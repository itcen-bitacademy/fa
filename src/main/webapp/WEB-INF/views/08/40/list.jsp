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
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">건물코드</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="id"
													placeholder="10자로 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%;">
											<label style="margin-right: 20px" class="control-label"
												for="form-field-1">건물대분류명</label> <select
												class="chosen-select" id="form-field-select-1"
												name="sectionNo" data-placeholder="전체">
												<c:forEach items="${listMainMenu }" var="sectionVo">
													<option value="${sectionVo.no }">${sectionVo.name }</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">매입거래처명</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="customer_name"
													placeholder="내용을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">거래처담당자명</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="manager_name"
													placeholder="내용을 입력하세요" />
											</div>
										</div>
									</div>

									<div class="control-group">
										<div style="float: left;">
											<label class="control-label" for="form-field-1">주소</label>
											<div class="controls">
												<select style="width: 205px;" class="chosen-select"
													id="form-field-select-1" name="sectionNo"
													data-placeholder="광역">
													<c:forEach items="${listMainMenu }" var="sectionVo">
														<option value="${sectionVo.no }">${sectionVo.name }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div style="float: left; margin-left: 10px" class="controls">
											<select style="width: 205px;" class="chosen-select"
												id="form-field-select-1" name="sectionNo"
												data-placeholder="시/군/구">
												<c:forEach items="${listMainMenu }" var="sectionVo">
													<option value="${sectionVo.no }">${sectionVo.name }</option>
												</c:forEach>
											</select>
										</div>
										<div style="float: left; margin-left: 10px" class="controls">
											<select style="width: 205px;" class="chosen-select"
												id="form-field-select-1" name="sectionNo"
												data-placeholder="읍/면/동">
												<c:forEach items="${listMainMenu }" var="sectionVo">
													<option value="${sectionVo.no }">${sectionVo.name }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">취득금액</label>
										<div class="controls">
											<input type="text" id="area" name="area"
												placeholder="금액을 입력하세요" /> <input
												style="border-style: none;" type="text" id="area"
												name="area" placeholder="입력된 금액이하로 검색됩니다." />
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
											<input class="span5" type="text" name="date-range-picker" id="id-date-range-picker-1">
										</div>
									</div>		
									<div class="control-group">
										<label class="control-label">평수</label>
										<div class="controls">
											<input type="text" id="area" name="area"
												placeholder="숫자만 입력하세요" /> <input
												style="border-style: none;" type="text" id="area"
												name="area" placeholder="입력된 숫자이하로 검색됩니다." />
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<input name="checkDel" type="checkbox" class="ace"> <span
												class="lbl"> 삭제여부</span>
										</div>
									</div>
									<div class="control-group" style="margin-bottom:0px;">
										<div class="span3" style="float: right;">
											<button class="btn btn-info btn-small"
												style="float: right; margin-right: 20px;">상세조회</button>
										</div>
									</div>
								</div>
								<!-- 우측 span -->
							</form>
							
						<!-- 구분선 -->
						<div class="span12" style="margin-left:0px;">
							<div class="hr hr-18 dotted"></div>
						</div>
						
						</div>
						<!-- 나누기 위한 row-fluid -->
						
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
							<div class="control-group">
								<div class="controls">
									<div class="span1" style="float: right">
										<button class="btn btn-info btn-small"
											style="float: right; margin-right: 20px;">조회</button>
									</div>
									<div class="span2" style="float: right">
										<input type="text" class="span12" id="form-field-1"
											name="search" placeholder="검색어를 입력하세요" />
									</div>
								</div>
							</div>
						</form>
						
						<div>
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>건물코드</th>
										<th>건물대분류코드</th>
										<th>건물분류명</th>
										<th>평수</th>
										<th>층수(지상)</th>
										<th>층수(지하)</th>
										<th>주소(광역)</th>
										<th>주소(시/군/구)</th>
										<th>주소(읍/면/동)</th>
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
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<div class="hidden-phone visible-desktop btn-group">
												<button class="btn btn-mini btn-success">
													<i class="icon-ok bigger-120"></i>
												</button>

												<button class="btn btn-mini btn-info">
													<i class="icon-edit bigger-120"></i>
												</button>

												<button class="btn btn-mini btn-danger">
													<i class="icon-trash bigger-120"></i>
												</button>
												<button class="btn btn-mini btn-warning">
													<i class="icon-flag bigger-120"></i>
												</button>
											</div>
											<div class="hidden-desktop visible-phone">
												<div class="inline position-relative">
													<button class="btn btn-minier btn-primary dropdown-toggle"
														data-toggle="dropdown">
														<i class="icon-cog icon-only bigger-110"></i>
													</button>
													<ul
														class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
														<li><a href="#" class="tooltip-info"
															data-rel="tooltip" title="" data-original-title="View">
																<span class="blue"> <i
																	class="icon-zoom-in bigger-120"></i>
															</span>
														</a></li>
														<li><a href="#" class="tooltip-success"
															data-rel="tooltip" title="" data-original-title="Edit">
																<span class="green"> <i
																	class="icon-edit bigger-120"></i>
															</span>
														</a></li>

														<li><a href="#" class="tooltip-error"
															data-rel="tooltip" title="" data-original-title="Delete">
																<span class="red"> <i
																	class="icon-trash bigger-120"></i>
															</span>
														</a></li>
													</ul>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="pagination">
								<ul>
									<li class="disabled"><a href="#"><i
											class="icon-double-angle-left"></i></a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</ul>
							</div>
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
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();
			$('#id-date-range-picker-1').daterangepicker().prev().on(ace.click_event, function(){
				$(this).next().focus();
			});
		});
	</script>
</body>
</html>