<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="border-bottom">
		<div class="container">
			<jsp:include page="../../include/header.jsp" />
  		</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td>165</td>
						<td>게시판 입니다.</td>
						<td>신지환</td>
						<td>2022.09.29</td>
						<td>2</td>
					</tr>
					<tr>
						<td>166</td>
						<td>두번째 게시판 입니다.</td>
						<td>신지환</td>
						<td>2022.09.29</td>
						<td>1</td>
					</tr>
				</tbody>	
			</table>
			<a class="btn btn-light" href="/boardWrite">글쓰기</a>
			<div class="text-center"style="width : 300px; margin: auto;">
  				<ul class="pagination">
    				<li class="page-item">
      					<a class="page-link" href="#" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      					</a>
    				</li>
    				<li><a class="page-link" href="#">1</a></li>
    				<li><a class="page-link" href="#">2</a></li>
    				<li><a class="page-link" href="#">3</a></li>
   					<li>
      				<a class="page-link" href="#" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
  			</ul>
		</div>
	</div>
</body>
</html>