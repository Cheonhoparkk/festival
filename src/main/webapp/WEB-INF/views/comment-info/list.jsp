<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���</h2>
<input type="text" id="ciWriter"><button onclick="getCommentInfos()">�˻�</button>
<table border="1">
	<tr>
		<th>��ȣ</th>
		<th>�ۼ���</th>
		<th>����</th>
		<th>�ۼ���</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>
<button onclick="location.href='/views/comment-info/insert'">���</button>
<script>
function getCommentInfos(){
	fetch('/comment-infos?ciWriter=' + document.querySelector('#ciWriter').value)
	.then(function(res){
		return res.json();
	})
	.then(function(list){
		let html = '';
		for(let i=0;i<list.length;i++){
			const boardInfo = list[i];
			html += '<tr>';
			html += '<td>' + commentInfo.ciNum + '</td>';
			html += '<td><a href="/views/comment-info/view?ciNum=' + commentInfo.ciNum + '">' + commentInfo.ciWriter + '</a></td>';
			html += '<td>' + commentInfo.uiId + '</td>';
			html += '<td>' + commentInfo.ciRegdate + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	})
};
window.onload = function(){
	getCommentInfos()
}
</script>
</body>
</html>