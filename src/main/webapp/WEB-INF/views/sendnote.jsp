<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media
screen
and
(min-width:512px)
and
(max-width:1024px)
</style>
<title>Insert title here</title>
<style>
body {
	background-image: url('resources/img/back.gif');
	background-size: 800px 600px;
	text-align: center;
}

table {
	/* margin-left: 380px; */
	margin: 0 auto;
}
#btn_s{
	background : pink;
	border-radius: 5px;
	border-color: pink;
	cursor : pointer;
	border: 1px solid #fbd6e3;
	color: #004080; 
	padding: 3px; 
}
</style>
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	 <script type="text/javascript">
      
      function InputValidation() {
    	  if ($("#takenick").val() == "") {
              alert("받는사람을 입력해주세요.");
              $("#takenick").focus();
              return false;
           } else if ($("#title").val() == "") {
  				alert("제목을 입력해주세요.");
  				$("#title").focus();
  				return false;
           } else if ($("#content").val() == "") {
  				alert("내용을 입력해주세요.");
  				$("#content").focus();
  				return false;
  		 } 
           return true;
      }
      $(document).ready(function() {
			$(".cencle").click(function() {
				history.back();
			});
		});
      $(function(){
    	  var takenick =$('#takenick').val(); 
    	  var title =$('#title').val(); 
    	  var content =$('#content').val();
    	  if (takenick != "" || title !="" || content != ""  ) {
    		  $(document).ready(function() {
	    		  $('.sendbtn').on("click", function() {
    		  alert("쪽지 전송이 완료 되었습니다.");
				return true; 
    		  }); 
    		  });
    		  }
    	  else{
    		  return false;
    	  }
      });
      
      </script>
	<h1>쪽지 보내기</h1>
	<form action="send" method="post" onsubmit="return InputValidation()">
	<input type="hidden" id="nonum" name="nonum" value="${nonum }" />
		<table class="loginc" border="3">
			<tr>
				<td>보내는사람</td>
				<td><input style="width: 400px; height: 50px;" id="sendnick"
					name="sendnick" value="${membernick }" readonly="${membernick }" /></td>
			</tr>
			<tr>
				<td>받는사람</td>
				<td><input type="text" style="width: 400px; height: 50px;"
					id="takenick" name="takenick" placeholder="상대방의 닉네임을 정확히 써주세요." /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" style="width: 400px; height: 50px;"
					id="title" name="title" placeholder="제목을 입력해주세요." /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="10" id="content" name="content" placeholder="내용을 입력해주세요."></textarea></td>
			</tr>
		</table>
		<br />
		<button type="submit" id="btn_s" class="sendbtn">전송</button>
		<input type="button" id="btn_s" class="cencle" value="취소" />
	</form>

</body>
</html>