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
					<h1 class="pull-left">매입거래처관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">

						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="no">사업자번호</label>
									<div class="controls">
										<input type="text" id="no" style="width: 200px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="ceo">대표자</label>
									<div class="controls">
										<input type="text" id="ceo" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="address">주소</label>
									<div class="controls">
										<input type="text" id="postcode" readonly style="width: 60px;"> 
										<input type="text" id="roadAddress" readonly style="width: 200px;"> 
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon" onclick="execDaumPostcode()"></i></span>
										<br>
										<br> 
										<input type="text" id="detailAddress" style="width: 330px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="condition">업태</label>
									<div class="controls">
										<input type="text" id="condition" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="open_date">개설일자</label>
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
									<label class="control-label" for="manager_name">담당자명</label>
									<div class="controls">
										<input type="text" id="manager_name" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="deposit_no">입금계좌번호</label>
									<div class="controls">
										<input type="text" id="deposit_no" style="width: 200px;"> 
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
									</div>
								</div>
							</div>

							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="name">상호</label>
									<div class="controls">
										<input type="text" id="name" style="width: 250px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="corporation_no">법인번호</label>
									<div class="controls">
										<input type="text" id="corporation_no" style="width: 200px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="phone">전화번호</label>
									<div class="controls">
										<input type="text" id="phone" style="width: 200px;">
										<br>
										<br> 
										<input type="text" id="" style="visibility: hidden;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="item">종목</label>
									<div class="controls">
										<input type="text" id="item" style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="jurisdiction_office">관할사무소</label>
									<div class="controls">
										<input type="text" id="jurisdiction_office" style="width: 200px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="manager_email">메일</label>
									<div class="controls">
										<input type="text" id="manager_email" style="width: 250px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="deposit_host">예금주</label>
									<div class="controls">
										<input type="text" id="deposit_host" readonly style="width: 150px;">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="bank">은행</label>
									<div class="controls">
										<input type="text" id="bank_code" readonly style="width: 80px;"> 
										<input type="text" id="bank_name" readonly style="width: 150px;">
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<button class="btn btn-info btn-small" style="float:left;margin-left:20px;">조회</button>
										<button class="btn btn-danger btn-small" style="float:left;margin-left:20px;">삭제</button>
										<button class="btn btn-warning btn-small" style="float:left;margin-left:20px;">수정</button>
										<button class="btn btn-primary btn-small" style="float:left;margin-left:20px;">입력</button>
										<button class="btn btn-default btn-small" style="float:left;margin-left:20px;">취소</button>
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
	
	
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function execDaumPostcode() {
            new daum.Postcode(
                    {
                        oncomplete : function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                            alert(fullRoadAddr);
                            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                    && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                    && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                            if (fullRoadAddr !== '') {
                                fullRoadAddr += extraRoadAddr;
                            }
 
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('roadAddress').value = fullRoadAddr;
                            document.getElementById('jibunAddress').value = data.jibunAddress;
 
                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                            if (data.autoRoadAddress) {
                                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                                var expRoadAddr = data.autoRoadAddress
                                        + extraRoadAddr;
                                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                        + expRoadAddr + ')';
 
                            } else if (data.autoJibunAddress) {
                                var expJibunAddr = data.autoJibunAddress;
                                document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                        + expJibunAddr + ')';
 
                            } else {
                                document.getElementById('guide').innerHTML = '';
                            }
                        }
                    }).open();
   		     }
	</script>
</body>
</html>