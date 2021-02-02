<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/mstyle.css" />


<title>Insert title here</title>
<style>
.menu a{ cursor: pointer;}
.menu .hide{display: none;} 
.hide{
list-style : none;
text-align: left;
font-size: 18px;
padding-left: 60px;
margin: 0, 100px;
}
.menu{
list-style : none;
text-align: left;
padding: 0, 20px;
margin: 0, 100px;
}
ul li:hover{
padding: 0 -5px;
}
</style>

</head>

<body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
$(".menu>a").click(function(){
   var submenu = $(this).next("ul")
   if (submenu.is(":visible")) {
      submenu.slideUp();
   }else{
      submenu.slideDown();
   }
});   
});
</script>
<div id="wrap">
      <div id="header1">
         <div class="container">
            <a href="mainpage"><img src="resources/img/logo1.png" alt=""
               width="1600" height="240" /></a>
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
            <a href="mypage">mypage</a>&nbsp;&nbsp;&nbsp;
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
<h2 style="font-size: 40px; font-weight: bold;">성혼스토리</h2>

   <div id="contents2">
   <div class="container">
<ul>
   <li class="menu" style="font-size:30px; "> <a>임X훈, 서X혜 회원 성혼스토리</a>
   <ul class="hide">
   <li style="font-size:20px; ">안녕하세요. 결혼한 지 이제 갓 2주 넘은 신혼부부 임X훈, 서X혜입니다. 저희 담당 매니저님 결혼 축하해 주셔서 정말 감사 드

립니다. 신혼여행도 잘 다녀왔어요. 이제 행복한 신혼생활 할 일만 남았네요. 다른 분들이 성혼 후기 쓰신 거 보면 정말 드라마

틱한 성혼 후기 많은 데 저희는 그렇게 특별하지는 않습니다. 좀 특이한 에피소드가 있긴 한데 처음에 매니저님한테 X혜를 소개

받고 저는 첫 만남에 바로 호감을 느꼈었습니다. 그래서 적극적으로 다가가게 되었죠. 만난 지 몇 번 안 됐었는데 제가 그 때

정말 X혜한테 정성을 다하던 때라서 만날 때도 직접 집에 가서 차로 데려오고 데려다 주고 그랬거든요. 그래서 미리 집 앞에 기

다리고 있는데 집 앞에서 X혜가 다른 남자랑 진한 스킨십을 하고 있는 것이었어요. 저는 너무 놀라고 충격을 받아서 그냥 그대

로 와버렸죠. 나중에 X혜한테 연락이 와도 안 받았어요. 그만큼 충격이었거든요. 그런데 나중에 알고 보니 X혜한테 쌍둥이 여동

생이 있었던 겁니다. 동생이 있다는 말은 들었는데 쌍둥이인 줄은 몰랐거든요. 저는 저 혼자 오해하고 그렇게 행동한 게 너무

미안해서 정말 진심으로 사과하고 더 잘해줬습니다. 다행히 X혜는 제 사과를 받아줬고 나중에는 X혜 동생이랑 그 남자친구까지

서로 친해져서 같이 놀러 다니기도 하고 그랬습니다. 그리고 이렇게 결혼도 하고 처제도 생기게 되었네요. 저는 사실 결혼정보

회사에서는 서로 비슷하게 조건을 맞춰서 결혼한다는 선입견에 이렇게까지 푹 빠질 상대를 만나게 되리라고는 생각하지 못했습

니다. 그런데 매니저님이 저를 정말 깊이 있게 이해하고 분석해 주셨고 또 굉장히 체계적으로 매칭해 주셔서 저는 정말 저에게

잘 맞는, 제가 정말 폭 빠질 수 있는 그런 배우자를 만날 수 있었던 것 같습니다. 연애하는 과정에서도 매니저 님이 중간에서

많은 도움 주셨고요. 결혼정보회사에서 연애 과정까지 이렇게 코칭을 해주는 줄은 몰랐습니다. 어쨌든 제가 생각했던 것보다 훨

씬 더 많은 도움 주시고 또 더 많이 잘해주셔서 저는 그냥 감사할 따름이에요. 사실 처음에 저희 어머니가 다원를 소개시켜

