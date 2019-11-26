<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="navbar" id="navbar">
	<div class="navbar-inner fixed">
		<div class="container-fluid">
			<a href="${pageContext.request.contextPath }" class="brand">ITCEN</a>
			<ul class="nav ace-nav pull-left">
				<c:forEach items="${menuInfo.mainMenus }" var="menu">
					<c:choose>
						<c:when test="${menuInfo.mainMenuNo == menu.no }">
							<li class="selected"><a href="${pageContext.request.contextPath }/${menu.code }">${menu.name }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/${menu.code }">${menu.name }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<!--	
			<div class="white pull-right">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle">
					<img class="nav-user-photo" src="${pageContext.request.contextPath }/assets/ace/avatars/user.jpg" alt="Jason's Photo" />
					<span class="user-info"><small>Welcome,</small>Jason</span>
					<i class="icon-caret-down"></i>
				</a>
				<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
					<li><a href="#"><i class="icon-cog"></i> Settings</a></li>
					<li><a href="#"><i class="icon-user"></i> Profile</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-off"></i> Logout</a></li>
				</ul>
			</div>
			-->
		</div><!-- /.container-fluid -->
	</div><!-- /.navbar-inner -->
</div>