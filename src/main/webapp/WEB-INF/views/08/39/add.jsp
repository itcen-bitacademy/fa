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
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">

				<div class="page-header position-relative">
					<h1 class="pull-left">건물관리</h1>
				</div>
				<!-- /.page-header -->
				
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->
							
							<!-- 좌측 -->
							<form class="form-horizontal" method="post"
								action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								<div class="span6">
									<div class="control-group">
										<label class="control-label" for="form-field-1">건물 코드</label>
										<div class="controls">
											<input type="text" id="land_code" name="landCode"
												placeholder="10자로 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">대분류
											코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1"
												name="sectionNo" data-placeholder="전체">
												<c:forEach items="${listMainMenu }" var="sectionVo">
													<option value="${sectionVo.no }">${sectionVo.name }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6"
												id="form-input-readonly" value="코드를 지정하면 대분류명이 등록됩니다">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소(광역)</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1"
												name="wideAddr" data-placeholder="선택">
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소(읍/면/동)</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1"
												name="localAddr" data-placeholder="선택">
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">거래처
											코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-select-1"
												name="customerNo" data-placeholder="선택">
												<c:forEach items="${listMainMenu }" var="customerVo">
													<option value="${customerVo.no }">${customerVo.name }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6"
												id="form-input-readonly" value="코드를 지정하면 거래처명이 등록됩니다">
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">매입일자</label>
											<div class="controls" style="width: 90%">
												<input type="text" id="form-input-readonly" name="payDate"
													placeholder="날짜를 선택하세요" /> <i class="icon-calendar"
													id="calendar"></i>
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">공시지가</label> <input
												type="text" id="form-field-1" name="publicValue"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">등록세</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="regTax"
													placeholder="금액을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">취득세</label> <input
												type="text" id="form-field-1" name="acqTax"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">합병코드</label>
										<div class="controls">
											<input type="text" id="combine_no" name="combineNo"
												placeholder="" />
										</div>
									</div>
								</div>

								<!-- 우측 -->
								<div class="span6">
									<div class="control-group">
										<div class="controls">
											<button class="btn btn-primary btn-small"
												style="float: left; margin-right: 20px;">등록</button>
											<button class="btn btn-warning btn-small"
												style="float: left; margin-right: 20px;">수정</button>
											<button class="btn btn-danger btn-small"
												style="float: left; margin-right: 20px;">삭제</button>
											<button class="btn btn-info btn-small"
												style="float: left; margin-right: 20px;">조회</button>
											<button class="btn btn-default btn-small"
												style="float: left; margin-right: 20px;">초기화</button>
										</div>
									</div>
									<div class="control-group">
										<div style="float: left">
											<label class="control-label" for="form-field-1">평수</label>
											<div class="controls">
												<input style="width: 206px" type="text" id="form-field-1"
													name="acqPrice" placeholder="숫자만 입력하세요" />
											</div>
										</div>
										<div style="float: left">
											<label style="width: 60px; margin-right: 20px;"
												class="control-label" for="form-field-1">층수</label>
											<div style="width: 205px; margin-left: 10px" class="controls">
												<input style="width: 50px" type="text" id="form-field-1"
													name="acqPrice" placeholder="지상" /> <input
													style="width: 50px" type="text" id="form-field-1"
													name="acqPrice" placeholder="지하" />
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">주소(시/군/구)</label>
										<div class="controls">
											<select class="chosen-select" id="cityAddr" name="cityAddr"
												data-placeholder="선택">
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">상세주소</label>
										<div class="controls">
											<input type="text" class="span7" id="detailAddr"
												name="detailAddr" placeholder="내용을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">담당자</label>
											<div class="controls">
												<input readonly type="text" id="form-input-readonly"
													name="customerManager" placeholder="" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">건물소유자</label> <input
												type="text" id="form-field-1" name="owner_name"
												placeholder="내용을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<div style="float: left; width: 50%">
											<label class="control-label" for="form-field-1">취득금액</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="acqPrice"
													placeholder="금액을 입력하세요" />
											</div>
										</div>
										<div style="float: left; width: 50%">
											<label style="width: 70px; margin-right: 10px;"
												class="control-label" for="form-field-1">기타비용</label> <input
												type="text" id="form-field-1" name="etcCost"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">세금계산서번호</label>
										<div class="controls">
											<input type="text" class="span7" id="taxbillNo">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-2">구분</label>
										<div class="controls">
											<input name="form-field-radio" type="radio" class="ace"
												id="tax" name="tax"> <span class="lbl">과세</span> <input
												name="form-field-radio" type="radio" class="ace"
												id="zeroTax" name="zeroTax"> <span class="lbl">영세</span>
										</div>
									</div>
								</div><!-- 우측 -->
							</form>
						</div><!-- 차변 대변 나누기 위한 row-fluid -->
						
						<div>
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace"> <span class="lbl"></span>
										</label></th>
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
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace"> <span class="lbl"></span>
										</label></th>
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
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
</body>
</html>