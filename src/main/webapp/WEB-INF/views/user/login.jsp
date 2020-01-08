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
<link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" />
<!-- ace settings handler -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace-extra.min.js"></script>
</head>
<body class="login-layout skin-3">

<div class="navbar" id="navbar">
	<div class="navbar-inner fixed">
		<div class="container-fluid">
			<a href="#" class="brand">ITCEN</a>
		</div><!-- /.container-fluid -->
	</div><!-- /.navbar-inner -->
</div>
<div class="main-container container-fluid">
	<div class="main-content">
		<div class="row-fluid">
			<div class="span12">
				<div class="login-container">
					<div class="space-30"></div>
					<div class="space-30"></div>
					<div class="row-fluid">
						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger"><i class="icon-coffee green"></i> 아이디와 비밀번호를 입력하세요.</h4>
										<div class="space-6"></div>
										<form action='${pageContext.request.contextPath }/user/auth' method='post'>
											<fieldset>
												<label>
													<span class="block input-icon input-icon-right">
														<input type="text" class="span12" name='id' placeholder="아이디" />
														<i class="icon-user"></i>
													</span>
												</label>
												<label>
													<span class="block input-icon input-icon-right">
														<input type="password" class="span12" name='password' placeholder="비밀번호" />
														<i class="icon-lock"></i>
													</span>
												</label>
												<div class="space"></div>
												<div class="clearfix">
<!-- 													<label class="inline"><input type="checkbox" class="ace" /> <span class="lbl"> Remember Me</span></label> -->
													<button class="width-35 pull-right btn btn-small btn-primary"><i class="icon-key"></i> 로그인</button>
												</div>
												<div class="space-4"></div>
											</fieldset>
										</form>
									</div><!-- /widget-main -->
								</div><!-- /widget-body -->
							</div><!-- /login-box -->
						</div><!-- /position-relative -->
					</div>
				</div>
			</div><!-- /.span -->
		</div><!-- /.row-fluid -->
	</div>
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
