<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
}
</style>

</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">



				<div class="page-header position-relative">
					<h1 class="pull-left">전표관리[1-03]</h1>
				</div><!-- /.page-header -->
				
					<div class="row-fluid">
						<div class="span6">
							<form class="form-horizontal">
								
								<!-- 전표 등록 영역 -->
								
								<!-- 전표 등록 날짜 -->
								<div class="control-group">
									<label class="control-label" for="form-field-codename">일자 :</label>
									<div class="controls">
										<div class="row-fluid input-append">
										<input class="span4 date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">계정과목코드 / 계정명 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code" placeholder="계정과목코드"/>
										<input class="span5" type="text" id="form-field-name" name="name" placeholder="계정명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">금액 :</label>
									<div class="controls">
										<input type="text" id="form-field-1">
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">부가세 :</label>
									<div class="controls">
										<input type="text" id="form-field-1">
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">차대구분 :</label>
									<div class="controls">
										<select class="chosen-select" id="d-c" name="dc" data-placeholder="차대구분">
											<option value="2019-12">차변</option>
											<option value="2019-12">대변</option>
										</select>
		
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">증빙코드 / 증빙종류 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code1" placeholder="증빙코드"/>
										<input class="span5" type="text" id="form-field-name" name="name1" placeholder="증빙종류"/>
									</div>
								</div>
								
							</form>
						</div>
	
						<div class="span6">
							<form class="form-horizontal">
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">거래처코드 / 거래처명 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code2" placeholder="거래처코드"/>
										<input class="span5" type="text" id="form-field-name" name="name2" placeholder="거래처명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">은행코드 / 은행명 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code3" placeholder="은행코드"/>
										<input class="span5" type="text" id="form-field-name" name="name3" placeholder="은행명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">카드번호 / 소유자 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code4" placeholder="카드번호"/>
										<input class="span5" type="text" id="form-field-name" name="name4" placeholder="소유자"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-codename">계좌번호 / 소유자 :</label>
									<div class="controls">
										<input class="span3" type="text" id="form-field-code" name="code5" placeholder="계좌번호"/>
										<input class="span5" type="text" id="form-field-name" name="name5" placeholder="소유자"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1">전표사용목적 :</label>
									<div class="controls">
										<input class="span8" type="text" id="form-field-code" name="code6" placeholder="전표사용목적"/>
									</div>
								</div>
								
							</form>
						</div>
					</div><!-- /.row-fluid -->


			<!-- buttons -->
			<div class="row-fluid">
				<div class="span12">
					<div class="form-actions">
						<button class="btn btn-info" type="button">입 력</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-danger" type="reset">조 회</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-warning" type="reset">수 정</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-primary" type="reset">삭 제</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default" type="reset">취 소</button>
					</div>
					<div class="hr"></div>
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->


			<!--조회 테이블 영역 -->
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>일자</th>
								<th>전표번호</th>
								<th>전표순번</th>
								<th>구분</th>
								<th>계정과목</th>
								<th>계정과목명</th>
								<th>차변</th>
								<th>대변</th>
								<th>부가세</th>
								<th>거래처</th>
								<th>증빙종류</th>
								<th>증빙코드</th>
								<th>은행명</th>
								<th>카드번호</th>
								<th>계좌번호</th>
								<th>소유자</th>
								<th>담당자</th>
								<th>사용목적</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>20191127</td>
								<td>0001</td>
								<td>01</td>
								<td>차변</td>
								<td>123456</td>
								<td>당좌예금</td>
								<td>100,000,000</td>
								<td></td>
								<td>10,000,000</td>
								<td>아이티센</td>
								<td>세금계산서</td>
								<td>123123</td>
								<td>신한은행</td>
								<td>카드번호</td>
								<td></td>
								<td>임성주</td>
								<td>둘리</td>
								<td>회식비 2차 20,000원 당좌예금에서 보통예금으로 입금</td>
							</tr>
							
							<tr>
								<td>20191127</td>
								<td>0001</td>
								<td>02</td>
								<td>대변</td>
								<td>123457</td>
								<td>보통예금</td>
								<td></td>
								<td>100,000,000</td>
								<td>10,000,000</td>
								<td>아이티센</td>
								<td>세금계산서</td>
								<td>123123</td>
								<td>신한은행</td>
								<td>카드번호</td>
								<td></td>
								<td>임성주</td>
								<td>둘리</td>
								<td>회식비 2차 20,000원 보통예금에서 당좌예금으로 출금</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<!-- 페이징 영역 -->
			<div class="pagination">
				<ul>
					<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
				</ul>
			</div>
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
});
</script>
</body>
</html>