<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#wrap {
	text-align: center;
	margin: 0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<div id="name" >
		<h1>글쓰기 화면</h1>
	</div>
	<div id="request">
	 	<form action="/board" method="POST">
	 	<label for="title">제목 :</label> <input type="text" name="title" size="80" placeholder="제목을 입력하세요"><br>
	 	<textarea name="content" rows="10" cols="65" placeholder="내용을 입력하세요"></textarea><br>
	 	<input type="submit">
	 	</form>
	</div>
</div>
</body>
</html>