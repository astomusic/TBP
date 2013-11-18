<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<title>TBP board</title>
</head>
<body>
<div id="wrap">
	<div id="name" >
		<h1>글쓰기 수정</h1>
	</div>
	<div id="request">
	 	<form action="/board/${board.id}/modified" method="POST" enctype="multipart/form-data">
	 	<input type="text" id="title" name="title" size="45" value="${board.title}"><br>
	 	<textarea id="contents" name="contents" rows="10" cols="40">${board.contents}</textarea><br>
	 	<input type="file" name="img_file" size ="20" accept="image/*"><br>
	 	<input type="submit" value="제출">
	 	<button type="button" name="cancel" onclick="location.href='/board/list'">취소</button>
	 	</form>
	</div>
</div>
</body>
</html>