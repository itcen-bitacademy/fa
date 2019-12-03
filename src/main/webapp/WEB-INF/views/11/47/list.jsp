<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.radio {
	float: left;
	width: 20%;
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
td{display: inline-block;}
.first-column {width:60px; padding-left:20px;}
.second-column {width:180px;}
.third-column {width:60px;}
.fourth-column {width:70px;}
.fifth-column {width:90px;}
.sixth-column {width:180px;}
.seventh-column{width:50px;}
.eighth-column{width:80px;}
.nineth-column{width:120px;}
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
				<h1 class="pull-left">단기차입금현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
				
					<!-- PAGE CONTENT BEGINS -->
					<div>
						<div>
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							<table style="width:100%;">
								<tbody>
								<tr>
									<td class="first-column"><h4>차입일자</h4></td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input type="date" name="debtDate" id="debtDate"  data-date-format="yyyy-mm-dd" />
				                         </div>
									</td>
									<td class="third-column"><h4>만기일자</h4></td>
									<td class="fourth-column">
				                        <div class="row-fluid input-prepend">
				                           <input type="date" name="expDate" id="expDate"  data-date-format="yyyy-mm-dd" />
				                         </div>
									</td>
									<td class="fifth-column"><h4>이자지급방식</h4></td>
									<td class="sixth-column">
										<div class="radio">
											<label>
												<input name="form-field-radio" type="radio" class="ace" />
												<span class="lbl">년</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="form-field-radio" type="radio" class="ace" />
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio" style="width:15%;">
											<label>
												<input name="form-field-radio" type="radio" class="ace" />
												<span class="lbl">만기</span>
											</label>
										</div>
									</td>
									<td class="seventh-column"><h4>은행명</h4></td>
									<td class=eighth-column>
										<input type="text" name="bankName"/>
									</td>
									<td class="nineth-column">
										<button type="button" class="btn">조회</button>
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
												<li class="order-item"><h4><a href="#">차입일자</a></h4></li>
												<li class="order-item"><h4><a href="#">만기일자</a></h4></li>
												<li class="order-item"><h4><a href="#">등록일자</a></h4></li>
												<li class="order-item"><h4><a href="#">차입금액</a></h4></li>
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
							<th class="center">단기차입금코드</th>
							<th class="center">단기차입금명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자 ~ 만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행코드</th>
							<th class="center">계좌</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list }" var="vo" varStatus="status">
							<tr>
							<td class="center">2019112701</td>
							<td>GS칼텍스는...</td>
							<td class="center">008-국내은행</td>
							<td class="center">70,000,000,000</td>
							<td class="center">월</td>
							<td class="center">2019-10-29 ~ 2029-10-29</td>
							<td class="center">1.99%</td>
							<td class="center">월</td>
							<td class="center">홍길동</td>
							<td class="center">010-1234-5678</td>
							<td class="center">0010987</td>
							<td class="center">한국은행</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>	
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>