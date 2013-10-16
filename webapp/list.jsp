<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<title>List</title>
</head>
<body>
	<div id="wrap">
		<ul>
			<li>LIST</li>
			<c:forEach items="${boardlist}" var="item">
			<li><a href="/board/${item.id}">${item.title} - ${item.attachment} </a></li>
			</c:forEach>
		</ul>
		<button type="button" name="new" onclick="location.href='/board/form'">새글쓰기</button>
	</div>
</body>
</html>