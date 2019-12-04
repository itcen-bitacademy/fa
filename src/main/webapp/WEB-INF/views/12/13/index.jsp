<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        #item-table tr td {
            padding: 0;
        }

        #item-table tr td p {
            padding: 8px;
            margin: 0;
        }

        #item-table tr td input {
            padding: 8px;
            margin: 0;
            width: 94%;
            border: 0
        }
        
        #item-table tr td div input {
            padding: 4px 20px 4px 5px;
            margin: 1px 0;
            width: 94%;
            border: 1px solid #aaa;
            width:100%
        }
        
        #item-table tr td input {
            padding: 8px;
            margin: 0;
            width: 94%;
            border: 0
        }

        .form-horizontal .control-label {
            text-align: left
        }

        .controls input[type=text] {
            width: 50%;
            min-width: 200px
        }
        .chosen-single{
       		margin-top: 4px;
       	}
    </style>
    <script>

        function add_row() {
            var table = document.getElementById("item-table");
            var row = table.insertRow(table.rows.length); // 하단에 추가       
            var cnt = table.rows.length-1;
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            cell1.innerHTML = '<td><p>' +cnt+ '</p><input type="hidden" value="'+cnt+'" name="number"></td>';
            cell2.innerHTML = '<td><select class="chosen-select" id="itemCode'+cnt+'" data-placeholder="품목코드" name="itemCode" onchange="setData.item(this.id)">'
					            +'<option value="">&nbsp;</option>'
					            +'<c:forEach items="${itemlist }" var="list" varStatus="status">'
					            +'<option value="${list.no }" id="">${list.no }(${list.name })</option>'
					            +'</c:forEach>'
					        	+'</select><td>';
            cell3.innerHTML = '<td><input type="text" id="itemName'+cnt+'" name="itemName" placeholder="품목명" value="" readonly></td>';
            cell4.innerHTML = '<td><input type="text" id="quantity'+cnt+'" name="quantity" placeholder="수량" onkeyup="sumData.addQuantity()" required></td>';
            cell5.innerHTML = '<td><input type="text" id="supplyValue'+cnt+'" name="supplyValue" placeholder="공급가액" onkeyup="sumData.addSupplyValue()" required></td>';
            cell6.innerHTML = '<td><input type="text" id="taxValue'+cnt+'" name="taxValue" placeholder="부가세" onkeyup="sumData.addTaxValue()" required></td>';
            document.getElementById("rowCnt").value = cnt;
            
            $(".chosen-select").chosen();
        }

        function delete_row() {
            var table = document.getElementById('item-table');
            if (table.rows.length < 3) {
                return;
            } else {
                table.deleteRow(table.rows.length-1); // 하단부터 삭제
            }
        }
        
        var sumData = {
        		addQuantity: function(){
        			var sum = 0;
        			for(var i=1; i<=document.getElementById("item-table").rows.length-1; i++){
        				sum = sum + Number($("#quantity"+i).val());
        				$("#totalQuantity").val(sum);
        			}
  					this.addSupplyValue();
  					this.addTaxValue();
        		},
        		addSupplyValue: function(){
					var sum = 0;
					for(var i=1; i<=document.getElementById("item-table").rows.length-1; i++){
						sum = sum + Number($("#quantity"+i).val())*Number($("#supplyValue"+i).val());
						$("#taxValue"+i).val(Math.round($("#supplyValue"+i).val()*0.1));
						$("#totalSupplyValue").val(sum);
					}
					this.addTaxValue();
					this.totalPrice();
				},
				addTaxValue: function(){
        			var sum = 0;
        			for(var i=1; i<=document.getElementById("item-table").rows.length-1; i++){
        				sum = sum + Number($("#quantity"+i).val())*Number($("#taxValue"+i).val());
        				$("#totaltaxValue").val(sum);
        			}
        			this.totalPrice();
        		},
        		totalPrice: function(){
        			var tax = Number($("#totaltaxValue").val());
        			var supply = Number($("#totalSupplyValue").val());
        			$("#totalPrice").val(tax+supply);
        		}
        }
        
       var setData = {
        	customer: function(){
        		var code = $("#customerCode").val();
        		if(code==""){
        			$("#empManager").val("");
    				$("#customerName").val("");
    				$("#customerPhone").val("");
        		}
        		<c:forEach items="${customerlist }" var="item" varStatus="status">
        			if(code=="${item.no }"){
        				$("#empManager").val("${item.ceo}");
        				$("#customerName").val("${item.name}");
        				$("#customerPhone").val("${item.phone}");
        			}
                </c:forEach>                
        	},
        	item : function(selectid){
        		var rownum = selectid.substring(selectid.length-1, selectid.length);
        		var code = $("#"+selectid).val();
        		if(code==""){
        			$("#itemName"+rownum).val("");
        		}
        		<c:forEach items="${itemlist }" var="item" varStatus="status">
	    			if(code=="${item.no }"){
	    				$("#itemName"+rownum).val("${item.name}");
	    			}
            	</c:forEach>  
        	}
        }
        

        function checkNo(){  
	        var code = $("#salesNo").val();
	        if(code==""){
	        	alert("매출번호를 입력하세요.");
	        	return;
	        }
	        location.href = "${pageContext.request.contextPath }/12/13/"+code;
	     }
        
        function checkFlag(){
            if($("#flag").val()=="true"){
            	$("#btnSubmit").attr('disabled', true);
            	sumData.addQuantity();
            	sumData.addSupplyValue();
            	sumData.addTaxValue();
            } else {
            	$("#btnModify").attr('disabled', true);
            	$("#btnDelete").attr('disabled', true);
            	add_row(); // 조회화면이 아니면 기본행 삽입
            }
        }
        
        function deleteData(){
        	var code = $("#checkSalesNo").val();
        	if($("#flag").val()=="true"&&code!=""){
        		location.href = "${pageContext.request.contextPath }/12/13/delete/"+code;
        	}
        }
        
        function update(){
        	var code = $("#checkSalesNo").val();
        	var url = "${pageContext.request.contextPath }/12/13/update/"+code;
        	if($("#flag").val()=="true"&&code!=""){
        		$("#insert-form").attr("action",url).submit();
        	}
        }
        
        function deleteCheck(){
        	var salesNo = $("#checkSalesNo").val();
        	if($("#flag").val()=="true"&&salesNo==""){
        		alert("삭제됐거나 없는 데이터 입니다.");
        		location.href = "${pageContext.request.contextPath }/12/13";
        	}
        }
        
    </script>
