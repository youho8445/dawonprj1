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
#btn_s{
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
         
            </c:if>
          <c:if test="${membernick eq '관리자' }">
			<span><strong>${membernick }</strong> 계정</span>
			<a href="manager">Manager</a>&nbsp;&nbsp;&nbsp;
			<a href="logout">LogOut</a>
		</c:if>
		</c:if>

			</div>
		</div>
		<hr />
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
            <span style="font-size: 30px; cursor:pointer; padding-left: 20px;  
                  position: absolute;" onclick="openNav()">&#9776; open</span>
				</div>
			</div>
		</div>

 <form action="type_board" id="form1" name="form1" method="post">
	
	<c:choose>
      <c:when test="${memberage }">
         <input type="checkbox" name="searchType2" value="memberage" checked />
      </c:when>
      <c:otherwise>
         <input type="checkbox" name="searchType2" value="memberage" />      
      </c:otherwise>
   </c:choose>
   <label>나이</label>
   
   <c:choose>
      <c:when test="${roadaddrpart1 }">
         <input type="checkbox" name="searchType2" value="roadaddrpart1" checked />         
      </c:when>   
      <c:otherwise>
         <input type="checkbox" name="searchType2" value="roadaddrpart1" />
      </c:otherwise>   
   </c:choose>
   <label>지역</label>
           	 
            <input type="text" name="sk2" value="${searchKeyword2 }" />
            <input id="btn_s" name="btn_search" type="submit" value="검색"> <br />
         
</form>		<br />

<h3>프로필 검색</h3>
<table width="900px">
	 <colgroup>
		<col width="20%" />
		<col width="15%" />
		<col width="15%" />
		<col width="10%" />
		<col width="25%" />
		<col width="15%" />
	</colgroup> 
	
		<thead>
			<tr>
				<th>사진</th>
				<th class="left">닉네임</th>
				<th class="left">성별</th>
				<th class="left">나이</th>
				<th class="left">지역</th>
				<th class="left">직업</th>
			</tr>
		</thead>
	<tbody>
	 <c:forEach items="${type_board }" var="dto">
		<tr>
			<td><img src="resources/upload/${dto.filesrc }" width="100" height="100" /></td>
			<td><a href="minihompy?memberid=${dto.memberid }" onclick="window.open('minihompy?memberid=${dto.memberid }','','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=800,height=600,left=500, top=300, scrollbars=yes');return false">${dto.membernick }</a></td>
			<td>${dto.membergender }</td>
			<td>${dto.memberage }</td>
			<td>${dto.roadaddrpart1 }</td>
			<td>${dto.memberjob }</td>
		</tr>
	</c:forEach> 
	</tbody>
</table>

<form action="type_board">
<c:if test="${pageVo.totPage>1 }">
	<c:if test="${pageVo.page>1 }">
		<a href="type_board?page=1">[처음]</a>  <!-- 어떤페이지라도 무조건 처음페이지로 이동 -->
		<a href="type_board?page=${pageVo.page-1 }">[이전]</a>   <!-- 현재페이지에서 -1 -->
	</c:if>
	
	<c:forEach var="i" begin="${pageVo.pageStart }" end="${pageVo.pageEnd }" step="1">
	
	<c:choose>
		<c:when test="${i eq pageVo.page }">
			${i }
		</c:when>
		<c:otherwise>
			<a href="type_board?page=${i }">${i }</a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	
		<c:if test="${pageVo.totPage>pageVo.page }">
		<a href="type_board?page=${pageVo.page+1 }">[다음]</a>   <!-- 현재페이지에서 +1 -->
		<a href="type_board?page=${pageVo.totPage }">[마지막]</a>  <!-- 어떤페이지라도 무조건 처음페이지로 이동 -->
	</c:if>
</c:if>
</form>
 
</div>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a class="sidemenu" href="joinview">회원가입</a>
  
   <c:if test="${not empty membernick }">
               <script type="text/javascript">
                  $(document).ready(function() {
                     $(".sidemenu").on("click", function() {
                        alert("로그아웃 후 이용할 수 있는 페이지입니다.");
                        return false;
                     });                 
                  });
                 
               </script>
       
            </c:if>
  <a href="map">찾아오시는길</a>
  <a href="#">방문상담신청</a>
  <a href="#">온라인상담</a>
</div>


<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "200px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
      </div>
      
<div id="footer">
		<a href="#">공지사항 </a>&nbsp;|
		<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
			href="">개인정보처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">청소년보호정책</a> <br />(주)DAWON
		다원 COMPANY | 대표: 최현범, 이규정, 신유호, 신동욱  <br />사업자등록번호 xxx-xx-xxxxxxx |
		문의전화: xxx-xxxx-xxxx <br /> 영업시간: AM 09:00 ~ PM 17:00

	</div>
</body>
</html>