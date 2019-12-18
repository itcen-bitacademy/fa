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
<style>
#staticBackdrop {
	z-index: -1;
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
					<h1 class="pull-left">재무제표계정관리</h1>
				</div>
				<!-- /.page-headerr -->
				<div class="row-fluid">
					<div class="span12">
						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							<!-- 회계연도  -->
							<div class="span3">
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:100px;" >회계연도</label>
									<div class="controls" style="margin-left:100px;">
										<input type="number" min="1900" max="2099" step="1"
											value="${accountUsedyear }" id="accountUsedyear" name="accountUsedyear"
											placeholder="회계연도"
											style="text-align: left; width: 150px; height: 18px;" />
									</div>
								</div>
							</div>
							<!-- 구분  -->
							<div class="span3">
								<div class="control-group">
								<label class="control-label" for="form-field-select-1" style="text-align:left;width:100px;" >구분</label>
									<div class="controls" style="margin-left:100px;">
										<select id="selectedAccountStatementType" name="selectedAccountStatementType"
											data-placeholder="메뉴선택"
											style="text-align: left; width: 150px;">
											<c:if test="${selectedAccountStatementType eq 'B' }">
												<option value="B" selected="selected">대차대조표</option>
												<option value="I">손익계산서</option>
											</c:if>
											<c:if test="${selectedAccountStatementType eq 'I' }">
												<option value="B">대차대조표</option>
												<option value="I" selected="selected">손익계산서</option>
											</c:if>
										</select>
									</div>
								</div>
							</div>
							<div class="span4">
								<!-- 계정명칭  -->
								<div class="control-group">
								<label class="control-label" for="form-field-select-1" style="text-align:left;width:100px;">계정과목</label>
								<div class="controls" style="margin-left:100px;">
									<select class="chosen-select" id="selectedAccount" name="selectedAccount" data-placeholder="계정과목" style="text-align:left;width:160px;" >
										<option value="" data-accountName="" id ="firstSelectedAccount" ></option>
										<c:choose>
											<c:when test="${selectedAccount eq selectedAccount }">
												<option value="${selectedAccount}" data-accountName="${selectedAccount }" selected>${selectedAccount }</option>
											</c:when>
										</c:choose>
										<c:forEach items="${accountList }" var="vo">
												<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>
										</c:forEach>
									</select>
									<input type="text" id="accountName" name="accountName" placeholder="계정명칭" value="" style="text-align: center; width: 160px; height: 18px;" disabled />

								</div>
								</div>
							</div>

							<div class="span2">
								&nbsp;
								<button class="btn btn-info btn-small" type="submit" name="action"  value="list" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">조회</button>
								&nbsp;
								<button class="btn btn-default btn-small" type="button" id="account-reset-btn" name="account-reset-btn">취소</button>
							</div>
						</form>
						<!-- PAGE CONTENT ENDS -->

					</div>
				</div>

				<!-- /.span -->
				<!-- /.row-fluid -->
				<div class="row-fluid">
				<!-- 제무재표 계정과목 테이블  -->
				<div class="span12">
				<!-- 선 -->
				<div class="hr hr-18 dotted"></div>

				<!-- 게시글 총 수 -->
				<h6>총 ${dataResult.pagination.totalCnt }건</h6>

					<table id="tb_account_management" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>순번</th>
								<th>계정과목</th>
								<th>계정명칭</th>
								<th>잔액구분</th>
								<th>입력담당자</th>
								<th>입력일자</th>
								<th>수정담당자</th>
								<th>수정일자</th>
							</tr>
						</thead>

						<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
							<tbody>
								<tr>
									<td>${vo.accountOrder }</td>
									<td>${vo.accountNo }</td>
									<td>${vo.accountName }</td>
									<c:if test="${vo.balanceType eq 'D' }">
									<td>차변</td>
									</c:if>
									<c:if test="${vo.balanceType eq 'C' }">
									<td>대변</td>
									</c:if>
									<td>${vo.insertUserid }</td>
									<td>${vo.insertDay }</td>
									<td>${vo.updateUserid }</td>
									<td>${vo.updateDay }</td>
									<td id="no" style="display:none;">${vo.no }</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				</div>
			</div>

		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->

	<%-- 페이징 --%>
	<div class="pagination">
		<ul>
			<c:choose>
				<c:when test="${dataResult.pagination.prev }">
					<li><a href="${pageContext.servletContext.contextPath }/17/60/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
				<c:choose>
					<c:when test="${pg eq dataResult.pagination.page }">
						<li class="active"><a href="${pageContext.servletContext.contextPath }/17/60/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${pg }">${pg }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.servletContext.contextPath }/17/60/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${pg }">${pg }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${dataResult.pagination.next }">
					<li><a href="${pageContext.servletContext.contextPath }/17/60/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- PAGE CONTENT ENDS -->

	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();
		});
	</script>

		<script>

    // 테이블의 Row 클릭시 값 가져오기
    $("#tb_account_management tr").dblclick(function(){
        var str = "";
        var tdArr = new Array();    // 배열 선언

        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();

        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });

        console.log("배열에 담긴 값 : "+tdArr);

        var accountOrder = td.eq(0).text();
        var accountNo = td.eq(1).text();
        var accountName = td.eq(2).text();
        var hiddenNo = td.eq(8).text();

        //$(".selectedAccount").val(accountNo).trigger('change');
        //$("#selectedAccount").val(accountNo).prop("selected", true);
        //$("#selectedAccount").val("10230123").attr("selected", "selected");
       	//$("#selectedAccount").val(accountNo);
        //$("#selectedAccount  option:contains(" + accountNo + ")").text(accountNo);
     	//$('#selectedAccount').chosen().val(accountNo);

     	$('#selectedAccount').val(accountNo).trigger('chosen:updated');
        $("#accountOrder").val(accountOrder);
        $("#accountName").val(accountName);
        $("#no").val(hiddenNo);

    });


    //계정과목에 따른 계정명 불러오기
    $('#selectedAccount').change(function () {
    	var accountName =$(this).find('option:selected').attr('data-accountName');
    	$('#accountName').val(accountName);
   	});


    //리셋버튼 누를 시 초기화
    $("#account-reset-btn").click(function() {
    	$('#selectedAccountStatementType').val("B");
    	$('#accountOrder').val("");
    	$('#accountUsedyear').val("2019");
    	$('#accountName').val("");
    	$('#selectedAccount').val(null).trigger('chosen:updated');
    });


	</script>
</body>
</html>
