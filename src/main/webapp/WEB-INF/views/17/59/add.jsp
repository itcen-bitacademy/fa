<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<!--
<script src="${pageContext.servletContext.contextPath }/assets/ace/js/uncompressed/jquery-2.0.3.js" type="text/javascript"></script>
<script>
$(function(){

	$("#account-add-btn").click(function(){

		var AccountManagement = {
				"account_order" : $("#account_order").val(),                   //계정과목 순서
				"account_no" : $("#account_no").val(),                         //계정과목 코드
				"account_statement_type" : $("#account_statement_type option:selected").val(), //제무재표 구분
				"account_usedyear" : $("#account_usedyear").val()              //계정과목 사용년도
		};

		if(AccountManagement == ''){
			alert("항목을 모두 입력해주세요.");
			return;
		}


		// ajax 통신
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add",
			type: "post",
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify(AccountManagement),

         	error : function(xhr, error) {
	        	console.error("error : " + error);
	        }

		});

	});



	$(document).on("click", ".delete-category", function(event) {
		  event.preventDefault();

		  var con_test = confirm("정말 삭제하시겠습니까?");
		  if(con_test == true){
			  var no = $(this).attr('id');
		      let clikedRow = $(this);

		      $.ajax({
		         url : "${pageContext.servletContext.contextPath }/api/blog/delete?no=" + no,
		         type : "post",
		         dataType : "json",
		         success : function(data) {
		         	$(clikedRow).parent().parent().remove();
		         },
		         error : function(xhr, error) {
		            console.error("error : " + error);
		         }
		      });
		  }
		  else if(con_test == false){
		    return;
		  }



	   });


});
</script>
 -->

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
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<!-- PAGE CONTENT BEGINS -->
						<form id="form-data" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
							<!-- 회계연도  -->
							<div class="control-group">
								<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >회계연도</label>
								<div class="controls">
									<input type="number" min="1900" max="2099" step="1" value="${accountUsedyear }" id="accountUsedyear" name="accountUsedyear" placeholder="회계연도" />
								</div>
							</div>

							<!-- 구분  -->
							<div class="control-group">
								<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;">구분</label>
								<div class="controls">
									<select id="selectedAccountStatementType" name="selectedAccountStatementType" >
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

							<!-- 순번  -->
							<div class="control-group">
								<label class="control-label" for="accountOrder" style="text-align:left;width:120px;" >순번</label>
								<div class="controls">
									<input type="number" min="0001" max="1000" step="1" value="${accountOrder }" id="accountOrder" name="accountOrder" placeholder="순번입력" />
									<input type="hidden" id="no" name="no" value="" >
								</div>
							</div>

							<!-- 계정과목  -->
							<div class="control-group">
								<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;" >계정과목</label>
								<div class="controls">
									<select class="chosen-select" id="selectedAccount" name="selectedAccount" data-placeholder="계정과목">
										<option value="" data-accountName=""></option>
										<c:choose>
											<c:when test="${selectedAccount eq selectedAccount }">
												<option value="${selectedAccount}" data-accountName="${selectedAccount }" selected>${selectedAccount }</option>
											</c:when>
										</c:choose>
										<c:forEach items="${accountList }" var="vo">
												<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>
										</c:forEach>
									</select>
									<input type="text" id="accountName" name="accountName" placeholder="계정명칭" value="" style="text-align: center; width: 300px; height: 18px;" disabled />

								</div>
							</div>
							<div class="controls" style="margin-left: 0px;">
								<button class="btn btn-info btn-small" type="submit" id="account-list-btn" name="account-list-btn" value="list" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">조회</button>
								&nbsp;
								<button class="btn btn-danger btn-small" type="submit" id="account-delete-btn" name="account-delete-btn" value="delete" onclick="delete_data();" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
								&nbsp;
								<button class="btn btn-default btn-small" type="button" id="account-reset-btn" name="account-reset-btn" >취소</button>
							</div>
						</form>
					</div>
				</div>

				<!-- /.row-fluid -->
				<div class="row-fluid">
				<!-- 제무재표 계정과목 테이블  -->
				<div class="span12">
				<!-- 선 -->
				<div class="hr hr-18 dotted"></div>

				<!-- 게시글 총 수 -->
				<h6>총 ${dataResult.pagination.totalCnt }건
				&nbsp;
				<button class="btn btn-default btn-small" type="button" onclick="add_row();">행추가</button>

                <button class="btn btn-default btn-small" type="button" onclick="delete_row();">행삭제</button>
                &nbsp;

                <!--  삭제할 예정
    			<button class="btn btn-primary btn-small" type="submit" id="account-add-btn" name="account-add-btn" value="add" onclick="add_data();"  formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">입력</button>

				<button class="btn btn-warning btn-small" type="submit" id="account-update-btn" name="account-update-btn" value="update" onclick="update_data();" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
				 -->

				<button class="btn btn-primary btn-small" type="button" onclick="test_data();" >저장</button>

                </h6>
					<table id="tb-account-management" class="table table-striped table-bordered table-hover">
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
							<tr id="tr-account-management${vo.no }">
								<td style="text-align:left;width:60px;"><input type="number" min="0001" max="1000" step="1" value="${vo.accountOrder }" id="accountOrder${vo.no }" name="accountOrder${vo.no }" placeholder="순번" style="text-align:left;width:60px;"></td>
								<td style="text-align:left;width:160px;">
  									<select class="chosen-select" id="selectedAccount${vo.no }" name="selectedAccount${vo.no }" data-placeholder="계정과목" style="text-align:left;width:160px;">
										<option value="${vo.accountNo}" data-accountName="${vo.accountName }" selected>${vo.accountNo }</option>
										<c:forEach items="${accountList }" var="list">
												<option value="${list.accountNo}" data-accountName="${list.accountName }" >${list.accountNo }</option>
										</c:forEach>
									</select>
                                </td>
								<td style="text-align: left; width: 300px; height: 18px;"><input type="text" id="accountName${vo.no }" name="accountName${vo.no }" placeholder="계정명칭" value="${vo.accountName }" style="text-align: left; width: 300px; height: 18px;" disabled></td>
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
								<td id="no${vo.no }" style="display:none;">${vo.no }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				</div>
			</div>

		</div>
	</div>


	<%-- 페이징 --%>
	<div class="pagination">
		<ul>
			<c:choose>
				<c:when test="${dataResult.pagination.prev }">
					<li><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
				<c:choose>
					<c:when test="${pg eq dataResult.pagination.page }">
						<li class="active"><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${pg }">${pg }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${pg }">${pg }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${dataResult.pagination.next }">
					<li><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- PAGE CONTENT ENDS -->

	<%-- 에러 모달  --%>
	<c:if test="${not empty param.error }">
		<input type="hidden" id="errorMessage" value="${param.error }"/>
	</c:if>

	<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="margin-top: 180px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel"></h5>
				</div>
				<div class="modal-body" id="staticBackdropBody"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-small" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js">
	</script>

	<script>
	$(function() {
		$(".chosen-select").chosen();
	});

	//재무제표 계정 추가
    function add_data(){
    	var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add";
		$("#form-data").attr("action",url).submit();
    }

	//재무제표 계정 수정
	function update_data() {
    	var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update";
		$("#form-data").attr("action",url).submit();

	}

	//재무제표 계정 삭제
	function delete_data() {
    	var url = "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete";
		$("#form-data").attr("action",url).submit();

	}

    // 테이블의 Row 클릭시 값 가져오기
    $("#tb-account-management tr").dblclick(function(){

        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();

        var hiddenNo     = td.eq(8).text(); // 해당 row의 실제 no

        var accountOrder = $("#accountOrder"+hiddenNo).val(); //순번
        var accountNo    = td.eq(1).text();                   //계정과목
            accountNo    = accountNo.substring(23,30);
        var accountName  = $("#accountName"+hiddenNo).val();  //계정명칭

      
        
     	$('#selectedAccount').val(accountNo).trigger('chosen:updated');
        $("#accountOrder").val(accountOrder);
        $("#accountName").val(accountName);
        $("#no").val(hiddenNo);

    });

    //계정과목에 따른 계정명칭 불러오기
    $('#selectedAccount').change(function () {
    	var accountName = $(this).find('option:selected').attr('data-accountName');
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

    //조회버튼 누를 시 초기화
    $("#account-list-btn").click(function() {
    	console.log($('#selectedAccount').val());
    });




	// validation check (보류)
	/*
	var validationMessage = ''

	function saveValidation() {

		let accountNo = $('#selectedAccount').val()
		let accountUsedyear = $('#accountUsedyear').val()
		let accountOrder = $('#accountOrder').val()

		console.log("accountNo : " + accountNo)
		console.log("accountUsedyear : " + accountUsedyear)
		console.log("accountOrder : " + accountOrder)



		if (!accountNo) {
			validationMessage = '계정과목을 입력해주세요'
			return false;
		} else if (!accountUsedyear) {
			validationMessage = '회계 연도를 입력해주세요.'
			return false;
		} else if (!accountOrder) {
			validationMessage = '순번을 입력해주세요.'
			return false;
		}

		return true;
	}

    //입력버튼 누를 시 초기화
    $("#account-add-btn").click(function() {
    	console.log("입력 버튼 클릭")
		if (!saveValidation()) {
			//openModal('Error', validationMessage);
			//window.history.pushState({}, document.title, '${pageContext.request.contextPath }/17/59/list')
		}
    });
    */

	/*
 	var result = "${param.result }";

 	console.log("result : " + result);

	if('overlap' == result ){
		alert("이미 있는 데이터입니다.");

		result = "";
	} else if('nullData' == result){
		alert("저장할 데이터를 입력해주세요");

		result = "";
	} else if('NPE' == result){
		alert("데이터를 입력해주세요");

		result = "";
	} else if('NPE2' == result){
		alert("삭제할 데이터를 선택해주세요");

		result = "";
	}
	*/
	
	$(function(){
		// 모달 설정
		backdrop = $('#staticBackdrop')
		backdrop.modal({
			keyboard: false,
			show: false
		})

		// 에러 모달 설정
		var errorMessage = $('#errorMessage')
		if (errorMessage.val()) {
			openModal('Error', errorMessage.val())
			window.history.pushState({}, document.title, '${pageContext.request.contextPath }/17/59/list')
		}

	});

	// static backdrop modal
	var backdrop

	function openModal(title, message) {
		$('#staticBackdropLabel').text('Error')
		$('#staticBackdropBody').text(message)

		backdrop.modal('show')
	}


    var max = Number("${dataResult.getDatas().get(0).getMax() }"); //가장 높은 순번
    var maxCnt = Number("${dataResult.getDatas().get(0).getMaxcnt() }"); //가장 높은 no
    var totalcnt = 0; //행 추가시 순번 자동 생성할 데이터

	// 테이블 행추가
    function add_row() {
        var table = document.getElementById("tb-account-management"); // 테이블 아이디
        var row = table.insertRow(table.rows.length); // 하단에 추가
        var cnt = table.rows.length-1; // 헤더를 뺀 테이블 길이 아이디에 부여용도

        if(max < 12){
        	totalcnt = cnt
        	maxCnt   = (maxCnt+cnt-(cnt-1));
        	console.log(maxCnt);

        }else {
        	totalcnt = (max+cnt-11);
        	maxCnt   = (maxCnt+cnt-(cnt-1));
        	console.log(maxCnt);
        }

        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        var cell7 = row.insertCell(6);
        var cell8 = row.insertCell(7);

        cell1.innerHTML = '<td style="text-align:left;width:60px;"><input type="number" min="0001" max="1000" step="1" value="'+totalcnt+'" id="accountOrder'+maxCnt+'" name="accountOrder'+maxCnt+'" placeholder="순번" style="text-align:left;width:60px;">'
        				  +'<input type="hidden" id="no" name="no" value="'+totalcnt+'" ></td>';

        cell2.innerHTML = '<td style="text-align:left;width:160px;"><select class="chosen-select" id="selectedAccount'+maxCnt+'" name="selectedAccount'+maxCnt+'" data-placeholder="계정과목" style="text-align:left;width:160px;">'
				           +'<option value=""></option>'
				           +'<c:forEach items="${accountList }" var="vo" varStatus="status">'
				           +'<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>'
				           +'</c:forEach>'
				           +'</select><td>';
        cell3.innerHTML = '<td style="text-align: left; width: 300px; height: 18px;"><input type="text" id="accountName'+maxCnt+'" name="accountName'+maxCnt+'" placeholder="계정명칭" value="" style="text-align: left; width: 300px; height: 18px;" disabled></td>'; //


        $(".chosen-select").chosen(); // 각 row에 품목코드 chosen 활성화
    }

    var tablee = document.getElementById("tb-account-management"); // 테이블 아이디
    var tablecnt = tablee.rows.length+1; //기존 데이터 행삭제 방지

	//테이블 행삭제
    function delete_row() {

        var table = document.getElementById('tb-account-management');
        if (table.rows.length < tablecnt) { // 헤더와 default row 1개 는 고정
            return;
        } else {
            table.deleteRow(table.rows.length-1); // 하단부터 삭제
        }
    }

    //계정과목에 따른 계정명칭 불러오기
    $('#selectedAccount'+totalcnt).change(function () {
    	var accountName = $(this).find('option:selected').attr('data-accountName');
    	$('#accountName'+totalcnt).val(accountName);
   	});

    var changedRows = [];//저장, 수정할 배열

    function test_data(){

    	if(changedRows == ""){
    		alert("저장 혹은 수정할 데이터를 입력해주세요");
    	}else{

        	$.ajax({
        		url  : "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/addorupdate",
        		type : "POST",
        		traditional : true,
        		data : {"changedRows" : changedRows},
        		success : function(data){
              	//console.log(data)
           		if(data.status == false){
           			openModal('Error', data.error);
           			data.status = true;
           			
           		}
           		location.reload();
            }

        	});
    	}
    }

    $(document).ready(function () {

        $('#tb-account-management').delegate('input,select', 'change', function () {
            var self = $(this);
            var id = self.context.id;
            var no = 0;
            var changedData = id.substring(0,1);

            //데이터
            // 기존 데이터 : no, 새로운 데이터 : maxNo + &
            if(changedData == 'a'){
            	no = id.substring(12,14);
            }else{
            	no = id.substring(15,17);
            }

            var accountNo                    = $("#selectedAccount"+no).find('option:selected').attr('value');            // accountNo 변경 시 accountNo 데이터 가져오기
        	var accountName                  = $("#selectedAccount"+no).find('option:selected').attr('data-accountName'); // accountNo 변경 시 accountName 데이터 가져오기
        	var accountOrder                 = $("#accountOrder"+ no).val();                                              //순번
        	var accountUsedyear              = $("#accountUsedyear").val();                                               //회계연도
        	var selectedAccountStatementType = $("#selectedAccountStatementType").val();                                  //구분

        	$('#accountName'+no).val(accountName); //accountNo 변경 시 accountName 데이터 삽입

            //insert 혹은 update할 데이터 넣기
            if(accountNo != ''){
            	changedRows.push(no + "/" + accountOrder + "/" + accountNo + "/" + accountUsedyear + "/" + selectedAccountStatementType);

                for(var i=0; i < changedRows.length; i++){
 	               console.log(changedRows[i]);
             	}
            }

        });


    });

	</script>
</body>
</html>
