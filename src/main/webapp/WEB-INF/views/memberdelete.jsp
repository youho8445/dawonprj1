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
<style>
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
<title>mypage</title>
<link rel="stylesheet" href="resources/css/mstyle.css" />
<link type="text/css" rel="stylesheet" href="resources/css/join.css" />
<link rel="stylesheet" href="resources/css/sidemenu.css" />
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function delete_event(){
    if (confirm("정말 탈퇴 하시겠습니까?") == true){    //확인
       alert("회원탈퇴가 완료되었습니다.");
       location.href='mainpage';
      return true;
    }else{   //취소
          alert("취소 되었습니다");
          return false;
    }
}
/* $(document).ready(function() {
    $("#submit").on("click", function() {
       alert("회원탈퇴가 완료되었습니다.")   
       location.href='mainpage';
    });
 }); */
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

      <div id="contents1" style="height: 450px;">
         <div id="contents2">
            <form action="memberdeletepr" method="post">
               <input type="hidden" id="memberid" name="memberid"
                  value="${memberid }" />
               <dl>
                  <dt>
                     <span style="font-size: 25px; font-style: BOLD;">회원탈퇴</span>
                  </dt>
               </dl>

               <dl>
                  <dt>아이디</dt>
                  <dd>
                     <input class="w3-input" type="text" id="memberid" name="memberid"
                        readonly value="${ memberid }">
                  </dd>
               </dl>
               <dl>
                  <dt>탈퇴 사유</dt>
                  <dd>
                     <select style="width: 200px; height: 30px;" class="left">
                        <option>새로운 인연을 찾아서</option>
                        <option>시스템이 마음에 안들어서</option>
                        <option>너무 복잡해서</option>
                        <option>기타</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <dt>기타</dt>
                  <dd>
                     <textarea rows="10" cols="30"></textarea>
                  </dd>
               </dl>
<br />
               <button type="submit" class="btn_s" id="submit" onclick="return delete_event()" style="width: 70px; height: 25px">회원탈퇴</button>
               <button class="btn_s" id="cencle" style="width: 70px; height: 25px"
                  type="button">취소</button>

            </form>
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