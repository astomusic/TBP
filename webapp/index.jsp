<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<title>TBP</title>
</head>
<body>
<div id="wrap">
	<div id="index_butten">
	<button type="button" name="new" onclick="location.href='/board/form'">새글</button>
	<button type="button" name="list" onclick="location.href='/board/list'">목록</button>
	<button type="button" name="signin" onclick="location.href='/login/form'">가입</button>
	</div>
</div>
</body>
</html>