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
table tr td {
	padding: 10px 0;
	border-top: 2px solid #ff6666;
}

</style>

<title>Insert title here</title>
</head>
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
				</div>
			</div>
		</div>


<br />
<h3>답글달기</h3>
<table>
	<form action="re_reply" method="post">
		<input type="hidden" name="reid" value="${re_reply_view.reid }" />
		<input type="hidden" name="regroup" value="${re_reply_view.regroup }" />
		<input type="hidden" name="restep" value="${re_reply_view.restep }" />
		<input type="hidden" name="reindent" value="${re_reply_view.reindent }" />

		<tr>
			<td class="left">번호</td>
			<td>${re_reply_view.reid }</td>
		</tr>
		<tr>
			<td class="left">제목</td>
			<td>
				<input type="text" name="retitle" />
			</td>
		</tr>
		<tr>
			<td class="left">글쓴이</td>
			<td>
				<input type="text" name="re_name" value="관리자" />
			</td>
		</tr>
		
		<tr>
			<td class="left">내용</td>
			<td>
			<textarea name="recontent"  cols="30" rows="10"></textarea>
			
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="답변달기" /> &nbsp;&nbsp;
				<a href="report_board">목록보기</a> &nbsp;&nbsp;
			</td>	
		</tr>
	</form>
</table>
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