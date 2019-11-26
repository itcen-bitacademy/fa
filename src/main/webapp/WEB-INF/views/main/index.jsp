<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>ITCEN-FA[Home]</title>
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath }/assets/css/fa.css" rel="stylesheet" />
<!-- ace settings handler -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace-extra.min.js"></script>
</head>

<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
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