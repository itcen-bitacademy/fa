<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">토지관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->

						<div class="span6"><!-- 차변 -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">토지 코드</label>
									<div class="controls">
										<input type="text" id="land_code" name="landCode" placeholder="10자로 입력하세요"/>
									</div>
								</div>
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">대분류 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="sectionNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="form-input-readonly" value="코드를 지정하면 대분류명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">주소(광역)</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="wideAddr" data-placeholder="선택">
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">주소(읍/면/동)</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="localAddr" data-placeholder="선택">
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">거래처 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="customerNo" data-placeholder="선택">
											<c:forEach items="${listMainMenu }" var="customerVo">
												<option value="${customerVo.no }">${customerVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="form-input-readonly" value="코드를 지정하면 거래처명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label class="control-label" for="form-field-1">매입일자</label>
											<div class="controls" style="width:90%">
												<input type="text" id="form-field-1" name="payDate" placeholder="달력을 클릭해주세요"/> <i class="icon-calendar" id="calendar"></i>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">공시지가</label>
											<input type="text" id="form-field-1" name="publicValue" placeholder="금액을 입력하세요"/>
										</div>	
								</div>
								
								
								<div class="control-group">
										<div style="float:left;width:50%">
											<label class="control-label" for="form-field-1">등록세</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="regTax" placeholder="금액을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">취득세</label>
											<input type="text" id="form-field-1" name="acqPrice" placeholder="금액을 입력하세요"/>
										</div>	
								</div>
								
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label class="control-label" for="form-field-1">토지소유자</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="ownerName" placeholder="이름을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">합병코드</label>
											<input type="text" id="form-field-1" name="combineNo" placeholder="합병코드번호를 입력하세요"/>
										</div>	
								</div>
								
								
								
								
							</form>
						</div><!-- 차변 span -->
							
						<div class="span6"><!-- 대변 -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								<div class="control-group">
									<div class="controls">
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>등록</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>수정</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>삭제</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>조회</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset"><i class="icon-undo bigger-110"></i>Reset</button>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" >평수</label>
									<div class="controls">
										<input type="text" id="area" name="area" placeholder="숫자만 입력해주세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">주소(시/군/구)</label>
									<div class="controls">
										<select class="chosen-select" id="cityAddr" name="cityAddr" data-placeholder="시/군/구">
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">상세주소</label>
									<div class="controls">
										<input type="text" class="span7" id="detailAddr" name="detailAddr" placeholder="상세주소를 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">담당자</label>
									<div class="controls">
										<input readonly type="text" id="form-input-readonly" id="customerManager" name="customerManager" value="담당자자동입력"/>
									</div>
								</div>
								<div class="control-group">
										<div style="float:left;width:50%">											
											<label class="control-label" for="form-field-1">취득금액</label>
											<div class="controls">
												<input type="text" id="form-field-1" name="acqPrice" placeholder="금액을 입력하세요"/>
											</div>
										</div>	
										<div style="float:left;width:50%">											
											<label style="width:70px; margin-right:10px;" class="control-label" for="form-field-1">기타비용</label>
											<input type="text" id="form-field-1" name="etcCost" placeholder="금액을 입력하세요"/>
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
										
											<input name="form-field-radio" type="radio" class="ace" id="tax" name="tax">
											<span class="lbl">과세</span>
										
										
											<input name="form-field-radio" type="radio" class="ace" id="zeroTax" name="zeroTax">
											<span class="lbl">영세</span>
										
									</div>
								</div>
							</form>
						</div><!-- 대변 span -->
					</div><!-- 차변 대변 나누기 위한 row-fluid -->
					<div>
										<table id="sample-table-1" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label>
															<input type="checkbox" class="ace">
															<span class="lbl"></span>
														</label>
													</th>
													<th>No</th>
													<th>토지코드</th>
													<th>토지대분류코드</th>
													<th>토지분류명</th>
													<th>주소(광역)</th>
													<th>주소(시/군/구)</th>
													<th>주소(읍/면/동)</th>
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
													<th>등록세(원)</th>
													<th>취득세(원)</th>
													<th>합병코드</th>
													<th>세금계산서번호</th>
													<th>구분</th>
													<th>작성자</th>
													<th>작성일</th>
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
	
													<td>1</td>
													<td>토지코드</td>
													<td>토지대분류코드</td>
													<td>토지분류명</td>
													<td>주소(광역)</td>
													<td>주소(시/군/구)</td>
													<td>주소(읍/면/동)</td>
													<td>주소(상세)</td>
													<td>평수</td>
													<td>토지소유자명</td>
													<td>매입거래처코드</td>
													<td>매입거래처명</td>
													<td>거래처담당자</td>
													<td>매입일자</td>
													<td>공시지가(원)</td>
													<td>취득금액(원)</td>
													<td>기타비용(원)</td>
													<td>등록세(원)</td>
													<td>취득세(원)</td>
													<td>합병코드</td>
													<td>세금계산서번호</td>
													<td>구분</td>
													<td>작성자</td>
													<td>작성일</td>
												</tr>
	
												
											</tbody>
										</table>
									</div>		
					<!-- PAGE CONTENT ENDS -->
					
				
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
</body>
</html>