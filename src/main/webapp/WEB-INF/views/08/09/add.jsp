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
				<h1 class="pull-left">팀추가</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							  <div class="row-fluid">
								<div class="span12">
									<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
									<div style="float:right">
										<button id="" name="">입력</button>
										<button id="" name="">수정</button>
										<button id="" name="">삭제</button>
										<button id="" name="">조회</button>
										<button id="" name="">초기화</button>
									</div>
									<div class="control-group">
										<label class="control-label" id="land_code" name="land_code">토지코드</label>
										<div class="controls">
											<input type="text" id="land_code" name="land_code" placeholder="이름"/>
										</div>
										
									</div>
										
									<div class="control-group" >
										<label class="control-label" id="land_code" name="land_code">대분류코드</label>
										<div class="controls">
											<select>
												<option>004</option>
												<option>005</option>
												<option>006</option>
												<option>007</option>
											</select>
										</div>
										
										</div>
									</form>
								</div>
									
									
									
									
									
									
									
									
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
								</div><!-- /span -->
							</div>
							  
							  
						</div><!-- /span -->
					</div><!-- /row -->					
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