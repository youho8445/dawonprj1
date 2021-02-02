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
<title>mainpage</title>
<link rel="stylesheet" href="resources/css/mstyle.css" />
<!-- <link type="text/css" rel="stylesheet" href="resources/css/join.css" /> -->
<link rel="stylesheet" href="resources/css/login/login.css" />

</head>

<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		function checkValue() {
			inputForm = eval("document.loginInfo");
			if ($("#memberid").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#memberid").focus();
				return false;
			} else if ($("#memberpw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#memberpw").focus();
				return false;
			}
			return true;
		}
	</script>

	<div id="wrap">
		<div id="header1">
			<div class="container">
				<a href="mainpage"><img src="resources/img/logo1.png" alt=""
					width="1400" height="240" /></a>
			</div>
		</div>
		<div id="header2">
			<div class="container" style="padding-right: 180px;">
				<c:if test="${empty membernick }">
				<script type="text/javascript">
                  $(document).ready(function() {
                     $(".submenuLink").on("click", function() {
                        alert("로그인 후 이용할수있는 페이지입니다.");
                        return false;
                     });
                     $(".topMenuLi").on("click", function() {
                        alert("로그인 후 이용할수있는 페이지입니다.");
                        return false;
                     });
                  });
               </script>
				
					<a href="loginview" style="color: #8080c0;">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="joinview" style="color: #8080c0;">회원가입</a>
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
		<section> <img class="main_slideImg"
			src="resources/img/2.png" style="height: 350px; width: 1400px;">
		<div class="main">
			<h1 style="padding-top: 20px;">LOGIN</h1>
			<form class="form-1" style="margin-bottom: 10px; margin-top: 30px;" action="loginpros" method="post" id="loginInfo"
				name="loginInfo" onsubmit="return checkValue()">

				<p class="field">
					<input type="text" id="memberid" name="memberid" placeholder="ID">
					<i class="icon-user icon-large"></i>
				</p>
				<p class="field">
					<input type="password" id="memberpw" name="memberpw"
						placeholder="Password"> <i class="icon-lock icon-large"></i>
				</p>
				<p class="submit">
					<button type="submit" name="submit">
						<i class="icon-arrow-right icon-large"></i>
					</button>
				</p>

				<!-- <input style="width: 70px; height: 25px" type="submit" value="로그인하기" /> -->
			</form>
			<p id="el" style="color:red; text-align:center;">${error }</p>
			<div class="center" style="font-size: 16px; ">
					처음 오셨나요? <a href="joinview">회원가입</a>
				</div>
				<div class="center2" style="font-size: 15px; margin-bottom: 10px;">
					비밀번호가 생각이 안 나시나요? <a href="#">비밀번호 찾기</a>
				</div>

		</div>
		</section>
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