</head>

<body class="skin-3">
    <c:import url="/WEB-INF/views/common/navbar.jsp" />
    <div class="main-container container-fluid">
        <c:import url="/WEB-INF/views/common/sidebar.jsp" />
        <div class="main-content" >
            <div class="page-content" style="min-width:1280px;">


                <div class="page-header position-relative">
                    <h1 class="pull-left">매출관리</h1>
                    <input type="hidden" value="${flag }" id="flag">
                </div>
                <!-- /.page-header -->

                <!-- PAGE CONTENT BEGINS -->
                <form class="form-horizontal" id="insert-form" method="post" action="${pageContext.request.contextPath }/12/13">
                    <div class="row-fluid">
                        <div class="span12">
                        
                            <!-- left -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="cl-total-date-picker">매출일</label>
                                    <div class="controls">
                                        <div class="input-append">
                                            <input class="cl-date-picker" autocomplete="off" id="salesDate" name="salesDate" type="text" data-date-format="yyyy-mm-dd" value="${saleslist[0].salesDate }" required><span class="add-on"> <i class="icon-calendar"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="customerCode">거래처코드</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="customerCode" data-placeholder="거래처코드" name="customerCode" onchange="setData.customer();">
	                                        <c:choose>
		                                        <c:when test="${flag == 'true'}">
										           <option value="${saleslist[0].customerCode }" selected style="display:none">${saleslist[0].customerCode }(${saleslist[0].customerName })</option>
										       </c:when>
	                                       		<c:otherwise>
										           <option value="">&nbsp;</option>
										       </c:otherwise>
	                                        </c:choose>
                                            <c:forEach items="${customerlist }" var="list" varStatus="status">
										        <option id="${status }" value="${list.no }">${list.no }(${list.name })</option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" id="setCustomer" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="empManager">거래처담당자</label>
                                    <div class="controls">
                                        <input type="text" id="empManager" name="empManager" placeholder="거래처담당자" value="${saleslist[0].empManager }"readonly>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="cl-total-date-picker">출고일</label>
                                    <div class="controls">
                                        <div class="input-append">
                                            <input class="cl-date-picker" autocomplete="off" id="releaseDate" type="text" data-date-format="yyyy-mm-dd" value="${saleslist[0].releaseDate }" name="releaseDate" required> <span class="add-on"> <i class="icon-calendar"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="totalQuantity">수량합계</label>
                                    <div class="controls">
                                        <input type="text" id="totalQuantity" name="totalQuantity" placeholder="수량합계" value="0" readonly>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="totalTax">부가세합계</label>
                                    <div class="controls">
                                        <input type="text" id="totaltaxValue" placeholder="부가세합계" value="0" readonly>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- right -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="salesNo">매출번호</label>
                                    <div class="controls">
                                    	<input type="hidden" id="checkSalesNo" value="${saleslist[0].salesNo }">
                                        <input type="text" id="salesNo" name="salesNo" value="${saleslist[0].salesNo }" placeholder="매출번호" required>
                                        <div class="btn-group">
                                            <button class="btn btn-info btn-small" type="button" onclick="checkNo();">조회</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="customerName">거래처명</label>
                                    <div class="controls">
                                        <input type="text" id="customerName" name="customerName" placeholder="거래처명" value="${saleslist[0].customerName }" readonly>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="customerPhone">거래처연락처</label>
                                    <div class="controls">
                                        <input type="text" id="customerPhone" name="customerPhone" placeholder="거래처연락처" readonly>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="taxbillNo">세금계산서번호</label>
                                    <div class="controls">
                                        <input type="text" id="taxbillNo" name="taxbillNo" placeholder="세금계산서번호" value="${saleslist[0].taxbillNo }">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="totalSupplyValue">공급가액합계</label>
                                    <div class="controls">
                                        <input type="text" id="totalSupplyValue" placeholder="공급가액합계" value="0" readonly>
                                    </div>
                                </div>                                
                                <div class="control-group">
                                    <label class="control-label" for="totalPrice">합계금액</label>
                                    <div class="controls">
                                        <input type="text" id="totalPrice" name="totalPrice" placeholder="합계금액" value="${saleslist[0].totalPrice }" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="hr hr-10 dotted"></div>
                    
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="btn-group">
                                <button class="btn btn-success btn-small" type="submit" id="btnSubmit">입력</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-info btn-small" type="button" id="btnModify" onclick="update();">수정</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-danger btn-small" type="button" id="btnDelete" onclick="deleteData();">삭제</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-small" type="button" onclick="add_row();">행추가</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-small" type="button" onclick="delete_row();">행삭제</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="hr hr-10 dotted"></div>
                    
                    <div class="row-fluid">
                        <div class="span12">
                        <input type="hidden" id="rowCnt" name="rowCnt" value="1">
                            <table id="item-table" class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th>순번</th>
                                    <th>품목코드</th>
                                    <th>품목명</th>
                                    <th>수량</th>
                                    <th>공급가액</th>
                                    <th>부가세</th>
                                </tr>
                                <c:forEach items="${saleslist }" var="sales" varStatus="status">
                                <tr>
                                    <td>
                                        <p>${sales.number }</p>
                                        <input type="hidden" value="${sales.number }" name="number">
                                    </td>                                    
                                    <td>
                                    	<select class="chosen-select" id="itemCode${sales.number }" data-placeholder="품목코드" name="itemCode" onchange="setData.item(this.id);">
                                    		<option value="${sales.itemCode }" selected style="display:none">${sales.itemCode }(${sales.itemName })</option>
                                            <c:forEach items="${itemlist }" var="list" varStatus="status">
                                            	<option value="${list.no }">${list.no }(${list.name })</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td><input type="text" id="itemName${sales.number }" name="itemName" placeholder="품목명" value="${sales.itemName }" readonly></td>
                                    <td><input type="text" id="quantity${sales.number }" name="quantity" placeholder="수량" value="${sales.quantity }" onkeyup="sumData.addQuantity()"></td>
                                    <td><input type="text" id="supplyValue${sales.number }" name="supplyValue" placeholder="공급가액" value="${sales.supplyValue }" onkeyup="sumData.addSupplyValue()"></td>
                                    <td><input type="text" id="taxValue${sales.number }" name="taxValue" placeholder="부가세" value="${sales.taxValue }" onkeyup="sumData.addTaxValue()"></td>
                                </tr>
                                </c:forEach>
                            </table>
                            <!-- PAGE CONTENT ENDS -->
                        </div>
                    </div>
                    <input type="hidden" value="${saleslist[0].insertUserid }" name="insertUserid">
                    <input type="hidden" value="${saleslist[0].insertDay }" name="insertDay">
                </form>
                <!-- /.span -->

                <!-- /.row-fluid -->
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

            $.fn.datepicker.dates['ko'] = {
                days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                daysShort: ["일", "월", "화", "수", "목", "금", "토"],
                daysMin: ["일", "월", "화", "수", "목", "금", "토"],
                months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                today: "Today",
                clear: "Clear",
                format: "yyyy-mm-dd",
                titleFormat: "yyyy MM",
                /* Leverages same syntax as 'format' */
                weekStart: 0
            };
            $('.cl-date-picker').datepicker({
                language: 'ko',
                setDate: new Date()
            }).next().on(ace.click_event, function() {
                $(this).prev().focus();
            });
            $('.cl-date-picker').on('changeDate', function(ev){
                $(this).datepicker('hide');
            });
            $(".cl-date-picker").datepicker( "setDate" , new Date());
            setData.customer(); // 거래처 목록 세팅
            checkFlag(); // 조회 확인 플래그  + 기본행 삽입
            deleteCheck();
        })
    </script>
</body>

</html>