주실 때만 해도 별 감흥이 없었는데 이제는 저에게 정말 중요한 사람을 만나게 해 준 결정적인 계기가 되었네요. 다시 한 번 감

사 드리고 더 번창하시길 바랄게요! 저희 잘 살겠습니다.</li>
   </ul>
   </li>
   <li class="menu" style="font-size:30px; "> <a>박X준, 이X현 회원 성혼스토리</a>
   <ul class="hide">
   <li style="font-size:20px; ">드디어 결혼을 해서 이렇게 성혼 후기를 쓰게 되다니. 정말 믿기지가 않습니다. 저는 정말 일찍 결혼을 하고 싶었습니다. 한 최

대 늦어도 스물 일곱에는 장가를 가고 싶었어요. 그런데 어학 연수다 취업 준비다 뭐다 해서 결국 서른을 넘기고 말았습니다.

물론 그만큼 시간도 들이고 투자도 해서 대기업에 취업할 수는 있었지만 저는 정말 결혼 빨리 해서 알콩달콩한 결혼 생활도 하

고 또 저는 자녀 계획도 벌써 다 세워놨었거든요. 꼭 세 명 이상 낳기로요. 그런데 결혼은 생각만큼 쉬운 것이 아니었습니다.

물론 사회적 지위나 경제적으로도 일정 수준 이상 갖춰야 하고 결혼할 수 있는 상황적 조건도 따라줘야 하고, 무엇보다 제대로

된 사람을 만나야 하는데 그게 제일 어려웠거든요. 아무래도 대기업에 다니다 보니 선 자리가 좀 들어오기는 했는데 번번히 실

패를 했습니다. 상대방에 대해 나이와 직업밖에 아는 게 없었거든요. 무슨 대학생 소개팅도 아니고 그런 단편적인 정보만 가지

고 배우자를 찾는 게 제대로 될 리가 없잖아요. 그래서 저는 올해 안에 꼭 결혼해야겠다는 목표로 다원에서 심리 검사나 상담

에도 성실히 임하고 제 스스로도 가치를 높이기 위해 문화생활도 하고 매니저님한테 여러 모로 매너나 여자 심리에 대해서도 많

이 배우고 그랬어요. 이런 노력의 결실인지 드디어 저도 결혼할 사람이 생기게 되었습니다. 지금 생각해도 그 첫만남이 너무 떨

리네요. 사실 직업이 공무원이라고 해서 설마 조건 맞춰서 소개시켜 주셨나 싶었는데 그런 게 전혀 아니었습니다. 우선 첫인상

이 정말 아름다웠습니다. 이야기를 나눠 보니 공무원이긴 하지만 다양한 취미생활을 가지고 여러 활동을 하는 게 정말 멋졌습니

다. 문화생활도 하고 창작활동도 하고 운동도 좋아하고. 그러다 보니 생각도 개방적이고 소탈한 매력까지 있었습니다. 무엇보다

가치관이나 관점도 굉장히 비슷해서 이야기도 잘 통했어요. 저는 바로 이런 사람이 배우자감이라는 구나 하는 것을 본능적으로

느낄 수 있었습니다. 매니저 님께도 정말 너무나 고마워서 마치 매니저님이 장모님인 것처럼 정말 감사의 인사도 드리고 식사도

대접하고 그랬었어요. 저는 바로 적극적으로 제 감정을 표현했고 X현이도 저에게 호감이 있는 것 같아서 저희는 자연스럽게 연

인 사이가 될 수 있었습니다. 다행히 X현이도 결혼을 빨리 하고 싶어 했고 2세 계획도 저랑 비슷하게 생각하고 있는 면이 많아

서 저희는 시간을 오래 끌지 않기로 했습니다. 한 5개월 정도 연애하면서 바로 부모님께 인사를 드리고 허락을 받아 냈습니다.

결혼한 후에도 가끔은 너무 실감이 안 날 때가 있습니다. 요즘은 첫째 아이로 딸이 좋을지 아들이 좋을지 옥신각신 하고 있네요

. 선택할 수도 있는 것도 아닌데. 이렇게 재미있게 살고 있네요.</li>
   </ul>
   </li>
   
</ul>

</div>
</div>
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