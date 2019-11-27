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
				<h1 class="pull-left">차량현황조회</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
						
						
						<div class="span5"><!-- 차변 -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">차량 코드</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="id" placeholder="10자로 입력하세요"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 명</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="customerName" placeholder="10자로 입력하세요"/>
									</div>
								</div>
							
							<div class="control-group">
                              <div style="float:left;">                                 
                                 <label class="control-label" for="form-field-1">주소</label>
                                 <div class="controls">
                                    <select style="width:150px;" class="chosen-select" id="form-field-select-1" name="wideAddr" data-placeholder="시/도">
                                       <c:forEach items="${listMainMenu }" var="sectionVo">
                                          <option value="${sectionVo.no }">${sectionVo.name }</option>
                                       </c:forEach>
                                    </select>
                                 </div>
                              </div>
                              <div style="float:left; margin-left:10px" class="controls">
                                 <select style="width:150px;" class="chosen-select" id="form-field-select-1" name="cityAddr" data-placeholder="시/군/구">
                                    <c:forEach items="${listMainMenu }" var="sectionVo">
                                       <option value="${sectionVo.no }">${sectionVo.name }</option>
                                    </c:forEach>
                                 </select>
                              </div>
                              <div style="float:left; margin-left:10px" class="controls">
                                 <select style="width:150px;" class="chosen-select" id="form-field-select-1" name="localAddr" data-placeholder="읍/면/동">
                                    <c:forEach items="${listMainMenu }" var="sectionVo">
                                       <option value="${sectionVo.no }">${sectionVo.name }</option>
                                    </c:forEach>
                                 </select>
                              </div>
                        </div>
								
							
								
								
						<div class="control-group">
								<label class="control-label" for="id-date-picker-1">매입일자</label>
								<div class="controls">
									<div class="input-append">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
									<input class="span5" type="text" name="acqPrice" id="id-date-range-picker-1">
								</div>
							</div>
 	
                         
						</form>
					</div><!-- 차변 span -->
							
						<div class="span3"><!-- 대변 -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							
			
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">차량분류</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="sectionNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">거래처 담당자</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="customerManager" placeholder="이름을 입력하세요"/>
									</div>
								</div>
							</form>
						</div><!-- 대변 span -->
						
						<div class="span4"><!-- 차변 -->
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							
						
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">직급</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="staffName" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								
									<div class="control-group">
										<label class="control-label" for="id-date-picker-1">납부일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											<input class="span5" type="text" name="payDate" id="id-date-range-picker-1">
										</div>
									</div>
								
								<div class="control-group">
								<div style="float:left;width:50%">											
									<label class="control-label" for="form-field-3">납부금액</label>
										<div class="controls">
											<input style="width:150px" type="text" id="form-field-1" name="payPrice" placeholder=""/>
										</div>
									</div>	
								</div>
								<div class="control-group">
                              <div class="controls">
                                 <div class="span4" style="float:right">
                                    <button class="btn btn-info btn-small" style="width:80px; float:right; margin-right:45px">상세조회</button>
                                 </div>
                                 <div class="span2" style="float:right">
                                    <label style="float:right">
                                       <input name="checkDel" type="checkbox" class="ace">
                                          <span class="lbl" style="width:90px; margin-right:20px">삭제포함</span>
                                    </label>
                                 </div>
                              </div>
                           </div>
							
							
						
						</form>
					</div><!-- 차변 대변 나누기 위한 row-fluid -->	
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
								<div class="control-group">
									<div class="controls">
										<div class="span1" style="float:right; margin-left:0px">
											<button class="btn btn-info btn-small" style="float:left; margin-right:0px;">조회</button>
										</div>
										<div class="span2" style="float:right; margin-left:50px">
											<input type="text" class="span11" id="form-field-1" name="search" placeholder="검색어를 입력하세요"/>
										</div>
									</div>
								</div>
							</form>
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
												<th>NO</th>
												<th>차량코드</th>
												<th>차량대분류</th>
												<th>차량배기량</th>
												<th>직급</th>
												<th>소유자</th>
												<th>주소(광역)</th>
												<th>주소(시/군/구)</th>
												<th>주소(읍/면/동)</th>
												<th>주소(상세)</th>
												<th>매입일자</th>
												<th>매입거래처코드</th>
												<th>매입거래처담당자</th>
												<th>출시가(원)</th>
												<th>등록세(원)</th>
												<th>취득세(원)</th>
												<th>부대비용(원)</th>
												<th>보증금(원)</th>
												<th>월 사용료(원)</th>
												<th>보증금 납부일자</th>
												<th>월 사용료 납부일자(원)</th>
												<th>과세/영세</th>
												<th>사용개월</th>
												<th>사용료 납부일자</th>
												<th>세금계산서번호</th>
												<th>작성자</th>
												<th>작성일자</th>
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

												<td>1</td>
												<td>차량코드</td>
												<td>차량대분류</td>
												<td>차량배기량</td>
												<td>직급</td>
												<td>소유자</td>
												<td>주소(광역)</td>
												<td>주소(시/군/구)</td>
												<td>주소(읍/면/동)</td>
												<td>주소(상세)</td>
												<td>매입일자</td>
												<td>매입거래처코드</td>
												<td>매입거래처담당자</td>
												<td>출시가(원)</td>
												<td>등록세(원)</td>
												<td>취득세(원)</td>
												<td>부대비용(원)</td>
												<td>보증금(원)</td>
												<td>월 사용료(원)</td>
												<td>보증금 납부일자</td>
												<td>월 사용료 납부일자(원)</td>
												<td>과세/영세</td>
												<td>사용개월</td>
												<td>사용료 납부일자</td>
												<td>세금계산서번호</td>
												<td>작성자</td>
												<td>작성일자</td>
												<td>삭제여부</td>
											</tr>

											
										</tbody>
									</table>
									
									<div class="pagination">
											<ul>
												<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
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