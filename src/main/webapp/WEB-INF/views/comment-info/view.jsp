<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="cDiv"></div>
<div id="btnDiv" style="display:none">
	<button onclick="location.href='/views/comment-info/update?ciNum=${param.ciNum}'">����</button>
	<button onclick="deleteCommentInfo()">����</button>
</div>
<script>
function deleteCommentInfo(){
	fetch('/comment-infos/${param.ciNum}',{
		method:'DELETE'
	})
	.then(function(res){
		return res.json();
	})
	.then(function(data){
		if(data===1){
			alert('���� �Ϸ�');
			location.href='/views/comment-info/list';
		}
	});
}
function getComment(){
	fetch('/comment-infos/${param.ciNum}')
	.then(function(res){
		return res.json();
	})
	.then(function(commentInfo){
		let html = '';
		html += '��ȣ : ' + commentInfo.ciNum + '<br>';
		html += '�ۼ��� : ' + commentInfo.ciWriter + '<br>';
		html += '���� : ' + commentInfo.ciContent + '<br>';
		html += '�ۼ��� : ' + commentInfo.ciRegdate + '<br>';
		document.querySelector('#cDiv').innerHTML = html;
		if(commentInfo.fiNum == '${festivalInformation.fiNum}'){
			document.querySelector('#btnDiv').style.display = '';
		}
	});
}
window.onload = function(){
	getComment();
}
</script>
</body>
</html>