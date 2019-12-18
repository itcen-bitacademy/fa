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
/* tr td:first-child { */
/* 	padding-right: 40px; */
/* } */
.radio {
	float: left;
	width: 10%;
}
.search-input-width-first {
	width: 130px;
}
.search-input-width-second {
	width: 235px;
}
.debt-name-input {
	width: 420px;
}
.mgr-input {
	width: 90px;
	display: inline;
}
.mgr-number-input-h4 {
	display: inline;
	margin-left: 30px;
	margin-right: 20px;
}
.mgr-call-input {
	width: 150px;
	display: inline;
}
.number-input{
	text-align:right;
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
			
		<!-- PAGE CONTENT BEGINS -->
		<form id="myform" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
		<div class="container-fluid">

		<!-- Example row of columns -->
			<div class="row">
				<div class="span8">
					<table>
						<tr >
							<td><h4>은행코드</h4></td>
							<td>
								<input type="text" name="code" class="code" id="code" 
								 maxlength="7" placeholder=" 은행코드(3) + 지점코드(4) " required 
								 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
								 
								<input id="btn-check-code" type="button" value="중복확인" /> 
								<img id="img-checkcode" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
							</td>
						</tr>
								
						<tr >
							<td><h4>지점명</h4></td>
							<td colspan="2" align=left>
								<input type="text" name="store" id="store" required />
							</td>
						</tr>
							
						<tr >
							<td><h4>FAX</h4></td>
							<td colspan="2" >
								<input type="text" name="fax" id="fax" maxlength="15" required
								  onKeyup="inputTelNumber(this);"
								 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
								 />
							</td>
						</tr>
							
						<tr>
						<td><h4>거래시작일</h4></td>
 							<td colspan="2"> 
								<div class="control-group">
									<div class="row-fluid input-append">
										<input class="date-picker" id="id-date-picker-1" name="dealDate" type="text" data-date-format="yyyy-mm-dd" readOnly required/>
										<span class="add-on">
										<i class="icon-calendar"></i>
										</span>
									</div>
								</div>
 							</td> 
						</tr>	
						
						<!-- 줄내림  -->
						<tr style="visibility:hidden;">
							<td><h4></h4></td>
							<td colspan="2">
							<input type="text" />	
							</td>
						</tr>
						
						<tr >
							<td><h4>담당자</h4></td>
							<td colspan="2">
								<input type="text" name="mgr" id="mgr" required />
							</td>
						</tr>
						
						<tr >
							<td><h4>담당자전화번호</h4></td>
							<td colspan="2">
								<input type="text" name="mgrPhone" id="mgrPhone" maxlength="15" required
								  onKeyup="inputTelNumber(this);"
								 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />
							</td>
						</tr>
						</table>
					</div>

					<div class="span8">
						<table>
							<tr>
								<td><h4>은행명</h4></td>
								<td colspan="2">
									<input type="text" name="name" id="name" required />
								</td>
							</tr>
							<tr >
								<td><h4>은행전화번호</h4></td>
								<td colspan="2">
									<input type="text" name="phone" id="phone" maxlength="15" required
								 	 onKeyup="inputTelNumber(this);"
									 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />
								</td>
							</tr>
							
							
							<tr >
								<td><h4>주소</h4></td>
								<td colspan="2">
								<div class="control-group"> 
			                       <div>
									<input type="button" class="btn-primary box"
			                            onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			                       </div>
									<div>
			                        
			                      		<input type="text" name="post" class="box" id="postcode"
			                           		placeholder="우편번호" readOnly required>
									</div>			
									<div>
			                       		<input  type="text" name="roadAddress" class="box"
			                           		id="roadAddress" placeholder="도로명주소" readOnly required>
									</div>                     
									<div>
					                 		<input  type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"/>
									</div>
								</div>
								</td>
							</tr>
							
									<!-- 줄내림  -->
								<tr style="visibility:hidden;">
									<td><h4></h4></td>
									<td colspan="2">
									<input type="text" />
									</td>
								</tr>
								
							
							
							<tr >
								<td><h4>담당자이메일</h4></td>
								<td colspan="2">
									<input type="email" name="mgrEmail" id="email" required />
										ex) jisu@naver.com
								</td>
							</tr>
						
						</table>
					</div>
				</div>
			
			</div>
		
			<hr>
			<div>
				<button id="search" class="btn btn-info btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
				<button class="btn btn-danger btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
				<button class="btn btn-warning btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
				<button class="btn btn-primary btn-small" id="inputbtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">입력</button>
				<button type="reset" class="btn btn-success btn-small mybtn" id="formReset">초기화</button>
				<hr>
			</div>
		
		</form>			
		
		<!-- PAGE CONTENT ENDS -->
		<p>총 ${dataResult.pagination.totalCnt }건</p>	
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
          	<tbody id= "tbody-list">
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
             
		<!-- PAGE CONTENT ENDS -->
		</div><!-- /.page-content -->
  
  		<div class="pagination">
			<ul>
			<c:choose>
				<c:when test="${dataResult.pagination.prev }">
					<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?code=${code }&page=${dataResult.pagination.startPage - 1 }">
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
							<a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?code=${code }&page=${pg }">${pg }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?code=${code }&page=${pg}">${pg }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
			
				<c:when test="${dataResult.pagination.next }">
					<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?code=${code }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
			
   </div>/.main-content -->
 </div>/.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
  <script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } else {
                    $('#detailAddress').val('');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#post').val(data.zonecode);
                $('#roadAddress').val(addr);

                document.getElementById("detailAddress").focus();
               
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
   		    
   		    /////////////////////////////////////////////////////////////////////////////////////////
   	
	        $(function() {
	        	  $(".chosen-select").chosen();
					
					$('.date-picker').datepicker().next().on(ace.click_event,function(){
						$(this).prev().focus();
					});
	       
					///////////////////////////////////////////////////////////////////////////////////////////////
		
		
					/////////////////////////////////////////////////////////////////
					//은행코드 중복체크
						$("#code").change(function(){
							$("#img-checkcode").hide();
							$("#btn-check-code").show();
						});	
					
						$("#btn-check-code").click(function(){
							
							var code = $("#code").val();
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
										$("#input-code").focus();
										return;
									}else{
										$("#btn-check-code").hide();
										$("#img-checkcode").show();
										ischecked = true;
									}
									},
									error:function(xhr,error) {
										console.err("error" + error);
									}
								});
							});	
					
				  		});
   		    
			   		    
				        $("#inputbtn").click(function(){
				        	   if(ischecked == false){
				        	      alert("은행코드를 중복체크 해야합니다.");
				        	      return;
				        	   }
				        	   else{
				        	      $('#myform').add();
				        	   }
				        	 });
	        
			////////////////////////////////////////////////////////////////////////////////////////
			
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
				$("#name").attr("disabled",true);
				$("#store").attr("disabled",true);
				$("#id-date-picker-1").attr("disabled",true);
				$("#phone").attr("disabled",true);
				$("#fax").attr("disabled",true);
				$("#postcode").attr("disabled",true);
				$("#roadAddress").attr("disabled",true);
				$("#detailAddress").attr("disabled",true);
				$("#mgr").attr("disabled",true);
				$("#mgrPhone").attr("disabled",true);
				$("#mgrEmail").attr("disabled",true);
				
				
				$("#name").val('');
				$("#store").val('');
				$("#id-date-picker-1").val('');
				$("#phone").val('');
				$("#fax").val('');
				$("#postcode").val('');
				$("#roadAddress").val('');
				$("#detailAddress").val('');
				$("#mgr").val('');
				$("#mgrPhone").val('');
				$("#mgrEmail").val('');
				});
		
		///////////////////////////////////////////////////////////////
		//이메일 유효성 검사
		$("#email").change(function(){
			function validateEmail(email) {
				var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				return re.test(email);
				}
							
			
				var email = $("#email").val();
				if (email == '' || !re.test($mgrEmail)) {
					alert("올바른 이메일 주소를 입력하세요")
				return false;
				}
			
		});
		
		
		
		/////////////////////////////////////////////////////////////////
		//전화번호 자동 하이픈
			function inputTelNumber(obj) {
			    var number = obj.value.replace(/[^0-9]/g, "");
			    var tel = "";
			
			    // 서울 지역번호(02)가 들어오는 경우
			    if(number.substring(0, 2).indexOf('02') == 0) {
			        if(number.length < 3) {
			            return number;
			        } else if(number.length < 6) {
			            tel += number.substr(0, 2);
			            tel += "-";
			            tel += number.substr(2);
			        } else if(number.length < 10) {
			            tel += number.substr(0, 2);
			            tel += "-";
			            tel += number.substr(2, 3);
			            tel += "-";
			            tel += number.substr(5);
			        } else {
			            tel += number.substr(0, 2);
			            tel += "-";
			            tel += number.substr(2, 4);
			            tel += "-";
			            tel += number.substr(6);
			        }
			    
			    // 서울 지역번호(02)가 아닌경우
			    } else {
			        if(number.length < 4) {
			            return number;
			        } else if(number.length < 7) {
			            tel += number.substr(0, 3);
			            tel += "-";
			            tel += number.substr(3);
			        } else if(number.length < 11) {
			            tel += number.substr(0, 3);
			            tel += "-";
			            tel += number.substr(3, 3);
			            tel += "-";
			            tel += number.substr(6);
			        } else {
			            tel += number.substr(0, 3);
			            tel += "-";
			            tel += number.substr(3, 4);
			            tel += "-";
			            tel += number.substr(7);
			        }
			    }
			
			    obj.value = tel;
			}	
		
	
	    /////////////////////////////////////////////////////////////////
		//은행코드 유효성검사
		function onlyNumber(event){
		    event = event || window.event;
		    var keyID = (event.which) ? event.which : event.keyCode;
		    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		        return;
		    else
		        return false;
		}
		 
		function removeChar(event) {
		    event = event || window.event;
		    var keyID = (event.which) ? event.which : event.keyCode;
		    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		        return;
		    else
		        event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
		
		
		
		
		</script>
</body>
</html>