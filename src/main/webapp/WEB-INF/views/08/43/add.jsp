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

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
	<input type="hidden" id="context-path" value="${pageContext.request.contextPath }"/>
	<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode }"/>
	<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }"/>
	<input type="hidden" id="kwd" name="kwd" value="${kwd }">
	
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">



				<div class="page-header position-relative">
					<h1 class="pull-left">무형자산관리</h1>
				</div>
				<!-- /.page-header -->
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<!-- PAGE CONTENT BEGINS -->


							<form class="form-horizontal" method="post"
								action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
								<div class="span6">
									<!-- 차변 -->
									<div class="control-group">
										<label class="control-label" for="form-field-1">무형자산
											코드</label>
										<div class="controls">
											<input type="text" class="span7" id="id" name="id"
												placeholder="ex) f120400701 (f+월+일+007+번호)" />
											<button class="btn btn-info btn-small" type="submit"
													id="list" style="float: right; margin-right: 180px;">조회</button>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">설치주소</label>
										<div class="controls">
											<input type="text" class="span11" id="form-field-1"
												name="address" placeholder="주소를 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">대분류
											코드</label>
										<div class="controls">
											<select class="span2 chosen-select" id="form-field-section"
												name="classification" data-placeholder="전체">
												<c:forEach items="${sectionList }" var="sectionVo">
													<option sectionList="${sectionVo.code }" value="${sectionVo.classification }">${sectionVo.classification }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6" name="code" id="code"
												placeholder="대분류명을 지정하면 코드가 등록됩니다">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-select-1">거래처
											코드</label>
										<div class="controls">
											<select class="chosen-select" id="form-field-customer"
												name="customerNo" data-placeholder="전체">
												<c:forEach items="${customerList }" var="customerVo">
													<option customerName="${customerVo.name }" customerManager="${customerVo.managerName }" value="${customerVo.no }">${customerVo.no }</option>
												</c:forEach>
											</select> <input readonly type="text" class="span6"
												name="customerName" id="customerName"
												value="코드를 지정하면 거래처명이 등록됩니다">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">취득금액</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="acqPrice" style="text-align:right;"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">부대비용</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="addiFee"  style="text-align:right;"
												placeholder="금액을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">세금계산서
											번호</label>
										<div class="controls">
											<input type="text" class="span7" id="form-field-1"
												name="taxbillNo" placeholder="12자로 입력하세요" />
										</div>
									</div>
								</div>
								<!-- 차변 span -->

								<div class="span6">
									<!-- 대변 -->
									<div class="control-group">
										<label class="control-label" for="form-field-1">무형자산 명</label>
										<div class="controls">
											<input type="text" class="span11" id="form-field-1"
												name="name" placeholder="무형자산명을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">사용 담당자</label>
										<div class="controls">
											<input type="text" class="span7" id="form-field-1"
												name="user" placeholder="이름을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">수량</label>
										<div class="controls">
											<input type="text" id="form-field-1" name="copyCount"  style="text-align:right;"
												placeholder="수량을 입력하세요" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">담당자</label>
										<div class="controls">
											<input readonly type="text" class="span7"
												name="customerManager" id="customerManager"
												value="코드를 지정하면 담당자가 등록됩니다" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="form-field-1">용도</label>
										<div class="controls">
											<!-- <input type="text" class="span11" id="form-field-1"
												name="purpose" placeholder="용도를 입력하세요" /> -->
											<select class="chosen-select" id="form-field-purpose"
												name="purpose" data-placeholder="전체">
												<c:forEach items="${purposeList }" var="purposeVo">
													<option value="${purposeVo.classification }">${purposeVo.classification }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="id-date-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<input class="cl-date-picker" id="id-date-picker-1"
													type="text" name="payDate">
												<span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">구분</label>
										<div class="controls">
											<div class="span2">
												<label> <input name="taxKind" type="radio" id="tax"
													value="과세" class="ace" checked> <span class="lbl">
														과세</span>
												</label>
											</div>
											<div class="span2">
												<label> <input name="taxKind" type="radio" id="zeroTax"
													value="영세" class="ace"> <span class="lbl">
														영세</span>
												</label>
											</div>
										</div>
									</div>
								</div>
								<!-- 대변 span -->

								<div class="row-fluid">
									<div class="span12">
										<div class="hr hr-18 dotted"></div>
										<div class="control-group" style="margin-left: 0px;">
											<div class="controls" style="margin-left: 0px;">
												<button class="btn btn-primary btn-small" type="submit"
													id="add" style="float: left; margin-right: 20px;">등록</button>
												<button class="btn btn-warning btn-small" type="submit"
													id="update" style="float: left; margin-right: 20px;">수정</button>
												<button class="btn btn-danger btn-small" type="submit"
													id="delete" style="float: left; margin-right: 20px;">삭제</button>
												<button class="btn btn-default btn-small" type="reset" id="reset"
													style="float: left; margin-right: 20px;">
													<i class="icon-undo bigger-110"></i>초기화
												</button>
											</div>
										</div>
										<div class="hr hr-18 dotted"></div>
									</div>
								</div>

							</form>
						</div>
						<!-- 차변 대변 나누기 위한 row-fluid -->
						<!-- PAGE CONTENT ENDS -->

					</div>
					<!-- /.span -->
				</div>
				<!-- /.row-fluid -->

				<table id="sample-table-1"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>NO</th>
							<th>무형자산코드</th>
							<th>설치주소</th>
							<th>대분류명</th>
							<th>대분류코드</th>
							<th>거래처코드</th>
							<th>거래처명</th>
							<th>취득금액(원)</th>
							<th>부대비용(원)</th>
							<th>세금계산서번호</th>
							<th>무형자산명</th>
							<th>사용담당자</th>
							<th>수량</th>
							<th>담당자</th>
							<th>용도</th>
							<th>매입일자</th>
							<th>구분</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list }" var="vo" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${vo.id }</td>
								<td>${vo.address }</td>
								<td>${vo.classification }</td>
								<td>${vo.code }</td>
								<td>${vo.customerNo }</td>
								<td>${vo.customerName }</td>
								<td><fmt:formatNumber value="${vo.acqPrice }" pattern="#,###"></fmt:formatNumber></td>
								<td><fmt:formatNumber value="${vo.addiFee }" pattern="#,###"></fmt:formatNumber></td>
								<td>${vo.taxbillNo }</td>
								<td>${vo.name }</td>
								<td>${vo.user }</td>
								<td><fmt:formatNumber value="${vo.copyCount }" pattern="#,###"></fmt:formatNumber></td>
								<td>${vo.customerManager }</td>
								<td>${vo.purpose }</td>
								<td>${vo.payDate }</td>
								<td>${vo.taxKind }</td>
								<td>${vo.insertUserId }</td>
								<td>${vo.insertDay }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();
	
			// 대분류명 선택시 대분류 코드 가져오기
			$('#form-field-section').change(function() {
				var code = $('#form-field-section option:selected').attr('sectionList');
				$('#code').val(code);
			});
			
			// 거래처 코드 선택시 거래처 명 가져오기
			$('#form-field-customer').change(function() {
				var customerName = $('#form-field-customer option:selected').attr('customerName');
				var customerManager = $('#form-field-customer option:selected').attr('customerManager');
				
				$('#customerName').val(customerName);
				$('#customerManager').val(customerManager);
			});
			
			// 품목코드 중복 체크
			$("input[name=id]").on("change", function() {
				var id = $("#id").val();
				
				$.ajax({
					url : $("#context-path").val()  + "/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/checkId?id=" + id,
					type : "get",
					dataType : "json",
					data : "",
					success: function(response){
						if(response.result == "fail"){
							console.error(response.message);
							return;
						}
						
						if(response.data == true){
							alert("사용중인 품목코드입니다 :p");
							$("#id").val("");
							$("#id").focus();
							return;
						
						} else if(id == "") {
							alert("품목코드는 필수 입력 사항입니다!");
							$("#id").focus();
						}
					},
					error: function(xhr, error) {
						console.error("error: " + error);
					}
				});
				
			});
	
			// 무형자산 등록 : C
			$('#add').click(function() {
				$("form").attr("action",
				"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add");

			});
			
			// 무형자산 품목코드 조회 : R
			$('#list').click(function() {
				var kwd = $("#id").val();
				
				$("form").attr("action",
				"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list?kwd=" + kwd);

			});
	
			// 무형자산 수정 : U
			$("#update").click(function() {
				$("form").attr("action",
							   "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update");
			});
	
			// 무형자산 삭제 : D
			$("#delete").click(function() {
				$("form").attr("action",
						       "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete");
			});
			
			// 초기화 버튼
			$("#reset").click(function() {
				// 초기화 버튼 누루면 등록, 수정버튼 다시 보이기
				document.getElementById('add').style.visibility='visible';
				document.getElementById('update').style.visibility='visible';
				
				// 새로고침!
				location.reload();
			});
	
			// 행 클릭시 수정, 삭제
			$("#sample-table-1 tr").click(function() {
				var str = ""
				var tdArr = new Array(); // 배열 선언
	
				// 현재 클릭된 Row(<tr>)
				var tr = $(this);
				var td = tr.children();
	
				console.log(tr.text());
	
				$("input[name=id]").val(td.eq(1).text());
				$("input[name=address]").val(td.eq(2).text());
				//$("input[name=classification]").val(td.eq(3).text());
				$('#form_field_section_chosen').find('span').text(td.eq(3).text());
				$("input[name=code]").val(td.eq(4).text());
				//$("input[name=customerNo]").val(td.eq(5).text());
				$('#form_field_customer_chosen').find('span').text(td.eq(5).text());
				$("input[name=customerName]").val(td.eq(6).text());
				$("input[name=acqPrice]").val((td.eq(7).text()).replace(/,/gi, ""));
				$("input[name=addiFee]").val((td.eq(8).text()).replace(/,/gi, ""));
				$("input[name=taxbillNo]").val(td.eq(9).text());
				$("input[name=name]").val(td.eq(10).text());
				$("input[name=user]").val(td.eq(11).text());
				$("input[name=copyCount]").val(td.eq(12).text());
				$("input[name=customerManager]").val(td.eq(13).text());
				$('#form_field_purpose_chosen').find('span').text(td.eq(14).text());
				//$("input[name=purpose]").val(td.eq(14).text());
				$("input[name=payDate]").val(td.eq(15).text());
				$("input[name=taxKind]").val(td.eq(16).text());
			    
				if(td.eq(16).text() == "과세") {
			         $("input[id=tax]").prop('checked', true);
			     } else if(td.eq(16).text() == "영세") {
			         $("input[id=zeroTax]").prop('checked', true);
			     } 
				
				if(td.eq(9).text() == "") {
					document.getElementById('add').style.visibility='hidden';
				} else if(td.eq(9).text() != "") {
					document.getElementById('add').style.visibility='hidden';
					document.getElementById('update').style.visibility='hidden';
				}
			});
			
	
		});
	</script>
	<script>
		$(function() {
			$.fn.datepicker.dates['ko'] = {
				days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
							"9월", "10월", "11월", "12월" ],
				monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
							"9월", "10월", "11월", "12월" ],
				today : "Today",
				clear : "Clear",
				format : "yyyy-mm-dd",
				titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
				weekStart : 0
			};
	
			$('#cl-ym-date-picker').datepicker({
				maxViewMode : 4,
				minViewMode : 1,
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
	
			$('.cl-date-picker').datepicker({
				language : 'ko'
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
		});
	</script>
</body>
</html>