<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='/fa/ace/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="/fa/ace/assets/js/bootstrap.min.js"></script>

<link href="/fa/ace/assets/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="/fa/ace/assets/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />

<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="/fa/ace/assets/js/jquery.ui.touch-punch.min.js"></script>

<script src="/fa/ace/assets/js/ace-elements.min.js"></script>
<script src="/fa/ace/assets/js/ace.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
			jQuery(function($) {
			
				$( "#datepicker" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
				});
				
				$( "#datepicker2" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
				});
			
			
				//override dialog's title function to allow for HTML titles
				$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
					_title: function(title) {
						var $title = this.options.title || '&nbsp;'
						if( ("title_html" in this.options) && this.options.title_html == true )
							title.html($title);
						else title.text($title);
					}
				}));
			
				//Menu
				$( "#menu" ).menu();
			
				//jquery accordion
				$( "#accordion" ).accordion({
					collapsible: true ,
					heightStyle: "content",
					animate: 250,
					header: ".accordion-header"
				}).sortable({
					axis: "y",
					handle: ".accordion-header",
					stop: function( event, ui ) {
						// IE doesn't register the blur when sorting
						// so trigger focusout handlers to remove .ui-state-focus
						ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
					}
				});
				
			});
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
					<h1 class="pull-left">계좌 관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->

				<!-- PAGE CONTENT BEGINS -->
				<!-- PAGE CONTENT BEGINS -->

				<div class="row-fluid">
					<div class="span6">
						<div class="tabbable">						
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="계좌 번호" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">예 금 주</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="예금주 (이름)" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">개설 일자</label>

									<div class="controls">
										<div class="input-append">
											<input type="text" id="datepicker" class="input-small" /> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
										
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">만기 일자</label>
									<div class="controls">
										<div class="input-append">
											<input type="text" id="datepicker2" class="input-small" /> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								

								<div class="control-group">
									<label class="control-label" for="form-field-1">예금 한도</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="예금한도(만원)" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">이 율 </label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="이율(%)" />
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /span -->

					<!-- 4조에서 데이터 가져오는 부분 -->
					<div class="span6">
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행 코드 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">개설 지점 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행담당자 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행전화번호 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
						</form>
					</div>
					<!-- /.span -->
				</div>
				<!-- /row -->
			</div>
			<!-- /.row-fluid -->


			<!-- buttons -->
			<div class="span12">
			<div class="form-actions">
				<button class="btn btn-info" type="button">
					<i class="icon-ok bigger-110"></i> 입 력
				</button>
				&nbsp; &nbsp; &nbsp;
				<button class="btn" type="reset">
					<i class="icon-undo bigger-110"></i> 조 회
				</button>
				&nbsp; &nbsp; &nbsp;
				<button class="btn" type="reset">
					<i class="icon-undo bigger-110"></i> 수 정
				</button>
				&nbsp; &nbsp; &nbsp;
				<button class="btn" type="reset">
					<i class="icon-undo bigger-110"></i> 삭 제
				</button>
			</div>
			<div class="hr"></div>
			</div>
			


			<!-- Tables -->
			
			<div class="span12">
									<table id="sample-table-1" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</th>
												<th>Domain</th>
												<th>Price</th>
												<th class="hidden-480">Clicks</th>

												<th class="hidden-phone">
													<i class="icon-time bigger-110 hidden-phone"></i>
													Update
												</th>
												<th class="hidden-480">Status</th>

												<th></th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" />
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
																	<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
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

											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>

												<td>
													<a href="#">base.com</a>
												</td>
												<td>$35</td>
												<td class="hidden-480">2,595</td>
												<td class="hidden-phone">Feb 18</td>

												<td class="hidden-480">
													<span class="label label-success">Registered</span>
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
																	<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
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

											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>

												<td>
													<a href="#">max.com</a>
												</td>
												<td>$60</td>
												<td class="hidden-480">4,400</td>
												<td class="hidden-phone">Mar 11</td>

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
																	<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
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

											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>

												<td>
													<a href="#">best.com</a>
												</td>
												<td>$75</td>
												<td class="hidden-480">6,500</td>
												<td class="hidden-phone">Apr 03</td>

												<td class="hidden-480">
													<span class="label label-inverse arrowed-in">Flagged</span>
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
																	<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
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

											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>

												<td>
													<a href="#">pro.com</a>
												</td>
												<td>$55</td>
												<td class="hidden-480">4,250</td>
												<td class="hidden-phone">Jan 21</td>

												<td class="hidden-480">
													<span class="label label-success">Registered</span>
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
																	<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
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
								</div><!-- /span -->
							</div><!-- /row -->


		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->




	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>