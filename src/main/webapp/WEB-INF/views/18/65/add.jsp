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
				<h1 class="pull-left">공통코드 추가</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
					
						<div class="control-group">
							<label class="control-label" for="form-field-1">분류명</label>
							<div class="controls">
								<input type="text" id="form-field-1" name="classification" placeholder="분류명"/>
							</div>
						</div>
						
						<div class="control-group">
							<label class="control-label" for="form-field-1">코드명</label>
							<div class="controls">
								<input type="text" id="form-field-1" name="code" placeholder="코드명[003]"/>
							</div>
						</div>
						
						<div class="control-group">
							<label class="control-label" for="form-field-select-1">대분류구분</label>
							<div class="controls">
								<select class="chosen-select" id="form-field-select-1" name="parentNo" data-placeholder="대분류코드">
									<option value="">없음</option>
									<c:forEach items="${listMainSection }" var="sectionVo">
										<option value="${sectionVo.no }">${sectionVo.classification }</option>
									</c:forEach>
								</select>
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
<script src="${pageContext.request.contextPath }/assets/ace/js/fuelux/fuelux.spinner.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen();
	$('#spinner1').ace_spinner({value:1,min:1,max:10,step:1, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
	.on('change', function(){
		//alert(this.value)
	});
});
</script>
</body>
</html>