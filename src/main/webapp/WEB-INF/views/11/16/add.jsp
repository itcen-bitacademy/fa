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
							<label class="control-label" for="form-field-codename">은행코드 / 은행명</label>
							<div class="controls">
								<input class="span2" type="text" id="form-field-code" name="code" placeholder="은행코드"/>
								<input class="span8" type="text" id="form-field-name" name="name" placeholder="은행명"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-codename">거래시작일</label>
								<div class="controls">
									<div class="row-fluid input-append">
									<input class="span9 date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" />
										<span class="add-on">
										<i class="icon-calendar"></i>
										</span>
									</div>
								</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-select-financetype">금융권 종류</label>
							<div class="controls">
								<select class="chosen-select" id="form-field-select-financetype" name="finance_type" data-placeholder="금융권종류">
									<c:forEach items="${listMainMenu }" var="menuVo">
										<option value="${menuVo.no }">${menuVo.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-mgr">담당자</label>
							<div class="controls">
								<input class="span10" type="text" id="form-field-mgr" name="mgr" placeholder="담당자"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="form-field-mgrphone">담당자전화번호</label>
							<div class="controls">
								<input class="span10" type="text" id="form-field-mgrphone" name="mgr_phone" placeholder="담당자전화번호"/>
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
									<input class="span10" type="text" id="form-field-mgremail" name="mgr_email" placeholder="담당자이메일"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-address">주소</label>
								<div class="controls">
			                        <input type="button" class="btn-primary box"
			                            onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			                   	 </div>
			                   	 
			                   	 <div class="controls">
			                        <input class="span7" type="text" name="post" class="box" id="postcode"
			                            placeholder="우편번호" required>
			                    </div>
			 					<label class="control-label" for="form-field-address"></label>
			                    <div class="controls">
			                        <input class="span7" type="text" name="roadAddress" class="box"
			                            id="roadAddress" placeholder="도로명주소" required>
			                    </div>
			                    <label class="control-label" for="form-field-address"></label>
			                    <div class="controls">
			                        <input class="span7" type="text" name="jibunAddress" class="box"
			                            id="jibunAddress" placeholder="지번주소" required>
			                    </div>
			                    <label class="control-label" for="form-field-address"></label>
			                    <div class="controls">
									<input class="span7" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"/>
								</div>
							</div>
						</div>
							
						<div>	
								
								<button class="btn btn-info" type="submit"><i class="icon-ok bigger-110"></i>입력</button>
								<button class="btn btn-info" type="modify"><i class="icon-ok bigger-110"></i>수정</button>
								<button class="btn btn-info" type="delete"><i class="icon-ok bigger-110"></i>삭제</button>
								<button class="btn btn-info" type="refer"><i class="icon-ok bigger-110"></i>조회</button>
								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset"><i class="icon-undo bigger-110"></i>초기화</button>
							
						</div>
						<br>
						
					<table id="simple-table" class="table  table-bordered table-hover">
                          <thead>
                              <tr>
                                 <th class="center">
                                    <label class="pos-rel">
                                     <input type="checkbox" class="ace" />
                                             <span class="lbl"></span>
                                          </label>
                                       </th>
                                       <th class="center">은행코드</th>
                                       <th class="center">은행명</th>
                                       <th class="center">지점명</th>
                                       <th class="center">거래시작일</th>
                                       <th class="center">전화번호</th>
                                       <th class="center">은행주소</th>
                                       <th class="center">금융권종류</th>
                                       <th class="center">담당자</th>
                                       <th class="center">담당자전화번호</th>
                                       <th class="center">담당자이메일</th>
                                    </tr>
                                 </thead>

                                 <tbody>
                                    <tr>
                                       <td class="center">
                                          <label class="pos-rel">
                                             <input type="checkbox" class="ace" />
                                             <span class="lbl"></span>
                                          </label>
                                       </td>
                                       <td class="center">0010100</td>
                                       <td class="center">한국은행</td>
                                       <td class="center">기획협력국</td>
                                       <td class="center">2019-10-29</td>
                                       <td class="center">02-759-4114</td>
                                       <td class="center">서울특별시 중구 남대문로 39</td>
                                       <td class="center">제1금융</td>
                                       <td class="center">배준석</td>
                                       <td class="center">02-759-4041</td>
                                       <td class="center">bokdplp@bok.or.kr</td>
                                    </tr>
                                 </tbody>
                              </table>
                              
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
   		     }
     
	    </script>
									
					</form>					
					<!-- PAGE CONTENT ENDS -->

				</div><!-- /.span -->
				
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
});
</script>
</body>
</html>