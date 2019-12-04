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
				</div>
				<!-- /.page-header -->
				
				<div class="row-fluid">
			
				<form class="form-horizontal">
				
				<div class="span4">
					<div class="control-group">
								<label class="control-label" for="form-field-codename">은행명</label>
								<div class="controls">
									<input class="span6" type="text" id="name"
										name="name" placeholder="은행명" />
							</div>
						</div>
					</div>
					
					<div class="span4">
						<div class="control-group">
							<label class="control-label" for="form-field-codename">지점명</label>
							<div class="controls">
								<input class="span5" type="text" id="store" name="store" placeholder="지점명"/>
							</div>
						</div>
					</div>
					
				<div class="span4">	
					<div class="control-group">
						<label class="control-label" for="form-field-codename">거래시작일</label>
							<div class="controls">
							<div class="row-fluid input-append">
								<input class="span5 date-picker" id="id-date-picker-1"
										name="dealDate" type="text" data-date-format="yyyy-mm-dd" /> <span
										class="add-on"><i class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
					</div>
					<br>
					<button id="search" class="btn btn-info btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
					<div class="pull-right">
						<label class="pos-rel"></label> <input type="checkbox" /> <span>삭제포함</span>
					</div>
					</form>
				</div>

				<!-- PAGE CONTENT BEGINS -->
				<div class="row-fluid">
					<div class="span12">
						<br>
						<table id="simple-table" class="table  table-bordered table-hover">
                          <thead>
                              <tr>
                                  <th class="center">은행코드</th>
                                  <th class="center">은행명</th>
                                  <th class="center">지점명</th>
                                  <th class="center">거래시작일</th>
                                  <th class="center">전화번호</th>
                                  <th class="center">FAX</th>
                                  <th class="center">우편번호</th>
                                  <th class="center">은행주소</th>
                                  <th class="center">담당자</th>
                                  <th class="center">담당자전화번호</th>
                                  <th class="center">담당자이메일</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 	<c:forEach items="${dataResult.datas }" var="bankvo">
                                    <tr>
                                       <td class="center">${bankvo.code }</td>
                                       <td class="center">${bankvo.name }</td>
                                       <td class="center">${bankvo.store }</td>
                                       <td class="center">${bankvo.dealDate }</td>
                                       <td class="center">${bankvo.phone }</td>
                                       <td class="center">${bankvo.fax }</td>
                                       <td class="center">${bankvo.post }</td>
                                       <td class="center">${bankvo.address }</td>
                                       <td class="center">${bankvo.mgr }</td>
                                       <td class="center">${bankvo.mgrPhone }</td>
                                       <td class="center">${bankvo.mgrEmail }</td>
                                    </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
					</div>
					<!-- /span -->
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div><!-- /.page-content -->
			
			<div class="pagination">
				<ul>
				<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
						<i class="icon-double-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
					<c:choose>
						<c:when test="${pg eq dataResult.pagination.page }">
							<li class="active">
								<a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
				</ul>
			</div>
		</div><!-- /.main-content -->
	</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>

</body>
</html>