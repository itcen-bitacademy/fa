<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<div class="sidebar" id="sidebar">
		<div id="timer">
			<h5 class="center" id="timer-text"></h5>
		</div>
		<div id="user-profile">
			<a data-toggle="dropdown" href="#" class="dropdown-toggle">
				<img class="photo" src="${pageContext.request.contextPath }/assets/images/default-profile.jpg" alt="안대혁의 프로필" />
				<span class="user-info"><em>${authUser.teamName }</em><strong>${authUser.name }님</strong></span>
				<i class="icon-caret-down"></i>
			</a>
			<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
				<li><a href="#"><i class="icon-cog"></i>설정</a></li>
				<li class="divider"></li>
				<li><a href="${pageContext.request.contextPath }/user/logout"><i class="icon-off"></i>로그아웃</a></li>
			</ul>
		</div><!-- #sidebar-profile -->
		<ul class="nav nav-list">
			<c:forEach items="${menuInfo.subMenus }" var="menu">
				<c:choose>
					<c:when test="${menu.no == menuInfo.subMenuNo }">
						<li class="selected"><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menu.code }"><span class="menu-text">${menu.name }</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menu.code }"><span class="menu-text">${menu.name }</span></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul><!-- /.nav-list -->
	</div>

	<script>
		var clockTarget = document.getElementById('timer-text');

		function pad(n, width) {
			n = n + '';
			return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
		}

		function clock() {
    	var date = new Date();
			var year = date.getFullYear();
    	var month = date.getMonth();
	    var clockDate = date.getDate();
	    var day = date.getDay();
	    var week = ['일', '월', '화', '수', '목', '금', '토'];
	    var hours = date.getHours()
	    var minutes = date.getMinutes()
	    var seconds = date.getSeconds()

	    clockTarget.innerText = (year + '-' + pad((month + 1), 2) + '-' + pad(clockDate, 2) + ' ' + pad(hours, 2) + ':' + pad(minutes, 2) + ':' + pad(seconds, 2) + ' (' + week[day] + ')')
		}

		function init() {
			clock();
			setInterval(clock, 1000);
		}

		init();
	</script>
