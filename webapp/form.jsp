<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../stylesheets/style.css">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<div id="name" >
		<h1>글쓰기 화면</h1>
	</div>
	<div id="request">
	 	<form action="/board/result" method="POST" enctype="multipart/form-data">
	 	<label for="title">제목 :</label> 
	 	<input type="text" name="title" size="45" placeholder="제목을 입력하세요"><br>
	 	<textarea name="content" rows="10" cols="40" placeholder="내용을 입력하세요"></textarea><br>
	 	<input type="file" name="img_file" size ="20" accept="image/*">
	 	<input type="submit" value="제출">
	 	</form>
	</div>
</div>
</body>
</html>