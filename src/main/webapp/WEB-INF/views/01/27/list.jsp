<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

/*체크박스 모두선택*/
function allChk(obj){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
        }
    }
}
</script>
<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>

<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />

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
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post">
						<div class="row-fluid" style="float: left">
							<div class="span6">
								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 사업자 등록번호:&nbsp; </label> <input
										type="text" id="no" name="no" placeholder="사업자등록번호"
										class="col-xs-10 col-sm-5" />
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 상호명:&nbsp; </label> <input type="text"
										id="name" name="name" placeholder="상호명" class="col-xs-10 col-sm-5" />
								</div>

								<br />

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 대표자:&nbsp; </label> <input type="text"
										id="ceo" name="ceo" placeholder="대표자" class="col-xs-10 col-sm-5" />
								</div>

								<br />

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 주소:&nbsp; </label>
									<div class="input-append">
										<input type="text" id="address" name="address" placeholder="주소"
											class="col-xs-10 col-sm-5" readonly/>
										<button type="button" class="addressSearch" onclick="execDaumPostcode()">
											<i class="icon-search bigger-110">
											</i> 검색
										</button>
									</div>

									&nbsp; &nbsp; &nbsp; &nbsp; 상세주소: <input type="text"
										id="detailAddress" name="detailAddress" placeholder="상세주소" class="col-xs-10 col-sm-5"
										 />
								</div>

								<br />


								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 업태:&nbsp; </label> <input type="text"
										id="conditions" name="conditions" placeholder="업태" class="col-xs-10 col-sm-5" />
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 종목:&nbsp; </label> <input type="text"
										id="item" name="item" placeholder="종목" class="col-xs-10 col-sm-5" />
								</div>

								<br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 법인번호:&nbsp; </label> <input type="text"
										id="corporationNo" name="corporationNo" placeholder="법인번호"
										class="col-xs-10 col-sm-5" />
								</div>

					</div>
				
							<!-- /span -->

							<div class="span6">


								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 관할 영업소:&nbsp; </label> <input type="text"
										id="jurisdictionOffice" name="jurisdictionOffice" placeholder="관할 영업소"
										class="col-xs-10 col-sm-5" />
								</div>

								<br />

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 거래처 전화번호:&nbsp; </label> <input
										type="text" id="phone" name="phone" placeholder="거래처 전화번호"
										class="col-xs-10 col-sm-5" />
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> E-mail:&nbsp; </label> <input type="text"
										id="managerEmail" name="managerEmail" placeholder="E-mail"
										class="col-xs-10 col-sm-5" />
								</div>

								<br />

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 계좌번호:&nbsp; </label>
									<div class="input-append">
										<input type="text" id="depositNo" name="depositNo" placeholder="계좌번호"
											class="col-xs-10 col-sm-5" />
										<button type="button" class="search_account">
											<i class="icon-search bigger-110"></i> 조회
										</button>
									</div>
									&nbsp; &nbsp; &nbsp; &nbsp; 은행코드: <input type="text"
										id="bankCode" name="bankCode" placeholder="자동입력" class="col-xs-10 col-sm-5"
										readonly />
								</div>

								<br />

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 은행명:&nbsp; </label> <input type="text"
										id="bankName" name="bankName" placeholder="자동입력" class="col-xs-10 col-sm-5"
										readonly />
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 예금주:&nbsp; </label> <input type="text"
										id="depositHost" name="depositHost" placeholder="자동입력" class="col-xs-10 col-sm-5"
										readonly />
								</div>

								<br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 거래처 담당자 성명:&nbsp; </label> <input
										type="text" id="managerName" name="managerName" placeholder="거래처 담당자"
										class="col-xs-10 col-sm-5" />
								</div>
							
							</div>
						</div>
							<!-- span -->
							<div class="row-fluid">
								<div class="span8">
									<button class="btn btn-info btn-small">조회</button>
									<button class="btn btn-danger btn-small" id="delete">삭제</button>
									<button class="btn btn-warning btn-small" id="update">수정</button>
									<button type="submit" class="btn btn-primary btn-small"
										formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">입력</button>
									<button class="btn btn-default btn-small" id="re">취소</button>
								</div>
								<!-- /.span -->
							</div>

							<br />
					</form>



					<div class="row-fluid">
						<div class="span12">

							<div style="width: 100%; overflow-x: auto">
								<table id="sample-table-1"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th scope="col" class="center">
												<label class="pos-rel">
													<input id="allCheck" type="checkbox" class="ace" onclick="allChk(this);"/>
													<span class="lbl">
													</span>
												</label>
											</th>
											<th scope="col">사업자등록번호</th>
											<th scope="col">상호</th>
											<th scope="col">대표자</th>
											<th scope="col">주소</th>
											<th scope="col">업태/종목</th>
											<th>관할영업소</th>
											<th>거래처 전화번호</th>
											<th>거래처 담당자 성명</th>
											<th>e-mail</th>
											<th>은행명</th>
											<th>계좌번호</th>
											<th>예금주</th>
											<th>입력일자</th>
											<th>입력담당자</th>
											<th>수정일자</th>
											<th>수정담당자</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${list }" var="vo" varStatus="status">
											<tr>
												<td class="center">
													<label class="pos-rel"> 
														<input name="RowCheck" type="checkbox" class="ace" />
														<span class="lbl">
														</span>
													</label>
												</td>
												<td>${vo.no }</td>
												<td>${vo.name }</td>
												<td>${vo.ceo }</td>
												<td>${vo.address } ${vo.detailAddress }</td>
												<td>${vo.conditions }/${vo.item }</td>
												<td>${vo.jurisdictionOffice }</td>
												<td>${vo.phone }</td>
												<td>${vo.managerName }</td>
												<td>${vo.managerEmail }</td>
												<td></td>
												<td>${vo.depositNo }</td>
												<td></td>
												<td>${vo.insertDay }</td>
												<td>${vo.insertUserid }</td>
												<td>${vo.updateDay }</td>
												<td>${vo.updateUserid }</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
							<!-- /span -->
						</div>
					</div>
				</div>


				<!-- /row -->
				<!-- PAGE CONTENT ENDS -->
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<div class="pagination">
			<!-- 페이징 공통 -->
			<ul>
				<li class="disabled"><a href="#"><i
						class="icon-double-angle-left"></i></a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
			</ul>
		</div>
	</div>
	<!-- /.page-content -->
	
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>