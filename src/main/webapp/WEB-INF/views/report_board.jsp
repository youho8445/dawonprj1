<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media screen and (min-width:512px) and (max-width:1024px)
</style> 
<link rel="stylesheet" href="resources/css/mstyle.css" />
<link rel="stylesheet" href="resources/css/sidemenu.css" />
<title>Insert title here</title>
</head>
<style>
form{
   text-align: center;
}
h3 {
   text-align: center;
}

table {
   margin: 20px auto;
   text-align: center;
}

table thead tr th {
   padding: 10px 0;
   border-top: 2px solid #fbd6e3;
   border-bottom: 1px solid #fbd6e3;
}

table tbody td {
   padding: 5px 0;
   border-bottom: 1px solid #fbd6e3; 
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
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function() {
    // 취소
    $("#submit").on("click", function() {
       alert("신고가 성공적으로 접수 완료 되었습니다. 빠른 시일내에 처리해드리겠습니다.");
       location.href = "mainpage";
    });
 });
 
$(document).ready(function() {
    $("#cencle").on("click", function() {
       history.back();
    });
 });
</script>
   <div id="wrap">
      <div id="header1">
         <div class="container">
            <a href="mainpage"><img src="resources/img/logo1.png" alt=""
               width="1400" height="240" /></a>
         </div>
      </div>
      <div id="header2">
         <div class="container">
            <c:if test="${empty membernick }">
         <a href="loginview">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a
               href="joinview">회원가입</a>
               </c:if>
         
      <c:if test="${not empty membernick }">
         <c:if test="${membernick ne '관리자' }">
       
            <span><strong>${membernick }</strong>님 접속중</span>
            <a href="memberprofile?memberid=${memberid }">mypage</a>&nbsp;
            <a href="logout">LogOut</a>  
            <script type="text/javascript">
   $(function(){
   var rename = $("#rename").val();
   var membernick = $("#membernick").val();
         if (rename == membernick) {
             $(document).ready(function() {
                     $('.retitle').on("click", function() {
                        alert("다른사용자는 볼 수 없는 게시글 입니다.");
                        return false;
                     });
                     });
         }
         else if (rename != membernick) {
           $(document).ready(function() {
                  $('.retitle').on("click", function() {
                     alert("다른사용자는 볼 수 없는 게시글 입니다.");
                     return false;
                  });
                  });
   }
});
</script>

            </c:if>
            <c:if  test="${membernick eq '관리자' }">
      <span><strong>${membernick }</strong> 계정</span>
         <a href="manager">Manager</a>&nbsp;&nbsp;&nbsp;
         <a href="logout">LogOut</a>
        </c:if>
      </c:if>

         </div>
      </div>
      
      <div id="banner">
         <div class="container">
            <div id="topMenu">
               <ul>
               <li class="topMenuLi"><a class="menuLink" href="introducepage">소개</a>
                  <ul class="submenu">
                     <li><a class="submenuLink longLink" href="introducepage">소개글</a></li>
								<li><a class="submenuLink longLink" href="map">찾아오시는길</a></li>
								<li><a class="submenuLink longLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!--    <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink" href="type_board">이상형만나기</a>
							<ul class="submenu">
								<li><a class="submenuLink longLink" href="type_board">프로필
										검색</a></li>
								<li><a class="submenuLink longLink" href="ready">준비중입니다</a></li>
								<li><a class="submenuLink longLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!--    <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink" href="ready">커뮤니티</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="free_board">자유 게시판</a></li>
								<li><a class="submenuLink" href="report_board">신고 게시판</a></li>
								<li><a class="submenuLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!-- <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink" href="faq">문의/FAQ</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="inquiry">문의</a></li>
								<li><a class="submenuLink" href="faq">FAQ</a></li>
								<li><a class="submenuLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!--    <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink"
							href="memberprofile?memberid=${memberid }">마이페이지</a>
							<ul class="submenu">
								<li><a class="submenuLink" id=""
									href="minihompy?memberid=${memberid }"
									onclick="window.open('minihompy?memberid=${memberid }','','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=800,height=600,left=500, top=500, scrollbars=yes');return false">내
										미니홈피</a></li>
								<li><a class="submenuLink" href="ready">내 아이템</a></li>
								<li><a class="submenuLink"
									href="notebox?takenick=${membernick }">내 쪽지함</a></li>
								<li><a class="submenuLink"
									href="memberpw?memberid=${memberid }">비밀번호 변경</a></li>
								<li><a class="submenuLink"
									href="memberdelete?memberid=${memberid }">회원탈퇴</a></li>
                  </ul></li>
                  
            </ul>
            </div>
         </div>
      </div> <br />
