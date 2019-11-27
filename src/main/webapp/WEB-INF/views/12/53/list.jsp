<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1 class="pull-left">매출세금계산서</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<!-- head  -->
					<div class="span12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row-fluid">
							<div class="span10">
								<div class="form-horizontal">
									<div class="span6">
										<label class="control-label" for="form-field-1">매 출 일
											자</label>
										<div class="row-fluid input-append span2">
											<input class="date-picker" id="id-date-picker-1"
												type="text" data-date-format="yyyy-mm-dd"> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
									</div>

									<div class="span6">
										<label class="control-label" for="form-field-1">매 출 번
											호 </label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
											<button class="btn btn-small">조회</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Line -->
						<div class="hr hr-double dotted"></div>
					</div>
					<!-- head end  -->
					<!-- middle  -->
					<div class="row-fluid">
					
						<div class="span12">
							<div class="span10">
								<div class="form-horizontal">
								<div class="control-group">
									<div class="span6">
										<label class="control-label span2" for="form-field-1">거래처코드</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1"> <input
												class="span5" type="text" id="form-field-1">
										</div>
									</div>
		
									<div class="span6">
										<label class="control-label span6" for="form-field-1">대표자</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
										</div>
									</div>
								</div>
								</div>
								<div class="form-horizontal">
									<div class="control-group">
									<div class="span6">
										<label class="control-label span2" for="form-field-1">주소</label>
										<div class="controls">
											<span class="btn btn-small btn-info"><i
												class="icon-search nav-search-icon"></i></span> <input
												class="span5" type="text" id="form-field-1"> <input
												class="span5" type="text" id="form-field-1">
										</div>
									</div>

									<div class="span6">
										<div class="span5">
											<label class="control-label span1" for="form-field-1">담당자</label>
											<div class="controls">
												<input class="span12" type="text" id="form-field-1">
											</div>
										</div>


										<div class="span7">
											<label class="control-label span1" for="form-field-1">메일</label>
											<div class="controls">
												<input class="span12" type="text" id="form-field-1">
											</div>
										</div>
									</div>
									</div>
								</div>

								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">수량합계</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span6" for="form-field-1">공급가액합계</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
									</div>
								</div>

								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">세금계산서번호</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span6" for="form-field-1">부가세합계</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1">
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label span2" for="form-field-1">세금계산서발행일</label>
											<div class="controls">
												<input class="span5" type="text" id="form-field-1" data-date-format="yyyy-mm-dd">
											</div>
										</div>
	
										<div class="span6">
											<label class="control-label span2" for="form-field-1">영세</label>
												<div class="span3">
														<div class="contorls" style="padding-left:5px">
															 <select id="selectBox">
															    <option>Cheese</option>
	    														<option>Egg</option>
	    														<option>Cabbage</option>
	  														</select>
  														</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-horizontal">
									<div class="control-group">
										<div class="span6">
											<label class="control-label" for="form-field-1">입금 계좌 번호</label>
											<div class="controls">
												<span class="btn btn-small btn-info"><i
													class="icon-search nav-search-icon"></i></span> <input
													class="span5" type="text" id="form-field-1">
											</div>
										</div>
	
										<div class="span6">
												<label class="control-label" for="form-field-1">출고일자</label>
												<div class="controls">
													<input class="span5" type="text" id="form-field-1">
												</div>
										</div>
									</div>
								</div>


								<!-- PAGE CONTENT ENDS -->
								<!-- /.span -->
							</div>
							<!-- /.row-fluid -->
						</div>
					</div>
					<!-- /.page-content -->
				</div>
				<!-- /.main-content -->
			</div>
		</div>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>