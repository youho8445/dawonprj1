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
<title>mainpage</title>
<link rel="stylesheet" href="resources/css/mstyle.css" />
<link rel="stylesheet" href="resources/css/login.css" />
<link rel="stylesheet" href="resources/css/join.css" />
<link rel="stylesheet" href="resources/css/sidemenu.css" />
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
                function delete_event(){
                   if (confirm("정말 강제 탈퇴처리 하시겠습니까?") == true){    //확인
                      alert("회원이 정상적으로 탈퇴처리 되었습니다.");
                     return true;
                   }else{   //취소
                         alert("취소 되었습니다");
                         return false;
                   }
               }
               </script> 
   <div id="wrap">
      <div id="header1">
         <a href="mainpage"><img src="resources/img/logo1.png" alt=""
            width="1400" height="240" /></a>
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
                  <li class="topMenuLi"><a class="menuLink"
                     href="introducepage">소개</a>
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
                        <li><a class="submenuLink" href="#">내 아이템</a></li>
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
      
      

      <h2>회원 정보</h2> <br />
      <form action="manager" id="form1" name="form1" method="post">
         <c:choose>
            <c:when test="${memberid }">
               <input type="checkbox" name="searchType3" value="memberid" checked />
            </c:when>
            <c:otherwise>
               <input type="checkbox" name="searchType3" value="memberid" />
            </c:otherwise>
         </c:choose>
         <label>아이디</label>

         <c:choose>
            <c:when test="${membernick }">
               <input type="checkbox" name="searchType3" value="membernick"
                  checked />
            </c:when>
            <c:otherwise>
               <input type="checkbox" name="searchType3" value="membernick" />
            </c:otherwise>
         </c:choose>
         <label>닉네임</label> <input type="text" name="sk3"
            value="${searchKeyword3 }" /> <input id="btn_s" name="btn_search"
            type="submit" value="검색"> <br />

      
      <br />

      <table class="loginc" width="900px" border="2">
         <thead>
            <tr>
               <th>아이디</th>
               <th>닉네임</th>
               <th>성별</th>
               <th>나이</th>
               <th>관리</th>
               <th>관리</th>
            </tr>
         </thead>
         <c:forEach items="${manager }" var="dto">
            <tr>
               <td>${dto.memberid }</td>
               <td>${dto.membernick }</td>
               <td>${dto.membergender }</td>
               <td>${dto.memberage }</td>
               <td><button type="button" id="btn_s"><a href="memberinfo?memberid=${dto.memberid }" onclick="window.open('memberinfo?memberid=${dto.memberid }','','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=1000,height=400,left=500, top=200, scrollbars=yes');return false">회원정보</a>
                     </button>
                     <input type="button" id="btn_s" value="수정하기" onclick="location.href='memberprofile?memberid=${dto.memberid }'" />
                     </td>
               <td><button type="button"  id="btn_s" onclick="return delete_event()"><a href="managerdel?memberseq=${dto.memberseq }">회원삭제</a></button></td>
            </tr>
         </c:forEach>
      </table>

      
         <c:if test="${pageVo.totPage>1 }">
            <c:if test="${pageVo.page>1 }">
               <a href="manager?page=1">[처음]</a>
               <!-- 어떤페이지라도 무조건 처음페이지로 이동 -->
               <a href="manager?page=${pageVo.page-1 }">[이전]</a>
               <!-- 현재페이지에서 -1 -->
            </c:if>

            <c:forEach var="i" begin="${pageVo.pageStart }"
               end="${pageVo.pageEnd }" step="1">

               <c:choose>
                  <c:when test="${i eq pageVo.page }">
         ${i }
      </c:when>
                  <c:otherwise>
                     <a href="manager?page=${i }">${i }</a>
                  </c:otherwise>
               </c:choose>
            </c:forEach>

            <c:if test="${pageVo.totPage>pageVo.page }">
               <a href="manager?page=${pageVo.page+1 }">[다음]</a>
               <!-- 현재페이지에서 +1 -->
               <a href="manager?page=${pageVo.totPage }">[마지막]</a>
               <!-- 어떤페이지라도 무조건 처음페이지로 이동 -->
            </c:if>
         </c:if>
      </form>

   </div>
   <br />
   <br />
   <div id="footer">
      <a href="#">공지사항 </a>&nbsp;| <a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
         href="">개인정보처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">청소년보호정책</a> <br />(주)DAWON
      다원 COMPANY | 대표: 최현범, 이규정, 신유호, 신동욱 <br />사업자등록번호 xxx-xx-xxxxxxx |
      문의전화: xxx-xxxx-xxxx <br /> 영업시간: AM 09:00 ~ PM 17:00

   </div>
</body>
</html>