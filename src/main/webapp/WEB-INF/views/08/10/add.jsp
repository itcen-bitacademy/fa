<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">팀추가</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
						<div class="control-group">
							<label class="control-label" for="form-field-1">이름</label>
							<div class="controls">
								<input type="text" id="form-field-1" name="name" placeholder="이름"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-select-1">접근메뉴</label>
							<div class="controls">
								<select class="chosen-select" id="form-field-select-1" name="menuNo" data-placeholder="메뉴선택">
									<c:forEach items="${listMainMenu }" var="menuVo">
										<option value="${menuVo.no }">${menuVo.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-2">부가정보</label>
							<div class="controls">
								<textarea id="form-field-2" name="info" placeholder="부가정보"></textarea>
							</div>
						</div>
						<div class="form-actions">
							<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>등록</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="reset"><i class="icon-undo bigger-110"></i>Reset</button>
						</div>						
					</form>					
					<!-- PAGE CONTENT ENDS -->

				</div><!-- /.span -->
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
</body>
</html>