<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">팀리스트</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>이름</th>
										<th>접근메뉴</th>
										<th>부가정보</th>
										<th class="hidden-phone">
											<i class="icon-time bigger-110 hidden-phone"></i>마지막 수정
										</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${teams }" var="team">
										<tr>
											<td><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update/${team.no }">${team.name }</a></td>
											<td>${team.menuName }</td>
											<td>${team.info }</td>
											<td class="hidden-phone">${team.lastUpdate }</td>
										 	<td>
												<div class="hidden-phone visible-desktop action-buttons">
													<!-- 
													<a class="green" href="#"><i class="icon-pencil bigger-130"></i></a>
													<a class="red" href="#"><i class="icon-trash bigger-130"></i></a> 
													-->
												</div>												
											</td> 
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
</body>
</html>