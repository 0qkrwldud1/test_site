<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<title>회원수정</title>
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
    <h2>회원 수정</h2>
    <form:form action="userUpdate" method="POST" modelAttribute="user">
        <div class="form-group">
            <label for="userId">아이디:</label>
            <form:input path="userId" id="userId" class="form-control" placeholder="아이디를 입력해주세요." readonly="true" />
        </div>
        <div class="form-group">
            <label for="userPwd">비밀번호:</label>
            <form:password path="userPwd" id="userPwd"  class="form-control" placeholder="수정할 비밀번호를 입력해주세요." autocomplete="off" />
        </div>
        <div class="form-group">
            <label for="userName">이름:</label>
            <form:input path="userName" id="userName"  class="form-control" placeholder="이름을 입력해주세요." />
        </div>
        <div class="form-group">
            <label for="userEmail">이메일:</label>
            <form:input path="userEmail" id="userEmail"  class="form-control" placeholder="이메일을 입력해주세요." />
        </div>
        <div class="form-group">
            <label for="userPhone">전화번호:</label>
            <form:input path="userPhone" id="userPhone" class="form-control" placeholder="전화번호를 입력해주세요." />
        </div>
        <div class="form-group">
            <label for="depCode">부서:</label>
            <form:select path="depCode" id="depCode"  class="form-control">
                <form:option value="">부서를 선택해주세요.</form:option>
                <form:option value="1">부서1</form:option>
                <form:option value="2">부서2</form:option>
            </form:select>
        </div>
        <button type="button" class="btn btn-primary" id="btnUp">수정</button>
    </form:form>
</div>

<script type="text/javascript" src="../member.js"></script>
</body>
</html>
