<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매출관리</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i>메뉴 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span10 center">
				
					<!-- PAGE CONTENT BEGINS -->
					
						<div class="control-group">
							<label class="control-label span2" for="form-field-1">매출일자</label>
							<div class="controls span4">
								<input type="text" id="form-field-1" name="id" placeholder="매출일자" />
							</div>
							<label class="control-label span2" for="form-field-1">매출번호</label>
							<div class="controls sapn4">
								<input type="text" id="form-field-1" name="id" placeholder="매출번호" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label span2" for="form-field-1">거래처코드</label>
							<div class="controls span4">
								<input type="text" id="form-field-1" name="id" placeholder="거래처코드" />
							</div>
							<label class="control-label span2" for="form-field-1">거래처 명</label>
							<div class="controls sapn4">
								<input type="text" id="form-field-1" name="id" placeholder="거래처 명" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label span2" for="form-field-1">거래처 담당자</label>
							<div class="controls span4">
								<input type="text" id="form-field-1" name="id" placeholder="거래처 담당자" />
							</div>
							<label class="control-label span2" for="form-field-1">거래처 연락처</label>
							<div class="controls sapn4">
								<input type="text" id="form-field-1" name="id" placeholder="거래처 연락처" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label span2" for="form-field-1">출고일</label>
							<div class="controls span4">
								<input type="text" id="form-field-1" name="id" placeholder="출고일" />
							</div>
							<label class="control-label span2" for="form-field-1">세금계산서 번호</label>
							<div class="controls sapn4">
								<input type="text" id="form-field-1" name="id" placeholder="세금계산서 번호" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label span2" for="form-field-1">수량합계</label>
							<div class="controls span4">
								<input type="text" id="form-field-1" name="id" placeholder="수량합계" />
							</div>
							<label class="control-label span2" for="form-field-1">공급가액 합계</label>
							<div class="controls sapn4">
								<input type="text" id="form-field-1" name="id" placeholder="공급가액 합계" />
							</div>
						</div>
						
						<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<tr>
								<th class="center"><input type="checkbox" class="ace">
								<span class="lbl"></span></th>	
								<th>순번</th>	
								<th>품목코드</th>	
								<th>품목명</th>	
								<th>수량</th>	
								<th>공급가액</th>	
								<th>부가세</th>	
							</tr>
						</table>
					<!-- PAGE CONTENT ENDS -->

				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>