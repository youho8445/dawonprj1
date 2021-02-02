<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/mstyle.css" />
<link rel="stylesheet" href="resources/css/sidemenu.css" />

<title>Insert title here</title>
<style>
.menu a{ cursor: pointer;}
.menu .hide{display: none;} 
.hide{
list-style : none;
text-align: left;
font-size: 18px;
margin: 0, 100px;
padding: 10px 0 10px 80px;
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
<h2 style="font-size: 40px; font-weight: bold;">FAQ</h2>

	<div id="contents2">
	<div class="container">
<ul>
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />모든 회원님께 드리는 말씀</a>
	<ul class="hide">
	
	안녕하십니까 행복을 이어주는 회사 (주)다원 대표이사 신유호입니다. <br />
	다원을 찾아주셔서 진심으로 감사드립니다. 회원 한분 한분께 정성껏 상담하고, <br />
	정성껏 매칭을 해드리는 다원은 올해도 높은 성장을 하여, 고객 여러분께 베풀고자 합니다. <br />
	끝까지 믿고 맡겨주시고, 최선을 다해, 최대의 효과로 최다 성혼을 시킬 수 있도록 꼭 믿어주십시오. <br />
	소개팅업계의 성혼 선두주자로서 회원을 가족 같은 마음, 친구 같은 마음으로 소개를 해드리겠습니다. <br />
	2021년 좋은 일과 행복이 가득하길 간절히 바라겠습니다. 다원을 방문해 주셔서 감사합니다. <br /><br />
	대표이사 신유호 올림
	
	</ul>
	</li>
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />다원은 다른 타업체와 비교했을때 어떤 장점인가요?</a>
	<ul class="hide">
	<li>네~ 자주 받는 질문인데요.</li>
	<li>타 소개팅업체 요즘 시스템상 잘 되어 있는 편이라 괜찮은 소개팅업체가 많습니다.</li>
	<li>그중 다원은 성혼을 목표로 만들어지고, 가입도 중요하지만 매칭을 꼼꼼히 하기 위해 </li>
	<li>서로 믿고, 배려 하고, 이해 한다면 성혼을 못할 것이 없다고 생각합니다.</li>
	<li>한번 믿고 맡겨주세요. 열심히 해드리겠습니다.</li>
	</ul>
	</li>
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />다원 소개팅정보회사란 바로 이런 회사</a>
	<ul class="hide">
	<li>다원은 순 우리말로 '모두 다 원하는, 모두 다 사랑하는 사람' 이라는 뜻입니다.</li>
	<li>다원의 매칭시스템은 학력, 직업, 연봉 등 상세한 개인정보를 확인한 후 매칭을 해드리는 시스템입니다.</li>
	<li>다원의 자존심을 걸고 이상적인 남녀간의 만남을 주선하여 행복한 만남이 이루어지도록 최선의 노력을 다하겠습니다.</li>
	</ul>
	</li>
<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />소개팅정보회사100% 이용하기 tip</a>
	<ul class="hide">
	<li>1.소개팅정보회사의 규칙과 소개만남의 자세를 미리 파악하자!</li>
	<li>매니저는 본인의 회원과 친해지려합니다. 회원님! 꼭 친해지셔야 합니다</li>
	<li>상대방이 무조건 본인을 좋아할 것이라는 생각도 자만심입니다, </li>
	<li>2.충분한 상담과 매니저와의 원활한 커뮤니케이션</li>
	<li>가입 전 혹은 가입 후 상담을 통해 컨설턴트와 매칭매니저와의 이상형에 대해서 수시로 대화를 하고 의견조율을 합니다.</li>
	<li>현실과 이상과의 차이가 많이 나면 날수록 멀어져가는 이성을 되돌릴 수 없답니다.</li>
	<li>고로 타협과 현명한 매칭을 하기 위해, 완벽한 이성을 바라기 보다, 완성된 본인의 모습을 가꾸어 나아가는 것이 더 빠를 것입니다.</li>
	<li>3.미팅약속은 센스 있게 합니다.</li>
	<li>미팅장소와 시간은 엄수하시고, 상대를 찾는 용도의 전화통화는 허용합니다.</li>
	<li>그러나 지나친 사전 긴 대화나, 호구조사 같은 내용으로의 연락은 피하시는 게 좋습니다.</li>
	<li>4. 남녀불문 복장매너및 향기나는 매너는 필수!</li>
	<li>선글라스, 찢어진 청바지, 면티, 슬리퍼, 절대 금기해야 할 사항이며, 너무 가볍게 입으면 상대방이 가볍게 생각할 것 이고, 너무 무겁게 입고 오면 부담을 느끼실 수 있을 것입니다.</li>
	<li>늘 적당히 라는 단어가 있듯이 적당한 차림과 치장이 중요합니다.</li>
	<li>센스남녀로서 향수까지 마무리 하시고, 구두 및 신발관련은 한 번 더 체크 하는 것도 센스입니다.</li>
	<li>5. 데이트 비용 어떻게 할까요?</li>
	<li>처음부터 너무 비싼 장소 및 식사 장소는 피하시는 것이 좋습니다. 간단한 커피나 차종류로 서로를 알아가면서, 1~2시간 사이에 호감도를 표시가 어느 정도 되었다면,</li>
	<li>그때 일어나서 다음 장소로 갈 것인지 아니면, 여기서 마치고 매니저에게 보고 후 다시 만날 것인지 미팅을 하면서 생각을 하시는 것이 제일 좋은 방법 중 하나입니다.</li>
	<li>데이트 비용! 무조건 남성이 지불하라는 법은 없습니다. 센스 있는 여성이라면 후식이나 디저트 종류 정도는 내도 상관없다는 마인드를 가진 여성이라면! 남성에게 인기 만점!</li>
	</ul>
	</li>
	
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />소개팅정보회사 실제 연애 후 결혼이 될까요?</a>
	<ul class="hide">
	<li>소개팅 정보 회사 성혼을 파악 하기 전에 한번쯤 확인해야 할 것은 바로 아이템입니다</li>
	<li>결혼정보회사는 말 그대로 이성 간의 소개를 정보로서 만나게끔 까지의 역할이며, 그 역할의 매개체라 생각하시면 됩니다.</li>
	<li>그 중 성혼이 되는 커플, 안되고 다시 매칭하는회원 등</li>
	<li>매칭수가 많으면 그만큼 성혼율은 증가세를 보이고 있는 건 당연한 이치입니다. 그렇습니다. 성혼 될 가능성이 현저히 높습니다. </li>
	<li>회원은 매니저를, 매니저는 회사를 끝까지 믿고 따라와준다면, 결과로서 꼭 보답을 해드릴 수 있다고 자부합니다.</li>
	</ul>
	</li>
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />불쾌감을 주는 유저는 바로 신고게시판으로!</a>
	<ul class="hide">
	<li>혐오감발언,욕설 을 하는 사용자는 바로 신고해주시면</li>
	<li>매니저가 확인 후 제재합니다</li>
	<li>규칙과 매너는 사람의 인품입니다.</li>
	</ul>
	</li>

<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />회원가입이 너무 복잡해요</a>
	<ul class="hide">
	<li>매칭시스템을 정확히 하기 위해선 고객님의 자세한 정보까지 받아서 최고의 매칭을 할수있게</li>
	<li>도와주는 매칭시스템이라 조금 귀찮더라도 열심히 적어주시면 그만큼 최선을 다해서 매칭을 도와드리겠습니다</li>
	</ul>
	</li>
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />다른 문의가 있으면 문의게시판으로~!</a>
	<ul class="hide">
	<li>FAQ 를 통해서 알려드릴수있는건 최대한 많이 알려드릴 수 있으나, 사람마다 원하는 것이 다르고 FAQ에 없는데 궁금한 게 있으면</li>
	<li>문의게시판을 통해 문의를 해주시면</li>
	<li>매니저가 확인 후 답변 해드릴 수 있도록 도와드리곘습니다.</li>
	</ul>
	</li>
	<li class="menu" style="font-size:30px; "> <a><img src="resources/img/qq.png" alt="" />주변 소개와 소개팅정보회사의 소개가 별반 다를게 없지않나요?</a>
	<ul class="hide">
	<li>아닙니다 다릅니다. 주변 소개의 소개팅 및 맞선의 장단점은 있습니다.</li>
	<li>장점으로는 주변 지인이 어느 정도 그 사람에 대해 성격이며 주관적인 감성적인 부분을 아는 상태에서 소개해 줌 으로서 잘 되는 경우도 더러있습니다.</li>
	<li>단점으로는 그 사람의 대한 스펙이라든지, 객관적인 집안 환경 등 그런 부분은 결코 쉽게 알지 못한다는 부분이 단점이며, 언제까지 주변 사람에게 부탁하고, 기다리는 것은 시간낭비, 기회비용의 낭비라 생각합니다.</li>
	<li>소개팅정보회사는 만나고자 하는 상대방 이성의 대한 자세한 프로필, 집안환경, 각종 서류 등 객관적인 것을 최소한의 자세로 임하기 때문에 겪는 스트레스는 많지 않습니다.</li>
	<li>회원의 짧은 상담시간에 통하는 성격이며, 결혼정보회사의 활동을 통하는 자세, 매니저에게 행하는 자세, 매칭하고 만났던 사람의 대한 피드백에 대해 성격을 가늠 할 수 있습니다.</li>
	</ul>
	</li>
</ul>

</div>
</div>
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
<div id="footer">
		<a href="#">공지사항 </a>&nbsp;|
		<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
			href="">개인정보처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">청소년보호정책</a> <br />(주)DAWON
		다원 COMPANY | 대표: 최현범, 이규정, 신유호, 신동욱  <br />사업자등록번호 xxx-xx-xxxxxxx |
		문의전화: xxx-xxxx-xxxx <br /> 영업시간: AM 09:00 ~ PM 17:00

	</div>
</body>
</html>