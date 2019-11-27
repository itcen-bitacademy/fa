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
				<h1 class="pull-left">매출거래처관리</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span10">
							<form class="form-horizontal" action="">
								<div class="span6">
									<div class="control-group">
										<label class="control-label form-field-1">사업자번호</label>
										<div class="controls">
											<input class="span3" type="text" id="form-field-1">
											<input class="span2" type="text" id="form-field-1">
											<input class="span5" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">대표자</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">주소</label>
										<div class="controls">
											<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
											<input class="span2" type="text" id="form-field-1" readonly>
											<input class="span7" type="text" id="form-field-1" readonly>
											<input class="span10" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">업태</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">개설일자</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">담당자명</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">입금계좌번호</label>
										<div class="controls">
											<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
											<input class="span9" type="text" id="form-field-1">
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<label class="control-label form-field-1">상호</label>
										<div class="controls">
											<input class="span12" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">법인번호</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-1">
											<input class="span5" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">전화번호</label>
										<div class="controls">
											<input class="span2" type="text" id="form-field-1">
											<input class="span3" type="text" id="form-field-1">
											<input class="span3" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">종목</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">관할사무소</label>
										<div class="controls">
											<input type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">메일</label>
										<div class="controls">
											<input class="span12" type="text" id="form-field-1">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">예금주</label>
										<div class="controls">
											<input type="text" id="form-field-1" readonly>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label form-field-1">은행</label>
										<div class="controls">
											<input class="span2" type="text" id="form-field-1" readonly>
											<input class="span6" type="text" id="form-field-1" readonly>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span6">
							<div id="sample-table-2_length" class="dataTables_length">
								<button class="btn btn-default">입력</button>
								<button class="btn btn-default">수정</button>
								<button class="btn btn-default">삭제</button>
								<button class="btn btn-default">조회</button>
								<button class="btn btn-default">초기화</button>
							</div>
						</div>
						<div class="span10">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper table-responsive" role="grid">
								<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2_info">
									<thead>
										<tr role="row">
											<th class="sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending" style="width: 173px;">사업자번호</th>
											<th class="sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending" style="width: 173px;">상호</th>
											<th class="sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending" style="width: 173px;">대표자</th>
											<th class="sorting_disabled" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending" style="width: 173px;">법인번호</th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<tr class="odd">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="even">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div><!-- /span -->
					</div><!-- /row -->
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