<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> <!-- spring에서 제공하는 태그 라이브러리 -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- form태그 라이브러리 -->
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
				<h1 class="pull-left">은행코드관리</h1>
			</div><!-- /.page-header -->
			
			<div class="row-fluid">
				<div class="span12">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
						
						<div class="span6">
						
						<div class="control-group">
							<label class="control-label" for="form-field-codename">은행코드</label>
							<div class="controls">
								<input class="span5" type="text" id="form-field-code" name="code" placeholder="은행코드"/>
<%-- 								<form:input path="code" /> --%>

								<input id="btn-check-code" type="button" value="중복확인">
								<img id="img-checkcode" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
								
								
							</div>
						</div>
							
							<div class="control-group">	
								<label class="control-label" for="form-field-codename">은행명</label>
								<div class="controls">
									<input class="span8" type="text" id="form-field-name" name="name" placeholder="은행명"/>
							</div>	
							
							</div>
						
						<div class="control-group">
								<label class="control-label" for="form-field-phoe">은행 전화번호</label>
								<div class="controls">
									<input class="span8" type="text" id="form-field-phone" name="phone" placeholder="phone"/>
								</div>
							</div>
						<div class="control-group">
							<label class="control-label" for="form-field-codename">거래시작일</label>
								<div class="controls">
									<div class="row-fluid input-append">
									<input class="span7 date-picker" id="id-date-picker-1" name="dealDate" type="text" data-date-format="yyyy-mm-dd" />
										<span class="add-on">
										<i class="icon-calendar"></i>
										</span>
									</div>
								</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-mgr">담당자</label>
							<div class="controls">
								<input class="span8" type="text" id="form-field-mgr" name="mgr" placeholder="담당자"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-mgrphone">담당자전화번호</label>
							<div class="controls">
								<input class="span8" type="text" id="form-field-mgrphone" name="mgrPhone" placeholder="담당자전화번호"/>
								</div>
							</div>
						
						</div>
						
						<div class="span6">		
							<div class="control-group">
								<label class="control-label" for="form-field-store">지점명</label>
								<div class="controls">
									<input class="span10" type="text" id="form-field-store" name="store" placeholder="지점명"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-fax">FAX</label>
								<div class="controls">
									<input class="span10" type="text" id="form-field-fax" name="fax" placeholder="FAX"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-mgremail">담당자이메일</label>
								<div class="controls">
									<input class="span10" type="text" id="form-field-mgremail" name="mgrEmail" placeholder="담당자이메일"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-address">주소</label>
								<div class="controls">
			                        <input type="button" class="btn-primary box"
			                            onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			                   	 </div>
			                   	 
			                   	 <div class="controls">
			                        <input class="span2" type="text" name="post" class="box" id="postcode"
			                            placeholder="우편번호" required>
			                        <input class="span6" type="text" name="roadAddress" class="box"
			                            id="roadAddress" placeholder="도로명주소" required>
			                    </div>
			                  
			                    <label class="control-label" for="form-field-address"></label>
			                    <div class="controls">
									<input class="span8" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"/>
								</div>
							</div>
						</div>
						
						<div class="hr hr-18 dotted"></div>
						
						
						<div class="span8">
							<button id="search" class="btn btn-info btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
							<button class="btn btn-danger btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
							<button class="btn btn-warning btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
							<button class="btn btn-primary btn-small" id="inputbtn" >입력</button>
							<button type="button" class="btn btn-success btn-small mybtn" id="formReset">초기화</button>
						</div>
						
						<div class="span8">
						</div>
						
					<table id="simple-table" class="table  table-bordered table-hover">
                          <thead>
                              <tr>
                                  <th class="center">은행코드</th>
                                  <th class="center">은행명</th>
                                  <th class="center">지점명</th>
                                  <th class="center">거래시작일</th>
                                  <th class="center">전화번호</th>
                                  <th class="center">FAX</th>
                                  <th class="center">우편번호</th>
                                  <th class="center">은행주소</th>
                                  <th class="center">담당자</th>
                                  <th class="center">담당자전화번호</th>
                                  <th class="center">담당자이메일</th>
                                    </tr>
                                 </thead>

                                 <tbody>
                                 	<c:forEach items="${dataResult.datas }" var="bankvo">
                                    <tr>
                                       
                                       <td class="center">${bankvo.code }</td>
                                       <td class="center">${bankvo.name }</td>
                                       <td class="center">${bankvo.store }</td>
                                       <td class="center">${bankvo.dealDate }</td>
                                       <td class="center">${bankvo.phone }</td>
                                       <td class="center">${bankvo.fax }</td>
                                       <td class="center">${bankvo.post }</td>
                                       <td class="center">${bankvo.address }</td>
                                       <td class="center">${bankvo.mgr }</td>
                                       <td class="center">${bankvo.mgrPhone }</td>
                                       <td class="center">${bankvo.mgrEmail }</td>
                                    </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
		</form>					
			<!-- PAGE CONTENT ENDS -->
	</div><!-- /.span -->
   </div><!-- /.row-fluid -->
  </div><!-- /.page-content -->
  
  <div class="pagination">
				<ul>
				<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
						<i class="icon-double-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
					<c:choose>
						<c:when test="${pg eq dataResult.pagination.page }">
							<li class="active">
								<a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
				</ul>
			</div>
  
  </div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
  <script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>	
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function execDaumPostcode() {
            new daum.Postcode(
                    {
                        oncomplete : function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                            alert(fullRoadAddr);
                            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                    && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                    && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                            if (fullRoadAddr !== '') {
                                fullRoadAddr += extraRoadAddr;
                            }
 
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('roadAddress').value = fullRoadAddr;
                            document.getElementById('jibunAddress').value = data.jibunAddress;
 
                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                            if (data.autoRoadAddress) {
                                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                                var expRoadAddr = data.autoRoadAddress
                                        + extraRoadAddr;
                                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                        + expRoadAddr + ')';
 
                            } else if (data.autoJibunAddress) {
                                var expJibunAddr = data.autoJibunAddress;
                                document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                        + expJibunAddr + ')';
 
                            } else {
                                document.getElementById('guide').innerHTML = '';
                            }
                        }
                    }).open();
   		    };
   	
	        $(function() {
	        	  $(".chosen-select").chosen();
					
					$('.date-picker').datepicker().next().on(ace.click_event, function(){
						$(this).prev().focus();
					});
					
			$("#simple-table tr").click(function(){ 
				
				var tr = $(this);
				var td = tr.children();
				
				$("input[name=code]").val(td.eq(0).text());
			    $("input[name=name]").val(td.eq(1).text());
			    $("input[name=store]").val(td.eq(2).text());
			    $("input[name=dealDate]").val(td.eq(3).text());
			    $("input[name=phone]").val(td.eq(4).text());
			    $("input[name=fax]").val(td.eq(5).text());
			    $("input[name=post]").val(td.eq(6).text());
			    $("input[name=roadAddress]").val(td.eq(7).text());
			    $("input[name=mgr]").val(td.eq(8).text());
			    $("input[name=mgrPhone]").val(td.eq(9).text());
			    $("input[name=mgrEmail]").val(td.eq(10).text());
			});
			
		/////////////////////////////////////////////////////////////////
		//조회시 필요없는 정보 입력 X
			$("#search").click(function(){
				$("#postcode").attr("disabled",true);
				$("#roadAddress").attr("disabled",true);
				$("#detailAddress").attr("disabled",true);
				});
		
		/////////////////////////////////////////////////////////////////
		//은행코드 중복체크
			$("#form-field-code").change(function(){

				$("#btn-check-code").show();
				$("#img-checkcode").hide();
			});	
			
			$("#inputbtn").hide();	// 초기 입력버튼이 보이지 않도록 하는 코드
			$("#btn-check-code").click(function(){
				
				var code = $("#form-field-code").val();
				if(code == ""){
					return;
				}
			
				// ajax 통신
				$.ajax({
					url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/api/checkcode?code=" + code,
					type: "get",
					dataType: "json",
					data: "",
					success: function(response){
						if(response.result == "fail"){
							console.error(response.message);
							return;
						}
						console.log(response);
						
						if(response.data == true){
							alert("이미 존재하는 은행코드입니다.");
							$("#input-code").val("");
							//$("#inputbtn").hide();
							$("#input-code").focus();
							return;
						}else{
							$("#inputbtn").show();
						
							$("#btn-check-code").hide();
							$("#img-checkcode").show();
						}
						},
						error:function(xhr,error) {
							console.err("error" + error);
						}
					});
				});	
		
	  		});
	    </script>
</body>
</html>