<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<div class="border-bottom">
		<div class="container">
			<jsp:include page="../../include/header.jsp" />
  		</div>
	</div>
	<div class="container board_write_wrap ">
		<h2 class="board_write_title text-center"><b>자유 게시판</b></h2>
		<input placeholder="제목을 입력해 주세요." id="board_title" style="height: 40px; width : 100%; margin: auto" />
		<div>
			<textarea id="board_summernote"></textarea>
		</div>
		
	</div>
	<script> 
	
		$('#board_summernote').summernote({
			placeholder : '내용을 입력해주세요',
			tabsize : 300,
			height : 500,
			
			lang : 'ko-KR',
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				}
			}
		});
	</script>
</body>
</html>

