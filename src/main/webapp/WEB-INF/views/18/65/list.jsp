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
				<h1 class="pull-left">공통코드리스트</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i>코드추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
								<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>대분류명</th>
										<th>품목명</th>
										<th class="hidden-phone">
											<i class="icon-time bigger-110 hidden-phone"></i>입력시간
										</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sectionList }" var="sections">
										<c:choose>
											<c:when test="${fn:length(sections.subSections) == 0 }">
												<tr>
													<td><a href="#">${sections.classification }[${sections.code }]</a></td>
													<td></td>
													<td class="hidden-phone">${sections.lastUpdate }</td>
													<td></td>
												</tr>
											</c:when>
											
											<c:otherwise>
												<c:forEach items="${sections.subSections }" var="subSection" varStatus="status">
													<tr>
														
														<c:if test="${status.index == 0 }">
															<td rowspan="${fn:length(sections.subSections) }"><a href="#">${sections.classification }[${sections.code }]</a></td>	
														</c:if>
														
														<td><a href="#">${subSection.classification }[${subSection.code }]</a></td>
														
														<td class="hidden-phone">${subSection.lastUpdate }</td>
														
														 	
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
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
						
							
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