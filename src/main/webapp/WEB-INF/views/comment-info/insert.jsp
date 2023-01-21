<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>��ȣ</th>
		<td><input type="text" id="ciNum"></td>
	</tr>
	<tr>
		<th>�ۼ���</th>
		<td><input type="text" id="ciWriter"></td>
	</tr>
	<tr>
		<th>����</th>
		<td><textarea rows="10" cols="40" id="ciContent"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<button onclick="insertCommentInfo()">���</button>
			<button>����Ʈ</button>
		</th>
	</tr>
</table>
<script>
function insertCommentInfo(){
	const param = {};
	param.ciTitle = document.querySelector('#ciTitle').value;
	param['ciContent'] = document.querySelector('#ciContent').value;
	
	fetch('/comment-infos',{
		method:'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(async function(res){
		if(res.ok){
			return res.json();
		}else{
			const err = await res.text();
			throw new Error(err);
		}
	})
	.then(function(data){
		if(data===1){
			alert('������ �Ǿ����ϴ�.');
			location.href='/views/comment-info/list';
		}
		
	})
	.catch(function(err){
		alert(err);
	});
}
</script>
</body>
</html>