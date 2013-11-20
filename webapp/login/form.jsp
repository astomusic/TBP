<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<link rel="icon" href="/stylesheets/tbp.ico" />
<title>TBP board</title>
</head>
<body>
<div id="wrap">
	<header>
		<h1>New Member</h1>
	</header>
	<div id="request">
	 	<form action="/login/new" method="POST" enctype="multipart/form-data">
	 	<input type="text" id="name" name="name" size="45" placeholder="name"><br>
	 	<input type="text" id="userid" name="userid" size="45" placeholder="user id"><br>
	 	<input type="password" id="password" name="password" size="45" placeholder="password"><br>
	 	<div class=buttons>
	 		<input type="submit" value="제출">
	 		<button type="button" name="cancel" onclick="location.href='/'">취소</button>
	 	</div>
	 	</form>
	</div>
</div>
</body>
</html>