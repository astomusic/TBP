<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../stylesheets/style.css">
<title>show</title>
<script type="text/javascript"> 
	function del() {
		alert("댓글이 있는 글을 삭제할수 없습니다!");
	}
</script> 
</head>
<body>
	<div id="wrap">
		<h1>${board.title}</h1>
		<div id="show_content">
			<c:if test="${not empty board.attachment}">
			<img src="/images/${board.attachment}"><br>
			</c:if>
			${board.contents}<br><br>
			<button type="button" name="modify" onclick="location.href='/board/${board.id}/modify'">수정</button>
			<c:choose>
			<c:when test="${not empty board.comments}">
				<button type="button" name="delete" onclick="del()">삭제</button>
			</c:when>
			<c:otherwise>
			<button type="button" name="delete" onclick="location.href='/board/${board.id}/delete'">삭제</button>
			</c:otherwise>
			</c:choose>
			<button type="button" name="list" onclick="location.href='/board/list'">목록</button>
		</div>
		
		<div class="comment_view">
		<ul>
			<c:forEach items="${board.comments}" var="comment">
				<li>${comment.content} <button type="button" name="c_delete" onclick="location.href='/board/${comment.id}/comment_delete'">x</button></li>
				
			</c:forEach>
		</ul>
		</div>
		
		<div class="comment">
		<form action="/board/${board.id}/comment" method="POST" enctype="multipart/form-data">
	 	<textarea id="content" name="content" rows="1" cols="48" placeholder="댓글을 입력하세요"></textarea><br>
	 	<input type="submit" value="댓글"><br>
	 	</form>
		</div>
	</div>
</body>
</html>