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
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<title>signUp</title>
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
	<h2>회원가입</h2>
	<form action="userSignUp" method="post" id="userForm">
		<div class="row">
			<div class="col">
				<label for="userId">아이디:</label> <input type="text" class="form-control"
					id="userId" placeholder="아이디를 입력해주세요." name="userId">
			</div>
			<div class="col align-self-end">
				<button type="button" class="btn btn-primary" id="btnIdCheck">중복확인</button>
			</div>
		</div>
		<div class="form-group">
			<label for="userPwd">비밀번호:</label> <input type="password"
				class="form-control" id="userPwd" placeholder="비밀번호를 입력해주세요."
				name="userPwd">
		</div>
		<div class="form-group">
			<label for="pass_check">비밀번호 확인:</label> <input type="password"
				class="form-control" id="pass_check"
				placeholder="비밀번호 확인" name="pass_check">
		</div>
		<div class="form-group">
			<label for="userName">이름:</label> <input type="text" class="form-control"
				id="userName" placeholder="이름을 입력해주세요." name="userName">
		</div>
		
		<div class="form-group">
			<label for="userEmail">이메일:</label> <input type="text" class="form-control"
				id="userEmail" placeholder="이메일을 입력해주세요." name="userEmail">
		</div>
		
		<div class="form-group">
			<label for="userPhone">전화번호:</label> <input type="text" class="form-control"
				id="userPhone" placeholder="전화번호를 입력해주세요." name="userPhone">
		</div>
		
		<div class="form-group">
			<label for="depCode">부서 :</label> 
			<select class="form-control" id="depCode" name="depCode">
				<option value="1">부서1</option>
				<option value="2">부서2</option>
			</select>
		</div>
		
		<button type="button" class="btn btn-primary btn-sm" id="btnSignUp">회원가입</button>
	</form>
</div>

<script type="text/javascript" src="../member.js"></script>

</body>
</html>