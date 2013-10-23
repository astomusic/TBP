<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<title>List</title>
</head>
<body>
	<div id="wrap">
		<h1>LIST</h1>
			<div id="board_list">
				<c:forEach items="${boardlist}" var="item">
				<div class="list_content"><a href="/board/${item.id}">${item.title} - ${item.attachment} </a></div>
				</c:forEach>
			</div>
		<div id="list_new">
		<button type="button" name="new" onclick="location.href='/board/form'">새글</button>
		</div>
	</div>
</body>
</html>