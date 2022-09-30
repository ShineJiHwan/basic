<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css"> -->

<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3">
	<a href="/index" class="d-flex align-items-center text-dark text-decoration-none">
    	<img alt="logo" class="bi me-2" width="100" height="100" aria-label="logo" src="../resources/img/translogo.png">
    </a>
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
		<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
   	    <li><a href="/board" class="nav-link px-2 link-dark">게시판</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
    </ul>
    <div class="col-md-3 text-end">
    	<button type="button" class="btn btn-outline-primary me-2" onClick="location.href='/login'">Login</button>
    	<button type="button" class="btn btn-primary" onClick="location.href='/membership'">회원가입</button>
	</div>
</header>