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
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.form-horizontal .control-label {text-align: left;}

h4{
   font-size:13px;
   font-family: 'Apple SD Gothic Neo','나눔고딕',NanumGothic,'맑은 고딕',Malgun Gothic,'돋움',dotum,'굴림',gulim,applegothic,sans-serif;
}


.textarea{
   resize: none;
   width: 282px;
   height: 84px;
}

tr td:first-child {
   padding-right: 10px;
}

.radio {
   float: left;
   width: 17%;
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
   margin-left: 42px;
   margin-right: 20px;
}

.mgr-call-input {
   width: 150px;
   display: inline;
}

.number-input{
   text-align:right;
}

.mybtn{margin-right:10px;}

#staticBackdrop {
   z-index: -1;
}

.selected{
   background-color:#ddd;
}

#simple-table{
   min-width: 2000px; 
   margin-bottom: 0; 
   width: auto;"
}


.margin-top{
    margin-top: 10px;
}

html,body{
         overflow-x:hidden;
      height:100%;
   }
   .main-container{
      height:calc(100% - 84px);
      overflow-x: hidden;
   }
   .main-content{
      overflow:auto;
   }
   .page-content{
      min-width:1280px;
   }
   @media screen and (max-width: 920px) {
      .main-container{
         height:calc(100% - 84px);
      }
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
		<form id="myform" class="form-horizontal">
		<div class="container-fluid">

		<!-- Example row of columns -->
			<div class="row">
				<div class="span8">
					<table>
						<tr >
							<td><label class="control-label">은행코드</label></td>
							<td>
								<input type="text" name="code" class="code" id="code" 
								 maxlength="7" placeholder="은행코드(3) + 지점코드(4) "  
								 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />
								 
								<input id="btn-check-code" type="button" value="중복확인" />
									<i id="img-checkcode" class="icon-ok bigger-180 blue" style="display: none;"></i> 
							</td>
						</tr>
								
						<tr >
							<td><label class="control-label">지점명</label></td>
							<td colspan="2" align=left>
								<input style="margin:10px 0 0 0" type="text" name="store" id="store" maxlength="15" />
							</td>
						</tr>
							
						<tr >
							<td><label class="control-label">FAX</label></td>
							<td colspan="2" >
								<input type="text" name="fax" id="fax" placeholder="숫자만입력하세요. "
									maxlength="13" onKeyup="inputTelNumber(this);"
								  
								 style="margin:10px 0 0 0"/>
							</td>
						</tr>
							
						<tr>
						<td><label class="control-label" >거래시작일</label></td>
 							<td colspan="2"> 
								<div class="control-group">
									<div class="row-fluid input-append">
										<input class="date-picker" id="id-date-picker-1" name="dealDate" type="text"
											 data-date-format="yyyy-mm-dd" readOnly style="margin:20px 0 0 0"/>
										<span class="add-on" style="margin:20px 0 0 0" >
										<i class="icon-calendar" style="margin:3px 0 0 0"></i>
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
							<td><label class="control-label">담당자</label></td>
							<td colspan="2">
								<input type="text" name="mgr" id="mgr" maxlength="5" />
							</td>
						</tr>
						
						<tr >
							<td><label class="control-label">담당자전화번호</label></td>
							<td colspan="2">
								<input type="text" name="mgrPhone" id="mgrPhone" 
								maxlength="13" onKeyup="inputTelNumber(this);"
								  style="margin:10px 0 0 0" />
							</td>
						</tr>
						</table>
					</div>

					<div class="span8">
						<table>
							<tr>
								<td><label class="control-label">은행명</label></td>
								<td colspan="2">
									<input type="text" name="name" id="name" maxlength="10" />
								</td>
							</tr>
							<tr >
								<td><label class="control-label">은행전화번호</label></td>
								<td colspan="2">
									<input type="text" name="phone" id="phone"  placeholder="숫자만입력하세요. "
									maxlength="13" onKeyup="inputTelNumber(this);"
									  style="margin:10px 0 0 0" />
								</td>
							</tr>
							
							
							<tr >
								<td><label class="control-label" style="margin:10px 0 0 0">주소</label></td>
								<td colspan="2">
								<div class="control-group"> 
			                       <div>
			                      		<input type="text" name="post"  id="postcode" style="width:55px; margin:30px 0 0 0;"
			                           		placeholder="우편번호" readOnly >
			                       		<input  type="text" name="roadAddress" style="width:250px; margin:30px 0 0 0;"
			                           		id="roadAddress" placeholder="도로명주소" readOnly >
			                           	<input type="button" style="width:70px; margin:30px 0 0 0;"
			                           	 onclick="execDaumPostcode()" value="주소찾기" id='addressSearch'>
									</div>                     
									<div>
					                 	<input  type="text"  id="detailAddress" name="detailAddress" style="width:400px;" 
					                 	maxlength="70" placeholder="상세주소"/>
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
								<td><label class="control-label">담당자이메일</label></td>
								<td colspan="2">
									<input  name="mgrEmail" id="email" maxlength="30" />
										ex) jisu@naver.com
								</td>
							</tr>
						
						</table>
					</div>
				</div>
			
			</div>
		
			<hr>
			<div>
				<button class="btn btn-primary btn-small" id="inputbtn">입력</button>
				<button id='updatebtn' class="btn btn-warning btn-small">수정</button>
				<button id='deletebtn' class="btn btn-danger btn-small" >삭제</button>
				<button id="search" class="btn btn-info btn-small" >조회</button>
				<button class="btn btn-default btn-small mybtn" id="formReset">초기화</button>
				<hr>
			</div>
		
		</form>			
		
		<!-- PAGE CONTENT ENDS -->
		<p>총 ${dataResult.pagination.totalCnt }건</p>	
		<div style="overflow: auto;">
		<table id="simple-table" class="table  table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
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
	                          <td>${bankvo.code }</td>
	                          <td>${bankvo.name }</td>
	                          <td>${bankvo.store }</td>
	                          <td>${bankvo.dealDate }</td>
	                          <td>${bankvo.phone }</td>
	                          <td>${bankvo.fax }</td>
	                          <td>${bankvo.post }</td>
	                          <td>${bankvo.address }</td>
	                          <td>${bankvo.mgr }</td>
	                          <td>${bankvo.mgrPhone }</td>
	                          <td>${bankvo.mgrEmail }</td>
                         </tr>
                         </c:forEach>
                     </tbody>
             </table>
             </div>
             
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
			<!-- error Modal pop-up : start -->
			<!-- 
			<div id="staticBackdrop"   title="Error-Message" hidden="hidden" >
			<table align="center">
				<tr>
					<td>
						<label>ERROR : </label>
						<h3 id="staticBackdropLabel"></h3>
					</td>
				</tr>
				<tr>
					<td>
						<label>ERROR Contents : </label>
						<div id="staticBackdropBody"></div>	
					</td>
				</tr>
			</table>
			</div>
			 -->
			 <div id="staticBackdrop" class="hide">
				<p id="staticBackdropBody" class="bolder grey">
				</p>
			</div>
			<!-- error Modal pop-up : end -->
			
			
			
   </div> <!-- /.main-content --> -->
 </div> <!-- /.main-container --> -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />

