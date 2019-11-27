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
				<h1 class="pull-left">무형자산관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
						
						
						<div class="span6"><!-- 차변 -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								<div class="control-group">
									<label class="control-label" for="form-field-1">무형자산 코드</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="id" placeholder="10자로 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">무형자산 명</label>
									<div class="controls">
										<input type="text" class="span11" id="form-field-1" name="name" placeholder="무형자산명을 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">설치주소</label>
									<div class="controls">
										<input type="text" class="span11" id="form-field-1" name="address" placeholder="주소를 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">대분류 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="sectionNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="sectionVo">
												<option value="${sectionVo.no }">${sectionVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="form-input-readonly" value="코드를 지정하면 대분류명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">거래처 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="customerNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="customerVo">
												<option value="${customerVo.no }">${customerVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span6" id="form-input-readonly" value="코드를 지정하면 거래처명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">취득금액</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="acqPrice" placeholder="금액을 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">부대비용</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="addiFee" placeholder="금액을 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">세금계산서 번호</label>
									<div class="controls">
										<input type="text" class="span7" id="form-field-1" name="taxbillNo" placeholder="12자로 입력하세요"/>
									</div>
								</div>
							</form>
						</div><!-- 차변 span -->
							
						<div class="span6"><!-- 대변 -->
							<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								<div class="control-group">
									<div class="controls">
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>등록</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>수정</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>삭제</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>조회</button>
											&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset"><i class="icon-undo bigger-110"></i>Reset</button>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">사용 담당자</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="user" placeholder="이름을 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">수량</label>
									<div class="controls">
										<input type="text" id="form-field-1" name="copyCount" placeholder="수량을 입력하세요"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-1">담당자</label>
									<div class="controls">
										<input readonly type="text" id="form-input-readonly" value="코드를 지정하면 대분류명이 등록됩니다"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">대분류 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="menuNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="menuVo">
												<option value="${menuVo.no }">${menuVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span5" id="form-input-readonly" value="코드를 지정하면 대분류명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-select-1">거래처 코드</label>
									<div class="controls">
										<select class="chosen-select" id="form-field-select-1" name="menuNo" data-placeholder="전체">
											<c:forEach items="${listMainMenu }" var="menuVo">
												<option value="${menuVo.no }">${menuVo.name }</option>
											</c:forEach>
										</select>
										<input readonly type="text" class="span5" id="form-input-readonly" value="코드를 지정하면 거래처명이 등록됩니다">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="form-field-2">부가정보</label>
									<div class="controls">
										<textarea id="form-field-2" name="info" placeholder="부가정보"></textarea>
									</div>
								</div>
							</form>
						</div><!-- 대변 span -->
					</div><!-- 차변 대변 나누기 위한 row-fluid -->						
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