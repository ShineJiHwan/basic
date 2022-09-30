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
			<span>이름</span>
			<div class="input-group mb-3">
  				<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<span>아이디</span>
			<div class="input-group mb-3">
  				<input type="text" class="form-control" placeholder="ID" aria-label="ID" aria-describedby="basic-addon1">
			</div>
			<span>비밀번호</span>
			<div class="input-group mb-3">
  				<input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
			</div>
			<span>비밀번호 확인</span>
			<div class="input-group mb-3">
  				<input type="password" class="form-control" placeholder="PasswordCheck" aria-label="PasswordCheck" aria-describedby="basic-addon1">
			</div>
			<span>이메일</span>
			<div class="input-group mb-3">
  				<input type="text" class="form-control" placeholder="Username" aria-label="Username">
  				<span class="input-group-text">@</span>
  				<input type="text" id="domain-txt" class="form-control" placeholder="Server" aria-label="Server">	
				<select id="domain-list" class="form-select" aria-label="Default select example">
  					<option value="type" selected>직접입력</option>
  					<option value="naver.com">naver.com</option>
  					<option value="gmail.com">gmail.com</option>
  					<option value="daum.net">daum.net</option>
				</select>
			</div>
			<div class="buttonBox text-center">
				<button type="button" class="btn btn-secondary btn-lg" style="width: 49.5%;" onclick="location.href='/index'">취소</button>
				<button type="button" class="btn btn-primary btn-lg" style="width: 49.5%;" onclick="location.href='/index'">가입하기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  if(event.target.value !== "type") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  } else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
})
</script>
</body>
</html>