<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
  	var ischecked= false;//중복체크를 했는지 안했는지 체크하는 변수
  	var validationMessage ='';//에러 메시지
	var errortitle='';//에러 타이틀
	var errorfield ='';//에러 난 부분->fucus할거임
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
                $('#postcode').val(data.zonecode);
                $('#roadAddress').val(addr);
                document.getElementById("detailAddress").focus();
            
                $('#detailAddress').show();
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
        
    }
   		    
/////////////////////////////////////////////////////////////////
//에러 팝업
function openErrorModal(title, message,errorfield) { //validation 체크 후 에러 메시지 모달을 띄우기 위한 함수
		$('#staticBackdropLabel').html(title);//에러
		$('#staticBackdropBody').text(message);//에러내용
		
		console.log($('#staticBackdropLabel').text());
		console.log($('#staticBackdropBody').text());
		
		$( "#staticBackdrop" ).dialog({
			resizable: false,
			modal: true,
			title: title,
			buttons: [
				{
					text: "OK",
					"class" : "btn btn-danger btn-mini",
					click: function() {
						$(this).dialog('close');
			          	$('#staticBackdropBody').text('');//에러내용
						$(errorfield).focus();
					}
				}
			]
		});
		
		$("#staticBackdrop").dialog('open');//모델창 띄운다
	}
	
