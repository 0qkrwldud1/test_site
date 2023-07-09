<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>signIn</title>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
		
		<a class="navbar-brand" href="/">회원가입 프로그램</a>

		<ul class="navbar-nav">
		<c:choose>
			<c:when test="${empty sessionScope.cUser }">
				<li class="nav-item"><a class="nav-link" href="/userSignIn">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><a class="nav-link" href="/userList">회원목록</a>
				<li class="nav-item"><a class="nav-link" href="/userSignOut">로그아웃(${cUser.userId})</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
	</nav>

	<div class="container">
	<h2>로그인</h2>
		<form action="userSignIn" method="post">
	
			<div class="form-group">
				<label for="userId">아이디:</label> 
				<input type="text" class="form-control"
					id="userId" placeholder="아이디를 입력하세요." name="userId">
			</div>
			<div class="form-group">
				<label for="userPwd">비밀번호:</label> <input type="password"
					class="form-control" id="userPwd" placeholder="비밀번호를 입력하세요."
					name="userPwd">
			</div>
			<button type="button" class="btn btn-primary btn-sm" id="btnSignIn">로그인</button>
		</form>
	</div>
	
	<script type="text/javascript" src="../member.js"></script>

</body>
</html>