<input type="hidden" id="membernick" value="${membernick }" />
<input type="hidden" id="memberid" value="${memberid }" />
 <c:if  test="${membernick eq '관리자' }">

         <table>
   <colgroup>
		<col width="10%" />
		<col width="20%" />
		<col width="40%" />
		<col width="30%" />
	</colgroup>
   
      <thead>
         <tr>
            <th class="left">번호</th>
            <th class="left">신고자</th>
            <th class="left">제목</th>
            <th class="left">날짜</th>
         </tr>
      </thead>
   <tbody>
         
   <c:forEach items="${report_board }" var="dto">
<input type="hidden" id="rename" name="rename" value="${dto.re_name }" />
<input type="hidden" id="reid" name="reid" value="${dto.reid }" />
      <tr>
         <td>${dto.reid }</td>
        <td>${dto.re_name }</td>
		 <td >
            <c:set value="${dto.reindent }" var="endIndent" />
            <c:forEach begin="1" end="${dto.reindent }" var="cnt">
               &nbsp;
               <c:if test="${cnt eq endIndent }">
                  <img src="resources/img/reply.gif" />
               </c:if>
            </c:forEach>
            <a class="retitle" href="re_content_view?reid=${dto.reid }">${dto.retitle }</a>
         </td>
         <td>${dto.redate }</td>
        
      </tr>
   </c:forEach> 
   </tbody>
   </table>
         <form action="report_board" id="form1" name="form1" method="post">
   
   <c:if test="${pageVo.totPage>1 }">
   <c:if test="${pageVo.page>1 }">
      <a href="report_board?page=1">[처음]</a>  <!-- 어떤페이지라도 무조건 처음페이지로 이동 -->
      <a href="report_board?page=${pageVo.page-1 }">[이전]</a>   <!-- 현재페이지에서 -1 -->
   </c:if>
   
   <c:forEach var="i" begin="${pageVo.pageStart }" end="${pageVo.pageEnd }" step="1">
   
   <c:choose>
      <c:when test="${i eq pageVo.page }">
         ${i }
      </c:when>
      <c:otherwise>
         <a href="report_board?page=${i }">${i }</a>
      </c:otherwise>
   </c:choose>
   </c:forEach>
   
      <c:if test="${pageVo.totPage>pageVo.page }">
      <a href="report_board?page=${pageVo.page+1 }">[다음]</a>   <!-- 현재페이지에서 +1 -->
      <a href="report_board?page=${pageVo.totPage }">[마지막]</a>  <!-- 어떤페이지라도 무조건 처음페이지로 이동 -->
   </c:if>
</c:if>
         
</form>  
      </c:if>
<c:if test="${not empty membernick }">
         <c:if test="${membernick ne '관리자' }">
            <script type="text/javascript">
   $(function(){
   var rename = $("#rename").val();
   var membernick = $("#membernick").val();
         if (rename == membernick) {
             $(document).ready(function() {
                     $('.retitle').on("click", function() {
                        alert("다른사용자는 볼 수 없는 게시글 입니다.");
                        return false;
                     });
                     });
         }
         else if (rename != membernick) {
           $(document).ready(function() {
                  $('.retitle').on("click", function() {
                     alert("다른사용자는 볼 수 없는 게시글 입니다.");
                     return false;
                  });
                  });
   }
});
</script>
<h3>신고접수</h3>
<form action="re_write" method="post">
<table>
      <tr>
         <td class="left">제목</td>
         <td>
            신고합니다.
         </td>
      </tr>
      <tr>
         <td class="left">신고자</td>
         <td>
            <input type="text" name="re_name" value="${membernick }" readonly="${membernick }" size="20" />
         </td>
      </tr>
      <tr>
         <td class="left">신고내용</td>
         <td>
            <textarea name="recontent"  cols="30" rows="10">닉네임 : 
사유 :            </textarea>
         </td>
      </tr>
      <tr>
         <td colspan="2">
         	<input type="submit" class="btn_s" id="submit" value="접수하기" />
				<input type="button" class="btn_s" onclick="location.href='mainpage'" value="취소" />
         	
				
         </td>   
      </tr>
   </table>
</form>
            </c:if>
          
      </c:if>
 
</div> <br />
<div id="footer">
		<a href="#">공지사항 </a>&nbsp;|
		<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
			href="">개인정보처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">청소년보호정책</a> <br />(주)DAWON
		다원 COMPANY | 대표: 최현범, 이규정, 신유호, 신동욱  <br />사업자등록번호 xxx-xx-xxxxxxx |
		문의전화: xxx-xxxx-xxxx <br /> 영업시간: AM 09:00 ~ PM 17:00

	</div>
</body>
</html>