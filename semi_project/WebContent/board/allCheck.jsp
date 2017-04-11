<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
//1.모두 체크
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
	</head>
	<body>
	<table>
	<tr><td><input type="button" value="저장" id="save"></td></tr>
	<tr><td><input type="button" value="삭제" id="del"></td></tr>
	</table>
<thead>
    <tr>
        <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></th>
    </tr>
</thead>
<tbody>
    <tr>
        <td class="center"><input type="checkbox" name="checkRow" value="${content.IDX}" /></td>
         <th scope="col"><input id="allCheck" type="checkbox" onclick="allChk(this);"/>전체삭제</th>
</tbody>

	</body>
	</html>
