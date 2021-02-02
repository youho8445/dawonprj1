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
   background-image: url('resources/img/icon3.png');
   background-size: 800px 600px;
}

#title {
   margin-top: 30px;
   margin-bottom: 10px;
}

body, tr, td {
   font-family: "돋움";
   font-size: 15px;
   color: #666;
}

#content, tbody {
   /* margin: 10px 250px 0px 250px; */
   padding-right: 70px;
   border-style: dotted;
   border-color: pink;
}

#title strong {
   font-size: 25px;
   font-weight: bold;
}
.btn_s{
	background : #fbd6e3;
	border-radius: 5px;
	border-color: #fbd6e3;
	cursor : pointer;
	border: 1px solid #fbd6e3;
	color: #004080; 
	padding: 3px; 
}
</style>
</head>
<body onresize="parent.resizeTo(800,600)"
   onload="parent.resizeTo(800,600)">
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript">
    $(document).ready(function() {
         $("#cencle").click(function() {
            history.back();
         });
      });
   </script>
   <div id="content">

      <h2>쪽지가 성공적으로 발송 되었습니다.</h2>
       <h3><button type="button" class="btn_s"><a href="minihompy?memberid=${memberid }">내 미니홈피로 돌아가기</a></button></h3>
      <button type="button" class="btn_s" id="cencle">뒤로 돌아가기</button>


   </div>

</body>
</html>