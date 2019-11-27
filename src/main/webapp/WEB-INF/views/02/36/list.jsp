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
						<form class="form-horizontal">
							<div class="span12">
								<div class="control-group">
									<label class="control-label" for="customer">거래처</label>
									<div class="controls">
										<input type="text" id="no1" style="width: 150px;">
										<input type="text" id="name1" readonly style="width: 200px;">
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span> ~ 
										<input type="text" id="no2" style="width: 150px;">
										<input type="text" id="name2" readonly style="width: 200px;">
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
									</div>
								</div>
							</div>
						</form>
						
						<form class="form-horizontal">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="item">종목</label>
									<div class="controls">
										<input type="text" id="item" style="width: 150px;">
									</div>
								</div>
							
								<div class="control-group">
									<label class="control-label" for="delete_flag">삭제포함여부</label>

									<div class="controls">
										<input name="delete_flag" type="radio" class="ace" value="N" checked="checked">
										<span class="lbl">미포함</span>
										<input name="delete_flag" type="radio" class="ace" value="Y">
										<span class="lbl">포함</span>
									</div>
								</div>
							</div>
						
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="insert_date">입력일자</label>
										<div class="controls">
											<div class="row-fluid input-append">
											<input class="span9 date-picker" id="id-date-picker-1" type="text" style="width: 135px;" data-date-format="yyyy-mm-dd" />
												<span class="add-on">
												<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="manager_name">거래처 담당자</label>
									<div class="controls">
										<input type="text" id="manager_name" style="width: 150px;">
									</div>
								</div>
							</div>
							
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<button class="btn btn-default">조회</button>
									</div>
								</div>
							</div>
							
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<button class="btn btn-default">입력</button>
										<button class="btn btn-default">수정</button>
										<button class="btn btn-default">삭제</button>
										<button class="btn btn-default">조회</button>
										<button class="btn btn-default">초기화</button>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span12">
									<table id="sample-table-1" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
				                                    <label>
				                                       <input type="checkbox" class="ace">
				                                       <span class="lbl"></span>
				                                    </label>
				                                 </th>
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
											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace">
														<span class="lbl"></span>
													</label>
												</td>

												<td>
													<a href="#">ace.com</a>
												</td>
												<td>$45</td>
												<td class="hidden-480">3,330</td>
												<td class="hidden-phone">Feb 12</td>

												<td class="hidden-480">
													<span class="label label-warning">Expiring</span>
												</td>

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
															<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
																<i class="icon-cog icon-only bigger-110"></i>
															</button>

															<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																<li>
																	<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
																		<span class="red">
																			<i class="icon-trash bigger-120"></i>
																		</span>
																	</a>
																</li>
															</ul>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</form>
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
	<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
	<script>
	$(function(){
		$(".chosen-select").chosen(); 
		$('.date-picker').datepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
	</script>
</body>
</html>