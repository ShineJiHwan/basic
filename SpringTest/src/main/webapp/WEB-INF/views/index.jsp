<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 사이트</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<div class="border-bottom">
	<div class="container">
	<jsp:include page="../include/header.jsp" />
  	</div>
</div>
<body>
	<div class="container">
		<!-- bootstrap silder -->
		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel"><!-- style="width: 800px; hight:289; margin:auto;" -->
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img src="../resources/img/slide1.png" class="d-block w-100" alt="...">
    			</div>
    			<div class="carousel-item" style="background-image: ../resources/img/slid3background.png">
      				<img src="../resources/img/slide3.jpg" class="d-block w-100" alt="...">
    			</div>
  			</div>
  			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Previous</span>
  			</button>
  			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Next</span>
  			</button>
		<!-- /bootstrap silder -->
		</div>
		
	<!-- ../resources/img/indeximg.jpeg -->	
	<!-- ../resources/img/indeximg2.jpg -->	
		
		<button type="button" class="btn btn-dark">시작하기</button>
	</div>
</body>
</html>
