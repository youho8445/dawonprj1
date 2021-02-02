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
<link rel="stylesheet" href="resources/css/sidemenu.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.slideshow-container').bxSlider({
				auto : true,
				autoControls : true,
				stopAutoOnClick : true,
				pager : true
			});
		});
	</script>


	<div id="wrap">
		<div id="header1">
			<a href="mainpage"><img src="resources/img/logo1.png" alt=""
				width="1400" height="240" /></a>
		</div>
		<div id="header2">
			<div class="container">
				<c:if test="${empty membernick }">
					<script type="text/javascript">
						$(document).ready(function() {
							$(".submenuLink").on("click", function() {
								alert("로그인 후 이용할 수 있는 페이지입니다.");
								return false;
							});
							$(".topMenuLi").on("click", function() {
								alert("로그인 후 이용할 수 있는 페이지입니다.");
								return false;
							});

						});
					</script>
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
		<div id="banner">
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

				<span
					style="font-size: 30px; cursor: pointer; padding-left: 20px; position: absolute;"
					onclick="openNav()">&#9776; OPEN</span>


			</div>

		</div>

		<div id="ccontents1">
			<div class="ccontainer">
				<div class="slideshow-container" style="height: 350px;">
					<div class="mySlides fade2">
						<img class="main_slideImg" src="resources/img/2.png"
							style="height: 350px;">

					</div>
					<div class="mySlides fade2">
						<img class="main_slideImg" src="resources/img/1.jpg"
							style="height: 350px;">

					</div>
					<div class="mySlides fade2">
						<img class="main_slideImg" src="resources/img/3.png"
							style="height: 350px;">

					</div>
					<div class="mySlides fade2">
						<img class="main_slideImg" src="resources/img/4.png"
							style="height: 350px;">

					</div>
					<div class="mySlides fade2">
						<img class="main_slideImg" src="resources/img/5.png"
							style="height: 350px;">

					</div>
				</div>

				<div class="chart">
					<div class="row">
						<div class="col-md-6">
							<canvas id="myChartOne"></canvas>
						</div>
						<div class="col-md-6">
							<canvas id="myChartTwo"></canvas>
						</div>
					</div>
				</div>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
				<script>
					let myChartOne = document.getElementById('myChartOne')
							.getContext('2d');
					let myChartTwo = document.getElementById('myChartTwo')
							.getContext('2d');

					let barChartOne = new Chart(myChartOne, {
						type : 'bar',
						data : {
							labels : [ '다원', 'H사', 'G사', 'A사', 'M사' ],
							datasets : [ {
								label : '미팅 분야 검색 점유율 1위',
								data : [ 11532, 6345, 3987, 4753, 5832 ],
								backgroundColor : [ 'pink', 'blue', 'red',
										'skyblue', 'orange' ],
								borderWidth : 5,
								borderColor : '#f5f5f5',
								hoverBorderWidth : 10,
							} ]
						}
					});

					let barChartTwo = new Chart(myChartTwo, {
						type : 'pie',
						data : {
							labels : [ '소개팅 성공율 70%', '소개팅 실패율 30%' ],
							datasets : [ {
								label : '소개팅 성공확률',
								data : [ 70, 30 ],
								backgroundColor : [ 'blue', 'red' ],
								borderWidth : 5,
								borderColor : '#f5f5f5',
								hoverBorderWidth : 10
							} ]
						}
					});
				</script>
			</div>
		</div>
		<div id="ccontents2">
			<div class="ccontainer">
				<div>
					<h1 style="color: pink"> 시간은 흐르고 있습니다!</h1><h1 style="color: pink">세월이 더 흘러가기전 찾아오십시오</h1>
               <span id="remaining" style="font-size: 40px; color: pink;"></span>
				</div>
			</div>
		</div>
		<script>
			function dateUntilNewYear() {
				var now = new Date();
				var newYear = new Date("january 1," + (now.getFullYear() + 1));
				var diff = newYear - now;
				var milliseconds = Math.floor(diff % 100);
				diff = diff / 1000;
				var seconds = Math.floor(diff % 60);
				diff = diff / 60;
				var minutes = Math.floor(diff % 60);
				diff = diff / 60;
				var hours = Math.floor(diff % 24);
				diff = diff / 24;
				var days = Math.floor(diff);

				var outStr = "올해까지의시간 " + days + "일" + hours + "시간" + minutes
						+ "분" + seconds + "초 남았습니다.";
				document.getElementById('remaining').innerHTML = outStr;
				setTimeout("dateUntilNewYear()", 1000);

			}
			dateUntilNewYear();
		</script>
		<script>
			$(document).ready(function() {
				$('.slideshow-container1').bxSlider({
					auto : true,
					autoControls : true,
					stopAutoOnClick : true,
					pager : true
				});
			});
		</script>
		<div id="ccontents1">
			<div class="ccontainer">
				<div class="slideshow-container1">
					<div class="mySlides fade2">
						<a href="story"><img class="main_slideImg"
							src="resources/img/6.png" style="height: 550px;"></a>

					</div>
					<div class="mySlides fade2">
						<a href="story"><img class="main_slideImg"
							src="resources/img/7.png" style="height: 550px;">more</a>

					</div>
				</div>
			</div>
		</div>



		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="joinview">회원가입</a>
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
			<a href="map">찾아오시는길</a> <a href="#">방문상담신청</a> <a href="#">온라인상담</a>
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