<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<title>List</title>
<script type="text/javascript"> 
	
	function del() {
		alert("댓글이 있는 글을 삭제할수 없습니다!");
	}
	
	function initPage() {
		countComments();
		registerEvents();
	}

	function countComments() {
		commentList = document.querySelectorAll('.comment_view>ul');
		commentcount = document.querySelectorAll('.comment>p');
		for(var i =0 ; i < commentList.length ; i++) {
			var currentNode = commentList[i];
			var nPListCount = currentNode.querySelectorAll('li').length;
			commentcount[i].innerHTML = "<a href='javascript:void(0)'>댓글 : " + nPListCount + "</a>";
		}
	}
	
	function registerEvents() {
		commenttog = document.querySelectorAll('.comment>p');
		for (var i=0 ; i < commenttog.length ; i++) {
			commenttog[i].addEventListener('click',toggleComments, false);
		}
		
		boardimg = document.querySelectorAll('.list_content>img');
		for (var i=0 ; i < boardimg.length ; i++) {
			boardimg[i].addEventListener('click',toggleimg, false);
		}
		
		formList = document.querySelectorAll('.comment input[type=submit]');
		for ( var i=0 ; i < formList.length ; i++) {
			formList[i].addEventListener('click',writeComments, false);
		}
		
		commentList = document.querySelectorAll('.comment_view>ul>li>button');
		for ( var i=0 ; i < commentList.length ; i++) {
			commentList[i].addEventListener('click',deleteComments, false);
		}
	}
	function deleteComments(e) {
		var eleForm = e.toElement.parentElement.firstElementChild;
		var sID = eleForm.id;
		var url = "/board/" +sID + "/comment_delete.json";
		var request = new XMLHttpRequest();
		request.open("POST" , url, true);
		request.onreadystatechange = function() {
			if(request.readyState ==4 && request.status ==200) {
				var deletedcomment = e.toElement.parentElement;
				var comments = deletedcomment.parentElement.parentElement;
				deletedcomment.outerHTML = "";
				var commentsli = comments.querySelectorAll('ul>li');
				comments.style.height = commentsli.length * 19 + "px";
				countComments();
			}
		}
		request.send(sID);
	}
	
	function writeComments(e) {
		e.preventDefault();
		var eleForm = e.currentTarget.form;
		var textbox = eleForm.querySelectorAll('input[type=text]');
		var oFormData = new FormData(eleForm); //form data들을 자동으로 묶어준다.
		textbox[0].value = "";
		var sID = eleForm[0].value;
		var url = "/board/" +sID + "/comments.json";
		var request = new XMLHttpRequest();
		request.open("POST" , url, true);
		request.onreadystatechange = function() {
			if(request.readyState ==4 && request.status ==200) {
				var obj = JSON.parse(request.responseText);
				var eleCommentList = eleForm.parentNode.previousElementSibling;
				var eleCommentListul = eleCommentList.querySelectorAll('ul');
				var str_del = "<button type=\"button\" name=\"c_delete\" onclick=\'javascript:void(0)\' id=\""+obj.id+"\">x</button>"
				eleCommentListul[0].insertAdjacentHTML("beforeend" , "<li>"+obj.content+str_del+"</li>" );
				var eleCommentListli = eleCommentList.querySelectorAll('ul>li');
				eleCommentList.style.height = eleCommentListli.length * 19 + "px";
				eleCommentList.style.opacity = "1";
				countComments();
				registerEvents();
			}
		}
		request.send(oFormData);
	}
	
	function toggleComments(e) {
		comment = e.target.parentNode.parentNode.parentNode.getElementsByClassName('comment_view');
		li = comment[0].querySelectorAll("ul>li");
		li_count = li.length;
		opacity = getStyle(comment[0], 'opacity');
		
		if(opacity === "1") {
			comment[0].style.opacity = "0";
			comment[0].style.height = "0px";
		} else if(opacity === "0") {
			comment[0].style.opacity = "1";
			comment[0].style.height = li_count*19 + "px";
		}
	}
	
	function toggleimg(e) {
		board = e.target.parentElement;
		head = board.querySelectorAll('h1');
		content_content = board.querySelectorAll('#content_content');
		buttons = board.querySelectorAll('.buttons');
		comment = board.querySelectorAll('.comment');
		comment_view = board.querySelectorAll('.comment_view');
		style = window.getComputedStyle(head[0]);
		display = style.getPropertyValue('display');
		if(display === "none") {
			head[0].style.display = "block";
			content_content[0].style.display = "block";
			buttons[0].style.display = "block";
			comment[0].style.display = "block";
		} else if(display === "block") {
			head[0].style.display = "none";
			content_content[0].style.display = "none";
			buttons[0].style.display = "none";
			comment[0].style.display = "none";
			comment_view[0].style.opacity = "0";
			comment_view[0].style.height = "0px";
		}
	}
	
	function getStyle(element, propoerty) {
		style = window.getComputedStyle(element);
		result = style.getPropertyValue(propoerty);
		return result;
	}

	window.onload = initPage;
</script>
</head>
<body>
	<div id="wrap">
		<header>
			<c:choose>
				<c:when test="${empty sessionScope.userid}">
					<a>로그인 해주세요</a>
					<button type="button" name="login" onclick="location.href='/'">Log in</button>
					<button type="button" name="signin" onclick="location.href='/login/form'">Sign in</button>
				</c:when>
				<c:otherwise>
					<a>${sessionScope.name}님 환영합니다.</a>
					<button type="button" name="signout" onclick="location.href='/logout'">Logout</button>
				</c:otherwise>
			</c:choose>
		</header>
		<h1>LIST</h1>
		<div id="board_list">
			<c:forEach items="${boardlist}" var="item">
				<div class="list_content">
					<h1>${item.title}</h1>
					<c:if test="${not empty item.attachment}">
						<img src="/images/${item.attachment}">
						<br>
					</c:if>
					<div id="content_content">${item.contents}</div>
					<div class=buttons>
						<button type="button" name="modify"
							onclick="location.href='/board/${item.id}/modify'">수정</button>
						<c:choose>
							<c:when test="${not empty item.comments}">
								<button type="button" name="delete" onclick="del()">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" name="delete"
									onclick="location.href='/board/${item.id}/delete'">삭제</button>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="comment_view">
						<ul>
							<c:forEach items="${item.comments}" var="comment">
								<li>${comment.content}
									<button type="button" name="c_delete" onclick='javascript:void(0)' id="${comment.id}">x</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="comment">
						<p></p>
						<form action="/board/${item.id}/comment" method="POST"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${item.id}"> 
							<input type="text" id="content" name="content" placeholder="댓글을 입력하세요">
							<input type="submit" value="댓글"><br>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="list_new">
			<button type="button" name="new"
				onclick="location.href='/board/form'">새글</button>
		</div>
	</div>
</body>
</html>