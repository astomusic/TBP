<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../stylesheets/style.css">
<link rel="icon" href="/stylesheets/tbp.ico" />
<title>TBP board</title>
</head>
<body>
<div id="wrap">
	<header>
		<h1>New Post</h1>
	</header>
	<div id="new_post">
	 	<form action="/board" method="POST" enctype="multipart/form-data">
	 	<input type="text" id="title" name="title" size="45" placeholder="제목을 입력하세요"><br>
	 	<textarea id="contents" name="contents" rows="10" cols="40" placeholder="내용을 입력하세요"></textarea><br>
	 	<input type="file" name="img_file" size ="20" accept="image/*" value="파일"><br>
	 	<input type="submit" value="제출">
	 	<button type="button" name="cancel" onclick="location.href='/board/list'">취소</button>
	 	</form>
	</div>
</div>
</body>
</html>