/**
 * 
 */

 $(document).ready(function(){
	 
	
	$("#btnSignUp").click(function(){
		
		
		var data={
			"userId":$("#userId").val(),
			"userPwd":$("#userPwd").val(),
			"userName":$("#userName").val(),
			"userEmail":$("#userEmail").val(),
			"userPhone":$("#userPhone").val(),
			"depCode":$("#depCode").val()
		}
		
		$.ajax({
			type:"post",
			url:"/userSignUp",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data)
		})
		.done(function(res){
			if(res=="success"){
				alert("회원가입을 축하합니다.");
				location.href="/userSignIn";
			}else if(res=="fail"){
				alert("아이디 중복확인하세요.");
				$("#id").val("")
			}
		})
		//$("#frm").submit();
		
	});
	
	
	$("#btnSignIn").click(function() {
		
	
		$.ajax({
			type : "post",
			url : "/userSignIn",
			data : {
		    	"userId" : $("#userId").val(),
		    	"userPwd" : $("#userPwd").val()
		  }
		
		}).done(function(resp) {
			if (resp == "no") {
				alert("회원이 아닙니다. 회원가입하세요");
				location.href = "/"
			} else if (resp == "success") {
				alert("로그인 성공");
				location.href = "/userList"
			} else {
				alert("비밀번호를 확인하세요");
			}
		})
	});


	$("#btnUp").click(function(){
			
			var data={
				"userId":$("#userId").val(),
				"userPwd":$("#userPwd").val(),
				"userName":$("#userName").val(),
				"userEmail":$("#userEmail").val(),
				"userPhone":$("#userPhone").val(),
				"depCode":$("#depCode").val()
			}
			
			
			$.ajax({
				type:"post",
				url:"/userUpdate",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data)
			})
			.done(function(res){
				if(res=="success"){
					alert("회원정보가 수정되었습니다.");
					location.href="/userList";
				}
			})
		});

	
	$('#btnIdCheck').click(function() {
	    var userId = $('#userId').val(); 
	     if (userId.length < 2) {
		      alert('아이디는 최소 2자 이상이어야 합니다.');
		      return;
		}
	    // 서버에 중복 체크 요청
	    $.ajax({
	      url: '/findByUserId', 
	      method: 'POST',
	      data: { userId: userId },
	      success: function(response) {
	        if (response === 'duplicate') {
	          alert('이미 사용 중인 아이디입니다.');
	        } else {
	          alert('사용 가능한 아이디입니다.');
	        }
	      },
	      error: function() {
	        alert('중복 체크에 실패했습니다. 다시 시도해주세요.');
	      	}
	   	});
	});
	
	
	 $('#userForm').validate({
	    rules: {
		userId: {
	        required: true,
	        minlength: 2
	      },
	      userPwd: {
	        required: true,
	        minlength: 6
	      },
	      pass_check: {
	        required: true,
	        equalTo: '#userPwd'
	      },
	      userName: 'required',
	      userEmail: {
	        required: true,
	        email: true
	      },
	      userPhone: {
	        required: true,
	        digits: true
	      }
	    },
	    messages: {
			userId: {
	        required: "아이디를 입력해주세요.",
	        minlength: "아이디는 최소 2자 이상이어야 합니다."
	      },
	      userPwd: {
	        required: '비밀번호를 입력해주세요.',
	        minlength: '최소 {0}자 이상 입력해주세요.'
	      },
	      pass_check: {
	        required: '비밀번호 확인을 입력해주세요.',
	        equalTo: '비밀번호가 일치하지 않습니다.'
	      },
	      userName: '이름을 입력해주세요.',
	      userEmail: {
	        required: '이메일을 입력해주세요.',
	        email: '유효한 이메일 주소를 입력해주세요.'
	      },
	      userPhone: {
	        required: '전화번호를 입력해주세요.',
	        digits: '숫자만 입력해주세요.'
	      }
	    },
	    submitHandler: function(form) {
	      form.submit();
	    }
	    
	  });
	  
		
	});