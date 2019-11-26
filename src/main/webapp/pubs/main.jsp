<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>ITCEN-FA</title>
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath }/assets/css/fa.css" rel="stylesheet" />
<!-- ace settings handler -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace-extra.min.js"></script>
</head>

<body class="skin-3">
<div class="navbar" id="navbar">
	<div class="navbar-inner fixed">
		<div class="container-fluid">
			<a href="#" class="brand">ITCEN</a>
			<ul class="nav ace-nav pull-left">
				<li><a href="">전표관리</a></li>
				<li><a href="">매입관리</a></li>
				<li><a href="">자산관리</a></li>
				<li><a href="">부채관리</a></li>
				<li><a href="">매출관리</a></li>
				<li><a href="">결산관리</a></li>
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


<div class="main-container container-fluid">

	<div class="sidebar" id="sidebar">
		<div id="user-profile">
			<a data-toggle="dropdown" href="#" class="dropdown-toggle">
				<img class="photo" src="${pageContext.request.contextPath }/assets/images/default-profile.jpg" alt="안대혁의 프로필" />
				<span class="user-info"><em>안녕하세요.</em><strong>안대혁님</strong></span>
				<i class="icon-caret-down"></i>
			</a>
			<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
				<li><a href="#"><i class="icon-cog"></i>설정</a></li>
				<li><a href="#"><i class="icon-user"></i>프로필</a></li>
				<li class="divider"></li>
				<li><a href="#"><i class="icon-off"></i>로그아웃</a></li>
			</ul>
		</div><!-- #sidebar-profile -->
		<ul class="nav nav-list">
			<li><a href="index.html"><span class="menu-text">메뉴1</span></a></li>
			<li><a href="typography.html"><span class="menu-text">메뉴2</span></a></li>
			<li><a href="#"><span class="menu-text">메뉴3</span></a></li>
			<li><a href="#"><span class="menu-text">메뉴4</span></a></li>
			<li><a href="#"><span class="menu-text">메뉴5</span></a></li>
			<li><a href="#"><span class="menu-text">메뉴6</span></a></li>
		</ul><!-- /.nav-list -->
	</div>
	<div class="main-content">
		<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">홈</a>
					<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
				</li>
				<li><a href="#">Other Pages</a><span class="divider"><i class="icon-angle-right arrow-icon"></i></span></li>
				<li class="active">Blank Page</li>
			</ul><!-- .breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row-fluid">
				<div class="span12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- PAGE CONTENT ENDS -->
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->


<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
window.jQuery || document.write("<script src='${pageContext.request.contextPath }/assets/ace/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
window.jQuery || document.write("<script src='${pageContext.request.contextPath }/assets/ace/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script src="${pageContext.request.contextPath }/assets/ace/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->
<!-- ace scripts -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

</body>
</html>