function CodeValidation() {
	let code = $('#code').val();
	if('' === code){
		errortitle='CODE ERROR';
		validationMessage = '코드를 반드시 입력해야 합니다.(7자)';
		errorfield='#code';
		return false;
	}
	if(code.length > 7 || code.length <= 6){
		errortitle='CODE ERROR';
		validationMessage = '코드는 7자리를 입력해야 합니다.';
		errorfield='#code';
		return false;
	}
	return true;
}
/////////////////////////////////////////////////////////////////
function Myvalidation(){
	let code = $('#code').val();//코드
	let name=$('#name').val(); //은행이름
	let store=$('#store').val(); //지점명
	let dealDate=$('#id-date-picker-1').val(); //거래시작일
	let phone=$('#phone').val(); //은행전화번호
	let fax=$('#fax').val(); //팩스번호
	let post=$('#postcode').val(); //우편번호
	let roadAddress=$('#roadAddress').val(); //은행도로명주소
	let detailAddress=$('#detailAddress').val(); //상세주소
	let mgr=$('#mgr').val(); //담당자
	let mgrPhone=$('#mgrPhone').val(); //담당자전화번호
	let mgrEmail=$('#email').val(); //담당자 이메일
	
	if(code === ''){
		errortitle='CODE ERROR';
		validationMessage = '은행코드를 반드시 입력해야 합니다.';
		errorfield='#code';
		return false;
		
	}
	/* if(code.length < 7) {
		errortitle = 'CODE ERROR';
		validationMessage = '은행코드는 반드시 7자로 입력해야 합니다.';
		errorfield='#code';
		return false;
	} */
	if('' === name) {
		errortitle='NAME ERROR';
		validationMessage = '은행명을 반드시 입력해야 합니다. (최대 10자)';
		errorfield='#name';
		return false;
	}
	if(name.length > 10) {
		errortitle = 'NAME ERROR';
		validationMessage = '은행명은 반드시 10자 이하로 입력해야 합니다.';
		errorfield='#name';
		return false;
	}
	if('' === store) {
		errortitle = 'STORE ERROR';
		validationMessage = '지점명은 반드시 입력해야 합니다. (최대 15자)';
		errorfield='#store';
		return false;
	}
	if(store.length > 15) {
		errortitle = 'STORE ERROR';
		validationMessage = '지점명은 반드시 15자 이하로  입력해야 합니다.';
		errorfield='#store';
		return false;
	}
	
	if('' === phone) {
		errortitle = 'PHONE ERROR';
		validationMessage = '은행 전화번호는 반드시 입력해야 합니다.';
		errorfield='#phone';
		return false;
	}
	 if(phone.length < 7) {
		errortitle = 'PHONE ERROR';
		validationMessage = '은행 전화번호가 잘못 입력되었습니다.';
		errorfield='#phone';
		return false;
	}
	if('' === fax) {
		errortitle = 'FAX ERROR';
		validationMessage = '팩스 전화번호는 반드시 입력해야 합니다.';
		errorfield='#fax';
		return false;
	}
	else if(fax.length < 7) {
		errortitle = 'FAX ERROR';
		validationMessage = '팩스 전화번호가 잘못 입력되었습니다.';
		errorfield='#fax';
		return false;
	}
	if('' === post || '' === roadAddress) {
		errortitle = 'Addreess ERROR';
		validationMessage = '주소는 우편번호 찾기를 통해 반드시 입력되야 합니다.'
		errorfield='#post';
		return false;
	}
	if('' === detailAddress) {
		errortitle = 'DETAILADDRESS ERROR';
		validationMessage = '상세주소는 반드시 입력해야 합니다.'
		errorfield='#detailAddress';
		return false;
	}
	if('' === dealDate) {
		errortitle = 'dealDate ERROR';
		validationMessage = '거래일은 반드시 입력해야 합니다.';
		errorfield='#id-date-picker-1';
		return false;
	}
	if('' === mgr) {
		errortitle = 'MGR ERROR';
		validationMessage = '담당자는 반드시 입력해야 합니다.';
		errorfield='#mgr';
		return false;
	}
	if(mgr.length > 5) {
		errortitle = 'MGR ERROR';
		validationMessage = '담당자명은 반드시 5자 이하로  입력해야 합니다.';
		errorfield='#mgr';
		return false;
	}
	if('' === mgrPhone) {
		errortitle = 'MGRPHONE ERROR';
		validationMessage = '담당자 전화번호는 반드시 입력해야 합니다.';
		errorfield='#mgrPhone';
		return false;
	}
	if(mgrPhone.length < 7) {
		errortitle = 'MGRPHONE ERROR';
		validationMessage = '담당자 전화번호가 잘못 입력되었습니다.';
		errorfield='#mgrPhone';
		return false;
	}
	if('' === mgrEmail) {
		errortitle = 'MGREMAIL ERROR';
		validationMessage = '담당자 이메일은 반드시 입력해야 합니다.';
		errorfield='#mgrEmail';
		return false;
	}
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var email = $("#email").val();
	if (email == '' || !re.test(email)) {
		errortitle = 'MGREMAIL ERROR';
		validationMessage = '이메일 형식이 틀립니다.';
		errorfield='#mgrEmail';
		return false;
	}
	return true;
}


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
	if(!CodeValidation()){
		openErrorModal(errortitle,validationMessage,errorfield);
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
			
			if(response.data == null){
				$("#btn-check-code").hide();
				$("#img-checkcode").show();
				ischecked = true;
				return;
			}else if(response.data.deleteFlag == "Y"){
				$("#code").val("");
				$("#code").focus();
				openErrorModal('CODE ERROR',"삭제된 코드입니다.",'#code');
			}else {
				
				$("#code").val("");
				$("#code").focus();
				openErrorModal('CODE ERROR',"이미 존재하는 코드입니다.",'#code');
			
			}
			},
			error:function(xhr,error) {
				console.err("error" + error);
			}
	});
});		


