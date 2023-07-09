<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<title>회원목록</title>
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
        <h2>회원목록</h2>
        <table class="table">
            <thead>
                <tr>
                	<th>회원번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>부서번호</th>
                </tr>
            </thead>
            <tbody>
            
                <c:forEach items="${userList}" var="user">
                    <tr>
                    	<td>${user.userCode}</td>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userPhone}</td>
                        <td>${user.depCode}</td>
                        <td>
                            <a href="/userUpdate/${user.userId}" class="btn btn-primary btn-sm" >수정</a>
                            <a href="/userDelete/${user.userCode}" class="btn btn-danger btn-sm">삭제</a>
                        </td>
                    </tr>
               </c:forEach>
               
            </tbody>
        </table>
    </div>
    
	<script type="text/javascript" src="../member.js"></script>
</body>
</html>
