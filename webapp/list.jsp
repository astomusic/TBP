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
		//console.log('로딩이 됐슈');
		countComments();
		registerEvents();
	}
	
	function countComments() {
		//console.log('함수호출');
		commentList = document.querySelectorAll('.comment_view>ul');
		commentcount = document.querySelectorAll('.comment');
		//console.log(commentList);
		for(var i =0 ; i < commentList.length ; i++) {
			var currentNode = commentList[i];
			var nPListCount = currentNode.querySelectorAll('li').length;
			commentcount[i].insertAdjacentHTML("afterbegin","<a href='javascript:void(0)'>댓글 : " + nPListCount) + "</a>";
			//commentcount[i].insertAdjacentHTML("afterbegin","댓글 : " + nPListCount);
		}
	}
	
	function registerEvents() {
		commenttog = document.querySelectorAll('.comment>a');
		//console.log(commenttog);
		//contentList =
		for (var i=0 ; i < commenttog.length ; i++) {
			commenttog[i].addEventListener('click',toggleComments, false);
		}
		
		boardimg = document.querySelectorAll('.list_content>img');
		//console.log(boardimg);
		for (var i=0 ; i < boardimg.length ; i++) {
			boardimg[i].addEventListener('click',toggleimg, false);
		}
	}
	
	function toggleComments(e) {
		//console.log(e);
		//commentList = document.getElementsByClassName('comment_view');
		comment = e.target.parentNode.parentNode.getElementsByClassName('comment_view');
		li = comment[0].querySelectorAll("ul>li");
		li_count = li.length;
		console.log(li_count);
		style = window.getComputedStyle(comment[0]);
		display = style.getPropertyValue('display');
		opacity = style.getPropertyValue('opacity');
		//console.log(display);
		if(opacity === "1") {
			//comment[0].style.display = "block";
			comment[0].style.opacity = "0";
			comment[0].style.height = "0px";
		} else if(opacity === "0") {
			//comment[0].style.display = "none";
			comment[0].style.opacity = "1";
			comment[0].style.height = li_count*17 + "px";
		}
	}
	
	function toggleimg(e) {
		//.list_content>h1, .list_content>#content_content, .list_content>.buttons, .list_content>.comment
		//console.log(e);
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

	window.onload = initPage;
</script>
</head>
<body>
	<div id="wrap">
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
									<button type="button" name="c_delete"
										onclick="location.href='/board/${comment.id}/comment_delete'">x</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="comment">
						<form action="/board/${item.id}/comment" method="POST"
							enctype="multipart/form-data">
							<input type="text" id="content" name="content"
								placeholder="댓글을 입력하세요"> <input type="submit" value="댓글"><br>
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