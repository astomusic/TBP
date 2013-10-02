<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../stylesheets/style.css">
<title>TBP board</title>
</head>
<body>
<div id="wrap">
	<div id="name" >
		<h1>글쓰기 화면</h1>
	</div>
	<div id="request">
	 	<form action="/board" method="POST" enctype="multipart/form-data">
	 	<label for="title">제목 :</label> 
	 	<input type="text" id="title" name="title" size="45" value="${board.title}"><br>
	 	<textarea id="contents" name="contents" rows="10" cols="40">${board.contents}</textarea><br>
	 	<input type="file" name="img_file" size ="20" accept="image/*">
	 	<input type="submit" value="제출">
	 	</form>
	</div>
</div>
</body>
</html>