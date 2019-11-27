<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
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
				<h1 class="pull-left">팀추가</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="form-field-1">장기차입금코드</label>
								<div class="controls">
									<input type="text" id="code" name="code" placeholder="장기차입금코드"/>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="form-field-1">장기차입금명</label>
								<div class="controls">
									<textarea rows="span4" cols="span4" id="name" name="name" placeholder="장기차입금명"></textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-select-1">차입금대분류</label>
								<div class="controls">
									<select class="chosen-select" id="form-field-select-1" name="classification" data-placeholder="선택">
										<c:forEach items="${listMainMenu }" var="menuVo">
											<option value="${menuVo.no }">${menuVo.name }</option>
										</c:forEach>
									</select>
									<input type="text" id="code" disabled="disabled" />
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="form-field-1">차입금액</label>
								<div class="controls">
									<div class="span3">
										<input type="text" id="amount" name="amount" placeholder="차입금액"/>
									</div>
								</div>
								<label class="control-label" for="form-field-1">상환금액</label>
								<div class="controls">
									<div class="span2">
										<input type="text" id="repay" name="repay" placeholder="상환금액"/>
									</div>
								</div>
							</div>
							
							<div class="row-fluid">
								<label for="id-date-range-picker-1">차입일자 ~ 납입일자</label>
							</div>

							<div class="control-group">
								<div class="row-fluid input-prepend">
									<span class="add-on">
										<i class="icon-calendar"></i>
									</span>
									<input class="span10" type="text" name="date-range-picker" id="id-date-range-picker-1" />
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
						</div>
						<div class="span6">	
							<div class="control-group">
								<label class="control-label" for="form-field-1">회계년도</label>
								<div class="controls">
									<input type="text" id="year" name="year" placeholder="회계년도"/>
								</div>
							</div>
			
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
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>

<script>
$(function(){
	$('#id-date-range-picker-1').daterangepicker().prev().on(ace.click_event, function(){
		$(this).next().focus();
	});
	$(".chosen-select").chosen(); 
});

</script>
</body>
</html>