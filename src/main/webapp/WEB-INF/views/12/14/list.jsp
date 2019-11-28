<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">



				<div class="page-header position-relative">
					<h1 class="pull-left">매출현황조회</h1>
				</div>
				<!-- /.page-header -->

				<!-- PAGE CONTENT BEGINS -->
				<div class="row-fluid">


					<!-- PAGE CONTENT BEGINS -->
					<div class="span12">
						<form class="form-horizontal" method="post" action="">
							<!-- left -->
							<div class="span6">
								<div class="control-group">
                                    <label class="control-label" for="form-field-5">매출번호</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-5" placeholder="매출번호">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">거래처코드</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-5" placeholder="거래처코드">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">품목코드</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-5" placeholder="품목코드">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">삭제여부</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="form-field-select-1" name="role" data-placeholder="팀선택">
                                            <option value="">전체</option>
                                            <option value="">삭제</option>
                                            <option value="">미삭제</option>
                                        </select>
                                    </div>
                                </div>
							</div>
							<!-- right -->
							<div class="span6">
								<div class="control-group">
                                    <label class="control-label" for="form-field-5">기간</label>
                                    <div class="controls">
                                        <input type="text" name="dates" class="form-control pull-right">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">매입담당자</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-5" placeholder="매입담당자">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">매출담당자</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-5" placeholder="매출담당자">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">정렬기준</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="form-field-select-1" name="role" data-placeholder="팀선택">
                                            <option value="">매출일</option>
                                            <option value="">거래처</option>
                                            <option value="">공급가액</option>
                                        </select>
                                        <div class="btn-group">
                                            <button class="btn btn-info btn-small">조회</button>
                                        </div>
                                    </div>
                                </div>
							</div>
						</form>
					</div>
				</div>
				<div class="hr hr-10 dotted"></div>
				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"	class="table table-striped table-bordered table-hover">
							<tr>
                                <th>매출번호</th>
                                <th>거래처코드</th>
                                <th>거래처명</th>
                                <th>거래처담당자</th>
                                <th>거래처연락처</th>
                                <th>세금계산서번호</th>
                                <th>순번</th>
                                <th>품목코드</th>
                                <th>품목명</th>
                                <th>공급가액</th>
                                <th>부가세</th>
                            </tr>
                            <tr>
                            	<td>1234567890</td>
                            	<td>610891456</td>
                            	<td>아이티센</td>
                            	<td>김현곤</td>
                            	<td>010-0000-0000</td>
                            	<td>12345678911</td>
                            	<td>01</td>
                            	<td>1556848997</td>
                            	<td>생수</td>
                            	<td>15,000</td>
                            	<td>1,500</td>
                            </tr>
						</table>
						<!-- PAGE CONTENT ENDS -->
					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->

			</div>
			<!-- /.span -->
		</div>
		<!-- /.row-fluid -->



	</div>
	<!-- /.page-content -->
	</div>
	<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
<script>
$('input[name="dates"]').daterangepicker();
</script>
</body>
</html>