//requied제거후 각각 validation 추가 해라			   		    
$("#inputbtn").click(function(){//입력버튼 클릭시      
	if(ischecked == false){
		openErrorModal("bankcode ERROR","은행코드를 중복체크 해야합니다.",'');
 	
 		   return;
 	 }
	else{
		if(!Myvalidation()){
	 			openErrorModal(errortitle,validationMessage,errorfield);
	 			
	 			return;
	 	}
	}
		
		
		$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add');
	  	$('#myform').attr('method', 'POST');
	  	$('#myform').submit();
  	});
  	
  	
$('#formReset').click(function(){//초기화 버튼 클릭시
 	$('input').val('');
 	$("#inputbtn").show();
 	$("#updatebtn").hide();
 	$("#img-checkcode").hide();
 	$('#code').attr('readOnly',false);
  	$('#btn-check-code').val('중복확인').show();
  	$('#addressSearch').val('주소찾기');
	$('#detailAddress').hide();
	$("#tbody-list").find('tr').removeClass("selected");
});	 

 $('#updatebtn').click(function(){
	 
	 var count = 0;
	 $("#tbody-list tr").each(function(i){
		if($(this).hasClass('selected') === true){
			count++;
		}
	 });
	console.log(count);
	
	if(count>1){
		openErrorModal('UPDATE ERROR','하나의 내용만 수정할 수 있습니다','');
		return;
	}
	if(count<=0){
		openErrorModal('UPDATE ERROR','수정할 리스트를 선택하여 주세요','');
		return;
	}	
	 
	 
	 if(!Myvalidation()){
			openErrorModal(errortitle,validationMessage,errorfield);
			return;
	}
  	$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update');
	$('#myform').attr('method', 'POST');
	$('#myform').submit();
 });
 
 $('#deletebtn').click(function(){
	 $("#tbody-list tr").each(function(i){
			if($(this).hasClass('selected') === true){
				count++;
			}
		 });
		
		
		if(count>1){
			openErrorModal('UPDATE ERROR','하나의 내용만 삭제 할 수 있습니다','');
			return;
		}
		if(count<=0){
			openErrorModal('UPDATE ERROR','삭제할 리스트를 선택하여 주세요','');
			return;
		}	
	 
	 
  	$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete');
	$('#myform').attr('method', 'POST');
	$('#myform').submit();
 });
 
$("#search").click(function(){
	$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list');
	$('#myform').attr('method', 'POST');
	$('#myform').submit();
});
			  
			  
////////////////////////////////////////////////////////////////////////////////////////
$("#tbody-list tr").click(function(){ 
	var tr = $(this);
	var td = tr.children();
	
	if($(this).hasClass('selected') === false) {
		$('#updatebtn').show();
		$('#inputbtn').hide();
		
		$("#tbody-list").find('tr').removeClass("selected");
		
		$(this).addClass('selected');
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
	    $('#code').attr('readOnly',true);

	  	$('#btn-check-code').val('중복확인').hide();
	  	 $('#detailAddress').hide();
	  	
	  	
	  	
	  	
	    
	} else {
		$(this).removeClass("selected");
		$('input').val('');
	 	$("#inputbtn").show();
	 	$("#updatebtn").hide();
	 	$("#img-checkcode").hide();
	 	$('#code').attr('readOnly',false);
	  	$('#btn-check-code').val('중복확인').show();
	  	$('#addressSearch').val('주소찾기');
	  	 $('#detailAddress').hide();
	}
	
});
			
		
///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//전화번호 자동 하이픈
function inputTelNumber(obj) {
	if (!(event.keyCode >= 48 && event.keyCode <= 57)) { //숫자키만 입력
		obj.value='';
		return;
	} 


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


/////////////////////////////////////////////////////////////////////////////////////////
$(function(){
	$('button').on('click', function(e) {
		e.preventDefault();
	});
	$(".chosen-select").chosen();

	$("#updatebtn").hide(); // 맨처음화면에서 수정화면 hide
	
	$('.date-picker').datepicker().next().on(ace.click_event,function(){
		$(this).prev().focus();
	});
	$("#staticBackdrop").dialog({
		autoOpen : false	
	});
	$('#detailAddress').hide();
});
	
///////////////////////////////////////////////////////////////////////////////////////////////
		
</script>
</body>
</html>