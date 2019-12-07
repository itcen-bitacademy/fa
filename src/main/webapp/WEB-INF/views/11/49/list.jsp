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
.radio {
	float: left;
	width: 10%;
}

.prod-list-opts {
	padding: 10px 15px 9px 11px;
	position: relative;
}

.prod-list-opts .order-list {
    margin: 3px 0 0;
    padding: 0;
    overflow: hidden;
}

.prod-list-opts .order-item {
    float: left;
    padding: 0 9px 0 8px;
    
}

.prod-list-opts li {
    list-style: none;
    float: left;
}

.checkbox {
	float: left;
}

form {
	margin-bottom: 0px;
}

/* table columns  */
.first-column {width:170px; padding-left:20px;}
.second-column {width:400px;}
.third-column {width:120px;}
.fourth-column {width:70px;}
.fifth-column {width:200px;}
.sixth-column {padding-left:20px;}

/* second row */
.span2 {padding-left:40px; padding-top:20px;}

</style>
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">장기차입금현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
				
					<!-- PAGE CONTENT BEGINS -->
					<div>
						<div>
						<form class="form-horizontal">
							<table style="width:100%;">
								<tbody>
								<tr>
									<td class="first-column"><h4>차입일자</h4></td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input class="date-picker" type="text" name="debtDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd" />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                           
				                         
				                         </div>
									</td>
									
									<td class="third-column"><h4>이자지급방식</h4></td>
									<td>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="Y"/>
												<span class="lbl">년</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="M"/>
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="E"/>
												<span class="lbl">만기</span>
											</label>
										</div>
									</td>
									<td class="fourth-column"><h4>은행명</h4></td>
									<td class="fifth-column">
										<input type="text" name="bankName"/>
									</td>
									<td class="sixth-column">
										<button type="submit" class="btn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
				
									</td>
								</tr>
								<tr>
								<td class="first-column"><h4>만기일자</h4></td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input class="date-picker" type="text" name="expDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd" />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                         
				                         </div>
									</td>
								</tr>
								</tbody>
							</table>	
							</form>
							
							<div class="row-fluid">
								<div class="span9">
									<div class="prod-list-opts">
										<div class="order-opt">
											<ul class="order-list">
												<li class="order-item"><h4><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?sort=d">차입일자</a></h4></li>
												<li class="order-item"><h4><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?sort=e">만기일자</a></h4></li>
												<li class="order-item"><h4><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?sort=i">등록일자</a></h4></li>
												<li class="order-item"><h4><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?sort=m">차입금액</a></h4></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="span2">
									<div class="checkbox">
										<label>
											<input name="form-field-checkbox" type="checkbox" class="ace" />
											<span class="lbl">삭제포함</span>
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input name="form-field-checkbox" type="checkbox" class="ace" />
											<span class="lbl">상환완료포함</span>
										</label>
									</div>
								</div>
							</div>
															
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
			
		<!-- list -->
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">장기차입금코드</th>
							<th class="center">장기차입금명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자 ~ 만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행명</th>
							<th class="center">계좌</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${dataResult.datas }" var="ltermvo">
						<tr>
							<td class="center"><label class="pos-rel">
							<input type="checkbox" class="ace" /> <span class="lbl"></span>
							</label></td>
							<td class="center">${ltermvo.code}</td>
							<td>${ltermvo.name}</td>
							 <c:choose>
										<c:when test="${ltermvo.majorCode eq '001'}"><td class="center">국내은행</td></c:when>
										<c:when test="${ltermvo.majorCode eq '002'}"><td class="center">저축은행</td></c:when>
										<c:when test="${ltermvo.majorCode eq '003'}"><td class="center">신용금고</td></c:when>
										<c:when test="${ltermvo.majorCode eq '004'}"><td class="center">새마을금고</td></c:when>
										<c:when test="${ltermvo.majorCode eq '005'}"><td class="center">외국계은행</td></c:when>
										<c:otherwise><td class="center">증권</td></c:otherwise>
							</c:choose>	
							<td class="center">${ltermvo.debtAmount}</td>
							<td class="center">${ltermvo.repayBal}</td>
							<c:choose>
										<c:when test="${ltermvo.repayWay eq 'Y'}"><td class="center">년</td></c:when>
										<c:when test="${ltermvo.repayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>		
							<td class="center">${ltermvo.debtExpDate}</td>
							<td class="center">${ltermvo.intRate}%</td>
							<c:choose>
										<c:when test="${ltermvo.intPayWay eq 'Y'}"><td class="center">년</td></c:when>
										<c:when test="${ltermvo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>	
							
							<td class="center">${ltermvo.mgr}</td>
							<td class="center">${ltermvo.mgrCall}</td>
							<td class="center">${ltermvo.bankName}</td>
							<td class="center">${ltermvo.depositNo}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>	
				
				<div class="pagination">
				<ul>
				<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?${uri}&page=${dataResult.pagination.startPage - 1 }">
						<i class="icon-double-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
					<c:choose>
						<c:when test="${pg eq dataResult.pagination.page }">
						<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?${uri}&page=${pg }">${pg }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?${uri}&page=${pg}">${pg }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?${uri}&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
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

$(function() {
	  $(".chosen-select").chosen();
		
		$('.date-picker').datepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
});



</script>


</body>
</html>