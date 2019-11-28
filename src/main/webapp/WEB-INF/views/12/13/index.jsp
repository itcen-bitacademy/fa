<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
    <c:import url="/WEB-INF/views/common/head.jsp" />
    <style>
    	#sample-table-1 tr td{
    		padding:0;
    	}
    	#sample-table-1 tr td p{
    		padding:8px;
    		margin:0;
    	}
    	#sample-table-1 tr td input{
    		padding:8px;
    		margin:0;
    		width:94%;
			border:0
    	}    
    </style>
    <script>
	    cnt = 2;   
	    ctg_cnt = 3;
	    function add_row() {
	        var table = document.getElementById("sample-table-1");
	        var row = table.insertRow(table.rows.length); // 하단에 추가       
	        var cell1 = row.insertCell(0);
	        var cell2 = row.insertCell(1);
	        var cell3 = row.insertCell(2);
	        var cell4 = row.insertCell(3);
	        var cell5 = row.insertCell(4);
	        var cell6 = row.insertCell(5);
	        cell1.innerHTML =   '<td><p>'+cnt+'</p></td>';
	        cell2.innerHTML = 	'<td><input type="text" id="" placeholder="품목코드"></td>';
	        cell3.innerHTML = 	'<td><input type="text" id="" placeholder="품목명"></td>';
	        cell4.innerHTML = 	'<td><input type="text" id="" placeholder="수량"></td>';
	        cell5.innerHTML = 	'<td><input type="text" id="" placeholder="공급가액"></td>';
	        cell6.innerHTML = 	'<td><input type="text" id="" placeholder="부가세"></td>';
	        cnt++;
	    }
	
	    function delete_row() {
	        var table = document.getElementById('sample-table-1');
	        if (table.rows.length < 3){
	        	return;
	        } else {
	        	cnt--
	        	table.deleteRow(table.rows.length - 1); // 하단부터 삭제
	        }
	    } 
    </script>
</head>

<body class="skin-3">
    <c:import url="/WEB-INF/views/common/navbar.jsp" />
    <div class="main-container container-fluid">
        <c:import url="/WEB-INF/views/common/sidebar.jsp" />
        <div class="main-content">
            <div class="page-content">


                <div class="page-header position-relative">
                    <h1 class="pull-left">매출관리</h1>
                </div>
                <!-- /.page-header -->
                


                    <!-- PAGE CONTENT BEGINS -->
               <div class="row-fluid">
                    <div class="span12">
                        <form class="form-horizontal" method="post" action="">
                            <!-- left -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="form-field-1">매출관리</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-1" placeholder="매출관리">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-4">거래처코드</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="form-field-select-1" name="role" data-placeholder="팀선택">
                                            <option value="">&nbsp;</option>
                                            <option value="1234567890">1234567890</option>
                                            <option value="4567890123">4567890123</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">거래처담당자</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-5" placeholder="거래처담당자">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-7">출고일</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-7" placeholder="출고일">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-9">수량합계</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-9" placeholder="수량합계">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-10">공급가액합계</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-10" placeholder="공급가액합계">
                                    </div>
                                </div>
                            </div>
                            <!-- right -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="form-field-2">매출번호</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-2" placeholder="매출번호">
                                        <div class="btn-group">
                                            <button class="btn btn-info btn-small">조회</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-3">거래처명</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-3" placeholder="거래처명">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-6">거래처연락처</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-6" placeholder="거래처연락처">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-8">세금계산서번호</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-8" placeholder="세금계산서번호">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-10">공급가액합계</label>
                                    <div class="controls">
                                        <input type="text" id="form-field-10" placeholder="공급가액합계">
                                    </div>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
                <div class="hr hr-10 dotted"></div>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="btn-group">
                            <button class="btn btn-success btn-small">입력</button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-info btn-small">수정</button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-danger btn-small">삭제</button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-small" onclick="add_row();">행추가</button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-small" onclick="delete_row();">행삭제</button>
                        </div>
                    </div>
                </div>
                <div class="hr hr-10 dotted"></div>
                <div class="row-fluid">
                    <div class="span12">
                        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                        	<tr>
                                <th>순번</th>
                                <th>품목코드</th>
                                <th>품목명</th>
                                <th>수량</th>
                                <th>공급가액</th>
                                <th>부가세</th>
                            </tr>
                            <tr>
                                <td><p>1</p></td>
                                <td><input type="text" id="" placeholder="품목코드"></td>
                                <td><input type="text" id="" placeholder="품목명"></td>
                                <td><input type="text" id="" placeholder="수량"></td>
                                <td><input type="text" id="" placeholder="공급가액"></td>
                                <td><input type="text" id="" placeholder="부가세"></td>
                            </tr>
                        </table>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                </div>
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
    <script>
        $(function() {
            $(".chosen-select").chosen();
        });
    </script>
</body>

</html>