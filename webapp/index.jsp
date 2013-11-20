<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<link rel="icon" href="/stylesheets/tbp.ico" />
<title>TBP</title>
</head>
<body>
	<div id="wrap">
		<h1>Welcome!</h1>
<!-- 		<div id="index_butten">
			<button type="button" name="new" onclick="location.href='/board/form'">새글</button>
			<button type="button" name="list" onclick="location.href='/board/list'">목록</button>
		</div> -->
		<div id="login">
			<form action="/login/get" method="POST" enctype="multipart/form-data">
					<input type="text" id="userid" name="userid" size="50" placeholder="USER ID"><br> 
					<input type="password" id="password" name="password" size="50" placeholder="PASSWORD"><br>
				<div class=buttons>
					<input type="submit" value="Login">
					<button type="button" name="signin" onclick="location.href='/login/form'">Sign in</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>