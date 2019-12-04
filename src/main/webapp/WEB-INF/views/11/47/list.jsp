<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
	label, h4{display: inline-block}
	
	#filter-area{
		display: grid;
		grid-template-columns: 845px 845px;
		grid-template-rows: 70px 30px;
	}
	
	.filter-top{
		grid-column: 1 / 3;
		grid-row: 1;
		
		display: grid;
	}
	
	.input-area-wrapper{
		display: grid;
		grid-template-columns: repeat(4, 420px);
		grid-template-rows: 80px 80px;
		gap: 10px;
		
		margin: auto 0;
	}
	
	.input-area{
		grid-column: auto;
		margin: auto 0;
	}
	
	.input-area>*, .input-area>input{
		margin: auto;
	}
	
	.input-area-radio{
		display: grid;
		grid-template-columns: 120px 50px 50px 80px;
	}
	.radio-label{
		margin-right: 5px;
	}
	.filter-left{
		grid-column: 1;
		grid-row: 2;
		
		display: grid;
	}
	
	.filter-right{
		grid-column: 2;
		grid-row: 2;
		
		display: grid;
	}
	
	.order-list{
		height: 80px;
		margin: auto 0;
		
		display: grid;
		grid-template-columns: repeat(4,80px);
		gap: 10px;
	}
	
	.order-list>li{
		display: inline-block;
		float: left;
	}
	
	.chkbox-list-area{
		margin: auto 0;		/** **/
	}
	
	.chkbox-list{
		float: right;
		margin-left: 10px;
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


.prod-list-opts li {
    list-style: none;
    float: left;
}

.checkbox {
	float: left;
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
				<h1 class="pull-left">단기차입금현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<!-- PAGE CONTENT BEGINS -->
			<form id="filter-area">
				<section class="filter-top">
					<div class="input-area-wrapper">
						<div class="input-area">
							<label><h4>차입일자</h4></label> 
							<input type="date">
						</div>
						<div class="input-area">
							<label><h4>만기일자</h4></label> 
							<input type="date">
						</div>
						<div class="input-area input-area-radio">
							<label><h4>이자지급방식</h4></label> 
							<div class="radio-input"><label class="radio-label">년</label><input type="radio" name="intRate"></div>
							<div class="radio-input"><label class="radio-label">월</label><input type="radio" name="intRate"></div>
							<div class="radio-input"><label class="radio-label">해당없음</label><input type="radio" name="intRate"></div>
						</div>
						<div class="input-area">
							<label><h4>은행명</h4></label> 
							<input type="text">
							<input type="submit" value="조회">
						</div>
					</div> <!-- input-area-wrapper end -->	</section> <!-- filter-top end -->
				<section class="filter-left">
					<ul class="order-list">
						<li><h4>차입일자</h4></li>
						<li><h4>만기일자</h4></li>
						<li><h4>등록일자</h4></li>
						<li><h4>차입금액</h4></li>
					</ul>
				</section> <!-- filter-left end -->
				<section class="filter-right">
					<div class="chkbox-list-area">
						<div class="chkbox-list">
							<label>삭제포함</label>
							<input type="checkbox" name="deleteFlag">
						</div>
						<div class="chkbox-list">
							<label>상환완료포함</label>
							<input type="checkbox" name="repayComplFlag">
						</div>
					</div>
				</section> <!-- filter-right end -->
			</form>
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