<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../stylesheets/style.css">
<title>show</title>
</head>
<body>
	<div id="wrap">
		<h1>TITLE : ${board.title}</h1>
		<div>
			<img src="/images/${board.attachment}"><br>
			CONTENTS : ${board.contents}<br>
			<button type="button" name="modify" onclick="location.href='/board/${board.id}/modify'">수정</button>
			<button type="button" name="delete" onclick="location.href='/board/${board.id}/delete'">삭제</button>
		</div>
	</div>
</body>
</html>