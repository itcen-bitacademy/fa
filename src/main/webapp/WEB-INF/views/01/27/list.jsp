<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>

<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />

<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="/fa/ace/assets/js/jquery.ui.touch-punch.min.js"></script>

<script src="/fa/ace/assets/js/ace-elements.min.js"></script>
<script src="/fa/ace/assets/js/ace.min.js"></script>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">거래처관리</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span6">
						<!-- <div class="col-sm-9">
											<span class="input-icon">
												<input type="text" id="form-field-icon-1" />
												<i class="ace-icon fa fa-leaf blue"></i>
											</span>

											<span class="input-icon input-icon-right">
												<input type="text" id="form-field-icon-2" />
												<i class="ace-icon fa fa-leaf green"></i>
											</span>
										</div> -->
							<form class="form-horizontal" role="form">
								<div class="form-group" style=float:left>
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 사업자 등록번호:&nbsp; </label>
									<input type="text" id="customer_no" placeholder="사업자등록번호" class="col-xs-10 col-sm-5" />	
								</div>
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 상호명:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="상호명" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 대표자:&nbsp; </label>
									<input type="text" id="customer_ceo" placeholder="대표자" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>

								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 주소:&nbsp; </label>
									<div class="input-append">
										<input type="text" id="customer_address" placeholder="주소" class="col-xs-10 col-sm-5" />
										<button type="button" class="">
											<i class="icon-search bigger-110"></i> 검색
										</button>
									</div>
									
									&nbsp; &nbsp; &nbsp; &nbsp; 상세주소:
									
									<input type="text" id="customer_address" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>
								
								<br/>
								
								
								<div class="form-group" style=float:left>
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 업태:&nbsp; </label>
									<input type="text" id="customer_no" placeholder="업태" class="col-xs-10 col-sm-5" />	
								</div>
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 종목:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="종목" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 법인번호:&nbsp; </label>
									<input type="text" id="form-field-1" placeholder="법인번호" class="col-xs-10 col-sm-5" />
								</div>

							</form>
							
						</div><!-- /span -->
						
						<div class="span6">
							<form class="form-horizontal" role="form">
							
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 관할 영업소:&nbsp; </label>
									<input type="text" id="form-field-1" placeholder="관할 영업소" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								
								<div class="form-group" style=float:left>
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 거래처 전화번호:&nbsp; </label>
									<input type="text" id="customer_no" placeholder="거래처 전화번호" class="col-xs-10 col-sm-5" />	
								</div>
								
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> E-mail:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="E-mail" class="col-xs-10 col-sm-5" />
								</div>
								
								<br/>
								
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 계좌번호:&nbsp; </label>
									<div class="input-append">
										<input type="text" id="customer_address" placeholder="주소" class="col-xs-10 col-sm-5" />
										<button type="button" class="">
											<i class="icon-search bigger-110"></i> 조회
										</button>
									</div>
									&nbsp; &nbsp; &nbsp; &nbsp; 은행코드:
									<input type="text" id="customer_address" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly/>
								</div>
								
								<br/>
								
								<div class="form-group" style=float:left>
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 은행명:&nbsp; </label>
									<input type="text" id="customer_no" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly/>	
								</div>
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 예금주:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly/>
								</div>
								
								<br/>
								<div class="form-group" >
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 거래처 담당자 성명:&nbsp; </label>
									<input type="text" id="customer_name" placeholder="거래처 담당자" class="col-xs-10 col-sm-5" />
								</div>
								
								
								
								
								
								
							</form>
						</div><!-- span -->
						
						<div class="row-fluid">
							<div class="span8">
								<button class="btn btn-info">조회</button>
								<button class="btn btn-danger">삭제</button>
								<button class="btn btn-warning">수정</button>
								<button class="btn btn-primary">입력</button>
								<button class="btn btn-default">취소</button>
							</div><!-- /.span -->
						</div>
						
						<br/>
						
						<div class="row-fluid">
						<div class="span12">
						
						<div style="width:100%; overflow-x:auto">
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">
											<label class="pos-rel">
											<input type="checkbox" class="ace" />
											<span class="lbl"></span>
											</label>
										</th>
										<th>사업자등록번호</th>
										<th>상호</th>
										<th>대표자</th>
										<th>주소</th>
										<th>업태/종목</th>
										<th>관할영업소</th>
										<th>거래처 전화번호</th>
										<th>거래처 담당자 성명</th>
										<th>e-mail</th>
										<th>은행명</th>
										<th>계좌번호</th>
										<th>예금주</th>
										<th>입력일자</th>
										<th>수정일자</th>
										<th>입력담당자</th>
										<th>수정담당자</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td class="center">
												<label class="pos-rel">
													<input type="checkbox" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td>120-86-81451</td>
											<td>아이티센</td>
											<td>박진국</td>
											<td>서울특별시 서초구 반포대로 13</td>
											<td>컴퓨터시스템 통합 자문 및 구축 서비스업</td>
											<td>본사</td>
											<td>02-3497-8300</td>
											<td>이종윤</td>
											<td>leejy3653@naver.com</td>
											<td>국민은행</td>
											<td>367802-01-110999</td>
											<td>이종윤</td>
											<td>2019-11-27</td>
											<td>-</td>
											<td>yoon3653</td>
											<td>-</td>
										</tr>
								</tbody>
							</table>
						</div><!-- /span -->
						</div>
					</div>
					</div>
					
					
					<!-- /row -->
					<!-- PAGE CONTENT ENDS -->
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						<div class="pagination"><!-- 페이징 공통 -->
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
				</div>
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>