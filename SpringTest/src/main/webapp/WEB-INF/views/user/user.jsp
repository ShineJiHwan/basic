<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
<link rel="stylesheet"  href="../resources/css/user.css" type="text/css" />
</head>
<header>
</header>
<body>
	<div class="border-bottom">
		<div class="container">
			<jsp:include page="../../include/header.jsp" />
  		</div>
	</div>
	<div class="container">
		<div class="col-md-6  col-md-offset-4 col-sm-6 col-sm-offset-3" id="login_box">
    		<div class="reg-page text-center"">
	   	 		<div class="reg-header">            
            		<h2>로그인</h2>
            	</div>
           	 	<div class="input-group margin-bottom-20">
            		<span class="input-group-addon"><i class="fa fa-user"></i></span>
                	<input type="text" placeholder="아이디 / 이메일" class="form-control" id="email" name="email" autofocus="autofocus">
           		</div>                    
            	<div class="input-group margin-bottom-20">
            		<span class="input-group-addon"><i class="fa fa-lock"></i></span>
                	<input type="password" placeholder="비밀번호" id="pw" class="form-control" name="pw">
           		</div>                    
            	<div class="row" id="login-row">
            		<div class="col-md-6 checkbox">
                		<label><input type="checkbox" name="auto_login"> 로그인 상태 유지</label>                        
                	</div>
               		<div class="col-md-6">
						<button id="LoginBtn" type="submit" class="btn btn-outline-secondary" data-loading-text="로그인 중...">로그인</button>
                	</div>
        		</div>
			</div>
		</div>
	</div>
</body>
<script>
$("#LoginBtn").click(function(){
	const email=$('#email').val();
	const pw=$('#pw').val();	
	const userinfo={
			email:email,
			pw:pw,
	};
	
	$.ajax({
		type:"post",
		url:"PT_login",
		headers:{"Content-Type":"application/json"},
		dataType:"text",
		data:JSON.stringify(userinfo),
		success:function(data){
			if(data=="loginOK"){
				alert(email+"님 환영합니다.");
				location.href='index';
			}else{
				if(data=="loginno"){
					alert("이메일 인증을 해주세요.")
				}
				if(data=="pwfail"){
					alert("비밀번호가 틀렸습니다.")
				}
				if(data=="NoEmail"){
					alert("아이디가 존재하지 않습니다.")
				}
			}
			
		},error:function(){
			console.log("실패");
		}
	})
	
});

</script>
</html>