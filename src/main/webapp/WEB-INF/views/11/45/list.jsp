<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<h1 class="pull-left">은행코드 현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
		

					<div class="row-fluid">
						<div class="span4">
							<form class="form-inline">
								<div class="control-group">
									<label class="control-label" for="form-field-codename">은행코드 / 은행명</label>
									<div class="controls">
			
									<input class="span2" type="text" id="form-field-code" name="code" placeholder="은행코드"/>
			
									<button onclick="return false;" class="btn btn-blue btn-small">
										<i class="icon-search icon-on-medium"></i>
									</button>
			
									<input class="span6" type="text" id="form-field-name" name="name" placeholder="은행명"/>

									<button onclick="return false;" class="btn btn-blue btn-small">
										조회
									</button>
									
									</div>
								</div>
							</form>
						</div>
						
					<div class="span4">
						<form class="form-inline">
							<div class="control-group">
								<label class="control-label" for="form-field-codename">지점명</label>
								<div class="controls">
									<input class="span5" type="text" id="form-field-store" name="store" placeholder="지점명"/>
									
									<button onclick="return false;" class="btn btn-blue btn-small">
										조회
									</button>
									
								</div>
							</div>
						</form>
					</div>
						
				<div class="span4">
					<form class="form-inline">
						<div class="control-group">
							<label class="control-label" for="form-field-codename">거래시작일</label>
								<div class="controls">
									<div class="row-fluid input-append">
									<input class="span5 date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" />
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
										<button onclick="return false;" class="btn btn-blue btn-small">
											조회
										</button>
									</div>
								</div>
							</div>
						</form>	
					</div>	
				<br>
					<div class="pull-right">
						<label class="pos-rel"></label>
						<input type="checkbox"/>
							<span>삭제포함</span>
						</div>	
					</div>
					
						
				<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<br>
							<table id="simple-table" class="table  table-bordered table-hover">
                          <thead>
                              <tr>
                                 <th class="center">
                                    <label class="pos-rel">
                                     <input type="checkbox" class="ace" />
                                             <span class="lbl"></span>
                                          </label>
                                       </th>
                                       <th class="center">은행코드</th>
                                       <th class="center">은행명</th>
                                       <th class="center">지점명</th>
                                       <th class="center">거래시작일</th>
                                       <th class="center">전화번호</th>
                                       <th class="center">은행주소</th>
                                       <th class="center">금융권종류</th>
                                       <th class="center">담당자</th>
                                       <th class="center">담당자전화번호</th>
                                       <th class="center">담당자이메일</th>
                                    </tr>
                                 </thead>

                                 <tbody>
                                    <tr>
                                       <td class="center">
                                          <label class="pos-rel">
                                             <input type="checkbox" class="ace" />
                                             <span class="lbl"></span>
                                          </label>
                                       </td>
                                       <td class="center">0010100</td>
                                       <td class="center">한국은행</td>
                                       <td class="center">기획협력국</td>
                                       <td class="center">2019-10-29</td>
                                       <td class="center">02-759-4114</td>
                                       <td class="center">서울특별시 중구 남대문로 39</td>
                                       <td class="center">제1금융</td>
                                       <td class="center">배준석</td>
                                       <td class="center">02-759-4041</td>
                                       <td class="center">bokdplp@bok.or.kr</td>
                                    </tr>
                                 </tbody>
                              </table>
							
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
					
			</div><!-- /.row-fluid -->
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
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