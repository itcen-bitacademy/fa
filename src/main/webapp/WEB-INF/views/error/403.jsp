<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>ITCEN-FA[Error: Access Denied]</title>
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
				<li>
					<a href="#">Error: Access Dnied</a>
				</li>
			</ul><!-- .breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row-fluid">
				<div class="span12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="error-container">
								<div class="well">
									<h1 class="grey lighter smaller">
										<span class="blue bigger-125">
											<i class="icon-random"></i>
											403
										</span>
										접근거부
									</h1>

									<hr />
									<h3 class="lighter smaller">
										해당 메뉴에 접근 권한이 없습니다.<br/>
										시스템 관리자에게 문의해 주세요.(안태영, 010.9145.9107)
									</h3>

									<hr />
									<div class="space"></div>

									<div class="row-fluid">
										<div class="center">
											<a href="hostory.go(-1);" class="btn btn-grey">
												<i class="icon-arrow-left"></i>
												이전 페이지
											</a>
											<a href="/fa" class="btn btn-primary">
												<i class="icon-dashboard"></i>
												홈으로 돌아가기
											</a>
										</div>
									</div>
								</div>
							</div>

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