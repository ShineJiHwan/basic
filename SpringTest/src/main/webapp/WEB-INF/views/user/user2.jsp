<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<header>
	<div class="container text-center">
		<a href="/index" class="align-items-center text-decoration-none ">
    		<img alt="logo" width="250" height="250" aria-label="logo" src="../resources/img/logo.png">
    	</a>
  	</div>
</header>
<body style="background-color: #e9ffb9">
	<div class="container" style="max-width: 600px; max-height: 460px;">
		<div class="content">
			<form id="MemberShipForm" data-page="login" action="membership" method="post">
			<span class="mt-3">이메일</span>
			<div class="input-group mb-3">
  				<input type="text" id="email" name="email" class="form-control email_form" placeholder="Username" aria-label="Username">
  				<span class="input-group-text">@</span>
  				<input type="text" id="domain" name="domain" class="form-control email_form" placeholder="Server" aria-label="Server">	
				<select id="domain-list" class="form-select email_form" aria-label="Default select example">
  					<option value="type" selected>직접입력</option>
  					<option value="naver.com">naver.com</option>
  					<option value="gmail.com">gmail.com</option>
  					<option value="daum.net">daum.net</option>
				</select>
				<div class="input-group">
					<span id="email_ch"></span>				
				</div>
			</div>
			
			<span class="mt-3">비밀번호</span>
			<div class="input-group mb-3">
  				<input type="password" id="pw" name="pw" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
				<div class="input-group">
					<span id="pwd_ch"></span>
				</div>				
			</div>
			
			<span class="mt-3">비밀번호 확인</span>
			<div class="input-group mb-3">
  				<input type="password" id="password_check" class="form-control" placeholder="PasswordCheck" aria-label="PasswordCheck" aria-describedby="basic-addon1">
				<div class="input-group">
					<span id="pwd_ch2"></span>	
				</div>			
			</div>
			
			<span class="mt-3">이름</span>
			<div class="input-group mb-3">
  				<input type="text" id="name" name="name" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				<div class="input-group">
					<span id="name_ch"></span>
				</div>				
			</div>

			
			<span class="mt-3">핸드폰 번호</span>
			<div class="input-group mb-3">
  				<input type="text" id="phone" name="phone" class="form-control" placeholder="010-1234-5678" aria-label="PhoneNumber" aria-describedby="basic-addon1">
				<div class="input-group">
					<span id="phone_ch"></span>
				</div>				
			</div>

			<div class="buttonBox text-center mt-4">
				<button type="button" class="btn btn-secondary btn-lg" style="width: 49.5%;" onclick="location.href='/index'">취소</button>
				<button type="button" class="btn btn-primary btn-lg" style="width: 49.5%;" id="email_submit">가입하기</button>
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		const domainListEl = document.querySelector('#domain-list');
		const domainInputEl = document.querySelector('#domain');
		// select 옵션 변경 시
		domainListEl.addEventListener('change', (event) => { //email 서버 선택자
		  // option에 있는 도메인 선택 시
		  if(event.target.value !== "type") {
		    // 선택한 도메인을 input에 입력하고 disabled
		    domainInputEl.value = event.target.value;
		    domainInputEl.disabled = true;
		  } else { // 직접 입력 시
		    // input 내용 초기화 & 입력 가능하도록 변경
		    domainInputEl.value = "";
		    domainInputEl.disabled = false;
		  }
		});
		
		$(function(){ //유효성 검사 및 회원가입 from 전송
			var getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
			var getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
			var getName= RegExp(/^[가-힣]+$/);
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]/);
			var getMailServer = RegExp(/^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var getPhone = RegExp(/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/);
			var chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
		
			//회원가입 검증~~
			//ID 입력값 검증.
			$('.email_form').on('change keyup', function() {
				if($("#email").val() == ""){
					$('#email_ch').html('<b style="font-size:16px;color:red;">[이메일은 필수 정보에요!]</b>');
					chk1 = false;
				}
				
				//아이디 유효성검사
				else if(!getMail.test($("#email").val())){
					$('#email_ch').html('<b style="font-size:16px;color:red;">[이메일 형식에 맞게 써주세요!]</b>');	  
					chk1 = false;
				}
				else if(!getMailServer.test($("#domain").val())){
					$('#email_ch').html('<b style="font-size:16px;color:red;">[이메일 형식에 맞게 써주세요!]</b>');	
					chk1 = false;
				}
				 //ID 중복확인 비동기 처리
 				 else {
 					var um = $("#email").val();
 					var domain = $("#domain").val();
 					var userEmail = um+"@"+domain;
					$.ajax({
						type: "POST",
						url: "/confirmEmail",
						headers: { 
							'Accept': 'application/json',
	            'Content-Type': 'application/json' 
	            },
						data: JSON.stringify({email:userEmail}),
						dataType:"text",
						success: function(data) {
							if($.trim(data) == "YES") {
								$('#email').css("background-color", "white");
								 $('#email_ch').html('<span></span>');
								/*$('#email_ch').css({'color':'#E95753',}); */
								chk1 = true;
							} else {
								$('#email_ch').html('<b style="font-size:16px;color:red;">[중복된 Email입니다!]</b>');
								chk1 = false;
							}
						}
					});
				}
			});	
			$('#pw').on('change keyup', function() {
				//비밀번호 공백 확인
				if($("#pw").val() == ""){
					$('#pwChk').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보에요!]</b>');
					chk2 = false;
				}		         
				//비밀번호 유효성검사
				else if(!getPwCheck.test($("#pw").val()) || $("#pw").val().length < 8 || $("#pw").val().length > 14){
					$('#pwd_ch').html('<b style="font-size:16px;color:red;">[특수문자 포함 8자이상으로 작성해주세요!]</b>');
					chk2 = false;
				} else {
					$('#pw').css("background-color", "white");
					$('#pwd_ch').html('<b></b>');
					$('#pwd_ch').css({'color':'#E95753',});
					chk2 = true;
				}
			});
			//패스워드 확인란 입력값 검증.
			$('#password_check').on('change keyup', function() {
				//비밀번호 확인란 공백 확인
				if($("#password_check").val() == ""){
					$('#pwd_ch2').html('<b style="font-size:16px;color:red;">[패스워드확인은 필수정보에요!]</b>');
					
					chk3 = false;
				}		         
				//비밀번호 확인란 유효성검사
				else if($("#pw").val() != $("#password_check").val()){
					$('#pwd_ch2').html('<b style="font-size:16px;color:red;">[비밀번호가 일치하지 않습니다!]</b>');
					chk3 = false;
				} else {
					$('#pwd_ch2').html('<b></b>');
					chk3 = true;
				}
			});
			//이름 입력값 검증.
			$('#name').on('change keyup', function() {
				//이름값 공백 확인
				if($("#name").val() == ""){
					$('#name_ch').html('<b style="font-size:16px;color:red;">[이름은 필수정보에요!]</b>');
					chk4 = false;
				}
				else{
					$('#name_ch').html('<b></b>');
					chk4 = true;
				}
			});
			//핸드폰 유효성 검증
			$('#phone').on('change keyup', function() {
				//이름값 공백 확인
				if($("#phone").val() == ""){
					$('#phone_ch').html('<b style="font-size:16px;color:red;">[전화번호를 입력해주세요!]</b>');
					chk5 = false;
				}
				else if(!getPhone.test($("#phone").val())){
					$('#phone_ch').html('<b style="font-size:16px;color:red;">[전화번호를 올바르게 적어주세요!]</b>');
					chk5 = false;
				}
				else{
					$('#phone_ch').html('<b></b>');
					chk5 = true;
				}
			});
			$('#email_submit').click(function(e) {
				if(chk1 && chk2 && chk3 && chk4 && chk5) {
					var answer = confirm('회원가입을 완료하시겠습니까?');
					if(answer) {
						e.preventDefault();
						$('#MemberShipForm').submit();
					} 
				} else {
					alert('입력정보를 다시 확인하세요.');	
					return false;
				}
			});
		});
		
		
</script>
</body>
</html>